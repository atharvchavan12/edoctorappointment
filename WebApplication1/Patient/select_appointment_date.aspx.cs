using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Ocsp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace WebApplication1.Patient
{
   
    public partial class select_appointment_date : System.Web.UI.Page
    {
        private List<DateTime> nonAvailabilityDates;
        string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["SelectedAppointmentDate"] = null;

                if (Session["Username"] == null)
                {
                    Response.Redirect("patient_signin_form.aspx"); // Redirect to login if session expired
                }

                // Reset IsDateSaved for a new appointment


                nonAvailabilityDates = new List<DateTime>();
                LoadNonAvailabilityDates();
                ViewState["NonAvailabilityDates"] = nonAvailabilityDates;

                // Check if a date has already been saved for this user

            }
            else
            {
                nonAvailabilityDates = ViewState["NonAvailabilityDates"] as List<DateTime>;
            }
        }


        private void LoadNonAvailabilityDates()
        {


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT non_availability_date FROM availability";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            nonAvailabilityDates.Add(reader.GetDateTime(0));
                        }
                    }
                }
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            if (Session["Username"] != null || Session["Password"] != null)
            {
                Label1.Text = "Your selected date is: " + Calendar1.SelectedDate.ToShortDateString();
            }
        }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
{
    DateTime minSelectableDate = DateTime.Today.AddDays(2);
    DateTime maxSelectableDate = DateTime.Today.AddDays(14);

    // Disable dates that are outside the allowed range or fall on Sundays
    if (e.Day.Date < minSelectableDate || e.Day.Date > maxSelectableDate || e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
    {
        e.Cell.Enabled = false;
        e.Cell.BackColor = System.Drawing.Color.LightGray;
        e.Cell.ForeColor = System.Drawing.Color.Brown;
    }
    else if (!nonAvailabilityDates.Contains(e.Day.Date)) // Available for appointment
    {
        e.Cell.BorderStyle = BorderStyle.Solid;
        e.Cell.BorderColor = System.Drawing.Color.Green;
        e.Cell.BorderWidth = Unit.Pixel(2);
    }

    // Add custom CSS class to non-availability dates
    if (e.Day.Date >= DateTime.Today && nonAvailabilityDates.Contains(e.Day.Date))
    {
        e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF6347");
        e.Cell.ForeColor = System.Drawing.Color.Black;
        e.Cell.CssClass = "non-available-date"; // Add a custom class
    }

    // Highlight the selected date in green
    if (Calendar1.SelectedDate == e.Day.Date)
    {
        e.Cell.BackColor = System.Drawing.Color.LightGreen;
        e.Cell.ForeColor = System.Drawing.Color.Black;
        e.Cell.Font.Bold = true;
    }

    // Highlight the current date in yellow and add tooltip
    if (e.Day.Date == DateTime.Today)
    {
        e.Cell.BackColor = System.Drawing.Color.Yellow;
        e.Cell.ForeColor = System.Drawing.Color.Black;
        e.Cell.BorderStyle = BorderStyle.Solid;
        e.Cell.BorderColor = System.Drawing.Color.Black;
        e.Cell.BorderWidth = Unit.Pixel(2);
        e.Cell.ToolTip = "Select a date at least 2 days after today's date for your appointment.";
    }
}



        public void FetchAndStoreEmail()
        {
            try
            {
                // Retrieve the username from the session
                string username = HttpContext.Current.Session["Username"]?.ToString();

                if (string.IsNullOrEmpty(username))
                {
                    throw new Exception("Username not found in session.");
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // SQL query to fetch the latest email ID
                    string query = @"
                    SELECT TOP 1 p_emailid,p_name 
                    FROM patient_appointment_tbl 
                    WHERE p_username = @Username 
                    ORDER BY p_id DESC";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);

                        connection.Open();
                        object result = command.ExecuteScalar();
                        connection.Close();

                        if (result != null)
                        {
                            // Store the email ID in a session variable
                            HttpContext.Current.Session["EmailID"] = result.ToString();
                            HttpContext.Current.Session["Name12"] = result.ToString();
                        }
                        else
                        {
                            HttpContext.Current.Session["EmailID"] = null;
                            HttpContext.Current.Session["Name12"] = null;
                            // Handle case where no email is found
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception (log or show error message)
                throw new Exception("An error occurred while fetching the email ID.", ex);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Ensure a date is selected
            if (Calendar1.SelectedDate == DateTime.MinValue)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a date before saving.');", true);
                return;
            }

            // Prevent selection on Sundays
            if (Calendar1.SelectedDate.DayOfWeek == DayOfWeek.Sunday)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Appointments cannot be booked on Sundays.');", true);
                return;
            }

            // Check if the selected date is a non-availability date (marked red)
            if (nonAvailabilityDates.Contains(Calendar1.SelectedDate))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Doctor not available on this date.');", true);
                return;
            }

            // Enforce a minimum selectable date of "day after tomorrow" and maximum of 14 days
            DateTime minSelectableDate = DateTime.Today.AddDays(2);
            DateTime maxSelectableDate = DateTime.Today.AddDays(14);
            if (Calendar1.SelectedDate < minSelectableDate || Calendar1.SelectedDate > maxSelectableDate)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a date within the next 14 days from current date.');", true);
                return;
            }

            // Check if user is logged in
            string username = Session["Username"] as string;
            if (string.IsNullOrEmpty(username))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Session has expired. Please log in again.');", true);
                return;
            }

            DateTime selectedDate = Calendar1.SelectedDate;
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Check if the doctor is available on the selected date in the database
                    string checkAvailabilityQuery = "SELECT COUNT(*) FROM availability WHERE non_availability_date = @selectedDate";
                    using (SqlCommand checkCmd = new SqlCommand(checkAvailabilityQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@selectedDate", selectedDate);
                        int count = (int)checkCmd.ExecuteScalar();

                        if (count > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Doctor not available on this date.');", true);
                            return;
                        }
                    }

                    // Update the appointment date in the database
                    string updateQuery = @"
UPDATE patient_appointment_tbl 
SET appointment_date = @AppointmentDate 
WHERE p_username = @Username 
AND p_id = (
    SELECT TOP 1 p_id 
    FROM patient_appointment_tbl 
    WHERE p_username = @Username 
    ORDER BY p_id DESC
)";

                    using (SqlCommand command = new SqlCommand(updateQuery, conn))
                    {
                        command.Parameters.AddWithValue("@AppointmentDate", selectedDate);
                        command.Parameters.AddWithValue("@Username", username);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Save session variable and provide feedback
                            Session["SelectedAppointmentDate"] = selectedDate;
                            Session["IsDateSaved"] = true;


                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Date saved successfully!');", true);

                            // Disable the calendar to prevent further selection
                            DisableDateSelection();
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to save the date. No matching records found.');", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any potential errors, such as database connectivity issues
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
            FetchAndStoreEmail();
        }
        // Method to disable date selection and hide the save button
        private void DisableDateSelection()
        {
            Calendar1.Enabled = false;
            Button1.Enabled = false;
            Button1.CssClass += " disabled"; // Optionally add a CSS class to style the disabled button
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            // Check if the Session["SelectedAppointmentDate"] is not null
            if (Session["SelectedAppointmentDate"] != null)
            {
                // Proceed with redirection if the date is selected
                Response.Redirect("try1.aspx");
            }
            else
            {
                // Optionally, display a message or take other actions if it's null
                // Example: Show a message to the user
                Response.Write("<script>alert('Please select an appointment date first.');</script>");
            }
        }
       

    }
}
