using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;

namespace WebApplication1.Doctor
{
    public partial class setdatetime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Enabled = false; // Disable Calendar initially
                ButtonSaveDate.Enabled = false; // Disable Button initially

                // Check if the date is already saved
                if (Session["IsDateSaved"] != null && (bool)Session["IsDateSaved"])
                {
                    Calendar1.Enabled = false; // Keep calendar disabled
                    ButtonSaveDate.Enabled = false; // Keep save button disabled
                }

                HighlightBookedSlots(); // Highlight booked slots
            }
        }

        protected void HighlightBookedSlots()
        {
            if (!string.IsNullOrEmpty(TextBox1.Text)) // Ensure a date is selected
            {
                string selectedDate = TextBox1.Text.Trim(); // Selected date from TextBox1
                string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        // Query to retrieve booked slots for the selected date
                        string query = "SELECT ap_time FROM patient_consultancy_tbl WHERE ap_date = @AppDate";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@AppDate", selectedDate);

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                List<string> bookedSlots = new List<string>();

                                while (reader.Read())
                                {
                                    bookedSlots.Add(reader["ap_time"].ToString());
                                }

                                // Highlight booked slots in red
                                foreach (string slot in bookedSlots)
                                {
                                    string slotID = "slot" + slot.Replace(":", "").Trim(); // Assuming slot button IDs follow a pattern
                                    var slotControl = FindControl(slotID);

                                    if (slotControl != null && slotControl is System.Web.UI.WebControls.Button slotButton)
                                    {
                                        slotButton.BackColor = System.Drawing.Color.Red;
                                        slotButton.Enabled = false; // Disable the booked slot
                                    }
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error highlighting booked slots: {ex.Message}');", true);
                }
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            string enteredFormattedID = TextBox2.Text.Trim();

            // Disable Calendar and Save Button initially
            Calendar1.Enabled = false;
            ButtonSaveDate.Enabled = false;

            if (string.IsNullOrEmpty(enteredFormattedID))
            {
                // No ID entered, show an alert and exit
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid Doctor ID.');", true);
                return;
            }

            try
            {
                // Validate ID format and check database
                if (enteredFormattedID.StartsWith("C") && int.TryParse(enteredFormattedID.Substring(1), out int numericID))
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string query = "SELECT COUNT(*) FROM patient_consultancy_tbl WHERE c_id = @CID";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@CID", numericID);

                            int recordCount = Convert.ToInt32(command.ExecuteScalar());

                            if (recordCount > 0)
                            {
                                // Enable Calendar if the ID exists
                                Calendar1.Enabled = true;
                            }
                            else
                            {
                                // Clear TextBox2 and show an alert if ID doesn't exist
                                TextBox2.Text = "";
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Entered ID does not exist in the database. Please enter a valid ID.');", true);
                            }
                        }
                    }
                }
                else
                {
                    // Invalid format, show an alert
                    TextBox2.Text = "";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid ID format. Please enter in C### format.');", true);
                }
            }
            catch (Exception ex)
            {
                // Handle any unexpected errors
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox2.Text))
            {
                TextBox1.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
                Session["c_ap_date"] = Calendar1.SelectedDate; // Store date in Session
                ButtonSaveDate.Enabled = true; // Enable Save button once a date is selected

                HighlightBookedSlots(); // Call after selecting a date to refresh the UI
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter Doctor ID first.');", true);
            }
        }

        protected void ButtonSaveDate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a date and enter a valid ID!');", true);
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "UPDATE patient_consultancy_tbl SET ap_date = @AppDate WHERE c_id = @CID";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@AppDate", Calendar1.SelectedDate);
                        command.Parameters.AddWithValue("@CID", TextBox2.Text.Substring(1)); // Extract numeric ID

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Success message
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Date updated successfully!');", true);

                            // Disable calendar and save button
                            Calendar1.Enabled = false;
                            ButtonSaveDate.Enabled = false;

                            // Store state in session to maintain after postback
                            Session["IsDateSaved"] = true;
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No record found with the entered ID.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Get selected slot and date
            string selectedSlot = HiddenFieldSlot.Value; // Hidden field value for the selected slot
                                                         // Date from the calendar or date textbox
                                                         // Doctor ID entered by the user

            if (string.IsNullOrEmpty(selectedSlot))
            {
                // Validate inputs
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a slot, date, and enter Doctor ID.');", true);
                return;
            }

            // Connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            // SQL Query to update the time slot and date
            string query = "UPDATE patient_consultancy_tbl SET  ap_time = @AppTime WHERE c_id = @CID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Set SQL parameters

                        command.Parameters.AddWithValue("@AppTime", selectedSlot);
                        command.Parameters.AddWithValue("@CID", TextBox2.Text.Substring(1));

                        // Execute the query
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Success message
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Time slot updated successfully!');", true);
                            Response.Redirect("doctorconsultancy.aspx");
                        }
                        else
                        {
                            // Error message if no rows are affected
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Update failed! Please check Doctor ID.');", true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                }
            }
        }
    }
}




