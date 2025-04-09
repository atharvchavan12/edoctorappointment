<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="modal_win.aspx.cs" Inherits="WebApplication1.modal_win" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Appointment System</title>
    <style>
        /* Full-page iframe with low opacity to show as background */
        #backgroundPage {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.5; /*Low transparency*/
            z-index: 1;
        }

        /* Modal styling with absolute centering */
         .modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 2;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 30px;
            width: 50%;
            max-width: 600px;
            text-align: left;
            border-radius: 8px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }
        .modal-content h2 {
            font-size: 22px;
            margin-bottom: 15px;
            color: #2c3e50;
            text-align: center;
        }

        .modal-content p {
            font-size: 14px;
            margin-bottom: 15px;
            color: #555;
            text-align: justify;
        }

        .modal-content ul {
            list-style-type: disc;
            margin-left: 20px;
            padding-left: 10px;
            font-size: 13px;
        }

        .modal-content li {
            margin-bottom: 8px;
        }

        /* Button styling */
        .modal-content button {
            padding: 10px;
            font-size: 15px;
            color: #fff;
            background-color:green;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
            width: 100%;
        }

        .modal-content button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Background iframe to load homepage1.aspx with reduced opacity -->
        <iframe id="backgroundPage" src="homepage2.aspx" frameborder="0"></iframe>

        <!-- Modal Structure -->
        <div id="userModal" class="modal">
          <div class="modal-content">
    <h2>Welcome to Dr.Zope's Clinic</h2>
    <p id="userInfo">
        Schedule your appointments effortlessly! Book a consultation with our doctors at a time that suits you best.
        Simply log in or create an account to get started, and let our system help you manage your appointments with ease.
    </p>
    <p><strong>How It Works:</strong></p>
    <ul>
        <li>If you're new, sign up to access the system.</li>
        <li>After signing up, you can fill out the appointment form. If you've already filled it out, use the "Fetch Previous Details" button.</li>
        <li>Complete the appointment process by:
            <ul>
                <li>Filling in all required fields on the appointment form.</li>
                <li>Clicking "Set Appointment Date and Time" to choose a date and time.</li>
                <li>Clicking "Send Request" to finalize your booking.</li>
            </ul>
        </li>
        <li>Dates marked in red on the calendar indicate doctor unavailability.</li>
        <li>Review your appointment details under the "Status" tab on the homepage.</li>
        <li>Note: <strong>You can cancel your appointment within 24 hours of booking; after that, cancellations are not allowed.</strong></li>
        <li><strong>Please arrive 10 minutes before your scheduled time on the day of the appointment.</strong></li>
    </ul>

    <!-- Checkbox for agreeing to terms -->
    <div style="margin-top: 15px;">
        <input type="checkbox" id="agreeCheckbox" />
        <label for="agreeCheckbox" style="color:red;">I agree and wish to continue</label>
    </div>

    <button type="button" onclick="checkAgreement()">Continue</button>
</div>
        </div>
    </form>

    <!-- JavaScript to close the modal and remove the overlay -->
   <script type="text/javascript">
       function checkAgreement() {
           var agreeCheckbox = document.getElementById("agreeCheckbox");
           if (agreeCheckbox.checked) {
               closeModal();
               window.location.href = "../homepage2.aspx";
               

           } else {
               alert("Please agree to the terms to continue.");
           }
       }

       function closeModal() {
           document.getElementById("userModal").style.display = "none";
           document.getElementById("backgroundPage").style.opacity = "1"; // Restore background opacity
       }
</script>
</body>
</html>
