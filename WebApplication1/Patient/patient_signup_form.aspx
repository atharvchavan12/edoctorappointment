<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="patient_signup_form.aspx.cs" Inherits="WebApplication1.Patient.patient_signup_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            margin-top: 30px;
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
        .error {
    border: 2px solid red;
    background-color: #ffe6e6;
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <img width="150px" src="../img/signup.png" />
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col text-center">
                                    <h3>Patient SignUp</h3>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>

                            <form id="signupForm" onsubmit="return validateForm();">
                                <div class="row">
                                    <div class="col">
                                        <label for="username" class="form-label">Enter Username</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Username"></asp:TextBox>
                                        </div>

                                        <label for="email" class="form-label">Enter Email ID</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="xyz12@gmail.com" TextMode="Email"></asp:TextBox>
                                        </div>

                                        <label for="password" class="form-label">Enter Password</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                            <i class="fas fa-eye toggle-password" onclick="showPassword('<%= TextBox2.ClientID %>')"></i>
                                        </div>

                                        <label for="cusername" class="form-label">Enter Confirm Password</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                            <i class="fas fa-eye toggle-password" onclick="showPassword('<%= TextBox3.ClientID %>')"></i>
                                        </div>

                                        <div class="form-group">
                                            <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-3">
                    <a href="../homepage2.aspx">← Back to Home page</a> |
                    <span>Already Have an Account? <a href="../Patient/patient_signin_form.aspx">Sign In</a></span>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel">Notification</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modalMessage">
                    <!-- Message will be populated dynamically -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showMessage(message) {
            document.getElementById("modalMessage").innerText = message;
            $('#messageModal').modal('show');
        }

        function showPassword(id) {
            const passwordField = document.getElementById(id);
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                setTimeout(() => {
                    passwordField.type = 'password';
                }, 300);
            }
        }
    </script>
</asp:Content>

