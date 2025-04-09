
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resechedule.aspx.cs" Inherits="WebApplication1.Doctor.resechedule" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Reschedule Appointment</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            background-color: #f9f9f9;
            transition: transform 0.2s, box-shadow 0.2s, background-color 0.2s;
            position: relative;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            background-color: #eef;
        }

        .card input[type="checkbox"],
        .card input[type="radio"] {
            position: absolute;
            top: 5px;
            left: 5px;
            transform: scale(1.2);
            cursor: pointer;
        }

        .card input[type="radio"]:checked + label,
        .card input[type="checkbox"]:checked + label {
            font-weight: bold;
            color: #0056b3;
        }
    </style>
</head>
<body class="container mt-5">
    <h2 class="text-center mb-4">Reschedule Appointment</h2>
    <div class="row">
        <!-- First Container: Select Appointment -->
        <div class="col-md-6">
            <div class="card shadow-sm">
                <h3 class="mb-3">Select Appointment</h3>
                <div class="mb-3">
                    <h4 class="text-muted">Morning Shift</h4>
                    <div class="row g-2">
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot1" />
                                <label for="slot1">9:30 - 10:00</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot2" />
                                <label for="slot2">10:00 - 10:30</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot3" />
                                <label for="slot3">10:30 - 11:00</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot4" />
                                <label for="slot4">11:00 - 11:30</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot5" />
                                <label for="slot5">11:30 - 12:00</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot6" />
                                <label for="slot6">12:00 - 12:30</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <h4 class="text-muted">Evening Shift</h4>
                    <div class="row g-2">
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot7" />
                                <label for="slot7">3:00 - 3:30</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot8" />
                                <label for="slot8">3:30 - 4:00</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot9" />
                                <label for="slot9">4:00 - 4:30</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot10" />
                                <label for="slot10">4:30 - 5:00</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot11" />
                                <label for="slot11">5:00 - 5:30</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="card">
                                <input type="checkbox" id="slot12" />
                                <label for="slot12">5:30 - 6:00</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Second Container: Select Time and Type -->
        <div class="col-md-6">
            <div class="card shadow-sm">
                <h3 class="mb-3">Select Duration</h3>
                <div class="row g-2">
                    <div class="col-6">
                        <div class="card">
                            <input type="radio" name="duration" id="duration60" />
                            <label for="duration60">60 Min</label>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card">
                            <input type="radio" name="duration" id="duration90" />
                            <label for="duration90">90 Min</label>
                        </div>
                    </div>
                </div>
                <h3 class="mt-4 mb-3">Select Type</h3>
                <div class="row g-2">
                    <div class="col-6">
                        <div class="card">
                            <input type="radio" name="type" id="typeEarly" />
                            <label for="typeEarly">Early</label>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card">
                            <input type="radio" name="type" id="typeLate" />
                            <label for="typeLate">Late</label>
                        </div>
                    </div>
                </div>
                <!-- Send Notification Button -->
                <div class="text-center mt-4">
                   
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Send Notification" OnClick="Button1_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

