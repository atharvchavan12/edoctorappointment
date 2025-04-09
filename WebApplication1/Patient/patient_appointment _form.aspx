<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="patient_appointment _form.aspx.cs" Inherits="WebApplication1.Patient.patient_appointment_form" EnableViewState="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Include jQuery first -->
    <script src="../bootstrap/js/jquery-3.3.1.slim.min.js"></script>
    
    <!-- Include Popper.js (required for some Bootstrap components) -->
    <script src="../bootstrap/js/popper.min.js"></script>
    
    <!-- Include Bootstrap JavaScript plugins -->
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


       <style>
      .radio-list .list-item {
        margin-right: 20px; /* Adjust spacing as needed */
    }


.container{
  
    margin-top:30px;
    }

</style>
     <div class="container">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col text-center">
                            <img width="150px" src="../img/appointmentlogo1.jpg" />
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col text-center">
                            <h4>Appointment Form</h4>
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
                            <span class="badge badge-pill badge-info">Login Credentials</span>
                        </div>
                    </div>

                    <!-- Bootstrap Modal -->
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Notification</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <asp:Label ID="lblModalMessage" runat="server" Text=""></asp:Label>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

                     <!-- Login Credentials Section -->
                      
                      <div class="row mt-3">
    <div class="col-md-6">
        <label for="username" class="form-label">Username</label>
        <div class="form-group">
            <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Username" BackColor="#CCCCCC" BorderColor="Lime"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-6">
        <label for="password" class="form-label">Password</label>
        <div class="form-group">
            <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Password" TextMode="Password" EnableViewState="true" BackColor="#CCCCCC" BorderColor="Lime" ></asp:TextBox>
            
            <!-- Add HiddenField here for password retention -->
            <asp:HiddenField ID="HiddenPassword" runat="server" />
        </div>
    </div>
</div>
<div class="row mt-3">
    <div class="col text-center">
        <asp:Button ID="LoginButton" CssClass="btn btn-outline-primary" runat="server" Text="Proceed" OnClick="LoginButton_Click" />
    </div>
</div>


                    <asp:Panel ID="AppointmentFormPanel" runat="server" Visible="false">

                         <div class="row mt-4">
     <div class="col text-center">
        <asp:Button ID="Button3"  CssClass="btn btn-primary" runat="server" Text="Fetch Previous Form Details" OnClick="Button3_Click1" />
     </div>
 </div>
<br />

                    <div class="row">
                        <div class="col-md-6">
                            <label for="username" class="form-label">Patient Full Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name"></asp:TextBox>
                            </div>
                          
                        </div>

                        <div class="col-md-6">
                            <label for="password" class="form-label">Date Of Birth</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Birth date" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-6">
                            <label for="username" class="form-label">Blood Type</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Blood Type"></asp:TextBox>
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
                                <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="Contact" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

             
                    <div class="row mt-3">
                        <div class="col">
                            <label for="password" class="form-label">Problem Description</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-md-4">
                            <label for="username" class="form-label">State</label>
                            <div class="form-group">
                                <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="Select" Value="select"></asp:ListItem>
                                   <asp:ListItem Text="Andhra Pradesh" Value="andhra_pradesh"></asp:ListItem>
<asp:ListItem Text="Arunachal Pradesh" Value="arunachal_pradesh"></asp:ListItem>
<asp:ListItem Text="Assam" Value="assam"></asp:ListItem>
<asp:ListItem Text="Bihar" Value="bihar"></asp:ListItem>
<asp:ListItem Text="Chhattisgarh" Value="chhattisgarh"></asp:ListItem>
<asp:ListItem Text="Goa" Value="goa"></asp:ListItem>
<asp:ListItem Text="Gujarat" Value="gujarat"></asp:ListItem>
<asp:ListItem Text="Haryana" Value="haryana"></asp:ListItem>
<asp:ListItem Text="Himachal Pradesh" Value="himachal_pradesh"></asp:ListItem>
<asp:ListItem Text="Jharkhand" Value="jharkhand"></asp:ListItem>
<asp:ListItem Text="Karnataka" Value="karnataka"></asp:ListItem>
<asp:ListItem Text="Kerala" Value="kerala"></asp:ListItem>
<asp:ListItem Text="Madhya Pradesh" Value="madhya_pradesh"></asp:ListItem>
<asp:ListItem Text="Maharashtra" Value="maharashtra"></asp:ListItem>
<asp:ListItem Text="Manipur" Value="manipur"></asp:ListItem>
<asp:ListItem Text="Meghalaya" Value="meghalaya"></asp:ListItem>
<asp:ListItem Text="Mizoram" Value="mizoram"></asp:ListItem>
<asp:ListItem Text="Nagaland" Value="nagaland"></asp:ListItem>
<asp:ListItem Text="Odisha" Value="odisha"></asp:ListItem>
<asp:ListItem Text="Punjab" Value="punjab"></asp:ListItem>
<asp:ListItem Text="Rajasthan" Value="rajasthan"></asp:ListItem>
<asp:ListItem Text="Sikkim" Value="sikkim"></asp:ListItem>
<asp:ListItem Text="Tamil Nadu" Value="tamil_nadu"></asp:ListItem>
<asp:ListItem Text="Telangana" Value="telangana"></asp:ListItem>
<asp:ListItem Text="Tripura" Value="tripura"></asp:ListItem>
<asp:ListItem Text="Uttar Pradesh" Value="uttar_pradesh"></asp:ListItem>
<asp:ListItem Text="Uttarakhand" Value="uttarakhand"></asp:ListItem>
<asp:ListItem Text="West Bengal" Value="west_bengal"></asp:ListItem>
<asp:ListItem Text="Andaman and Nicobar Islands" Value="andaman_nicobar"></asp:ListItem>
<asp:ListItem Text="Chandigarh" Value="chandigarh"></asp:ListItem>
<asp:ListItem Text="Dadra and Nagar Haveli and Daman and Diu" Value="dadra_nagar_haveli_daman_diu"></asp:ListItem>
<asp:ListItem Text="Lakshadweep" Value="lakshadweep"></asp:ListItem>
<asp:ListItem Text="Delhi" Value="delhi"></asp:ListItem>
<asp:ListItem Text="Puducherry" Value="puducherry"></asp:ListItem>
<asp:ListItem Text="Ladakh" Value="ladakh"></asp:ListItem>
<asp:ListItem Text="Jammu and Kashmir" Value="jammu_kashmir"></asp:ListItem>

                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label for="password" class="form-label">City</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="City"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label for="password" class="form-label">Pin code</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Pincode" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col">
                            <label for="password" class="form-label">Full Address</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>

               

                    <div class="row mt-4">
                        <div class="col text-center">

                            <asp:Button CssClass="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Set Appointment date and Time" OnClick="Button1_Click1" />
                        </div>
                    </div>

                    
 </asp:Panel>
                   
                </div> <!-- card-body -->
            </div> <!-- card -->
             <div class="text-center mt-3">
     <a href="../homepage2.aspx">← Home page</a>

 </div>
        </div> <!-- col-md-8 -->
    </div> <!-- row -->
</div> <!-- container -->

</asp:Content>
