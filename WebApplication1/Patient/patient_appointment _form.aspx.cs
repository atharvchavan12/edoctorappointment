using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace WebApplication1.Patient
{
    public partial class patient_appointment_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AppointmentFormPanel.Visible = false;

                // Restore values from Session if they exist
                if (Session["FullName"] != null)
                    TextBox3.Text = Session["FullName"].ToString();
                if (Session["ContactNumber"] != null)
                    TextBox4.Text = Session["ContactNumber"].ToString();
                if (Session["Email"] != null)
                    TextBox5.Text = Session["Email"].ToString();
                if (Session["BirthDate"] != null)
                    TextBox1.Text = Session["BirthDate"].ToString();
                if (Session["BloodType"] != null)
                    TextBox2.Text = Session["BloodType"].ToString();
                if (Session["Gender"] != null)
                    RadioButtonList1.SelectedValue = Session["Gender"].ToString();
                if (Session["ProblemDescription"] != null)
                    TextBox11.Text = Session["ProblemDescription"].ToString();
                if (Session["State"] != null)
                    DropDownList1.SelectedValue = Session["State"].ToString();
                if (Session["City"] != null)
                    TextBox9.Text = Session["City"].ToString();
                if (Session["Pincode"] != null)
                    TextBox10.Text = Session["Pincode"].ToString();
                if (Session["Address"] != null)
                    TextBox8.Text = Session["Address"].ToString();
                if (Session["Username"] != null)
                    TextBox12.Text = Session["Username"].ToString();

                // Store the password in HiddenField for postbacks
                if (Session["Password"] != null)
                    HiddenPassword.Value = Session["Password"].ToString();

                // Disable autocomplete on sensitive fields
                TextBox12.Attributes.Add("autocomplete", "off");
                TextBox13.Attributes.Add("autocomplete", "new-password");

                // Set the initial value of password textbox
                TextBox13.Attributes["value"] = HiddenPassword.Value;
            }
            else
            {
                // Set the password field's value during postbacks
                TextBox13.Attributes["value"] = HiddenPassword.Value;
            }
        }


        // Insert record function
        protected void InsertRecord()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            // Retrieve form values
            string fullName = TextBox3.Text;
            string bloodType = TextBox2.Text;
            DateTime birthDate;
            DateTime.TryParse(TextBox1.Text, out birthDate);
            string gender = RadioButtonList1.SelectedValue;
            string contactNumber = TextBox4.Text;
            string email = TextBox5.Text;
            string problemDescription = TextBox11.Text;
            string state1 = DropDownList1.SelectedValue;
            string city = TextBox9.Text;
            string pinCode = TextBox10.Text;
            string fullAddress = TextBox8.Text;
            string username = TextBox12.Text;
            string password = TextBox13.Text;
            string Status = "pending";

            string query = @"INSERT INTO patient_appointment_tbl 
                  (p_name, p_bloodtype, p_gender, p_contact, p_emailid, p_problem, 
                  p_state, p_city, p_pincode, p_dob, p_address, p_username, p_password, 
                  p_appointment_time, p_appointment_date, status)
                  VALUES (@FullName, @BloodType, @Gender, @Contact, @Email, 
                  @ProblemDescription, @State, @City, @PinCode, @BirthDate, 
                  @Address, @Username, @Password, CAST(GETDATE() AS TIME), GETDATE(), @Status)";



            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters
                    command.Parameters.AddWithValue("@FullName", fullName);
                    command.Parameters.AddWithValue("@BloodType", bloodType);
                    command.Parameters.AddWithValue("@Gender", gender);
                    command.Parameters.AddWithValue("@Contact", contactNumber);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@ProblemDescription", problemDescription);
                    command.Parameters.AddWithValue("@State", state1);
                    command.Parameters.AddWithValue("@City", city);
                    command.Parameters.AddWithValue("@PinCode", pinCode);
                    command.Parameters.AddWithValue("@BirthDate", birthDate);
                    command.Parameters.AddWithValue("@Address", fullAddress);
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@Status", Status);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            
                            lblModalMessage.Text = "Record inserted successfully!";
                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                        }
                        else
                        {
                           
                            lblModalMessage.Text = "No record inserted. Check field values or constraints.";
                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
                        }
                    }
                    catch (SqlException ex)
                    {
                        string sanitizedMessage = ex.Message.Replace("'", "\\'");
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('SQL Error: {sanitizedMessage}');", true);
                    }
                }
            }
        }

        // Clear fields


        // Redirects and stores form values in session
        protected void Button3_Click(object sender, EventArgs e)
        {
            StoreFormValuesInSession();
            Response.Redirect("select_appointment_date.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            StoreFormValuesInSession();
            Response.Redirect("select_appointment_time.aspx");
        }

        // Stores form values in session
        private void StoreFormValuesInSession()
        {
            Session["FullName"] = TextBox3.Text;
            Session["ContactNumber"] = TextBox4.Text;
            Session["Email"] = TextBox5.Text;
            Session["BirthDate"] = TextBox1.Text;
            Session["BloodType"] = TextBox2.Text;
            Session["ProblemDescription"] = TextBox11.Text;
            Session["State"] = DropDownList1.SelectedValue;
            Session["City"] = TextBox9.Text;
            Session["Pincode"] = TextBox10.Text;
            Session["Address"] = TextBox8.Text;
            Session["Gender"] = RadioButtonList1.SelectedValue;
            Session["Username"] = TextBox12.Text;
            Session["Password"] = TextBox13.Text;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            InsertRecord();



            // Uncomment this line once data is inserting successfully
            Response.Redirect("select_appointment_date.aspx");
        }

        private bool IsUserAuthenticated(string username, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            string query = "SELECT COUNT(*) FROM patient_signupin_tbl WHERE p_username = @Username AND p_password = @Password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        connection.Open();
                        int userCount = (int)command.ExecuteScalar();
                        return userCount > 0;
                    }
                    catch (Exception ex)
                    {
                        lblModalMessage.Text = "Error: " + ex.Message.Replace("'", "\\'");
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);

                        return false;
                    }
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (IsUserAuthenticated(TextBox12.Text, TextBox13.Text))
            {
                // Show the remaining form fields if the user is authenticated
                AppointmentFormPanel.Visible = true;

                // Hide the Username, Password, and Login button after successful login
                TextBox12.Enabled = false;
                TextBox13.Enabled = true;
                LoginButton.Visible = false;

                // Store username in session for later use
                Session["Username"] = TextBox12.Text;
                Session["Password"] = TextBox13.Text;



                HiddenPassword.Value = Session["Password"].ToString();
            }
            else
            {
                AppointmentFormPanel.Visible = true;
            }
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            string username = TextBox12.Text;
            string password = TextBox13.Text;

            if (CheckAndLoadPreviousAppointment(username, password))
            {
                // Load the form with existing details
                AppointmentFormPanel.Visible = true;
            }
            else
            {
                lblModalMessage.Text = "You are new here, we do not have any details of you.";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);
            }
        }

        private bool CheckAndLoadPreviousAppointment(string username, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            string query = @"SELECT p_name, p_bloodtype, p_gender, p_contact, p_emailid, p_problem,
                             p_state, p_city, p_pincode, p_dob, p_address
                             FROM patient_appointment_tbl
                             WHERE p_username = @Username AND p_password = @Password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows && reader.Read())
                        {
                            // Populate form fields
                            TextBox3.Text = reader["p_name"].ToString();
                            TextBox2.Text = reader["p_bloodtype"].ToString();
                            RadioButtonList1.SelectedValue = reader["p_gender"].ToString();
                            TextBox4.Text = reader["p_contact"].ToString();
                            TextBox5.Text = reader["p_emailid"].ToString();
                            TextBox11.Text = reader["p_problem"].ToString();
                            DropDownList1.SelectedValue = reader["p_state"].ToString();
                            TextBox9.Text = reader["p_city"].ToString();
                            TextBox10.Text = reader["p_pincode"].ToString();
                            TextBox1.Text = Convert.ToDateTime(reader["p_dob"]).ToString("yyyy-MM-dd");
                            TextBox8.Text = reader["p_address"].ToString();
                            return true;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblModalMessage.Text = "Error: " + ex.Message.Replace("'", "\\'");
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "$('#messageModal').modal('show');", true);

                    }
                }
            }

            return false;
        }

    }
}
