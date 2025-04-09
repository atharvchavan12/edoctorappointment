using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Doctor
{
    public partial class chatbot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImgBtnWhatsApp_Click(object sender, ImageClickEventArgs e)
        {
            // URL encode the predefined message "I need assistance"
            string predefinedMessage = "I need assistance";
            string encodedMessage = Uri.EscapeDataString(predefinedMessage);

            // Redirect the user to the WhatsApp URL with the predefined message
            string url = "https://wa.me/919850115182?text=" + encodedMessage;
            Response.Redirect(url);
        }

    }
}