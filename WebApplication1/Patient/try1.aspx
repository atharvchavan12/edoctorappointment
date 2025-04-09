<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="try1.aspx.cs" Inherits="WebApplication1.Patient.try1" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shift Timings</title>
    <style>
        /* Center container styling */
       .center-container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        min-height: 100vh;
        text-align: center;
        background-image: url('~/img/time.png'); /* Path to your image */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        color: #333;
        font-family: Arial, sans-serif;
    }
        /* Shift container styling */
        .shift-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
            justify-content: center;
        }

        /* Shift box styling */
        .shift-box {
            width: 100px;
            height: 50px;
            background-color: #87CEEB;
            border: 1px solid #4682B4;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        /* Hover effect for shift box */
        .shift-box:hover {
            background-color: #00aaff;
            transform: scale(1.05);
        }

        /* Selected shift box styling */
        .shift-box.selected {
            background-color: red;
            color: white;
            cursor: not-allowed;
        }

        /* Title styling */
        .shift-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        /* Button styling */
        .btn {
            width: 200px;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            margin-top: 10px;
            text-transform: uppercase;
        }

        /* Button hover effect */
        .btn:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        /* Label styling */
        .info-label {
            font-size: 16px;
            font-weight: normal;
            color: #666;
            margin-top: 20px;
            padding: 10px;
        }

        /* Note styling */
        .note {
            font-size: 14px;
            color: red;
            margin-top: 15px;
            font-style: italic;
        }
    </style>

    <script>
        var selectedShift = null; // Variable to keep track of the selected shift

        function selectShift(shiftBox, shiftTime) {
            // Deselect any previously selected box
            const selectedBox = document.querySelector(".shift-box.selected");
            if (selectedBox) {
                selectedBox.classList.remove("selected");
                selectedBox.style.backgroundColor = ""; // Reset to original color
                selectedBox.style.color = ""; // Reset to original text color
            }

            // Select the clicked box
            shiftBox.classList.add("selected");

            // Set selected shift time in Label1
            const label = document.getElementById("<%= Label1.ClientID %>");
            label.textContent = "Selected time shift is " + shiftTime;

            // Store the selected shift time in a hidden field for use in C# code-behind
            document.getElementById("<%= HiddenSelectedTime.ClientID %>").value = shiftTime;
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="center-container">
            <asp:Label ID="lblMorningShift" runat="server" CssClass="shift-title" Text="Morning Shift"></asp:Label>
            <asp:Panel ID="pnlMorningShift" runat="server" CssClass="shift-container"></asp:Panel>
            
            <asp:Label ID="lblEveningShift" runat="server" CssClass="shift-title" Text="Evening Shift"></asp:Label>
            <asp:Panel ID="pnlEveningShift" runat="server" CssClass="shift-container"></asp:Panel>

            <asp:Label ID="Label1" runat="server" Text="Selected time shift is - " CssClass="info-label"></asp:Label><br />

               <asp:Button ID = "Button1" runat="server"  CssClass="btn" Text="Submit" OnClick="Button1_Click" OnClientClick="showLoadingMessage()" />
<div id = "loadingMessage" style="display: none; text-align: center; background: rgba(0,0,0,0.5); color: white; position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: 1000;">
    <h2 style = "margin-top: 20%;" > Please wait...</h2>
</div>
            <asp:Label ID="Label2" runat="server" Text="Appointment saved successfully!" Visible="false" CssClass="info-label"></asp:Label>

            <!-- Note message for users -->
            <div class="note">Note: All red shifts are already booked and cannot be selected.</div>

            <!-- Hidden field to store selected time shift -->
            <asp:HiddenField ID="HiddenSelectedTime" runat="server" />
        </div>
    </form>
</body>
    <script>
        function showLoadingMessage() {
            document.getElementById("loadingMessage").style.display = "block";
        }
</script>
</html>
