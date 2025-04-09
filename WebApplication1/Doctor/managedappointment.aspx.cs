using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;    

namespace WebApplication1.Doctor
{
    public partial class managedappointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
                LoadPendingAppointments();
            }

        }

        private void LoadPendingAppointments()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
SELECT 
       CAST(p_id AS VARCHAR) AS  p_id, 
    p_name, 
    p_contact, 
    appointment_date, 
    'Appointed' as status 
FROM patient_appointment_tbl 
WHERE status = 'Appointed'

UNION ALL

SELECT 
      'e' + CAST(e_id AS VARCHAR) AS p_id, 
    e_name AS p_name, 
    e_contact AS p_contact, 
    e_appointment_date AS appointment_date, 
    'Emergency' as status 
FROM emergency_appointment_tbl 
WHERE status = 'Appointed'";


                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }


        protected void Button1_Click(object sender, EventArgs e)//go
        {
            // Check if an ID is entered
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                // Display alert message if ID is not entered
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter an ID before searching.');", true);
                return; // Stop execution if ID is empty
            }

            // Define the connection string (assumes you have it in Web.config under the name "YourConnectionStringName")
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Define your SQL query to fetch patient details based on the ID
                string query = "SELECT p_contact, p_name, appointment_date, p_emailid, p_dob, p_bloodtype, p_gender, appointment_time,height,weight1, p_address FROM patient_appointment_tbl WHERE p_id = @ID and status= 'Appointed'";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", TextBox1.Text);

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Populate each textbox with the corresponding database field
                        TextBox2.Text = reader["p_contact"].ToString();
                        TextBox4.Text = reader["p_name"].ToString();
                        TextBox5.Text = reader["p_emailid"].ToString();
                        TextBox6.Text = Convert.ToDateTime(reader["p_dob"]).ToString("yyyy-MM-dd"); // Format as date
                        TextBox7.Text = reader["p_bloodtype"].ToString();
                        TextBox8.Text = reader["p_gender"].ToString();
                        TextBox9.Text = Convert.ToDateTime(reader["appointment_date"]).ToString("yyyy-MM-dd"); // Format as date
                        TextBox10.Text = reader["appointment_time"].ToString();
                        TextBox13.Text = reader["p_address"].ToString();
                        TextBox11.Text = reader["height"].ToString();
                        TextBox12.Text = reader["weight1"].ToString();

                    }
                    else
                    {
                        // Display message if no record is found
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No record found with the entered ID.');", true);
                    }
                }
                catch (Exception ex)
                {
                    // Handle any errors that occur
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An error occurred while fetching the record. Please try again.');", true);
                }
            }

        }



        protected void Button4_Click(object sender, EventArgs e) // Delete
        {
            // Retrieve the p_id from the TextBox
            string patientId = TextBox1.Text.Trim(); // Ensure TextBox1 is the correct ID

            if (string.IsNullOrEmpty(patientId))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid Patient ID.');", true);
                return;
            }

            // Validate p_id as numeric
            if (!int.TryParse(patientId, out int validId))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Patient ID must be a numeric value.');", true);
                return;
            }

            // Connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // SQL query to delete the record
                    string deleteQuery = "DELETE FROM patient_appointment_tbl WHERE p_id = @p_id";

                    using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@p_id", validId); // Pass numeric ID

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record deleted successfully.');", true);

                            // Refresh the GridView after successful deletion
                            LoadPendingAppointments();
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No record found with the provided Patient ID.');", true);
                        }
                    }
                }
                catch (SqlException sqlEx)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Database error: " + sqlEx.Message.Replace("'", "\\'") + "');", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred: " + ex.Message.Replace("'", "\\'") + "');", true);
                }
            }
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Clear all the textboxes by setting their Text property to an empty string
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;
            TextBox7.Text = string.Empty;
            TextBox8.Text = string.Empty;
            TextBox9.Text = string.Empty;
            TextBox10.Text = string.Empty;
            TextBox11.Text = string.Empty;
            TextBox12.Text = string.Empty;
            TextBox13.Text = string.Empty;
        }
    }
}