using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Doctor
{
    public partial class add_receptionist : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDoctorData();
        }
        void LoadDoctorData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // Modify the SQL query to select records where id starts with 'r0'
                SqlCommand cmd = new SqlCommand("SELECT id, name1, d_username, d_password FROM doctor_login_tbl WHERE id LIKE 'r0%'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        bool checkIfDoctorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                // Check if the doctor ID already exists
                SqlCommand cmdId = new SqlCommand("SELECT COUNT(*) FROM doctor_login_tbl WHERE id = @Id", con);
                cmdId.Parameters.AddWithValue("@Id", TextBox3.Text.Trim());
                int idCount = Convert.ToInt32(cmdId.ExecuteScalar());

                // Check if the doctor username already exists
                SqlCommand cmdUsername = new SqlCommand("SELECT COUNT(*) FROM doctor_login_tbl WHERE d_username = @Username", con);
                cmdUsername.Parameters.AddWithValue("@Username", TextBox4.Text.Trim());
                int usernameCount = Convert.ToInt32(cmdUsername.ExecuteScalar());

                con.Close();

                // If either the ID or username already exists, return true
                if (idCount > 0)
                {

                    return true;
                }
                if (usernameCount > 0)
                {
                    Response.Write("<script>alert('Username already exists. Please use a different username.')</script>");
                    return true;
                }

                return false; // Return false if neither exists
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
                return false;
            }
        }

        bool IsFormValid()
        {
            if (string.IsNullOrWhiteSpace(TextBox3.Text) ||
                string.IsNullOrWhiteSpace(TextBox1.Text) ||
                string.IsNullOrWhiteSpace(TextBox2.Text) ||
                string.IsNullOrWhiteSpace(TextBox4.Text) ||
                string.IsNullOrWhiteSpace(TextBox5.Text))
            {
                Response.Write("<script>alert('Please fill all the fields')</script>");
                return false;
            }
            return true;
        }

        void addnewdoctor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO doctor_login_tbl (id, name1, joining_date, designation, d_username, d_password) VALUES (@Id, @Name, @Joining_date, @Designation, @D_username, @D_password)", con);
                cmd.Parameters.AddWithValue("@Id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Joining_date", DateTime.Now.Date);
                cmd.Parameters.AddWithValue("@Designation", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@D_username", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@D_password", TextBox5.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Record added successfully!')</script>");
                clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updateDoctor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                SqlCommand cmd = new SqlCommand("UPDATE doctor_login_tbl SET name1=@Name, d_username=@D_username, d_password=@D_password WHERE id=@Id", con);
                cmd.Parameters.AddWithValue("@Id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@D_username", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@D_password", TextBox5.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Record updated successfully!')</script>");
                clearform();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void deletedoctor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM doctor_login_tbl WHERE id=@Id", con);
                cmd.Parameters.AddWithValue("@Id", TextBox3.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Record deleted successfully')</script>");
                clearform();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void clearform()
        {
            TextBox1.Text = "";

            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }

        protected void getdoctorbyID()
        {
            try
            {
                if (string.IsNullOrEmpty(TextBox3.Text))
                {
                    Response.Write("<script>alert('Please enter a valid ID.')</script>");
                    return;
                }

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT name1 FROM doctor_login_tbl WHERE id = @id", con);
                    cmd.Parameters.AddWithValue("@id", TextBox3.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
                        TextBox1.Text = dt.Rows[0]["name1"].ToString();  // Assuming 'name1' is the column with doctor name
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid ID')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }


        protected void Button2_Click(object sender, EventArgs e)//add
        {
            if (IsFormValid())
            {
                if (checkIfDoctorExists())
                {
                    Response.Write("<script>alert('Record with this ID, username, or password already exists')</script>");
                }
                else
                {
                    addnewdoctor();
                    LoadDoctorData();

                }
            }

        }

        protected void Button3_Click(object sender, EventArgs e)//update
        {
            if (checkIfDoctorExists())
            {
                updateDoctor();
                LoadDoctorData();

            }
            else
            {
                Response.Write("<script>alert('Record does not exist')</script>");
            }

        }

        protected void Button4_Click(object sender, EventArgs e)//delete
        {
            if (checkIfDoctorExists())
            {
                deletedoctor();
                LoadDoctorData();

            }
            else
            {
                Response.Write("<script>alert('Record does not exist')</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)//go
        {
            getdoctorbyID();

        }
    }
}