using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace WebApplication1
{
    public partial class doctorlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Attributes.Add("autocomplete", "off");
                TextBox2.Attributes.Add("autocomplete", "new-password");
            }

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            // Get values from textboxes
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            // SQL query to check if the user exists and has the designation "Doctor"
            string query = "SELECT d_username, d_password FROM doctor_login_tbl WHERE d_username = @Username AND d_password = @Password AND designation = 'Doctor'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        // Open connection
                        connection.Open();

                        // Execute query and read user data
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Login successful
                                // Store user values in session
                                Session["Username_d"] = reader["d_username"].ToString();
                                Session["Password_d"] = reader["d_password"].ToString();
                                Session["Role"] = "admin";


                                lblModalMessage.Text = "Login Successful";
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                               
                                Response.Redirect("~/Doctor/doctor_panel1.aspx");
                            }
                            else
                            {
                                // Login failed
      

                                lblModalMessage.Text = "Invalid username or password.";
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle any errors
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "\\'") + "');", true);
                    }
                }
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}