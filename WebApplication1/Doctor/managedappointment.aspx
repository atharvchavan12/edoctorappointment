<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="managedappointment.aspx.cs" Inherits="WebApplication1.Doctor.managedappointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
      </script> 
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
</style>
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
                            <h4>Managed Appointments </h4>
                        </center>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center>
                            <img width="140px" src="../img/managedappointment1.png" />
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
                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="contact"  ReadOnly="True"></asp:TextBox>
             
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
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Name"  ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
    <label for="patientname" class="form-label">Email ID</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="email ID"  ReadOnly="True"></asp:TextBox>
        </div>
    </div>
</div>
       </div>

                                <div class="row">
    <div class="col-md-4">
        <label for="dob" class="form-label">DOB</label>
        <div class="form-group">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" TextMode="Date"  ReadOnly="True"></asp:TextBox>
            </div>
        </div>
    </div>
                     <div class="col-md-4">
     <label for="bt" class="form-label">Blood Type</label>
     <div class="form-group">
         <div class="input-group">
             <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server"  ReadOnly="True"></asp:TextBox>
         </div>
     </div>
 </div>

                                                        <div class="col-md-4">
    <label for="gender" class="form-label">Gender</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server"  ReadOnly="True"></asp:TextBox>
        </div>
    </div>
</div>
</div>

                                <div class="row">
                    <div class="col-md-6">
                        <label for="patientname" class="form-label">Appointment Date</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" TextMode="Date" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
    <label for="patientname" class="form-label">Appointment Time</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server"  ReadOnly="True" ></asp:TextBox>
        </div>
    </div>
</div>
       </div>

                                <div class="row">
                    <div class="col-md-6">
                        <label for="height" class="form-label">Height</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Height"  ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
    <label for="weight" class="form-label">Weight</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Weight"  ReadOnly="True"></asp:TextBox>
        </div>
    </div>
</div>
       </div>
                            <div class="row">
<div class="col-md-12">
    <label for="height" class="form-label">Address</label>
    <div class="form-group">
        <div class="input-group">
            <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" Rows="3" TextMode="MultiLine"  ReadOnly="True"></asp:TextBox>
        </div>
    </div>
</div>
                                </div>

                <div class="row">
   
                    <div class="col-12">
                        <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button4" runat="server" Text="Delete Patient Permanently" OnClick="Button4_Click" />
                    </div>
                   
                </div>
            </div> <!-- card-body -->
        </div> <!-- card -->
        <div class="text-center mt-3">
            <a href="/Doctor/dashboard1.aspx">← Dashboard</a>
        </div>
    </div> <!-- col-md-5 -->

    <div class="col-md-7">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>Appointment List</h4>
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
     <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="p_id" HeaderText="Patient ID" />
        <asp:BoundField DataField="p_name" HeaderText="Name" />
        <asp:BoundField DataField="p_contact" HeaderText="Contact" />
     <asp:BoundField DataField="status" HeaderText="Status" />    
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
