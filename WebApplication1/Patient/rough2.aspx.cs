using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication1
{
    public partial class rough2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Get values from the form
            string patient_name = txtName.Text;
            string patient_email = txtEmail.Text;
            string patient_passwd = txtPassword.Text;
            string patient_confirmpasswd = txtConfirmPassword.Text;

            // Insert data when the form is submitted
            InsertData(patient_name, patient_email, patient_passwd, patient_confirmpasswd);
        }

        private void InsertData(string patient_name, string patient_email, string patient_passwd, string patient_confirmpasswd)
        {
            // Connection string to your SQL Server
            string connectionString = "Data Source=LAPTOP-IA1VDG6L\\SQLEXPRESS;Initial Catalog=userlogin;Integrated Security=True;Trust Server Certificate=True";

            // SQL insert query with parameter placeholders
            string query = "INSERT INTO patient_signup (patient_name, patient_email, patient_passwd, patient_confirmpasswd) VALUES (@PatientName, @PatientEmail, @PatientPasswd, @PatientConfirmpasswd)";

            try
            {
                // Establishing the connection
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    System.Diagnostics.Debug.WriteLine("Connection Opened Successfully!");

                    // Executing the SQL insert query
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Adding parameters to prevent SQL injection
                        command.Parameters.AddWithValue("@PatientName", patient_name);
                        command.Parameters.AddWithValue("@PatientEmail", patient_email);
                        command.Parameters.AddWithValue("@PatientPasswd", patient_passwd);
                        command.Parameters.AddWithValue("@PatientConfirmpasswd", patient_confirmpasswd);

                        int rowsAffected = command.ExecuteNonQuery();
                        System.Diagnostics.Debug.WriteLine($"{rowsAffected} row(s) inserted successfully.");
                    }

                    // Closing the connection
                    connection.Close();
                    System.Diagnostics.Debug.WriteLine("Connection Closed Successfully!");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("An error occurred: " + ex.Message);
            }
        }
    }
}
