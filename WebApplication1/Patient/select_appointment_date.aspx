<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="select_appointment_date.aspx.cs" Inherits="WebApplication1.Patient.select_appointment_date" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Appointment Date</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .calendar-control {
    width: 100%;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #f8f9fa;
    color: #343a40;
    font-family: Arial, sans-serif;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.calendar-control table {
    width: 100%;
    border-collapse: collapse;
}

.calendar-control th {
    padding: 8px;
    background-color: #007bff;
    color: white;
    font-weight: bold;
}

.calendar-control td {
    padding: 12px;
    border: 1px solid #ddd;
    cursor: pointer;
    transition: background-color 0.3s;
}

.calendar-control td:hover {
    background-color: #e9ecef;
}

.calendar-control .selected {
    background-color: #007bff;
    color: white;
}

.calendar-control .other-month {
    color: #ced4da;
}

.calendar-control .today {
    background-color: #ffc107;
    color: white;
    font-weight: bold;
}
.container {
    margin-top:-20px;
}
        .calendar-container {
         
            max-width: 500px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }
        .calendar-header {
            font-size: 1.5rem;
            font-weight: bold;
            color:#5D3FD3;
            margin-bottom: 1rem;
        }
        .btn-custom {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 5px;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .date-label {
            font-size: 1.2rem;
            font-weight: bold;
            color: #28a745;
            margin-top: 1rem;
        }
         .indicator-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .indicator-box {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 110px;
        height: 40px;
        font-weight: bold;
        color: #000;
        border-radius: 5px;
        text-align: center;
        margin: 0 5px; /* Adjust the horizontal space between boxes */
        padding: 5px;
    }
    .today-indicator {
        background-color: yellow;
        border: 2px solid black;
    }
    .unavailable-indicator {
        background-color:#FF6347;
        color: white;
        border: 2px solid darkred;
    }
    .available-indicator {
        border: 2px solid green;
        color: green;
    }
  
     .disabled-date {
        pointer-events: none;
        cursor: not-allowed;
        background-color: #FF6347 !important; /* Tomato color for non-availability */
        color: black !important;
    }
    .disabled-date:hover {
        cursor: not-allowed;
    }
    .out-of-range-date {
        pointer-events: none;
        cursor: not-allowed;
        background-color: lightgray !important;
        color: brown !important;
    }
    .current-date {
        background-color: yellow !important;
        color: black !important;
        border: 2px solid black !important;
    }
    .available-date {
        border: 2px solid green !important;
    }
    .selected-date {
        background-color: lightgreen !important;
        color: black !important;
        font-weight: bold !important;
    }
    .non-available-date {
        cursor: not-allowed;
    }

    .non-available-date:hover {
        opacity: 0.7; /* Optional hover effect */
    }
</style>

</head>
    
<body class="bg-light">
    <form id="form1" runat="server">
         <div style="background-image: url('../img/setschedule.jpg'); background-size: cover; background-position: center; background-attachment: fixed; opacity: 0.5; width: 100%; height: 100%; position: absolute; top:0; left: 0; z-index: -1;"></div>
        <div class="container">
            <div class="calendar-container">
                <div class="calendar-header text-center">
                    Select Appointment Date
                </div>
              <asp:Calendar ID="Calendar1" runat="server"
              OnSelectionChanged="Calendar1_SelectionChanged"
              OnDayRender="Calendar1_DayRender"
              CssClass="calendar-control">
</asp:Calendar>

                <asp:Label ID="Label1" runat="server" CssClass="date-label d-block text-center" Text=""></asp:Label>
                
                <div class="d-flex justify-content-around mt-4">
                    <asp:Button ID="Button1" runat="server" Text="Save Date" OnClick="Button1_Click" CssClass="btn btn-custom" />
                    <asp:Button ID="Button2" runat="server" Text="Set Appointment Time" OnClick="Button2_Click1" CssClass="btn btn-custom" />
                </div>
            </div>
            
            <!-- Indicator Boxes for Date Status -->
            <div class="indicator-container">
                <div class="indicator-box today-indicator">Today</div>
                <div class="indicator-box unavailable-indicator">Unavailable</div>
                <div class="indicator-box available-indicator">Available</div>
            </div>
        </div>
    </form>
    
    <!-- Bootstrap JS and dependencies (for interactivity if needed) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Attach event listeners to non-available dates
        document.querySelectorAll('.non-available-date').forEach(function (cell) {
            cell.addEventListener('click', function (event) {
                event.preventDefault(); // Prevent default action
                alert('Doctor not available on this date.'); // Optional feedback
            });
        });
    });
    </script>

</html>
