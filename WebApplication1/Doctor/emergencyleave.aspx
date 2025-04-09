<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emergencyleave.aspx.cs" Inherits="WebApplication1.Doctor.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Emergency Leave</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
      <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <style>
          
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .container {
            margin-top:30px;
            max-width: 500px; /* Reduced width */
            padding: 15px;    /* Reduced padding for height */
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
          
        }

        .calendar-container {
            margin-bottom: 15px; /* Reduced margin */
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
            padding: 8px; /* Reduced padding for height */
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

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px; /* Reduced gap for compact design */
            justify-content: center;
            margin-bottom: 15px; /* Reduced margin */
        }

        .card {
            padding: 10px; /* Reduced padding */
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            background: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            cursor: pointer;
            width: 120px; /* Adjusted width for compact look */
            text-align: center;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            background-color: #f0f8ff;
        }

        .btn-submit {
            width: 100%;
            padding: 8px 10px; /* Reduced button padding */
            font-size: 14px; /* Adjusted font size */
        }
       
    .back-btn {
        position: absolute;
        top: 20px;   /* Adjust this to control the vertical position */
        left: 20px;  /* Adjust this to control the horizontal position */
        font-size: 20px;
        color: green; /* Blue color for the icon */
        background-color: transparent;
        border: none;
        cursor: pointer;
    }

    .back-btn:hover {
        color: #0056b3; /* Darker blue on hover */
    }
 </style>
</head>

 
<body>
    <form id="form1" runat="server">
            <div style="background-image: url('../img/emergencyleave.jpg'); background-size: cover; background-position: center; background-attachment: fixed; opacity: 0.5; width: 100%; height: 130%; position: absolute; top:0; left: 0; z-index: -1;"></div>
             <!-- Back button with Font Awesome icon -->
 <button type="button" class="back-btn" onclick="window.location.assign('setschedule3.aspx');">
    <i class="fas fa-arrow-left"></i> Back
</button>
        <div class="container">
            <div class="calendar-container">
              <asp:Calendar ID="Calendar1" runat="server" CssClass="custom-calendar" 
    OnSelectionChanged="Calendar1_SelectionChanged" 
    OnDayRender="Calendar1_DayRender">
</asp:Calendar>

                <asp:TextBox ID="TextBox1" runat="server" class="form-control mt-2" placeholder="yyyy-MM-dd" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="card-container" runat="server" id="CardContainer">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="9:30 - 10:00" CssClass="card" />
                <asp:CheckBox ID="CheckBox2" runat="server" Text="10:00 - 10:30" CssClass="card" />
                <asp:CheckBox ID="CheckBox3" runat="server" Text="10:30 - 11:00" CssClass="card" />
                <asp:CheckBox ID="CheckBox4" runat="server" Text="11:00 - 11:30" CssClass="card" />
                <asp:CheckBox ID="CheckBox5" runat="server" Text="11:30 - 12:00" CssClass="card" />
                <asp:CheckBox ID="CheckBox6" runat="server" Text="12:00 - 12:30" CssClass="card" />
                <asp:CheckBox ID="CheckBox7" runat="server" Text="3:00 - 3:30" CssClass="card" />
                <asp:CheckBox ID="CheckBox8" runat="server" Text="3:30 - 4:00" CssClass="card" />
                <asp:CheckBox ID="CheckBox9" runat="server" Text="4:00 - 4:30" CssClass="card" />
                <asp:CheckBox ID="CheckBox10" runat="server" Text="4:30 - 5:00" CssClass="card" />
                <asp:CheckBox ID="CheckBox11" runat="server" Text="5:00 - 5:30" CssClass="card" />
                <asp:CheckBox ID="CheckBox12" runat="server" Text="5:30 - 6:00" CssClass="card" />
            </div>

            <asp:Button ID="Button1" runat="server" Text="Send Message" CssClass="btn btn-primary btn-submit" OnClick="Button1_Click" />
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
