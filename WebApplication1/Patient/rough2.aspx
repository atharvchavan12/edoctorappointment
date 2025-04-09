<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rough2.aspx.cs" Inherits="WebApplication1.rough2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
    <!-- FontAwesome CSS -->
    <link href="fontawesome/css/all.css" rel="stylesheet" />
    <style>


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        .givecolor {
            background-color: aqua;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
        }

        .container_userlogin {
            background-color: #fff;
            border-radius: 30px;
            box-shadow: 0 5px 15px rgba(255, 255, 255, 0.35);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 480px;
            border: 1px solid green;
        }

            .container_userlogin p {
                font-size: 14px;
                line-height: 20px;
                letter-spacing: 0.3px;
                margin: 20px 0;
            }

            .container_userlogin span {
                font-size: 12px;
            }

            .container_userlogin a {
                color: #333;
                font-size: 13px;
                text-decoration: none;
                margin: 15px 0 10px;
            }

            .container_userlogin button {
                background-color: forestgreen;
                color: #fff;
                font-size: 12px;
                padding: 10px 45px;
                border: 1px solid transparent;
                border-radius: 8px;
                font-weight: 600;
                letter-spacing: 0.5px;
                text-transform: uppercase;
                margin-top: 10px;
                cursor: pointer;
            }

                .container_userlogin button.hidden {
                    background-color: transparent;
                    border-color: #fff;
                }

            .container_userlogin form {
                background-color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 40px;
                height: 100%;
            }

            .container_userlogin input {
                background-color: #eee;
                border: none;
                margin: 8px 0;
                padding: 10px 15px;
                font-size: 13px;
                border-radius: 8px;
                width: 100%;
                outline: none;
            }

        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .sign-in {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .container_userlogin.active .sign-in {
            transform: translateX(100%);
        }

        .sign-up {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .container_userlogin.active .sign-up {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: move 0.6s;
        }

        @keyframes move {
            0%, 49.99% {
                opacity: 0;
                z-index: 1;
            }

            50%, 100% {
                opacity: 1;
                z-index: 5;
            }
        }

        .social-icons {
            margin: 20px 0;
        }

            .social-icons a {
                border: 1px solid #ccc;
                border-radius: 20%;
                display: inline-flex;
                justify-content: center;
                align-items: center;
                margin: 0 3px;
                width: 40px;
                height: 40px;
            }

        .toggle-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: all 0.6s ease-in-out;
            border-radius: 20px;
            z-index: 1000;
        }

        .container_userlogin.active .toggle-container {
            transform: translateX(-100%);
            border-radius: 20px;
        }

        .toggle {
            background-color: forestgreen;
            height: 100%;
            color: #fff;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: all 0.6s ease-in-out;
        }

        .container_userlogin.active .toggle {
            transform: translateX(50%);
        }

        .toggle-panel {
            position: absolute;
            width: 50%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 30px;
            text-align: center;
            top: 0;
            transform: translateX(0);
            transition: all 0.6s ease-in-out;
        }

        .toggle-left {
            transform: translateX(-200%);
        }

        .container_userlogin.active .toggle-left {
            transform: translateX(0);
        }

        .toggle-right {
            right: 0;
            transform: translateX(0);
        }
    </style>


</head>
<body style="height: 483px">
   
      
     <div class="givecolor">
        <div class="container_userlogin" id="container">
            <div class="form-container sign-up">
                <form id="form1" runat="server">
                    <h1>Create Account</h1>
                    <div class="social-icons">
                        <a href="#" class="icons"><i class="fa-brands fa-google"></i></a>
                        <a href="#" class="icons"><i class="fa-brands fa-facebook"></i></a>
                        <a href="#" class="icons"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icons"><i class="fa-brands fa-linkedin"></i></a>
                    </div>
                    <span>Registration with E-mail</span>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="input"></asp:TextBox>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="input"></asp:TextBox>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="input"></asp:TextBox>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm password" CssClass="input"></asp:TextBox>
                    <asp:Button ID="btnSignUp" runat="server" Text="Sign up" OnClick="btnSignUp_Click" CssClass="button" />
                     <button>Sign up</button>
                </form>
            </div>
            <div class="form-container sign-in">
                <form>
                    <h1>Sign In</h1>
                    <div class="social-icons">
                        <a href="#" class="icons"><i class="fa-brands fa-google"></i></a>
                        <a href="#" class="icons"><i class="fa-brands fa-facebook"></i></a>
                        <a href="#" class="icons"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icons"><i class="fa-brands fa-linkedin"></i></a>
                    </div>
                    <span>Login with E-mail and Password</span>
                    <input type="email" placeholder="Email" required />
                    <input type="password" placeholder="Password" required />
                    <a href="#">Forgot password?</a>
                    <button>Sign in</button>
                </form>
            </div>
            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h1>Welcome to<br />Dr.Zopes Clinic</h1>
                        <p>Sign in with Email and Password</p>
                        <button class="hidden" id="login">Sign in</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Welcome to<br />Dr.Zopes Clinic</h1>
                        <p>Skin and Laser specialist</p>
                        <button class="hidden" id="register">Sign up</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
           </form>
    <script>
        const container = document.getElementById('container');
        const registerBtn = document.getElementById('register');
        const loginBtn = document.getElementById('login');

        registerBtn.addEventListener('click', () => {
            container.classList.add("active");
        });

        loginBtn.addEventListener('click', () => {
            container.classList.remove("active");
        });
    </script>

   
</body>
</html>
