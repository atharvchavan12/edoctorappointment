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
    public partial class manage_emergency : System.Web.UI.Page
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
                string query = "SELECT * FROM emergency_appointment_tbl WHERE status = 'pending'";
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
                // Get the e_id from CommandArgument
                int e_id = Convert.ToInt32(e.CommandArgument);

                // Determine the new status based on the button clicked
                string newStatus = e.CommandName == "Accept" ? "Appointed" : "Not Appointed";

                // Update the status in the database
                UpdateAppointmentStatus(e_id, newStatus);

                // Find the row index in the GridView
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;

                // Update the status cell in the GridView directly
                row.Cells[4].Text = newStatus;  // Assuming status is in the 5th column (index 4)

                // Optionally, you can reload the GridView if necessary
             //   GridView1.DataBind();
            }
        }

        private void UpdateAppointmentStatus(int e_id, string status)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE emergency_appointment_tbl SET status = @status WHERE e_id = @e_id";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@e_id", e_id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }



    }
}