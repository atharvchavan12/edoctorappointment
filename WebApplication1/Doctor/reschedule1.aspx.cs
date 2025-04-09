using System;
using System.Collections.Generic;
using System.Web.UI;

namespace WebApplication1.Doctor
{
    public partial class reschedule1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Define the available time slots
                List<string> timeSlots = new List<string>
                {
                    "9:30 - 10:00", "10:00 - 10:30", "10:30 - 11:00",
                    "11:00 - 11:30", "11:30 - 12:00", "12:00 - 12:30",
                    "12:30 - 1:00", "3:00 - 3:30", "3:30 - 4:00",
                    "4:00 - 4:30", "4:30 - 5:00", "5:00 - 5:30",
                    "5:30 - 6:00"
                };

                // Generate checkboxes dynamically
                string html = string.Empty;
                foreach (string slot in timeSlots)
                {
                    html += $@"
                    <div style='margin-bottom: 10px;'>
                        <input type='checkbox' name='slot' value='{slot}' id='{slot.Replace(" ", "").Replace(":", "")}' />
                        <label for='{slot.Replace(" ", "").Replace(":", "")}'>{slot}</label>
                    </div>";
                }
                TimeSlotsLiteral.Text = html;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Handle form submission logic here
        }
    }
}
