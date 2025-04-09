using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;


namespace WebApplication1.Doctor
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.SelectedDate = DateTime.Today; // Optionally preselect today's date
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // Display the selected date in yyyy-MM-dd format
            TextBox1.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime currentDate = DateTime.Today;

            // Disable all dates up to the current date
            if (e.Day.Date < currentDate)
            {
                e.Day.IsSelectable = false; // Disable date selection
                e.Cell.ForeColor = System.Drawing.Color.Gray; // Optional: Change text color
            }

            // Highlight the current date in yellow and add a black border
            if (e.Day.Date == currentDate)
            {
                e.Cell.BackColor = System.Drawing.Color.Yellow;
                e.Cell.Attributes.Add("style", "border: 2px solid black;"); // Adding a black border
            }

            // Highlight all Sundays in red
            if (e.Day.IsWeekend && e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
            {
                e.Cell.BackColor = System.Drawing.Color.Red;
                e.Cell.ForeColor = System.Drawing.Color.White; // Optional: Change text color for contrast
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            // Ensure that a date is selected
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Please select a date from the calendar.');", true);
                return;
            }

            // Collect selected time slots
            List<string> selectedTimeSlots = new List<string>();
            foreach (Control control in CardContainer.Controls)
            {
                if (control is CheckBox checkBox && checkBox.Checked)
                {
                    selectedTimeSlots.Add(checkBox.Text);
                }
            }

            if (selectedTimeSlots.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Please select at least one time slot.');", true);
                return;
            }

            try
            {
                DateTime selectedDate = DateTime.ParseExact(TextBox1.Text, "yyyy-MM-dd", null);
                string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Update the status to "unavailable"
                    foreach (string timeSlot in selectedTimeSlots)
                    {
                        string updateQuery = "UPDATE patient_appointment_tbl " +
                                             "SET status = 'unavailable' " +
                                             "WHERE appointment_date = @SelectedDate AND appointment_time = @TimeSlot";

                        using (SqlCommand command = new SqlCommand(updateQuery, connection))
                        {
                            command.Parameters.AddWithValue("@SelectedDate", selectedDate);
                            command.Parameters.AddWithValue("@TimeSlot", timeSlot);
                            command.ExecuteNonQuery();
                        }
                    }

                    // Fetch email IDs of affected patients
                    string fetchEmailsQuery = "SELECT DISTINCT p_emailid, p_name, appointment_time FROM patient_appointment_tbl " +
                                               "WHERE appointment_date = @SelectedDate AND status = 'unavailable'";

                    using (SqlCommand command = new SqlCommand(fetchEmailsQuery, connection))
                    {
                        command.Parameters.AddWithValue("@SelectedDate", selectedDate);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string email = reader["p_emailid"].ToString();
                                string name = reader["p_name"].ToString();
                                string timeSlot = reader["appointment_time"].ToString();

                                // Send cancellation email
                                SendCancellationEmail(email, name, selectedDate, timeSlot);
                            }
                        }
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "successMessage", "alert('Selected time slots marked as unavailable and emails sent successfully.');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "errorMessage", $"alert('Error: {ex.Message}');", true);
            }
        }

        private void SendCancellationEmail(string emailAddress, string patientName, DateTime appointmentDate, string appointmentTime)
        {
            try
            {
                string fromMail = "drzopeclinic2024@gmail.com";
                string fromPassword = "hsnvwroxeixywzop"; // Use an App Password, not your Gmail password

                MailMessage message = new MailMessage();
                message.From = new MailAddress(fromMail);
                message.To.Add(new MailAddress(emailAddress));
                message.Subject = "Appointment Cancellation Notice";
                message.IsBodyHtml = true;
                message.Body = $@"
        <html>
        <body>
           <h3>Dear {patientName},</h3>
            <p>We regret to inform you that your appointment on <b>{appointmentDate:dd-MM-yyyy}</b> at <b>{appointmentTime}</b> has been canceled by the doctor due to unforeseen circumstances.</p>
            <p>We sincerely apologize for the inconvenience. If you need further assistance, please contact our clinic or book a new appointment.</p>
            <p>Best Regards,<br>Dr. Zope's Clinic</p>
        </body>
        </html>";

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587)
                {
                    EnableSsl = true,
                    UseDefaultCredentials = false,  // ✅ Ensure this is set before credentials
                    Credentials = new System.Net.NetworkCredential(fromMail, fromPassword),
                    DeliveryMethod = SmtpDeliveryMethod.Network
                };

                smtpClient.Send(message);
            }
            catch (SmtpException smtpEx)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "smtpError", $"alert('SMTP Error: {smtpEx.Message}');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "generalError", $"alert('General Error: {ex.Message}');", true);
            }
        }



    }

}