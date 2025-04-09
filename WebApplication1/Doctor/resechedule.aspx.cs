using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;

namespace WebApplication1.Doctor
{
    public partial class reschedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Fetch selected slots from the form
            string selectedSlots = Request.Form["slot"];
            if (string.IsNullOrEmpty(selectedSlots))
            {
                Response.Write("<script>alert('Please select at least one time slot.');</script>");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
            List<(string Email, string Name, DateTime AppointmentDate, TimeSpan AppointmentTime)> appointments = new List<(string, string, DateTime, TimeSpan)>();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Prepare query to fetch patient details
                    string query = @"
                    SELECT p_emailid, p_name, appointment_date, p_appointment_time
                    FROM patient_appointment_tbl 
                    WHERE appointment_date = @CurrentDate 
                    AND p_appointment_time IN ({0})";

                    // Dynamically build IN clause for selected slots
                    var slotParams = selectedSlots.Split(',');
                    var slotPlaceholders = new List<string>();
                    for (int i = 0; i < slotParams.Length; i++)
                    {
                        slotPlaceholders.Add($"@Slot{i}");
                    }
                    query = string.Format(query, string.Join(", ", slotPlaceholders));

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@CurrentDate", currentDate);
                        for (int i = 0; i < slotParams.Length; i++)
                        {
                            command.Parameters.AddWithValue($"@Slot{i}", TimeSpan.Parse(slotParams[i]));
                        }

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                appointments.Add((
                                    reader["p_emailid"].ToString(),
                                    reader["p_name"].ToString(),
                                    Convert.ToDateTime(reader["appointment_date"]),
                                    (TimeSpan)reader["p_appointment_time"]
                                ));
                            }
                        }
                    }
                }

                // Send emails
                foreach (var appointment in appointments)
                {
                    SendEmail(appointment.Email, appointment.Name, appointment.AppointmentDate, appointment.AppointmentTime);
                }

                Response.Write("<script>alert('Notifications sent successfully.');</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        private void SendEmail(string emailAddress, string patientName, DateTime appointmentDate, TimeSpan appointmentTime)
        {
            try
            {
                string fromMail = "drzopeclinic2024@gmail.com";
                string fromPassword = "ciwhzfegzirslhon";

                MailMessage message = new MailMessage
                {
                    From = new MailAddress(fromMail),
                    Subject = "Appointment Cancellation Notice",
                    IsBodyHtml = true
                };
                message.To.Add(new MailAddress(emailAddress));

                message.Body = $@"
<html>
<body>
    <h3>Dear {patientName},</h3>
    <p>We regret to inform you that your appointment scheduled on <b>{appointmentDate:yyyy-MM-dd}</b> at <b>{appointmentTime}</b> has been canceled due to an emergency leave by the doctor.</p>
    <p>We sincerely apologize for the inconvenience caused. Please contact us for further assistance or to reschedule your appointment.</p>
    <p>Thank you for your understanding.<br><br>Best regards,<br>Dr. Zope's Clinic</p>
</body>
</html>";

                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new System.Net.NetworkCredential(fromMail, fromPassword),
                    EnableSsl = true,
                };

                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "emailError", $"alert('Error sending email: {ex.Message}');", true);
            }
        }
    }
}
