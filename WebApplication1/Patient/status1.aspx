<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="status1.aspx.cs" Inherits="WebApplication1.Patient.status1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
           <div class="container-fluid">
    <div class="row">
        <div class="col-md-5">

            <div class="card">
                <div class="card-body">

                    <div class="row">
                        <div class="col">
                            <center>                          
                                <img width="150px" src="../img/login.png" />
                            </center>
                        </div>
                    </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>YOUR PROFILE</h3>
                                   <span class="badge badge-pill badge-info">Patient Information</span>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

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
                                <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
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
                        <div class="col-8 mx-auto">
                            <center>
                            <div class="form-group">
                            <asp:Button CssClass="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="UPDATE" OnClick="Button1_Click1" />
                        </div>
                                </center>
                    </div>

                   </div>

                   
                </div> <!-- card-body -->
            </div> <!-- card -->
             <div class="text-center mt-3">
     <a href="../homepage1.aspx">← Home page</a>

 </div>
        </div> <!-- col-md-8 -->

        <div class="col-md-7">
                        <div class="card">
                <div class="card-body">

                    <div class="row">
                        <div class="col">
                            <center>                          
                                <img width="150px" src="../img/login.png" />
                            </center>
                        </div>
                    </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>YOUR Appointments</h3>
                                     <span class="badge badge-pill badge-info">Apppointment Information</span>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                            
                    <div class="row">
                        <div class="col">

                        </div>
                    </div>

                     <div class="row">
     <div class="col">
         <asp:GridView class="table table-striped table-bordered"   ID="GridView1" runat="server"></asp:GridView>
     </div>
 </div>
                

             

                
                
                      

                   
                </div> <!-- card-body -->
            </div>
        </div>
    </div> <!-- row -->
</div> <!-- container -->
</asp:Content>
