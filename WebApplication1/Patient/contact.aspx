<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication1.Patient.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
    .contact-container {
        display: flex;
        flex-wrap: wrap;
        background-color: #f4f8fb;
        padding: 0px;
        justify-content: center;
    }

    .contact-form, .contact-info {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: 15px;
        padding: 25px;
    }

    .contact-form {
        flex: 3;
        max-width: 750px;
    }

    .contact-info {
        flex: 2;
        max-width: 450px;
        text-align: center;
    }

    .contact-info h3 {
        margin-bottom: 15px;
        color: #007bff;
        text-shadow: 1px 1px 4px rgba(0, 123, 255, 0.6);
    }

    .contact-info ul {
        list-style: none;
        padding: 0;
        font-size: 14px;
        color: #333;
    }

    .contact-info ul li {
        margin-bottom: 12px;
    }

    .contact-info ul li a {
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s;
    }

    .contact-info ul li a:hover {
        color: #0056b3;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        color: #333;
        font-weight: bold;
    }

    .form-group input, .form-group textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: border-color 0.3s;
    }

    .form-group input:focus, .form-group textarea:focus {
        border-color: #007bff;
    }

    .form-group textarea {
        resize: none;
        height: 120px;
    }

    .btn-submit {
        background-color: #007bff;
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s, box-shadow 0.3s;
    }

    .btn-submit:hover {
        background-color: #0056b3;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    iframe {
        border: 0;
        width: 100%;
        height: 400px;
        margin-top: 20px;
        border-radius: 8px;
    }

    .chat-button {
        position: fixed;
        bottom: 20px;
        right: 20px;
        z-index: 1000;
        transition: box-shadow 0.3s ease, transform 0.3s ease;
    }

    .whatsapp-logo {
        width: 70px;
        height: auto;
        cursor: pointer;
        transition: transform 0.3s ease;
    }

    .chat-button:hover {
        transform: scale(1.1);
    }

    .whatsapp-logo:hover {
        opacity: 0.8;
    }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-container">
        <!-- Contact Form -->
        <div class="contact-form">
            <h3>Send a Message</h3>
            <div class="form-group">
                <label for="firstName">Full Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" Placeholder="Enter your full name"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="lastName">Subject</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" Placeholder="Enter the subject"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Your email address"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile</label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" Placeholder="Your mobile number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="message">Message</label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Placeholder="Write your message here..."></asp:TextBox>
            </div>
            <asp:Button ID="btnSend" runat="server" CssClass="btn-submit" Text="Send Message" OnClick="btnSend_Click" />
        </div>

        <!-- Bootstrap Modal -->
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Message</h5>
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


        <!-- Contact Information -->
        <div class="contact-info">
            <h3>Contact Info</h3>
            <ul>
                <li>Near the Clove Wine n Dine hotel, Maruti Mandir, Ratnagiri</li>
                <li><a href="mailto:drzopeclinic2024@gmail.com">drzopeclinic2024@gmail.com</a></li>
                <li>+91 987 654 3210</li>
            </ul>
            <div class="social-icons">
                <a href="#">Facebook</a> |
                <a href="#">Twitter</a> |
                <a href="#">LinkedIn</a> |
                <a href="#">Instagram</a>
            </div>
            <iframe 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3899.8259464578764!2d73.32320287494282!3d16.9903285085199!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bf92b2486237%3A0xe27f345c71bfe330!2sZope&#39;s%20Clinic!5e0!3m2!1sen!2sin!4v1695827452137!5m2!1sen!2sin" 
                allowfullscreen=""
                loading="lazy">
            </iframe>
        </div>
        
        <!-- WhatsApp Chat Button -->
        <div class="chat-button">
            <asp:ImageButton ID="imgBtnWhatsApp" runat="server" 
                ImageUrl="~/img/whatsapp2.png" 
                AlternateText="Chat with us on WhatsApp"
                CssClass="whatsapp-logo" OnClientClick="openWhatsApp(); return false;" />
        </div>
    </div>

    <script type="text/javascript">
        function openWhatsApp() {
            var predefinedMessage = "I need assistance";
            var encodedMessage = encodeURIComponent(predefinedMessage);
            var phoneNumber = "919850115182";  // Replace with the actual phone number
            var whatsappUrl = "https://wa.me/" + phoneNumber + "?text=" + encodedMessage;
            window.open(whatsappUrl, "_blank");
        }




    </script>
</asp:Content>