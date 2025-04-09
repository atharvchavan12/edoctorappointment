<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="doctorlogin.aspx.cs" Inherits="WebApplication1.doctorlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <style>
       .container{
           margin-top:30px;
       }
       .form-group {
           position: relative;
       }
       .toggle-password {
           position: absolute;
           right: 10px;
           top: 50%;
           transform: translateY(-50%);
           cursor: pointer;
       }
   </style>

   <div class="container">
       <div class="row">
           <div class="col-md-6 mx-auto">
               <div class="card">
                   <div class="card-body">
                       <div class="row">
                           <div class="col">
                               <center>
                                   <img width="150px" src="img/doctorlogin.png" />
                               </center>
                           </div>
                       </div>

                       <div class="card-body">
                           <div class="row">
                               <div class="col">
                                   <center>
                                       <h3>DOCTOR LOGIN</h3>
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
                                   <label for="username" class="form-label">Enter Username</label>
                                   <div class="form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Username"></asp:TextBox>
                                   </div>

                                   <label for="password" class="form-label">Enter Password</label>
                                   <div class="form-group">
                                       <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                       <i class="fas fa-eye toggle-password" onclick="showPassword()"></i>
                                   </div>

                                   <div class="form-group">
                                       <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
                                   </div>
                                   <div class="form-group">
                                       <asp:Button class="btn btn-warning btn-block btn-lg" ID="Button3" runat="server" Text="Clear" OnClick="Button2_Click" />
                                   </div>
                               </div>
                           </div>
                       </div>
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


               <div class="text-center mt-3">
                   <a href="../homepage2.aspx">← Home page</a>
               </div>
           </div>
       </div>
   </div>

   <script>
       function showPassword() {
           const passwordField = document.getElementById('<%= TextBox2.ClientID %>');
           passwordField.type = 'text';
           setTimeout(() => {
               passwordField.type = 'password';
           }, 300); // Show password for 300 milliseconds
       }
   </script>

</asp:Content>

