<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reschedule1.aspx.cs" Inherits="WebApplication1.Doctor.reschedule1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reschedule Appointments</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 50%; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; background-color: #f9f9f9;">
            <h2 style="text-align: center;">Select Time Slots for Reschedule</h2>
            <hr />
            <div id="timeSlotContainer" runat="server">
                <asp:Literal ID="TimeSlotsLiteral" runat="server"></asp:Literal>
            </div>
            <hr />
            <div style="text-align: center;">
                <asp:Button ID="SubmitButton" runat="server" Text="Send Notifications" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
