using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Doctor
{
    public partial class add_emergency_appointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               LoadAvailableTimeSlots();
            }
        }

        private void LoadAvailableTimeSlots()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
            string query = "SELECT e_appointment_time FROM emergency_appointment_tbl WHERE e_appointment_date = CAST(GETDATE() AS DATE)";

            List<string> bookedSlots = new List<string>();
            List<string> allSlots = new List<string>
    {
        "12:30 - 1:00",
        "6:00 - 6:30",
        "9:00 - 9:30",
        "2:30 - 3:00"
    };

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            bookedSlots.Add(reader["e_appointment_time"].ToString());
                        }
                    }
                    catch (SqlException ex)
                    {
                        string sanitizedMessage = ex.Message.Replace("'", "\\'");
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('SQL Error: {sanitizedMessage}');", true);
                    }
                }
            }

            // Bind available slots to DropDownList
            DropDownList1.Items.Clear();
            DropDownList1.Items.Add(new ListItem("Select", "")); // Default option
            foreach (string slot in allSlots)
            {
                if (!bookedSlots.Contains(slot))
                {
                    DropDownList1.Items.Add(new ListItem(slot));
                }
            }
        }

        protected void InsertRecord()
        {
            // Validate form fields
            if (string.IsNullOrWhiteSpace(TextBox1.Text) ||
                string.IsNullOrWhiteSpace(TextBox2.Text) ||
                string.IsNullOrWhiteSpace(TextBox3.Text) ||
                RadioButtonList1.SelectedValue == string.Empty ||
                string.IsNullOrWhiteSpace(TextBox4.Text) ||
                string.IsNullOrWhiteSpace(TextBox5.Text) ||
                string.IsNullOrWhiteSpace(TextBox6.Text) ||
                DropDownList1.SelectedValue == string.Empty ||
                string.IsNullOrWhiteSpace(TextBox7.Text) ||
                string.IsNullOrWhiteSpace(TextBox8.Text))
            {
                // Show an alert dialog if any field is empty
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('All fields are required. Please fill in all the details.');", true);
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            // Retrieve form values
            string fullName = TextBox1.Text;
            DateTime birthDate;
            DateTime.TryParse(TextBox2.Text, out birthDate);
            string bloodType = TextBox3.Text;
            string gender = RadioButtonList1.SelectedValue;
            string contactNumber = TextBox4.Text;
            string email = TextBox5.Text;
            string fullAddress = TextBox6.Text;
            string time = DropDownList1.SelectedValue;
            string height = TextBox7.Text;
            string weight = TextBox8.Text;
            string status = "pending";

            string query = @"INSERT INTO emergency_appointment_tbl 
    (e_name, e_bloodtype, e_gender, e_contact, e_emailid, e_dob, e_address, 
    e_appointment_time, e_appointment_date, height, weight, status)
    VALUES (@FullName, @BloodType, @Gender, @Contact, @Email, 
    @BirthDate, @Address, @Time, GETDATE(), @Height, @Weight, @Status)";

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
                    command.Parameters.AddWithValue("@BirthDate", birthDate);
                    command.Parameters.AddWithValue("@Address", fullAddress);
                    command.Parameters.AddWithValue("@Time", time);
                    command.Parameters.AddWithValue("@Height", height);
                    command.Parameters.AddWithValue("@Weight", weight);
                    command.Parameters.AddWithValue("@Status", status);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Show success message
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record inserted successfully!');", true);

                            // Clear all fields
                            ClearFields();
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No record inserted. Check field values or constraints.');", true);
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

        private void ClearFields()
        {
            // Reset all TextBoxes
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;
            TextBox7.Text = string.Empty;
            TextBox8.Text = string.Empty;

            // Reset DropDownList
            DropDownList1.SelectedIndex = 0; // Reset to "Select"

            // Reset RadioButtonList
            RadioButtonList1.ClearSelection();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            InsertRecord();
        }

    }
}