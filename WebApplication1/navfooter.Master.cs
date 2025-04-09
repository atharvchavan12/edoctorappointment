using System;
using System.Web.UI;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Always set control visibility to maintain consistent state
            SetControlVisibility();
        }

        private void SetControlVisibility()
        {
            // Session Role-based visibility control
            if (Session["Role"] == null || string.IsNullOrEmpty(Session["Role"].ToString()))
            {
                // User is not logged in
                LinkButton2.Visible = true;  // Patient sign up
                LinkButton3.Visible = false; // Logout button
                LinkButton4.Visible = false; // Welcome user label
                LinkButton1.Visible = true;  // Doctor login button
                LinkButton5.Visible = false;
                LinkButton6.Visible = false; // Dashboard
                LinkButton7.Visible = false; // Admin logout
                LinkButton8.Visible = true;//home
             
                LinkButton10.Visible = true;//about us
                LinkButton11.Visible = true;//contact 
                LinkButton12.Visible = true;//faq
                LinkButton13.Visible = false;//dashboard
                LinkButton14.Visible = false;//dashboard

            }
            else if (Session["Role"].ToString().Equals("user", StringComparison.OrdinalIgnoreCase))
            {
                // User is a patient
                LinkButton2.Visible = false; // Hide sign up
                LinkButton3.Visible = true;  // Show logout
                LinkButton4.Visible = true;  // Show welcome message
                LinkButton1.Visible = false; // Hide doctor login
                LinkButton5.Visible = true;  // Show patient sign in/status
                LinkButton6.Visible = false; // Hide dashboard
                LinkButton7.Visible = false; // Hide admin logout
                LinkButton8.Visible = true;//home
          
                LinkButton10.Visible = true;//about us
                LinkButton11.Visible = true;//contact 
                LinkButton12.Visible = true;//faq
                LinkButton13.Visible = false;//dashboard
                LinkButton14.Visible = true;//dashboard

                LinkButton4.Text = "HELLO " + (Session["Username"]?.ToString() ?? "User");
                LinkButton4.Attributes.Add("style", "color: red; font-weight: bold;");
            }
            else if (Session["Role"].ToString().Equals("admin", StringComparison.OrdinalIgnoreCase))
            {
                // User is an admin
                LinkButton2.Visible = false; // Hide sign up
                LinkButton3.Visible = false; // Hide logout
                LinkButton4.Visible = true;  // Show welcome message
                LinkButton1.Visible = false; // Hide doctor login
                LinkButton5.Visible = false; // Hide patient sign in/status
                LinkButton6.Visible = true;  // Show dashboard
                LinkButton7.Visible = true;  // Show admin logout
                LinkButton8.Visible = true;//home
           
                LinkButton10.Visible = false;//about us
                LinkButton11.Visible = false;//contact 
                LinkButton12.Visible = false;//faq
                LinkButton13.Visible = true;//dashboard
                LinkButton14.Visible = false;//dashboard



                LinkButton4.Text = "WELCOME " + (Session["Username_d"]?.ToString() ?? "admin")+"!! ";
                LinkButton4.Attributes.Add("style", "color: purple; font-weight: bold;");
            }
            else
            {
                // Handle unexpected roles if necessary
                // Optionally, reset session or redirect to an error page
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // Doctor login
            Response.Redirect("~/doctorlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            // Patient sign up
            Response.Redirect("~/Patient/patient_signup_form.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            // Determine the intended action for LinkButton5
            // For example, redirect to patient sign-in form or status page
            // Ensure only one event handler is associated with LinkButton5
            // Uncomment the desired redirection

            // Option 1: Patient sign in
          //  Response.Redirect("~/Patient/patient_signin_form.aspx");

            // Option 2: Patient status
             Response.Redirect("~/Patient/status.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            // User logout
            Session.Clear();
            Response.Redirect("~/homepage2.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Doctor/doctor_panel1.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            // Admin logout
            Session.Clear();
            Response.Redirect("~/homepage2.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)//home
        {
            Response.Redirect("~/homepage2.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)//doctor
        {
            Response.Redirect("~/doctor.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)//about us
        {
            Response.Redirect("~/aboutus.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)//contact
        {
            Response.Redirect("~/Patient/contact.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)//faq
        {
            Response.Redirect("~/faq.aspx");
        }
        protected void LinkButton13_Click(object sender, EventArgs e)//faq
        {
            Response.Redirect("~/Doctor/dashboard1.aspx");
        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Doctor/consultancy.aspx");
        }
    }
}
