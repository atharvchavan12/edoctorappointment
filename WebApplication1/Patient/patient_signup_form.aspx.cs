

using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;


namespace WebApplication1.Patient
{
    public partial class patient_signup_form : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Attributes.Add("autocomplete", "off");
                TextBox2.Attributes.Add("autocomplete", "new-password");
            }
        }
        protected void ShowModalMessage(string message)
        {
            string script = $"<script type='text/javascript'>showMessage('{message}');</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "ModalMessage", script, false);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Reset all textboxes to default style
            TextBox1.CssClass = TextBox1.CssClass.Replace(" error", "");
            TextBox2.CssClass = TextBox2.CssClass.Replace(" error", "");
            TextBox3.CssClass = TextBox3.CssClass.Replace(" error", "");
            TextBox4.CssClass = TextBox4.CssClass.Replace(" error", "");

            string username = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();
            string confirmPassword = TextBox3.Text.Trim();
            string email = TextBox4.Text.Trim();

            bool hasError = false;

            if (string.IsNullOrEmpty(username))
            {
                TextBox1.CssClass += " error";
                hasError = true;
            }

            if (username.Contains(" "))
            {
                TextBox1.CssClass += " error";
                ShowModalMessage("Username should not contain spaces.");
                return;
            }

            if (string.IsNullOrEmpty(password))
            {
                TextBox2.CssClass += " error";
                hasError = true;
            }

            if (!Regex.IsMatch(password, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,}$"))
            {
                TextBox2.CssClass += " error";
                ShowModalMessage("Password must be at least 8 characters long, include at least one digit, one special character, one uppercase letter, and one lowercase letter.");
                return;
            }

            if (password != confirmPassword)
            {
                TextBox2.CssClass += " error";
                TextBox3.CssClass += " error";
                ShowModalMessage("Passwords do not match.");
                return;
            }

            if (string.IsNullOrEmpty(email))
            {
                TextBox4.CssClass += " error";
                hasError = true;
            }

            if (!Regex.IsMatch(email, @"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                TextBox4.CssClass += " error";
                ShowModalMessage("Invalid email format.");
                return;
            }

            if (hasError)
            {
                ShowModalMessage("Please correct the highlighted fields.");
                return;
            }

            string hashedPassword = ComputeSha256Hash(password);

            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string checkUsernameQuery = "SELECT COUNT(*) FROM patient_signupin_tbl WHERE p_username = @Username";
                using (SqlCommand checkUsernameCommand = new SqlCommand(checkUsernameQuery, connection))
                {
                    checkUsernameCommand.Parameters.AddWithValue("@Username", username);
                    int userExists = (int)checkUsernameCommand.ExecuteScalar();

                    if (userExists > 0)
                    {
                        TextBox1.CssClass += " error";
                        ShowModalMessage("Try another username.");
                        return;
                    }
                }

                string checkEmailQuery = "SELECT COUNT(*) FROM patient_signupin_tbl WHERE p_email = @Email";
                using (SqlCommand checkEmailCommand = new SqlCommand(checkEmailQuery, connection))
                {
                    checkEmailCommand.Parameters.AddWithValue("@Email", email);
                    int emailExists = (int)checkEmailCommand.ExecuteScalar();

                    if (emailExists > 0)
                    {
                        TextBox4.CssClass += " error";
                        ShowModalMessage("Email already registered. Try another email.");
                        return;
                    }
                }

                string signupQuery = "INSERT INTO patient_signupin_tbl (p_username, p_password, p_email) VALUES (@Username, @Password, @Email)";
                using (SqlCommand signupCommand = new SqlCommand(signupQuery, connection))
                {
                    signupCommand.Parameters.AddWithValue("@Username", username);
                    signupCommand.Parameters.AddWithValue("@Password", hashedPassword);
                    signupCommand.Parameters.AddWithValue("@Email", email);

                    signupCommand.ExecuteNonQuery();
                    ShowModalMessage("Signup successful! Redirecting to sign-in...");
                    Response.Redirect("patient_signin_form.aspx");
                }
            }
        }



        // Function to compute SHA256 hash




        // Helper method to hash the password
        private string ComputeSha256Hash(string rawData)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }


    }
}
