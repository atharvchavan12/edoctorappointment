<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="select_appointment_time.aspx.cs" Inherits="WebApplication1.Patient.select_appointment_time" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Appointment Time</title>

    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        /* Style the body */
        body {
            background-color: #f0f8ff; /* Light blue background color */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Style the main container */
        .container {
            text-align: center;
            background-color: #ffffff; /* White background for container */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 90%;
        }

        /* Style the dropdown list */
        .dropdown-custom {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-top: 15px;
            box-sizing: border-box;
            background-color: #f8f9fa;
            transition: border-color 0.3s;
        }
        
        /* Dropdown hover effect */
        .dropdown-custom:hover {
            border-color: #007bff;
        }

        /* Style the buttons */
        .btn-custom {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 15px;
        }

        /* Hover effect for buttons */
        .btn-custom:hover {
            background-color: #0056b3;
        }

        /* Style the labels */
        .status-label {
            font-size: 1.1em;
            font-weight: bold;
            margin-top: 10px;
            display: block;
            color: #333;
        }

        /* Success label */
        .label-success {
            color: #28a745; /* Green color for success */
        }

        /* Error label */
        .label-error {
            color: #dc3545; /* Red color for error */
        }

        /* Style for button container */
        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Label ID="Label1" runat="server" CssClass="status-label" Text="Select your appointment time:"></asp:Label>
            
            <!-- Dropdown list for time slots -->
            <asp:DropDownList ID="ddlTimeSlots" runat="server" CssClass="dropdown-custom" AutoPostBack="True" OnSelectedIndexChanged="ddlTimeSlots_SelectedIndexChanged">
                <asp:ListItem Text="Morning Shift" Value="" Enabled="false" />
                <asp:ListItem Text="9:30-10:00" Value="9:30-10:00" />
                <asp:ListItem Text="10:00-10:30" Value="10:00-10:30" />
                <asp:ListItem Text="10:30-11:00" Value="10:30-11:00" />
                <asp:ListItem Text="11:00-11:30" Value="11:00-11:30" />
                <asp:ListItem Text="11:30-12:00" Value="11:30-12:00" />
                <asp:ListItem Text="12:00-12:30" Value="12:00-12:30" />
                <asp:ListItem Text="12:30-1:00" Value="12:30-1:00" />
                <asp:ListItem Text="1:00-1:30" Value="1:00-1:30" />

                <asp:ListItem Text="Evening Shift" Value="" Enabled="false" />
                <asp:ListItem Text="3:00-3:30" Value="3:00-3:30" />
                <asp:ListItem Text="3:30-4:00" Value="3:30-4:00" />
                <asp:ListItem Text="4:00-4:30" Value="4:00-4:30" />
                <asp:ListItem Text="4:30-5:00" Value="4:30-5:00" />
                <asp:ListItem Text="5:00-5:30" Value="5:00-5:30" />
                <asp:ListItem Text="5:30-6:00" Value="5:30-6:00" />
            </asp:DropDownList>

            <!-- Label to show selected time -->
            <asp:Label ID="LabelSelectedTime" runat="server" CssClass="status-label label-success" Text="Your Selected Time: "></asp:Label>

            <!-- Button container for Save Time and Next buttons -->
           <div class="button-container">
    <asp:Button ID="ButtonSave" runat="server" Text="Save Time" CssClass="btn-custom" OnClick="ButtonSave_Click" />
  

</div>
            
  <asp:Button ID="Button1" runat="server" Text="Sent Appointment Request" CssClass="btn btn-success" OnClick="Button1_Click" />

            <!-- Label to confirm successful save -->
            <asp:Label ID="LabelConfirmation" runat="server" CssClass="status-label label-success" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
