using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using DlibDotNet.Dnn;
using System.IO;
using System.Xml.Linq;

namespace WebApplication1
{
    public partial class homepage2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTestimonials();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Retrieve the username and password from the session variables
            string username = Session["Username"] != null ? Session["Username"].ToString() : null;
            string password = Session["Password"] != null ? Session["Password"].ToString() : null;

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                // Verify the credentials against the database
                string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(1) FROM patient_signupin_tbl WHERE p_username = @Username AND p_password = @Password";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count == 1)
                    {
                        // Valid credentials, redirect to the appointment form
                        Response.Redirect("~/Patient/patient_appointment _form.aspx");
                    }
                    else
                    {
                        // Invalid credentials, redirect to the sign-in form
                        Response.Redirect("~/Patient/patient_signin_form.aspx");
                    }
                }
            }
            else
            {
                // No username or password in session, redirect to the sign-in form
                Response.Redirect("~/Patient/patient_signin_form.aspx");
            }
        }


protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            // Redirect to the sign-in page if not signed in
            Response.Redirect("~/Patient/patient_signin_form.aspx");
            return;
        }

        // Retrieve input values from the TextBox controls
        string name = txtName.Text;
        string email = txtEmail.Text;
        string subject = txtSubject.Text;
        string message = txtMessage.Text;

        // Initialize ImageURl to a default image in the 'img' folder
        string ImageURl = "img/feedback_icon.jpg";

        // Check if an image is uploaded
        if (fileUpload.HasFile)
        {
            try
            {
                // Get the file extension and ensure it's a valid image file type
                string fileExtension = Path.GetExtension(fileUpload.PostedFile.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                {
                    // Generate a unique filename to avoid conflicts
                    string fileName = "feedback_" + Guid.NewGuid().ToString() + fileExtension;
                    string filePath = Server.MapPath("img/") + fileName;

                    // Save the uploaded file to the 'img' folder
                    fileUpload.SaveAs(filePath);

                    // Set the ImageURl to the newly saved image path
                    ImageURl = "img/" + fileName;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please upload a valid image file (.jpg, .jpeg, .png, .gif).');", true);
                    return;
                }
            }
            catch (Exception ex)
            {
                // Handle any errors during file upload
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred while uploading the image: {ex.Message}');", true);
                return;
            }
        }

        // Define the SQL connection string (update with your actual connection string if needed)
        string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

        // SQL query to insert data into patient_feedback_tbl
        string query = "INSERT INTO patient_feedback_tbl (p_name, p_email, p_subject, p_message, ImageUrl) " +
                       "VALUES (@Name, @Email, @Subject, @Message, @ImageURL)";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Add parameters to avoid SQL injection
                command.Parameters.AddWithValue("@Name", name);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Subject", subject);
                command.Parameters.AddWithValue("@Message", message);
                command.Parameters.AddWithValue("@ImageURL", ImageURl);

                // Open the database connection, execute the command, and display a success message
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();

                    // Display an alert message to the user
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Feedback sent successfully!');", true);

                    // Optionally, clear the form after submission
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtSubject.Text = "";
                    txtMessage.Text = "";
                }
                catch (Exception ex)
                {
                    // Handle exceptions (e.g., log error, show error message)
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                }
            }
        }
    }


    private void LoadTestimonials()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT p_message, ImageUrl,P_name FROM patient_feedback_tbl";
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                rptTestimonials.DataSource = reader;
                rptTestimonials.DataBind();
            }
        }
    }
}