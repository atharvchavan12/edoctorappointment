using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace WebApplication1.Patient
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            // Retrieve form inputs
            string name = txtFirstName.Text.Trim();
            string subject = txtLastName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string message = txtMessage.Text.Trim();

            // Validate inputs
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(mobile) || string.IsNullOrEmpty(message))
            {
                lblModalMessage.Text = "All fields are required.";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                return;
            }

            // Database connection string
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            string query = "INSERT INTO patient_contact (pat_name, pat_subject, pat_email, pat_mobile_no, pat_message) " +
                           "VALUES (@Name, @Subject, @Email, @Mobile, @Message)";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters
                        command.Parameters.AddWithValue("@Name", name);
                        command.Parameters.AddWithValue("@Subject", subject);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Mobile", mobile);
                        command.Parameters.AddWithValue("@Message", message);

                        // Execute query
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblModalMessage.Text = "Your message has been sent successfully.";
                            ClearFields();
                        }
                        else
                        {
                            lblModalMessage.Text = "Failed to send your message. Please try again.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblModalMessage.Text = "An error occurred: " + ex.Message;
            }

            // Show Bootstrap modal
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
        }


        private void ClearFields()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtMessage.Text = string.Empty;
        }
    }
}