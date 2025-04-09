<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="add_emergency_appointment.aspx.cs" Inherits="WebApplication1.Doctor.add_emergency_appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

        .container{
  
    margin-top:30px;
    }
    /* Style for the dropdown list */
        .form-control-dropdown {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 5px;
            font-size: 16px;
            color: #495057;
        }

        .form-control-dropdown:focus {
            outline: none;
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Card and form styling */
        .card {
            border: 2px solid #343a40; /* Darker border for the form */
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 20px;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-success:hover {
            background-color: #218838;
            box-shadow: 0 4px 10px rgba(33, 136, 56, 0.4);
        }

        /* General styles for input elements */
        .form-control {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 5px;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Styling for labels */
        .form-label {
            font-weight: bold;
            color: #495057;
        }
          .back-btn {
      position: absolute;
      top: 20px;
      left: 20px;
      font-size: 20px;
      color: #007bff; /* Blue color for the icon */
      background-color: transparent;
      border: none;
      cursor: pointer;
      margin-top:65px;
  }

  .back-btn:hover {
      color: #0056b3; /* Darker blue on hover */
  }
    </style>
     <button type="button" class="back-btn" onclick="window.location.assign('appointment.aspx');">
    <i class="fas fa-arrow-left"></i> Back
</button>
        <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <img width="150px" src="../img/addemergencyappointment.jpg" />
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col text-center">
                                <h4>Emergency Appointment Form</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <!-- Form Fields Start -->
                        <div class="row mt-4">
                            <div class="col text-center">
                                <span class="badge badge-pill badge-info">Patient Details</span>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-md-6">
                                <label for="username" class="form-label">Patient Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="password" class="form-label">Date Of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Birth date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label for="username" class="form-label">Blood Type</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Blood Type"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="password" class="form-label">Gender</label>
                                <div class="form-group">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="radio-list">
                                        <asp:ListItem Text="<span class='list-item'>Male</span>" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="<span class='list-item'>Female</span>" Value="Female"></asp:ListItem>
                                        <asp:ListItem Text="<span class='list-item'>Other</span>" Value="Other"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label for="username" class="form-label">Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Contact" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="password" class="form-label">Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="Email ID" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label for="password" class="form-label">Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label for="password" class="form-label">Select Time Slot</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="form-control-dropdown">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>12:30 - 1:00</asp:ListItem>
                                        <asp:ListItem>6:00 - 6:30</asp:ListItem>
                                        <asp:ListItem>9:00 - 9:30</asp:ListItem>
                                        <asp:ListItem>2:30 - 3:00</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                          <div class="row">
      <div class="col-md-6">
          <label for="username" class="form-label">Height</label>
          <div class="form-group">
              <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="in CM"></asp:TextBox>
          </div>
      </div>

      <div class="col-md-6">
          <label for="password" class="form-label">Weight</label>
          <div class="form-group">
              <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="in KG"></asp:TextBox>
          </div>
      </div>
  </div>

                        <!-- Continue with the rest of the form as is -->
                        <div class="row mt-4">
                            <div class="col text-center">
                                <asp:Button CssClass="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Book Appointment" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-3">
                    <a href="../homepage2.aspx">← Home page</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
