using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Doctor
{
    public partial class doctorconsultancy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the doctor is logged in by checking session values for username and password
            if (Session["Username_d"] == null || Session["Password_d"] == null)
            {
                // Redirect to the login page if the doctor is not logged in
                Response.Redirect("~/doctorlogin.aspx");
                return; // Ensure the page does not load further if the doctor is not logged in
            }

            // If the doctor is logged in, bind the data to the GridView and load pending appointments
            if (!IsPostBack)
            {
                GridView1.DataBind(); // Bind data to GridView
                LoadPendingAppointments(); // Load pending appointments
            }
        }

        private void LoadPendingAppointments()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT 'C' + RIGHT('000' + CAST(c_id AS VARCHAR), 3) AS formatted_c_id, " +
                "c_dob, c_patientname, c_gender, c_email, c_package, status, ap_date, ap_time " +
                "FROM patient_consultancy_tbl " +
                "WHERE video_link IS NULL;";


                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Check if an ID is entered
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                // Display alert message if ID is not entered
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter an ID before searching.');", true);
                return; // Stop execution if ID is empty
            }

            // Define the connection string (assumes you have it in Web.config under the name "defaultDB")
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Define your SQL query to fetch all relevant fields
                string query = "SELECT 'C' + RIGHT('000' + CAST(c_id AS VARCHAR), 3) AS formatted_c_id, " +
                               "c_dob, c_patientname, c_contact, c_gender, c_email, c_package, " +
                               "status, c_problem, ap_date, ap_time, video_link " +
                               "FROM patient_consultancy_tbl " +
                               "WHERE 'C' + RIGHT('000' + CAST(c_id AS VARCHAR), 3) = @ID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", TextBox1.Text);

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Populate each textbox with the corresponding database field
                        TextBox2.Text = reader["c_contact"].ToString();
                        TextBox5.Text = reader["c_patientname"].ToString();
                        TextBox6.Text = reader["c_email"].ToString();
                        TextBox7.Text = Convert.ToDateTime(reader["c_dob"]).ToString("yyyy-MM-dd"); // Format as date
                        TextBox8.Text = reader["c_gender"].ToString();
                        TextBox10.Text = reader["c_problem"].ToString();
                        TextBox11.Text = reader["c_package"].ToString();

                        // Conditionally populate these fields only if they are not null
                        if (reader["ap_date"] != DBNull.Value)
                            TextBox3.Text = Convert.ToDateTime(reader["ap_date"]).ToString("yyyy-MM-dd");

                        if (reader["ap_time"] != DBNull.Value)
                            TextBox4.Text = reader["ap_time"].ToString();

                        if (reader["video_link"] != DBNull.Value)
                            TextBox9.Text = reader["video_link"].ToString();
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

        protected void btnStartVideoCall_Command(object sender, CommandEventArgs e)
        {
            // Retrieve the command argument, if needed
            string formattedCId = e.CommandArgument.ToString();

            // Define your Google Meet URL
            // Replace with your specific Google Meet link or dynamically generate it.
            string googleMeetLink = "https://meet.google.com/landing";

            // Redirect to the Google Meet link
            Response.Redirect(googleMeetLink);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("setdatetime.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            // Check if all required textboxes are filled
            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) ||
                string.IsNullOrEmpty(TextBox5.Text) || string.IsNullOrEmpty(TextBox6.Text) ||
                string.IsNullOrEmpty(TextBox7.Text) || string.IsNullOrEmpty(TextBox8.Text) ||
                string.IsNullOrEmpty(TextBox9.Text) || string.IsNullOrEmpty(TextBox10.Text) ||
                string.IsNullOrEmpty(TextBox11.Text))
            {
                // Display an error message if any textbox is empty
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Please fill in all the required fields before updating.');", true);
                return; // Stop execution if validation fails
            }

            // Define the connection string
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Define the SQL query to update the video_link column
                string query = "UPDATE patient_consultancy_tbl " +
                               "SET video_link = @VideoLink " +
                               "WHERE 'C' + RIGHT('000' + CAST(c_id AS VARCHAR), 3) = @ID";

                SqlCommand cmd = new SqlCommand(query, con);

                // Pass parameters to avoid SQL injection
                cmd.Parameters.AddWithValue("@VideoLink", TextBox9.Text); // Assuming TextBox9 contains the video link
                cmd.Parameters.AddWithValue("@ID", TextBox1.Text); // Assuming TextBox1 contains the formatted ID

                try
                {
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery(); // Execute the update query

                    if (rowsAffected > 0)
                    {
                        // Display success message if the record is updated
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                            $"alert('Record updated successfully for ID: {TextBox1.Text}.');", true);

                        // Send email to the patient
                        SendEmail(TextBox6.Text, TextBox5.Text, TextBox3.Text, TextBox4.Text, TextBox9.Text);

                    }
                    else
                    {
                        // Display error if no record was updated
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                            "alert('No record found with the provided ID.');", true);
                    }
                }
                catch (Exception ex)
                {
                    // Handle any errors that occur
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                        $"alert('An error occurred while updating the record: {ex.Message}');", true);
                }
            }
        }

        private void SendEmail(string toEmail, string patientName, string apDate, string apTime, string videoLink)
        {
            try
            {
                // Create a new MailMessage object
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("drzopeclinic2024@gmail.com"); // Sender's email
                mail.To.Add(toEmail);
                mail.Subject = "Online Consultancy Appointment Details";
                mail.Body = $"Dear {patientName},\n\n" +
                            "Your online consultancy appointment details are as follows:\n\n" +
                            $"Appointment Date: {apDate}\n" +      // Corrected: Using apDate
                            $"Appointment Time: {apTime}\n" +      // Corrected: Using apTime
                            $"Video Link: {videoLink}\n\n" +
                            "Please join the meeting using the provided link at the scheduled time.\n\n" +
                            "Thank you,\nDr. Zope's Clinic";
                mail.IsBodyHtml = false;

                // Configure the SMTP client
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587); // Gmail's SMTP server
                smtp.Credentials = new System.Net.NetworkCredential("drzopeclinic2024@gmail.com", "ciwhzfegzirslhon"); // Sender's credentials
                smtp.EnableSsl = true;

                // Send the email
                smtp.Send(mail);

                // Display success message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    "alert('Email sent successfully to the patient.');", true);
            }
            catch (Exception ex)
            {
                // Handle any errors that occur during email sending
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                    $"alert('An error occurred while sending the email: {ex.Message}');", true);
            }
        }





    }
}