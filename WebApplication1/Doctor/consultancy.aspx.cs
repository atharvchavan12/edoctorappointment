using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Doctor
{
    public partial class consultancy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get the connection string from Web.config
            string connStr = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            // Get values from the form
            string patientName = TextBox3.Text;
            string dob = TextBox1.Text;
            string email = TextBox2.Text;
            string gender = RadioButtonList1.SelectedValue;
            string problem = TextBox11.Text;
            string package = DropDownList1.SelectedValue;
            string status = "pending";
            string contact = TextBox12.Text;

            // Validate inputs
            if (string.IsNullOrEmpty(patientName) || string.IsNullOrEmpty(dob) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(contact))
            {
                lblModalMessage.Text = "Please fill in all mandatory fields.";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                return;
            }

            // Insert query
            string query = @"INSERT INTO patient_consultancy_tbl
             (c_patientname, c_dob, c_email, c_gender, c_problem, c_package, c_contact, status)
             VALUES
             (@PatientName, @DOB, @Email, @Gender, @Problem, @Package, @Contact, @Status)";

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Add parameters
                        cmd.Parameters.AddWithValue("@PatientName", patientName);
                        cmd.Parameters.AddWithValue("@DOB", dob);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Gender", gender);
                        cmd.Parameters.AddWithValue("@Problem", problem);
                        cmd.Parameters.AddWithValue("@Package", package);
                        cmd.Parameters.AddWithValue("@Contact", contact);
                        cmd.Parameters.AddWithValue("@Status", status);

                        // Execute the query
                        cmd.ExecuteNonQuery();
                    }
                }

                // Success message
                lblModalMessage.Text = "Consultancy appointment requested successfully.";
            }
            catch (Exception ex)
            {
                lblModalMessage.Text = "An error occurred: " + ex.Message;
            }

            // Show Bootstrap modal
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
        }


    }
}