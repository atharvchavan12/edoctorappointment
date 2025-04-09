using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Doctor
{
    public partial class manageconsultancy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingAppointments();
            }
        }

        private void LoadPendingAppointments()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
       SELECT 'C' + RIGHT('000' + CAST(c_id AS VARCHAR), 3) AS formatted_c_id, 
              c_patientname, 
              c_contact, 
              ap_date, 
              ap_time, 
              status, 
              video_link 
       FROM patient_consultancy_tbl
       WHERE video_link IS NOT NULL;";


                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Step 1: Ensure the command is "Accept" or "Reject"
            if (e.CommandName == "Accept" || e.CommandName == "Reject")
            {
                string formattedCId = e.CommandArgument.ToString();
                string newStatus = e.CommandName == "Accept" ? "Appointed" : "Not Appointed";

                // Step 2: Debug Command Name and Argument
                System.Diagnostics.Debug.WriteLine($"CommandName: {e.CommandName}, CommandArgument: {formattedCId}");

                if (string.IsNullOrEmpty(formattedCId))
                {
                    // Log if the CommandArgument is missing or null
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error: CommandArgument is missing!');", true);
                    return;
                }

                // Step 3: Database connection and query
                string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"
                UPDATE patient_consultancy_tbl 
                SET status = @Status 
                WHERE 'C' + RIGHT('000' + CAST(c_id AS VARCHAR), 3) = @ID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Status", newStatus);
                    cmd.Parameters.AddWithValue("@ID", formattedCId);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        // Step 4: Debug SQL Execution Result
                        System.Diagnostics.Debug.WriteLine($"Rows Affected: {rowsAffected}");

                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Status updated to {newStatus} for Patient ID: {formattedCId}.');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Failed to update status for Patient ID: {formattedCId}.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Step 5: Log exceptions
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Database Error: {ex.Message}');", true);
                    }
                }

                // Step 6: Refresh the GridView
                LoadPendingAppointments();
            }
        }

        protected void btnStartVideoCall_Command(object sender, CommandEventArgs e)
        {
            string formattedCId = e.CommandArgument.ToString();

            // Example: Generate a unique Google Meet link (replace this with your logic)
            string googleMeetLink = "https://meet.google.com/landing";

            Response.Redirect(googleMeetLink);
        }
    }
}
