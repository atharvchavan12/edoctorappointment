using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Patient
{
    public partial class try1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*  if (Session["Username"] == null)
                  {
                      Response.Redirect("patient_signin_form.aspx"); // Redirect to login if session expired
                  }*/

                // Ensure that the appointment date is set in the session
                if (Session["SelectedAppointmentDate"] == null)
                {
                    Label2.Text = "No appointment date selected. Please select a date first.";
                    Label2.ForeColor = System.Drawing.Color.Red;
                    return; // Exit if the session variable is not set
                }


            }
            PopulateShiftTimings();
        }


        private void PopulateShiftTimings()
        {
            // Ensure appointment date is available in the session
            if (Session["SelectedAppointmentDate"] == null)
            {
                Label2.Text = "No appointment date selected. Please select a date first.";
                Label2.ForeColor = System.Drawing.Color.Red;
                return; // Exit if no date is selected
            }

            DateTime appointmentDate = (DateTime)Session["SelectedAppointmentDate"];
            string[] morningShifts = { "9:30 - 10:00", "10:00 - 10:30", "10:30 - 11:00", "11:00 - 11:30", "11:30 - 12:00", "12:00 - 12:30" };
            string[] eveningShifts = { "3:00 - 3:30", "3:30 - 4:00", "4:00 - 4:30", "4:30 - 5:00", "5:00 - 5:30", "5:30 - 6:00" };

            AddShiftTimingsToPanel(pnlMorningShift, morningShifts, appointmentDate);
            AddShiftTimingsToPanel(pnlEveningShift, eveningShifts, appointmentDate);
        }

        private void AddShiftTimingsToPanel(Panel panel, string[] timings, DateTime appointmentDate)
        {
            List<string> bookedSlots = GetBookedSlots(appointmentDate);

            foreach (string timing in timings)
            {
                Label shiftLabel = new Label
                {
                    Text = timing,
                    CssClass = "shift-box"
                };

                // Check if the timing is booked
                if (bookedSlots.Contains(timing))
                {
                    shiftLabel.Attributes.Add("style", "background-color:#FF6347; color: white;");
                    shiftLabel.Attributes.Add("onclick", $"alert('This slot is already booked on {appointmentDate:dd-MM-yyyy}.');");
                }
                else
                {
                    // Add the onclick attribute for available slots
                    shiftLabel.Attributes.Add("onclick", $"selectShift(this, '{timing}')");
                }

                panel.Controls.Add(shiftLabel);
            }
        }


        private List<string> GetBookedSlots(DateTime appointmentDate)
        {
            List<string> bookedSlots = new List<string>();
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT appointment_time FROM patient_appointment_tbl WHERE appointment_date = @appointmentDate";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@AppointmentDate", appointmentDate);
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            bookedSlots.Add(reader["appointment_time"].ToString());
                        }
                    }
                }
            }

            return bookedSlots;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Check if the selected time is not empty
            string selectedTime = HiddenSelectedTime.Value;

            if (string.IsNullOrEmpty(selectedTime))
            {
                Label2.Text = "Please select a shift before saving.";
                Label2.Visible = true;
                return; // Exit if no time is selected
            }

            // Store the selected time in the session
            Session["SelectedTime"] = selectedTime;

            // Check if the selected appointment date is in the session
            if (Session["SelectedAppointmentDate"] == null)
            {
                Label2.Text = "No appointment date selected. Please select a date first.";
                Label2.Visible = true;
                return; // Exit if no date is selected
            }

            // Retrieve the appointment date from the session
            DateTime appointmentDate = (DateTime)Session["SelectedAppointmentDate"];

            // Database connection string
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL query to update the patient's appointment time
                string query = @"
            UPDATE patient_appointment_tbl 
            SET appointment_time = @AppointmentTime
            WHERE p_username = @Username 
            AND p_id = (
                SELECT TOP 1 p_id 
                FROM patient_appointment_tbl 
                WHERE p_username = @Username 
                ORDER BY p_id DESC
            )";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@AppointmentTime", selectedTime);
                    command.Parameters.AddWithValue("@Username", Session["Username"]);
                    command.Parameters.AddWithValue("@AppointmentDate", appointmentDate);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        string script = "alert('Appointment confirmation email sent successfully!'); window.location = '../homepage2.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                        // Change background color of the selected slot
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ChangeColor",
                            $"document.querySelectorAll('.shift-box').forEach(box => {{ if(box.innerText == '{selectedTime}') {{ box.style.backgroundColor = 'red'; box.style.color = 'white'; }} }});", true);

                        Label2.Text = "Appointment saved successfully!";
                        Label2.Visible = true;
                        HiddenSelectedTime.Value = string.Empty; // Clear the hidden field
                    }
                    else
                    {
                        Label2.Text = "Failed to save the appointment. No matching records found.";
                        Label2.Visible = true;
                    }
                }

                // Email notification
                try
                {
                    // Sender's email credentials
                    string fromMail = "drzopeclinic2024@gmail.com";
                    string fromPassword = "hsnvwroxeixywzop";

                    // Retrieve dynamic details from the session
                    string recipientEmail = Session["EmailID"]?.ToString(); // Patient's email address
                    string appointmentDate1 = Session["SelectedAppointmentDate"]?.ToString(); // Appointment date
                    string appointmentTime = Session["SelectedTime"]?.ToString(); // Appointment time
                    string patientName = Session["Name12"]?.ToString(); // Patient's name

                    // Validate session variables
                    if (string.IsNullOrEmpty(recipientEmail) || string.IsNullOrEmpty(appointmentDate1) || string.IsNullOrEmpty(appointmentTime))
                    {
                        Response.Write("<script>alert('Error: Missing appointment details. Please try again.');</script>");
                        return;
                    }

                    // Email message setup
                    MailMessage message = new MailMessage
                    {
                        From = new MailAddress(fromMail),
                        Subject = "Appointment Request Successfully Sent",
                        Body = $@"
<html>
<body>
    <h3>Dear {patientName ?? "Patient"},</h3>
    <p>Your appointment request has been successfully submitted. Your Appointment details are as follows:</p>
    <ul>
        <li><b>Appointment Date:</b> {appointmentDate1}</li>
        <li><b>Appointment Time:</b> {appointmentTime}</li>
    </ul>
    <p>We will contact you shortly with further details. Thank you for choosing our services.</p>
    <p>Best regards,<br> Dr.Zope's Clinic</p>
</body>
</html>",
                        IsBodyHtml = true
                    };
                    message.To.Add(new MailAddress(recipientEmail)); // Recipient's email address

                    // Configure SMTP client
                    using (var smtpClient = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtpClient.Credentials = new NetworkCredential(fromMail, fromPassword);
                        smtpClient.EnableSsl = true;
                        smtpClient.Send(message);
                    }

                    // Notify the user of success
                  
                }
                catch (SmtpException smtpEx)
                {
                    // Handle SMTP-specific errors
                    Response.Write("<script>alert('SMTP Error: " + smtpEx.Message + "');</script>");
                }
                catch (Exception ex)
                {
                    // Handle general errors
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }

            }
        }




    }



}

