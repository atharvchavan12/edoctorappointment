<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" 
    AutoEventWireup="true" EnableEventValidation="false" CodeBehind="navfooter.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    </style>

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
                    <a href="../homepage1.aspx">← Back to Home page</a> |
                    <span>Already Have an Account? <a href="../Patient/patient_signin_form.aspx">Sign In</a></span>
                </div>
            </div>
        </div>
    </div>

    <script>
        function validateUsername(username) {
            return !/\s/.test(username);
        }

        function validateEmail(email) {
            const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            return emailRegex.test(email);
        }

        function validatePassword(password) {
            const passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*()])[a-zA-Z0-9!@#$%^&*()]{8,12}$/;
            return passwordRegex.test(password);
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

        function validateForm() {
            const username = document.getElementById('<%= TextBox1.ClientID %>').value.trim();
            const email = document.getElementById('<%= TextBox4.ClientID %>').value.trim();
            const password = document.getElementById('<%= TextBox2.ClientID %>').value.trim();
            const confirmPassword = document.getElementById('<%= TextBox3.ClientID %>').value.trim();

            if (!username || !email || !password || !confirmPassword) {
                alert('All fields are required.');
                return false;
            }

            if (!validateUsername(username)) {
                alert('Username should not contain spaces.');
                return false;
            }

            if (!validateEmail(email)) {
                alert('Invalid email format.');
                return false;
            }

            if (!validatePassword(password)) {
                alert('Password must be 8-12 characters long, include at least one digit and one special character.');
                return false;
            }

            if (password !== confirmPassword) {
                alert('Passwords do not match.');
                return false;
            }

            return true;
        }
    </script>

</asp:Content>
