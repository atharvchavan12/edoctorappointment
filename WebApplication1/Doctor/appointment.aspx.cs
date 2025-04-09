using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace WebApplication1.Doctor
{
    public partial class appointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataBind();
                LoadPendingAppointments();
            }
        }

        void clearfield()
        {
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
        private void LoadPendingAppointments()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM patient_appointment_tbl WHERE status = 'pending'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Accept" || e.CommandName == "Reject")
            {
                int p_id = Convert.ToInt32(e.CommandArgument);
                string newStatus = e.CommandName == "Accept" ? "Appointed" : "Not Appointed";

                // Update the status in the database
                UpdateAppointmentStatus(p_id, newStatus);

                // Find the row index and update the status cell directly in the GridView
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;

                // Assuming the status is in the third cell (adjust index as necessary)
                row.Cells[3].Text = newStatus; // Update the cell directly in the GridView

                // Optional: If using DataBinding or you want to reflect all changes, uncomment the following line:
                LoadPendingAppointments();
            }
        }




        private void UpdateAppointmentStatus(int p_id, string status)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE patient_appointment_tbl SET status = @status WHERE p_id = @p_id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@p_id", p_id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e) // go
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
                string query = "SELECT p_contact, p_name, appointment_date, p_emailid, p_dob, p_bloodtype, p_gender, appointment_time, p_address FROM patient_appointment_tbl WHERE p_id = @ID";

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


        protected void Button4_Click(object sender, EventArgs e)
        {
            // Ensure all textboxes from 1 to 13 are filled
            if (!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrEmpty(TextBox2.Text) &&
               !string.IsNullOrEmpty(TextBox4.Text) &&
                !string.IsNullOrEmpty(TextBox5.Text) && !string.IsNullOrEmpty(TextBox6.Text) &&
                !string.IsNullOrEmpty(TextBox7.Text) && !string.IsNullOrEmpty(TextBox8.Text) &&
                !string.IsNullOrEmpty(TextBox9.Text) && !string.IsNullOrEmpty(TextBox10.Text) &&
                !string.IsNullOrEmpty(TextBox11.Text) && !string.IsNullOrEmpty(TextBox12.Text) &&
                !string.IsNullOrEmpty(TextBox13.Text))
            {
                // Define the connection string
                string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Define your SQL query to update patient details based on the ID
                    string query = @"UPDATE patient_appointment_tbl
                             SET p_contact = @contact,
                                 appointment_date = @appointment_date,
                                 p_name = @name,
                                 p_emailid = @email,
                                 p_dob = @dob,
                                 p_bloodtype = @blood_type,
                                 p_gender = @gender,
                                 appointment_time = @appointment_time,
                                 height = @height,
                                 weight1 = @weight,
                                 p_address = @address,
                                 status = 'Appointed'
                             WHERE p_id = @ID";

                    SqlCommand cmd = new SqlCommand(query, con);

                    // Add parameters to the command
                    cmd.Parameters.AddWithValue("@ID", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@contact", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@appointment_date", Convert.ToDateTime(TextBox9.Text));
                    cmd.Parameters.AddWithValue("@name", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@email", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@dob", Convert.ToDateTime(TextBox6.Text));
                    cmd.Parameters.AddWithValue("@blood_type", TextBox7.Text);
                    cmd.Parameters.AddWithValue("@gender", TextBox8.Text);
                    cmd.Parameters.AddWithValue("@appointment_time", TextBox10.Text);
                    cmd.Parameters.AddWithValue("@height", TextBox11.Text);
                    cmd.Parameters.AddWithValue("@weight", TextBox12.Text);
                    cmd.Parameters.AddWithValue("@address", TextBox13.Text);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Display success message
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record updated successfully with status Appointed');", true);


                            // Find the row in the GridView and update the status cell
                            foreach (GridViewRow row in GridView1.Rows)
                            {
                                if (row.Cells[0].Text == TextBox1.Text) // Assuming p_id is in the first cell
                                {
                                    row.Cells[4].Text = "Appointed"; // Assuming status is in the third cell
                                    break;
                                }
                            }
                            clearfield();
                        }
                        else
                        {
                            // Display message if no record was found to update
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record not found or no changes were made.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Display error message
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An error occurred while updating the record. Please try again.');", true);
                    }
                }
            }
            else
            {
                // Display alert if not all textboxes are filled
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please fill all required fields before updating.');", true);
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_emergency_appointment.aspx");
        }
    }
}
