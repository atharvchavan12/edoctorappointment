<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="add_receptionist.aspx.cs" Inherits="WebApplication1.Doctor.add_receptionist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
  $(document).ready(function () {
      $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
  });
      </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                   <style>
    

.container{
  
    margin-top:30px;
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
           <div class="container">
   <div class="row">
    <div class="col-md-5">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <center>
                            <h4>Receptionist Details</h4>
                        </center>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <center>
                            <img width="140px" src="../img/receptionist.png" />
                        </center>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label for="doctorid" class="form-label">Receptionist ID</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="r001"></asp:TextBox>
                                <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <label for="doctorname" class="form-label">Receptionist Name</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- New Designation Row -->
                <div class="row">
                    <div class="col-md-6">
                        <label for="designation" class="form-label">Designation</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" ReadOnly="True" Text="Receptionist"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                                <div class="row">
    <div class="col-md-6">
        <label for="designation" class="form-label">Username</label>
        <div class="form-group">
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
                     <div class="col-md-6">
     <label for="designation" class="form-label">Password</label>
     <div class="form-group">
         <div class="input-group">
             <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server"></asp:TextBox>
         </div>
     </div>
 </div>
</div>

                <div class="row">
                    <div class="col-4">
                        <asp:Button class="btn btn-lg btn-block btn-success" ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" />
                    </div>
                    <div class="col-4">
                        <asp:Button class="btn btn-lg btn-block btn-warning" ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" />
                    </div>
                    <div class="col-4">
                        <asp:Button class="btn btn-lg btn-block btn-danger" ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" />
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
                            <h4>Receptionist List</h4>
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
        <asp:GridView CssClass="table table-striped table-bordered" 
            ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name1" HeaderText="name1" SortExpression="name1" />
               
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
