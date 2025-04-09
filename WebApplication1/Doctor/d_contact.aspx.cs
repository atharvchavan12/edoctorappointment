using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace WebApplication1.Doctor
{
    public partial class d_contact : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPatientQueries();
            }
        }

        private void LoadPatientQueries()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT pat_name, pat_subject, pat_email, pat_mobile_no, pat_message FROM patient_contact";
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvPatientQueries.DataSource = dt;
                    gvPatientQueries.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }

        protected void gvPatientQueries_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Get the clicked row index
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvPatientQueries.Rows[index];

                // Find the Button control inside the TemplateField
                Button respondButton = (Button)row.FindControl("btnRespond");

                if (respondButton != null)
                {
                    // Mark the button as visited by adding a CSS class
                    respondButton.CssClass = "visited-link";
                }
            }
        }



        protected void btnSendResponse_Click(object sender, EventArgs e)
        {
            GridViewRow row = gvPatientQueries.SelectedRow;
            if (row != null)
            {
                string patientEmail = row.Cells[2].Text; // Email column
                string patientQuery = row.Cells[4].Text; // Message column
                string responseMessage = txtResponse.Text;

                try
                {
                    SendEmail(patientEmail, patientQuery, responseMessage);
                    Response.Write("<script>alert('Response sent successfully!');</script>");
                    txtResponse.Text = string.Empty; // Clear the response box
                    lblSelectedPatient.Text = string.Empty; // Clear the selected patient label
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please select a query to respond to.');</script>");
            }
        }


        private void SendEmail(string recipientEmail, string patientQuery, string responseMessage)
        {
            try
            {
                // Sender's email credentials
                string fromMail = "drzopeclinic2024@gmail.com";
                string fromPassword = "ciwhzfegzirslhon";

                // Email message setup
                MailMessage message = new MailMessage();
                message.From = new MailAddress(fromMail);
                message.Subject = "Response to Your Query";
                message.To.Add(new MailAddress(recipientEmail)); // Patient's email
                message.Body = $@"
<html>
<body>
    <h3>Dear Patient,</h3>
    <p>Thank you for reaching out to us. Please find our response to your query below:</p>
    <p><b>Your Query:</b></p>
    <blockquote>{patientQuery}</blockquote>
    <p><b>Our Response:</b></p>
    <blockquote>{responseMessage}</blockquote>
    <p>If you have further questions, feel free to contact us. We are here to help!</p>
    <p>Best regards,<br> Dr.Zope's Clinic</p>
</body>
</html>";
                message.IsBodyHtml = true;

                // Configure SMTP client
                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new System.Net.NetworkCredential(fromMail, fromPassword),
                    EnableSsl = true,
                };

                // Send the email
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
                throw new Exception("Email sending failed: " + ex.Message);
            }
        }

    }
}