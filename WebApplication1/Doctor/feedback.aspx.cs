using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeedbacks();
            }
        }

        private void LoadFeedbacks()
        {
            string connStr = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT p_fid, p_name, p_email, p_subject, p_message FROM patient_feedback_tbl", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewFeedback.DataSource = dt;
                GridViewFeedback.DataBind();
            }
        }

        protected void GridViewFeedback_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteFeedback")
            {
                int feedbackID = Convert.ToInt32(e.CommandArgument);
                DeleteFeedback(feedbackID);
                LoadFeedbacks(); // Reload the feedbacks to reflect the deletion
            }
        }

        private void DeleteFeedback(int feedbackID)
        {
            string connStr = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM patient_feedback_tbl WHERE p_fid = @FeedbackID", conn);
                cmd.Parameters.AddWithValue("@FeedbackID", feedbackID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}
