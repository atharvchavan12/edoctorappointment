<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="doctor_panel1.aspx.cs" Inherits="WebApplication1.Doctor.doctor_panel11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <style>
       .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2c3e50;
            color: #ecf0f1;
            padding-top: 20px;
            z-index: 1000;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            padding: 10px;
            margin-bottom: 20px;
            border-bottom: 1px solid #34495e;
        }

        .sidebar-logo img {
            height: 50px;
            width: 50px;
            margin-right: 10px;
            border-radius: 50%;
        }

        .sidebar-logo h3 {
            font-size: 1.2em;
            color: #ecf0f1;
            margin: 0;
            font-weight: 600;
        }

        .sidebar-menu {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar-menu li {
            margin: 20px 0;
            padding: 10px;
            transition: background-color 0.3s;
        }

        .sidebar-menu li a {
            color: #ecf0f1;
            text-decoration: none;
            font-size: 1em;
            display: flex;
            align-items: center;
        }

        .sidebar-menu li a i {
            margin-right: 15px;
            font-size: 1.2em;
        }

        .sidebar-menu li:hover {
            background-color: #34495e;
        }

        /* Main content styling */
        .main-content {
            margin-left: 260px;
            padding: 20px;
        }

        /* Clock and search bar styling */
        .clock-search-container {
            margin-top:20px;
            display: flex;
            justify-content:left;
            align-items: center;
        }

        .clock-container {
            padding: 10px;
            border: 2px solid #606060;
            border-radius: 8px;
            background-color: #f0f0f0;
            color: black;
            font-size: 14px;
            transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
        }

        .clock-container:hover {
            background-color: #222222;
            color: white;
            border-color: #f0f0f0;
        }

        .date {
            font-size: 12px;
            text-align: center;
            margin-bottom: 5px;
        }

        .time {
            list-style: none;
            display: flex;
            font-size: 18px;
            gap: 5px;
            padding: 0;
            margin: 0;
        }

        .time li {
            font-weight: bold;
        }

        .colon {
            font-weight: normal;
        }

        .search-container {
            flex-grow: 1;
            max-width: 800px;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            margin-left:100px;
        }

        .search-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            outline: none;
            flex-grow: 1;
        }

        .search-button {
            padding: 10px;
            background-color: #2c3e50;
            color: #ecf0f1;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-left: -5px;
        }

        .search-button i {
            font-size: 16px;
        }

        .search-button:hover {
            background-color: #34495e;
        }
        /* Footer styling */
.footer {
    margin-top: 20px;
    padding: 20px;
    text-align: center;
}
    </style>
    <div class="sidebar">
        <div class="sidebar-logo">
            <img src="logo.png" alt="Logo" />
            <h3>Dr. Zope's Clinic</h3>
        </div>
        <ul class="sidebar-menu">
            <li><a href="../homepage2.aspx"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="dashboard1.aspx"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="add_dctor.aspx"><i class="fas fa-user-md"></i> Add Doctor</a></li>
            <li><a href="add_receptionist.aspx"><i class="fas fa-user-nurse"></i> Add Receptionist</a></li>
            <li><a href="feedback.aspx"><i class="fas fa-comments"></i> Feedback</a></li>
            <li><a href="Logout.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>


     <div class="main-content">
        <div class="page-wrapper">
            <div class="content container-fluid">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="page-title">Welcome Admin!</h3>
                        </div>
                    </div>
                </div>

                <!-- Clock and Search Bar -->
                <div class="clock-search-container">
                    <div class="clock-container">
                        <div class="date"></div>
                        <ul class="time">
                            <li class="hours">12</li>
                            <li class="colon">:</li>
                            <li class="minutes">00</li>
                            <li class="colon">:</li>
                            <li class="seconds">00</li>
                        </ul>
                    </div>
                    <div class="search-container">
                        <form action="SearchResults.aspx" method="get">
                            <input type="text" placeholder="Search..." name="query" class="search-input" />
                            <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        


     

       <!--4 boxes -->
          <div class="row" style="margin-top:50px;">
		<div class="col-xl-3 col-sm-6 col-12">
			<div class="card">
				<div class="card-body">
					<div class="dash-widget-header">
						<span class="dash-widget-icon text-primary border-primary">
					<%-- 	<i class='bx bx-plus-medical'></i>  --%>
						</span>
						<div class="dash-count">
							<h3>2</h3>
						</div>
					</div>
					<div class="dash-widget-info">
						<h6 class="text-muted">Doctors</h6>
						<div class="progress progress-sm">
							<div class="progress-bar bg-primary w-50"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 col-12">
			<div class="card">
				<div class="card-body">
					<div class="dash-widget-header">
						<span class="dash-widget-icon text-success">
							<i class="fe fe-credit-card"></i>
						</span>
						<div class="dash-count">
							<h3>487</h3>
						</div>
					</div>
					<div class="dash-widget-info">
						
						<h6 class="text-muted">Patients</h6>
						<div class="progress progress-sm">
							<div class="progress-bar bg-success w-50"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 col-12">
			<div class="card">
				<div class="card-body">
					<div class="dash-widget-header">
						<span class="dash-widget-icon text-danger border-danger">
							<i class="fe fe-money"></i>
						</span>
						<div class="dash-count">
							<h3>485</h3>
						</div>
					</div>
					<div class="dash-widget-info">
						
						<h6 class="text-muted">Appointment</h6>
						<div class="progress progress-sm">
							<div class="progress-bar bg-danger w-50"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 col-12">
			<div class="card">
				<div class="card-body">
					<div class="dash-widget-header">
						<span class="dash-widget-icon text-warning border-warning">
							<i class="fe fe-folder"></i>
						</span>
						<div class="dash-count">
							<h3>Rs.62000</h3>
						</div>
					</div>
					<div class="dash-widget-info">
						
						<h6 class="text-muted">Revenue</h6>
						<div class="progress progress-sm">
							<div class="progress-bar bg-warning w-50"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  </div>
          </div>
  <script>
        function clock() {
            const monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
            const dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

            const today = new Date();
            document.querySelector('.date').innerHTML = `${dayNames[today.getDay()]} ${today.getDate()} ${monthNames[today.getMonth()]} ${today.getFullYear()}`;

            let h = today.getHours();
            let m = today.getMinutes();
            let s = today.getSeconds();
            h = h < 10 ? '0' + h : h;
            m = m < 10 ? '0' + m : m;
            s = s < 10 ? '0' + s : s;

            document.querySelector('.hours').innerHTML = h;
            document.querySelector('.minutes').innerHTML = m;
            document.querySelector('.seconds').innerHTML = s;
        }

        setInterval(clock, 1000);
        clock();  // Initial call to display the clock immediately
    </script>
</asp:Content>
