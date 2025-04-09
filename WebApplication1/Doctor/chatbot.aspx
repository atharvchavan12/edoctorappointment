<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="chatbot.aspx.cs" Inherits="WebApplication1.Doctor.chatbot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- You can add any specific head content here -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .chat-button button {
            background-color: #25d366;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
        }
        .whatsapp-logo {
            width: 50px;  /* Adjust as needed */
            height: auto;
            cursor: pointer;  /* Optional: Shows a pointer on hover */
        }
    </style>

    <!-- Chat button to open WhatsApp -->
    <div class="chat-button">
        <!-- Use ImageButton to display WhatsApp logo -->
        <asp:ImageButton ID="imgBtnWhatsApp" runat="server" 
            ImageUrl="~/img/whatsapp2.png" 
            AlternateText="Chat with us on WhatsApp"
            CssClass="whatsapp-logo" OnClientClick="openWhatsApp(); return false;" />
    </div>

    <script type="text/javascript">
        function openWhatsApp() {
            // Define the predefined message and encode it
            var predefinedMessage = "I need assistance";
            var encodedMessage = encodeURIComponent(predefinedMessage);

            // Redirect to WhatsApp with the predefined message
            var phoneNumber = "919850115182";  // Replace with the actual phone number
            var whatsappUrl = "https://wa.me/" + phoneNumber + "?text=" + encodedMessage;

            // Open the WhatsApp URL
            window.open(whatsappUrl, "_blank");
        }
    </script>
</asp:Content>
