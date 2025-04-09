<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="dashboard1.aspx.cs" Inherits="WebApplication1.Doctor.dashboard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Add Bootstrap CSS -->
  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Header with Clock and Search Bar */
       .header {
    display: flex;
    align-items: center;
    justify-content: flex-start; /* Align items to the left */
    padding: 20px;
    gap: 20px; /* Space between clock and search bar */
}

/* Increase width of the search bar */
.search-bar {
    display: flex;
    align-items: center;
    width: 100%; /* Set to 100% of available space */
    max-width: 700px; /* Optional: limit max width */
}

        /* Clock Styling */
        .clock {
            display: inline-block;
            border: 1px solid #606060;
            color: black;
            padding: 10px;
            border-radius: 8px;
            background-color: #f0f0f0;
            font-size: 14px;
            text-align: center;
        }

        .date {
            font-size: 12px;
            margin-bottom: 5px;
        }

        .time {
            font-size: 24px;
            font-weight: bold;
        }

      

        .search-bar input {
            flex: 1;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #606060;
            border-radius: 4px;
        }

        .search-bar button {
            padding: 8px 15px;
            margin-left: 5px;
            font-size: 14px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-bar button:hover {
            background-color: #45a049;
        }

        /* Card Styles */
        .card {
            width: 100%;
            height: 300px;
            text-align: center;
            border: 1px solid #dcdcdc;
            border-radius: 8px;
            padding: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
        }

        .card img {
            width: 100%;
            height: 180px;
            border-radius: 8px;
            object-fit: cover;
        }

        .link-button {
            display: block;
            margin-top: 10px;
            padding: 8px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            text-align: center;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .link-button:hover {
            background-color: #45a049;
            color: #ffffff;
        }

        /* Additional Spacing Between Rows */
        .row {
            margin-bottom: 20px;
        }
          .back-btn {
     
      top: 20px;
      left: 20px;
      font-size: 20px;
      color:orangered; /* Blue color for the icon */
      background-color: transparent;
      border: none;
      cursor: pointer;
      margin-top:10px;
  }

  .back-btn:hover {
      color: #0056b3; /* Darker blue on hover */
  }
    </style>
     <div style="background-image: url('../img/clinic.png'); background-size: cover; background-position: center; background-attachment: fixed; opacity: 0.5; width: 100%; height: 130%; position: absolute; top:80px; left: 0; z-index: -1;"></div>
    <!-- Header with Clock and Search Bar -->
        <!-- Back button with Font Awesome icon -->
 <button type="button" class="back-btn" onclick="window.location.assign('doctor_panel1.aspx');">
    <i class="fas fa-arrow-left"></i> Back
</button>
    <div class="header container">
        <!-- Clock on the left -->
        <div class="clock">
            <div class="date">Loading Date...</div>
            <div class="time">Loading Time...</div>
        </div>

        <!-- Search Bar on the right -->
        <div class="search-bar">
            <input type="text" placeholder="Search..." />
            <button>🔍</button>
        </div>
    </div>

    <!-- Dashboard Panel with Bootstrap Classes -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="../img/setschedule.jpg" alt="Image 1">
                    <a href="setschedule3.aspx" class="link-button">Set Schedule</a>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="../img/appointments.jpg" alt="Image 2">
                    <a href="appointment.aspx" class="link-button">Appointments</a>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="../img/feedback.jpg" alt="Image 3">
                    <a href="feedback.aspx" class="link-button">Feedback</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="../img/managedappointment.jpg" alt="Image 4">
                    <a href="managedappointment.aspx" class="link-button">Managed Appointments</a>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="../img/consultancy.jpg" alt="Image 5">
                    <a href="doctorconsultancy.aspx" class="link-button">Consultancy Appointments</a>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="../img/enquiry.jpg" alt="Image 6">
                    <a href="d_contact.aspx" class="link-button">Patient Inquiries</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Clock JavaScript -->
    <script>
        function updateClock() {
            const monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
            const dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

            const now = new Date();
            const dateStr = dayNames[now.getDay()] + " " +
                now.getDate() + " " +
                monthNames[now.getMonth()] + " " +
                now.getFullYear();

            const timeStr = now.toLocaleTimeString('en-US', { hour12: false });

            document.querySelector('.date').innerText = dateStr;
            document.querySelector('.time').innerText = timeStr;
        }

        setInterval(updateClock, 1000);
        updateClock();
    </script>

  
</asp:Content>
