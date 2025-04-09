using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Doctor
{
    public partial class setschedule3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDoctorData();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {
                int id = Convert.ToInt32(e.CommandArgument); // Get the id from the CommandArgument
                DeleteRecord(id); // Delete the record with the specified id
                LoadDoctorData(); // Refresh the GridView to show updated data
            }
        }

        void DeleteRecord(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM availability WHERE id = @id", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    int rowsAffected = cmd.ExecuteNonQuery(); // Capture the number of affected rows

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Record deleted successfully');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('No record found with the specified ID');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void LoadDoctorData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT id, non_availability_date FROM availability", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();

                    // Bind the data to GridView
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DateTime vacationDate;

            if (DateTime.TryParse(txtVacationDate.Text, out vacationDate))
            {
                InsertVacationDate(vacationDate);
                txtVacationDate.Text = string.Empty; // Clear the textbox
            }
            else
            {
                txtVacationDate.Text = "Invalid date format!";
            }
        }

        void InsertVacationDate(DateTime vacationDate)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO availability (non_availability_date) VALUES (@vacationDate)", con);
                    cmd.Parameters.AddWithValue("@vacationDate", vacationDate);
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
                LoadDoctorData(); // Refresh the GridView to show the newly added date
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // Handle calendar selection
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // Set the selected date in the TextBox
            txtVacationDate.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
        }

        // Customize the display of the calendar days
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            // Highlight the holiday dates
            DataTable dt = GetHolidayDates();
            foreach (DataRow row in dt.Rows)
            {
                DateTime holidayDate = Convert.ToDateTime(row["non_availability_date"]);
                if (e.Day.Date == holidayDate)
                {
                    e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF6347"); // Set holiday dates in tomato color
                }
            }

            // Highlight today's date with a yellow background and a 3px border
            if (e.Day.Date == DateTime.Today)
            {
                e.Cell.BackColor = System.Drawing.Color.Yellow;
                e.Cell.BorderWidth = 3;
                e.Cell.BorderColor = System.Drawing.Color.Black;
            }

            // Highlight Sundays in tomato color (#FF6347)
            if (e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
            {
                e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF6347"); // Set Sundays in tomato color
            }
        }


        // Retrieve the holiday dates from the database
        private DataTable GetHolidayDates()
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT non_availability_date FROM availability", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            return dt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("emergencyleave.aspx");
        }
    }
}
