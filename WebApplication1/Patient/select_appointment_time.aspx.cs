using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace WebApplication1.Patient
{
    public partial class select_appointment_time : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("patient_signin_form.aspx"); // Redirect to login if session expired
                }
                LabelSelectedTime.Text = "";
                LabelConfirmation.Text = "";
            }
        }

        protected void ddlTimeSlots_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelSelectedTime.Text = "Your selected time is: " + ddlTimeSlots.SelectedValue;
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            string selectedTime = ddlTimeSlots.SelectedValue;

            if (!string.IsNullOrEmpty(selectedTime))
            {
                try
                {
                    UpdateAppointmentTime(selectedTime);
                    LabelConfirmation.Text = "Time saved successfully!";
                }
                catch (Exception ex)
                {
                    LabelConfirmation.Text = "Error saving time. Please try again.";
                    Console.WriteLine(ex.Message); // Consider logging the error
                }
            }
            else
            {
                LabelConfirmation.Text = "Please select a valid time slot.";
            }
        }

        private void UpdateAppointmentTime(string appointmentTime)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
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
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@AppointmentTime", appointmentTime);
                    cmd.Parameters.AddWithValue("@Username", Session["Username"]);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected == 0)
                    {
                        throw new Exception("No records found for the provided username.");
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Retrieve the email address and username from the session
            string userEmail = Session["Email"]?.ToString();
            string username = Session["Username"]?.ToString();

            if (!string.IsNullOrEmpty(userEmail) && !string.IsNullOrEmpty(username))
            {
                try
                {
                    // Set up the email client
                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com")
                    {
                        Port = 587,
                        Credentials = new NetworkCredential("achcavan1211@gmail.com", "@ac12112004p"), // Replace with your email and app password
                        EnableSsl = true,
                    };

                    // Create the email message
                    MailMessage mailMessage = new MailMessage
                    {
                        From = new MailAddress("achcavan1211@gmail.com"), // Your email
                        Subject = "Your Appointment Request",
                        Body = $"Dear {username},\n\nYour appointment request has been received.\n\nThank you!",
                        IsBodyHtml = false,
                    };
                    mailMessage.To.Add(userEmail); // Add recipient email

                    // Send the email
                    smtpClient.Send(mailMessage);

                    // Show success message and redirect
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Appointment request has been sent!');", true);
                    Response.Redirect("~/homepage2.aspx");
                }
                catch (SmtpException smtpEx)
                {
                    // Handle specific SMTP exceptions
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('SMTP Error: {smtpEx.Message}');", true);
                }
                catch (Exception ex)
                {
                    // Handle other exceptions
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred while sending the email: {ex.Message}');", true);
                }
            }
            else
            {
                // Show alert if user information is not available
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User information is not available.');", true);
            }
        }

    }
}
