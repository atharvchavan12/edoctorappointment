using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Web;
using Azure;
using iTextSharp.text.pdf.draw;
using System.Net.Mail;
using System.Net;

namespace WebApplication1.Patient
{
    public partial class status : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null && Session["Password"] != null)
                {
                    string username = Session["Username"].ToString();
                    string password = Session["Password"].ToString();

                    if (AuthenticateUser(username, password))
                    {
                        LoadAppointments(username, password);
                        pnlAppointmentSelection.Visible = true;
                        lblMessage.Visible = false;
                    }
                    else
                    {
                        lblMessage.Text = "You have not taken any appointments.";
                        lblMessage.Visible = true;
                        pnlAppointmentSelection.Visible = false;
                    }
                }
                else
                {
                    Response.Redirect("~/Patient/patient_signin_form.aspx");
                }
            }
        }

        private bool AuthenticateUser(string username, string password)
        {
            bool hasAppointments = false;
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM patient_appointment_tbl WHERE p_username = @Username AND p_password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                hasAppointments = count > 0;
            }

            return hasAppointments;
        }

        private void LoadAppointments(string username, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT p_id, appointment_date FROM patient_appointment_tbl WHERE p_username = @Username AND p_password = @Password AND status = 'pending'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    ddlAppointments.Visible = true;
                    lblMessage.Visible = false;

                    // In the LoadAppointments method, modify ListItem references to avoid ambiguity
                    ddlAppointments.Items.Clear();
                    ddlAppointments.Items.Add(new System.Web.UI.WebControls.ListItem("Select an appointment", ""));

                    while (reader.Read())
                    {
                        string appointmentId = reader["p_id"].ToString();
                        string appointmentDate = reader["appointment_date"] != DBNull.Value
                            ? Convert.ToDateTime(reader["appointment_date"]).ToString("yyyy-MM-dd")
                            : "No Date Available";

                        ddlAppointments.Items.Add(new System.Web.UI.WebControls.ListItem($"Appointment on {appointmentDate}", appointmentId));
                    }

                }
                else
                {
                    ddlAppointments.Visible = false;
                   
                    lblMessage.Text = "You have not taken any appointments.";
                    lblMessage.Visible = true;
                }

                reader.Close();
            }
        }

        protected void ddlAppointments_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedAppointmentId = ddlAppointments.SelectedValue;

            if (!string.IsNullOrEmpty(selectedAppointmentId))
            {
                DisplayAppointmentDetails(selectedAppointmentId);
                pnlAppointmentDetails.Visible = true;
            }
            else
            {
                pnlAppointmentDetails.Visible = false;
            }
        }

        private void DisplayAppointmentDetails(string appointmentId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM patient_appointment_tbl WHERE p_id = @AppointmentId";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@AppointmentId", appointmentId);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    DetailsView1.DataSource = dt;
                    DetailsView1.DataBind();
                    pnlAppointmentDetails.Visible = true;
                }
                else
                {
                    pnlAppointmentDetails.Visible = false;
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null && Session["Password"] != null)
            {
                string username = Session["Username"].ToString();
                string password = Session["Password"].ToString();

                if (int.TryParse(AppointmentIdTextBox.Text, out int appointmentId))
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString + ";MultipleActiveResultSets=True";


                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();

                        string selectQuery = "SELECT p_appointment_time, p_appointment_date FROM patient_appointment_tbl WHERE p_id = @AppointmentId AND p_username = @Username AND p_password = @Password";
                        using (SqlCommand selectCmd = new SqlCommand(selectQuery, conn))
                        {
                            selectCmd.Parameters.AddWithValue("@AppointmentId", appointmentId);
                            selectCmd.Parameters.AddWithValue("@Username", username);
                            selectCmd.Parameters.AddWithValue("@Password", password);

                            using (SqlDataReader reader = selectCmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    TimeSpan appointmentTime = reader.GetTimeSpan(reader.GetOrdinal("p_appointment_time"));
                                    DateTime appointmentDate = reader.GetDateTime(reader.GetOrdinal("p_appointment_date"));

                                    DateTime appointmentDateTime = appointmentDate.Add(appointmentTime);
                                    DateTime currentTime = DateTime.Now;
                                    double differenceInHours = currentTime.Subtract(appointmentDateTime).TotalHours;

                                    if (differenceInHours > 24)
                                    {
                                        ClientScript.RegisterStartupScript(this.GetType(), "CancelAlert", "alert('You cannot cancel the appointment as the time has passed 24 hour.');", true);
                                    }
                                    else
                                    {
                                        string deleteQuery = "DELETE FROM patient_appointment_tbl WHERE p_id = @AppointmentId AND p_username = @Username AND p_password = @Password";

                                        using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn))
                                        {
                                            deleteCmd.Parameters.AddWithValue("@AppointmentId", appointmentId);
                                            deleteCmd.Parameters.AddWithValue("@Username", username);
                                            deleteCmd.Parameters.AddWithValue("@Password", password);

                                            int rowsAffected = deleteCmd.ExecuteNonQuery();

                                            if (rowsAffected > 0)
                                            {
                                                pnlAppointmentDetails.Visible = false;
                                                ddlAppointments.Items.Clear();
                                                AppointmentIdTextBox.Text = "";

                                                ClientScript.RegisterStartupScript(this.GetType(), "CancelSuccess", "alert('Appointment canceled successfully.');", true);
                                                LoadAppointments(username, password);
                                                // Email notification
                                           /*     try
                                                {
                                                    // Sender's email credentials
                                                    string fromMail = "drzopeclinic2024@gmail.com";
                                                    string fromPassword = "ciwhzfegzirslhon";

                                                    // Retrieve dynamic details from the session
                                                    string recipientEmail = Session["EmailID"]?.ToString(); ; // Patient's email address
                                                    string appointmentDate1 = Session["SelectedAppointmentDate"]?.ToString(); // Appointment date
                                                    string appointmentTime1 = Session["SelectedTime"]?.ToString(); // Appointment time
                                                    string name12 = Session["Name12"]?.ToString();

                                                    // Validate session values
                                                    if (string.IsNullOrEmpty(recipientEmail))
                                                    {
                                                        Response.Write("<script>alert('Error: Email is missing.');</script>");
                                                        return;
                                                    }

                                                    if (string.IsNullOrEmpty(appointmentDate1) || string.IsNullOrEmpty(appointmentTime1))
                                                    {
                                                        Response.Write("<script>alert('Error: Appointment details are missing.');</script>");
                                                        return;
                                                    }

                                                    // Email message setup
                                                    MailMessage message = new MailMessage();
                                                    message.From = new MailAddress(fromMail);
                                                    message.Subject = "Appointment Request Successfully Sent";
                                                    message.To.Add(new MailAddress(recipientEmail)); // Use the dynamic email from session


                                                    // Email body with dynamic session values
                                                    message.Body = $@"
  <html>
<body>
    <h3>Dear Patient,</h3>
    <p>We regret to inform you that your appointment has been successfully canceled. Below are the details of the canceled appointment:</p>
    <ul>
        <li><b>Appointment Date:</b> {appointmentDate1}</li>
        <li><b>Appointment Time:</b> {appointmentTime1}</li>
    </ul>
    <p>If this cancellation was not intentional or if you wish to reschedule, please contact us at your earliest convenience.</p>
    <p>We apologize for any inconvenience caused and look forward to serving you in the future.</p>
    <p>Best regards,<br> Dr. Zope's Clinic</p>
</body>
</html>";

                                                    message.IsBodyHtml = true;

                                                    // Configure SMTP client
                                                    var smtpClient = new SmtpClient("smtp.gmail.com")
                                                    {
                                                        Port = 587,
                                                        Credentials = new NetworkCredential(fromMail, fromPassword),
                                                        EnableSsl = true,
                                                    };

                                                    // Send the email
                                                    smtpClient.Send(message);

                                                    // Notify the user

                                                }
                                                catch (Exception ex)
                                                {
                                                    // Handle any errors
                                                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                                                }*/

                                                if (ddlAppointments.Items.Count == 0)
                                                {
                                                    ClientScript.RegisterStartupScript(this.GetType(), "NoAppointments", "alert('You have not taken any appointments.');", true);
                                                }
                                            }
                                            else
                                            {
                                                ClientScript.RegisterStartupScript(this.GetType(), "CancelError", "alert('Appointment not found or already canceled.');", true);
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    ClientScript.RegisterStartupScript(this.GetType(), "CancelError", "alert('Appointment not found.');", true);
                                }
                            }
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "InvalidAppointmentId", "alert('Please enter a valid Appointment ID.');", true);
                }
            }
            else
            {
                Response.Redirect("~/Patient/patient_signin_form.aspx");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
    {
        string username = Session["Username"]?.ToString();
        string password = Session["Password"]?.ToString();

        if (username != null && password != null)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                Document document = new Document(PageSize.A4, 50, 50, 50, 50);
                PdfWriter writer = PdfWriter.GetInstance(document, ms);
                document.Open();

                    PdfContentByte canvas = writer.DirectContentUnder;
                    Rectangle background = new Rectangle(document.PageSize);
                    background.BackgroundColor = new BaseColor(255, 245, 238); // #FFF5EE
                    background.BorderWidth = 0; // No border
                    background.Left = document.LeftMargin;
                    background.Right = document.PageSize.Width - document.RightMargin;
                    background.Top = document.PageSize.Height - document.TopMargin;
                    background.Bottom = document.BottomMargin;

                    // Draw and fill the background rectangle
                    canvas.SetColorFill(background.BackgroundColor);
                    canvas.Rectangle(background.Left, background.Bottom, background.Right - background.Left, background.Top - background.Bottom);
                    canvas.Fill();

                    // Set font styles
                    Font headerFont = FontFactory.GetFont("Arial", 18, Font.BOLD, new BaseColor(34, 139, 34)); // Green color for header
                Font labelFont = FontFactory.GetFont("Arial", 12, Font.BOLD);
                Font regularFont = FontFactory.GetFont("Arial", 12, Font.NORMAL);

                // Clinic Header
                Paragraph clinicHeader = new Paragraph("Dr. Zope's Clinic", headerFont);
                clinicHeader.Alignment = Element.ALIGN_CENTER;
                document.Add(clinicHeader);

                // Horizontal line after header
                LineSeparator line = new LineSeparator(1, 100, BaseColor.BLACK, Element.ALIGN_CENTER, -2);
                document.Add(new Chunk(line));

                document.Add(new Paragraph(" ")); // Empty line for spacing

                // Database connection and data retrieval
                string connectionString = ConfigurationManager.ConnectionStrings["defaultDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM patient_appointment_tbl WHERE p_username = @Username AND p_password = @Password";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Appointment details section
                        PdfPTable table = new PdfPTable(2);
                        table.WidthPercentage = 100;
                        table.SetWidths(new float[] { 1, 2 });

                        // Add labels and values in a table for alignment
                        table.AddCell(new PdfPCell(new Phrase("Appointment ID:\n", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(reader["p_id"].ToString(), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Date:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(Convert.ToDateTime(reader["appointment_date"]).ToString("yyyy-MM-dd"), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Time:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(reader["appointment_time"].ToString(), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Email ID:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(reader["p_emailid"].ToString(), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Patient Name:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(reader["p_name"].ToString(), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Username:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(username, regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Date of Birth:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(Convert.ToDateTime(reader["p_dob"]).ToString("yyyy-MM-dd"), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Blood Type:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(reader["p_bloodtype"].ToString(), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Gender:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(reader["p_gender"].ToString(), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Contact Number:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(reader["p_contact"].ToString(), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Problem:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(reader["p_problem"].ToString(), regularFont)) { Border = Rectangle.NO_BORDER });

                        table.AddCell(new PdfPCell(new Phrase("Address:", labelFont)) { Border = Rectangle.NO_BORDER });
                        table.AddCell(new PdfPCell(new Phrase(reader["p_address"].ToString(), regularFont)) { Border = Rectangle.NO_BORDER });

                        document.Add(table);

                        document.Add(new Paragraph(" ")); // Empty line for spacing

                        // Footer section with border
                        PdfPTable footerTable = new PdfPTable(2);
                        footerTable.WidthPercentage = 100;
                        footerTable.SetWidths(new float[] { 1, 1 });

                        PdfPCell leftFooter = new PdfPCell(new Phrase("Dr. Amol Zope\nContact: 9850115182", regularFont)) { Border = Rectangle.TOP_BORDER };
                        PdfPCell rightFooter = new PdfPCell(new Phrase("Dr. Sneha Zope\nContact: 72345878920", regularFont)) { Border = Rectangle.TOP_BORDER };
                        PdfPCell middleFooter = new PdfPCell(new Phrase("Address:2nd floorm,near Clove Restaurant,Maruti Mandir,Ratnagiri", regularFont)) { Border = Rectangle.TOP_BORDER };



                        footerTable.AddCell(leftFooter);
                        footerTable.AddCell(rightFooter);
                        footerTable.AddCell(middleFooter);
                        document.Add(footerTable);
                    }
                    else
                    {
                        document.Add(new Paragraph("No appointment details found.", regularFont));
                    }

                    reader.Close();
                }

                document.Close();

                byte[] fileContent = ms.ToArray();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=AppointmentDetails.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(fileContent);
                Response.End();
            }
        }
        else
        {
            Response.Redirect("~/patient_signin_form.aspx");
        }
    }
        protected string FormatAppointmentTime(object time)
        {
            if (time != null && time is TimeSpan)
            {
                return ((TimeSpan)time).ToString(@"hh\:mm"); // Format to show only hours and minutes
            }
            return string.Empty;
        }



    }
}
