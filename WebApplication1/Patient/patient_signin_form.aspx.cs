using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;


namespace WebApplication1.Patient
{
    public partial class patient_signin_form : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Attributes.Add("autocomplete", "off");
                TextBox2.Attributes.Add("autocomplete", "new-password");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            // Encrypt the entered password using the same method as during signup
            string hashedPassword = HashPassword(password);

            string query = "SELECT p_username, p_password FROM patient_signupin_tbl WHERE p_username = @Username AND p_password = @Password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", hashedPassword);

                    try
                    {
                        connection.Open();

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Session["Username"] = reader["p_username"].ToString();
                                Session["Password"] = reader["p_password"].ToString();
                                Session["Role"] = "user";

                                lblModalMessage.Text = "Login successful!";
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                                Response.Redirect("~/Patient/patient_appointment _form.aspx");
                            }
                            else
                            {
                                lblModalMessage.Text = "Invalid username or password.";
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblModalMessage.Text = "Error: " + ex.Message.Replace("'", "\\'");
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                    }
                }
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();

                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }

                return builder.ToString();
            }
        }


        protected void SendEmailButton_Click(object sender, EventArgs e)
        {
            string email = EmailTextBox.Text.Trim();
            if (string.IsNullOrEmpty(email))
            {
                lblModalMessage.Text = "Please enter an email ID.";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            string query = "SELECT p_username, p_password FROM patient_signupin_tbl WHERE p_email = @Email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        connection.Open();

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Fetch username and password
                                string username = reader["p_username"].ToString();
                                string password = reader["p_password"].ToString();

                                // Send email
                                SendEmail(email, username, password);

                                lblModalMessage.Text = "Email sent successfully. Check your inbox.";
                            }
                            else
                            {
                                lblModalMessage.Text = "Email ID not found in our records. Please try again.";
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblModalMessage.Text = "Error: " + ex.Message.Replace("'", "\\'");
                    }

                    // Show Bootstrap modal
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                }
            }
        }


        private void SendEmail(string emailAddress, string username, string password)
        {
            try
            {
                // Sender's email credentials
                string fromMail = "drzopeclinic2024@gmail.com";
                string fromPassword = "gsolakiawyfqadit";

                // Email message setup
                MailMessage message = new MailMessage
                {
                    From = new MailAddress(fromMail),
                    Subject = "Your Username and Password",
                    IsBodyHtml = true
                };
                message.To.Add(new MailAddress(emailAddress));

                // Email body with dynamic values
                message.Body = $@"
<html>
<body>
    <h3>Dear User,</h3>
    <p>Your login credentials for Dr. Zope's Clinic are as follows:</p>
    <ul>
        <li><b>Username:</b> {username}</li>
        <li><b>Password:</b> {password}</li>
    </ul>
    <p>If you have any issues logging in, please contact us for assistance.</p>
    <p>Thank you for choosing Dr. Zope's Clinic.<br><br>Best regards,<br>Dr. Zope's Clinic Team</p>
</body>
</html>";

                // Configure SMTP client
                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new System.Net.NetworkCredential(fromMail, fromPassword),
                    EnableSsl = true,
                };

                // Send the email
                smtpClient.Send(message);

                lblModalMessage.Text = "Email sent successfully. Check your inbox.";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                // Show success message
              
            }
            catch (Exception ex)
            {
               
                lblModalMessage.Text = "Email Error: " + ex.Message.Replace("'", "\\'");
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);

                // Log or handle email sending errors
            
            }
        }




    }
}
