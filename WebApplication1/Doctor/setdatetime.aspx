<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="setdatetime.aspx.cs" Inherits="WebApplication1.Doctor.setdatetime" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set Date and Time</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Ensure the background image is correctly set */
        .container-fluid {
            background-image: url('setschedule.jpg'); /* Make sure this path is correct */
            background-size: cover; /* Ensure it covers the entire background */
            background-position: center; /* Center the image */
            padding: 50px 0;
            position: relative;
        }

        .container-fluid::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.3); /* Dark overlay to improve text visibility */
            z-index: -1; /* Ensure overlay is behind content */
        }

        /* Styling for the cards (optional for better contrast) */
        .card {
            background-color: rgba(255, 255, 255, 0.85); /* Slightly transparent white background */
            border-radius: 8px;
        }

        /* Other styles */
        .slot.booked {
            background-color: #ff6961; /* Red for booked slots */
            pointer-events: none;
        }

        .row {
            display: flex;
            justify-content: space-between;
        }

        .slot {
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            font-weight: bold;
        }

        .slot:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transform: translateY(-2px);
            background-color: #e0f7fa;
        }

        #selectedSlotLabel {
            font-size: 16px;
            font-weight: bold;
        }

        .btn-success {
            margin-top: 10px;
        }

        .text-danger {
            font-size: 14px;
        }

        .calendar-box {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 10px;
            background: linear-gradient(135deg, #ffffff, #f1f4f9);
            display: inline-block;
            margin: auto;
            text-align: center;
        }

        .custom-calendar {
            width: 100%;
            font-family: Arial, sans-serif;
            border-collapse: collapse;
        }

        .custom-calendar th {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .custom-calendar td {
            width: 40px;
            height: 40px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
        }

        .custom-calendar .selected {
            background-color: #f39c12;
            color: white;
            font-weight: bold;
        }

        .custom-calendar .disabled {
            background-color: #eee;
            color: #aaa;
            cursor: not-allowed;
        }

        .custom-calendar td:hover:not(.disabled):not(.selected) {
            background-color: #d1e7dd;
        }

        .custom-calendar .weekend {
            color: #e74c3c;
        }

        .card.border {
            border: 2px solid #007bff;
            border-radius: 10px;
        }
        .slot.booked {
    background-color: #ff6961; /* Red background for booked slots */
    pointer-events: none; /* Prevent clicking on booked slots */
    cursor: not-allowed; /* Show a not-allowed cursor */
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 text-center">
                    <div class="card p-4 border">
                        <label>Enter Doctor ID:</label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control mb-3"
                            AutoPostBack="true" OnTextChanged="TextBox2_TextChanged"
                            Placeholder="Enter Doctor ID"></asp:TextBox>
                        <div class="calendar-box">
                            <asp:Calendar ID="Calendar1" runat="server" CssClass="custom-calendar"
                                OnSelectionChanged="Calendar1_SelectionChanged" Enabled="false"></asp:Calendar>
                        </div>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control text-center mb-3"
                            Placeholder="dd/mm/yyyy" ReadOnly="true"></asp:TextBox>
                        <asp:Button ID="ButtonSaveDate" runat="server" Text="Save Date"
                            CssClass="btn btn-primary mt-2" OnClick="ButtonSaveDate_Click" />
                        <asp:Button ID="Button1" runat="server" Text="Emergency Leave" CssClass="btn btn-primary mt-2" />
                    </div>
                </div>

         <div class="col-md-6 text-center">
    <div class="card p-4 border">
        <h4 class="my-3">MORNING SHIFT</h4>
        <div class="row mb-4">
            <div class="col-4 slot" onclick="selectSlot('9:00 - 10:00')">9:00 - 10:00</div>
            <div class="col-4 slot" onclick="selectSlot('10:00 - 11:00')">10:00 - 11:00</div>
            <div class="col-4 slot" onclick="selectSlot('11:00 - 12:00')">11:00 - 12:00</div>
        </div>

        <h4 class="my-3">EVENING SHIFT</h4>
        <div class="row mb-4">
            <div class="col-4 slot" onclick="selectSlot('3:00 - 4:00')">3:00 - 4:00</div>
            <div class="col-4 slot" onclick="selectSlot('4:00 - 5:00')">4:00 - 5:00</div>
            <div class="col-4 slot" onclick="selectSlot('5:00 - 6:00')">5:00 - 6:00</div>
        </div>

        <div class="my-4">
            <p id="selectedSlotLabel">Selected time shift is -</p>
            <asp:HiddenField ID="HiddenFieldSlot" runat="server" />
            <asp:Button ID="SubmitButton" runat="server" Text="SUBMIT" CssClass="btn btn-success" OnClick="SubmitButton_Click" />
        </div>

        <p class="text-danger">Note: All red shifts are already booked and cannot be selected.</p>
    </div>
</div>


            </div>
        </div>
    </form>

  <script>
      // Function to handle the slot selection
      function selectSlot(slot) {
          // Update the label with the selected slot
          document.getElementById("selectedSlotLabel").innerText = "Selected time shift is - " + slot;

          // Update the hidden field value for server-side processing
          document.getElementById('<%= HiddenFieldSlot.ClientID %>').value = slot;
      }
</script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
