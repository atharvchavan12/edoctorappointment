using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class modal_win : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Show the modal on page load
                string script = "document.getElementById('userModal').style.display = 'block';";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowModalScript", script, true);
            }
        }



    }
}