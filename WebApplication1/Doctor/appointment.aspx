<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="appointment.aspx.cs" Inherits="WebApplication1.Doctor.appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
        </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                        <style>
        .container-fluid {
            margin-top: 35px;
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
        <a href="manage_emergency.aspx" class="manage-emergency-link">Manage Emergency Appointments</a>
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
                            <img width="140px" src="../img/appointment.png" />
                        </center>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

            <div class="row">
    <div class="col-md-3">
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

   <%--  <div class="col-md-4">
        <label for="patientdate" class="form-label">Appointment Date</label>
        <div class="form-group">
            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
        </div>
    </div> --%>
</div>


                <div class="row">
                    <div class="col-md-6">
                        <label for="patientname" class="form-label">Name</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Name"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
    <label for="patientname" class="form-label">Email ID</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="email ID"></asp:TextBox>
        </div>
    </div>
</div>
       </div>

                                <div class="row">
    <div class="col-md-4">
        <label for="dob" class="form-label">DOB</label>
        <div class="form-group">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" TextMode="Date"></asp:TextBox>
            </div>
        </div>
    </div>
                     <div class="col-md-4">
     <label for="bt" class="form-label">Blood Type</label>
     <div class="form-group">
         <div class="input-group">
             <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server"></asp:TextBox>
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
                        <label for="patientname" class="form-label">Appointment Date</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
    <label for="patientname" class="form-label">Appointment Time</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" ></asp:TextBox>
        </div>
    </div>
</div>
       </div>

                                <div class="row">
                    <div class="col-md-6">
                        <label for="height" class="form-label">Height</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Height"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
    <label for="weight" class="form-label">Weight</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Weight"></asp:TextBox>
        </div>
    </div>
</div>
       </div>
                            <div class="row">
<div class="col-md-12">
    <label for="height" class="form-label">Address</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
        </div>
    </div>
</div>
                                </div>

                <div class="row">
                    <div class="col-6">
                        <asp:Button class="btn btn-lg btn-block btn-success" ID="Button3" runat="server" Text="Emergency Appointment" OnClick="Button3_Click"  />
                    </div>
                    <div class="col-6">
                        <asp:Button class="btn btn-lg btn-block btn-warning" ID="Button4" runat="server" Text="Update" OnClick="Button4_Click" />
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
                            <h4>Issued Appointment List</h4>
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
     <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="p_id" HeaderText="Patient ID" />
        <asp:BoundField DataField="p_name" HeaderText="Name" />
        <asp:BoundField DataField="p_contact" HeaderText="Contact" />
        
       
        <asp:BoundField DataField="appointment_date" HeaderText="Appointment Date" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
        
        <asp:BoundField DataField="status" HeaderText="Status" />
        
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("p_id") %>' CssClass="btn btn-success btn-sm" />
                <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("p_id") %>' CssClass="btn btn-danger btn-sm" />
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




