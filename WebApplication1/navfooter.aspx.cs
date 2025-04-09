using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Text;


namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
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
            string username = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();
            string confirmPassword = TextBox3.Text.Trim();
            string email = TextBox4.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword) || string.IsNullOrEmpty(email))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('All fields are required.');", true);
                return;
            }

            if (username.Contains(" "))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username should not contain spaces.');", true);
                return;
            }

            if (!Regex.IsMatch(email, @"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid email format.');", true);
                return;
            }

            if (!Regex.IsMatch(password, @"^(?=.*[0-9])(?=.*[!@#$%^&*()])[a-zA-Z0-9!@#$%^&*()]{8,12}$"))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password must be 8-12 characters long, include at least one digit and one special character.');", true);
                return;
            }

            if (password != confirmPassword)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Passwords do not match.');", true);
                return;
            }

            // Encrypt the password using SHA256
            string hashedPassword = ComputeSha256Hash(password);

            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string checkQuery = "SELECT COUNT(*) FROM patient_signupin_tbl WHERE p_username = @Username";
                using (SqlCommand checkCommand = new SqlCommand(checkQuery, connection))
                {
                    checkCommand.Parameters.AddWithValue("@Username", username);
                    int userExists = (int)checkCommand.ExecuteScalar();

                    if (userExists > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Try another username.');", true);
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
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Signup successful!');window.location='patient_signin_form.aspx';", true);
                }
            }
        }

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