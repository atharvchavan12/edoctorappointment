<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="doctorconsultancy.aspx.cs" Inherits="WebApplication1.Doctor.doctorconsultancy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                                   <style>
.container-fluid{
  
    margin-top:35px;
    }
 .back-btn {
     position: fixed;
     top: 85px;
     left: 20px;
     font-size: 20px;
     color: #007bff; /* Blue color for the icon */
     background-color: transparent;
     border: none;
     cursor: pointer;
 }

 .back-btn:hover {
     color: #0056b3; /* Darker blue on hover */
 }
     .manage-emergency-link {
        font-weight: bold;
        color: #007BFF;
        margin-top: 10px;
        text-decoration: none;
    }

    .manage-emergency-link:hover {
        text-decoration: underline;
    }

    .top-links {
        position: fixed;
        top: 90px;
        right: 20px;
    }
                                   </style>
     <div class="top-links">
     <a href="manageconsultancy.aspx" class="manage-emergency-link">Manage Consultancy Appointments</a>
 </div>
        <button type="button" class="back-btn" onclick="window.location.assign('dashboard1.aspx');">
    <i class="fas fa-arrow-left"></i> Back
</button>
  <div class="container-fluid">
   <div class="row">
    <div class="col-md-5">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>Patient Appointment Profile</h4>
                        </center>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center>
                            <img width="140px" src="../img/consultancy.jpg" />
                        </center>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

            <div class="row">
    <div class="col-md-5">
        <label for="patientid" class="form-label">ID</label>
        <div class="form-group">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
            </div>
        </div>
    </div>

    <div class="col-md-5">
        <label for="patientcontact" class="form-label">Contact</label>
        <div class="form-group">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="contact"></asp:TextBox>
             
            </div>
        </div>
    </div>
</div>
                            <div class="row">
    <div class="col-md-6">
        <label for="patientid" class="form-label">Consultancy Date</label>
        <div class="form-group">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
              
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <label for="patientcontact" class="form-label">Consultancy Time</label>
        <div class="form-group">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
             
            </div>
        </div>
    </div>
</div>

                <div class="row">
                    <div class="col-md-6">
                        <label for="patientname" class="form-label"> Patient Name</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Name"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
    <label for="patientname" class="form-label">Email ID</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="email ID"></asp:TextBox>
        </div>
    </div>
</div>
       </div>

                                <div class="row">
    <div class="col-md-6">
        <label for="dob" class="form-label">DOB</label>
        <div class="form-group">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" TextMode="Date"></asp:TextBox>
            </div>
        </div>
    </div>
<div class="col-md-4">
    <label for="gender" class="form-label">Gender</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server"></asp:TextBox>
        </div>
    </div>
</div>
</div>

                               
                                                        <div class="row">
    <div class="col-md-6">
        <label for="dob" class="form-label">Video Link</label>
        <div class="form-group">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" ></asp:TextBox>
            </div>
        </div>
    </div>
<div class="col-md-4">
    <label for="gender" class="form-label">Package</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server"></asp:TextBox>
        </div>
    </div>
</div>
</div>
                                

                            <div class="row">
<div class="col-md-12">
    <label for="height" class="form-label">Problem Description</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
        </div>
    </div>
</div>
                                </div>


                                                <div class="row">
    <div class="col-md-6">
      
        <div class="form-group">
            <div class="input-group">
              <asp:Button class="btn btn-lg btn-block btn-success " ID="Button3" runat="server" Text="Set Date and time" OnClick="Button3_Click"  />
            </div>
        </div>
    </div>
<div class="col-md-6">
    <div class="form-group">
        <div class="input-group">
        <asp:Button class="btn btn-lg btn-block btn-success " ID="Button5" runat="server" Text="UPDATE" OnClick="Button5_Click"  />
        </div>
    </div>
</div>
</div>

              
            </div> <!-- card-body -->
        </div> <!-- card -->
        <div class="text-center mt-3">
            <a href="/Doctor/doctor_panel1.aspx">← Doctor Panel</a>
        </div>
    </div> <!-- col-md-5 -->

    <div class="col-md-7">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>Issued Consultancy List</h4>
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
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False">
    <Columns>
        
        <asp:BoundField DataField="formatted_c_id" HeaderText="Patient ID" />
        
        <asp:BoundField DataField="c_patientname" HeaderText="Patient Name" />
      

 
      <asp:TemplateField HeaderText="Calling">
    <ItemTemplate>
        <asp:Button ID="btnStartVideoCall" 
                    runat="server" 
                    Text="Get Link" 
                    CommandName="StartCall" 
                    CommandArgument='<%# Eval("formatted_c_id") %>' 
                    CssClass="btn btn-primary btn-sm" 
                    OnCommand="btnStartVideoCall_Command" />
    </ItemTemplate>
</asp:TemplateField>

    </Columns>
</asp:GridView>

    </div>
</div>



            </div> <!-- card-body -->
        </div> <!-- card -->
    </div> <!-- col-md-7 -->
</div> <!-- main row -->
</div>









</asp:Content>
