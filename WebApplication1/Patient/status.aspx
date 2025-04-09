<%@ Page Title="Appointment Status" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="status.aspx.cs" Inherits="WebApplication1.Patient.status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Background image for the entire window */
        body {
            background-image: url('~/img/logo.jpg'); /* Add your image path */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
        }

        /* Center the main container */
        .content-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0 auto;
            width: 80%;
            background-color: rgba(255, 255, 255, 0.8); /* Add slight transparency */
            padding: 20px;
            border-radius: 8px;
        }

        /* Style the marquee text */
        .page-header {
            text-align: center;
            color: #4A3C8C;
            font-family: Arial, sans-serif;
            margin-bottom: 20px;
        }

        /* Styling for message label */
        .message-label {
            font-size: 16px;
            color: #E74C3C;
            text-align: center;
            margin-bottom: 10px;
        }

        /* Styling for selection label */
        .selection-label {
            font-weight: bold;
            color: #34495E;
            margin-bottom: 8px;
            text-align: center;
            display: block;
        }

        /* Center the panels */
        .appointment-panel, .details-panel {
            text-align: center;
            margin-top: 20px;
        }

        /* Dropdown styling */
        .appointment-dropdown {
            width: 100%; /* Increase width for better visibility */
            padding: 8px;
            font-size: 14px;
            border: 1px solid #D5D5D5;
            border-radius: 5px;
            margin-top: 5px;
        }

        /* DetailsView styling */
        .details-view {
            margin-top: 20px;
            width: 90%;
            border: 1px solid #D5D5D5;
            border-radius: 8px;
            overflow: hidden;
        }

        /* Bold column names */
        .details-view th {
            background-color: #4A3C8C;
            color: #F7F7F7;
            font-weight: bold;
            padding: 10px;
        }

        .details-view td {
            padding: 10px;
            background-color: #F7F7F7;
            color: #34495E;
            border-bottom: 1px solid #D5D5D5;
        }

        /* Last row in DetailsView */
        .details-view tr:last-child td {
            border-bottom: none;
        }

        /* TextBox styling */
        .appointment-id-textbox {
            padding: 8px;
            width: 30%; /* Reduced width */
            border: 1px solid #D5D5D5;
            border-radius: 5px;
            font-size: 14px;
            margin-top: 15px;
        }

        /* Button styling */
        .cancel-button {
            background-color: #4A3C8C;
            color: #FFFFFF;
            padding: 10px 20px;
            font-size: 16px;
            font-family: Arial, sans-serif;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease;
        }

        .cancel-button:hover {
            background-color: #34495E;
        }

          @keyframes marquee {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
       <marquee><h1 class="page-header">PATIENT APPOINTMENT STATUS</h1></marquee>
        
        <asp:Label ID="lblMessage" runat="server" CssClass="message-label" Visible="false"></asp:Label>
        
        <asp:Panel ID="pnlAppointmentSelection" runat="server" CssClass="appointment-panel" Visible="false">
            <asp:Label ID="lblSelectAppointment" runat="server" CssClass="selection-label" Text="Select an Appointment:" AssociatedControlID="ddlAppointments" />
            <asp:DropDownList ID="ddlAppointments" runat="server" CssClass="appointment-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlAppointments_SelectedIndexChanged">
            </asp:DropDownList>
        </asp:Panel>

        <asp:Panel ID="pnlAppointmentDetails" runat="server" CssClass="details-panel" Visible="false">
            <h2>Appointment Details</h2>
            
            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="details-view" AutoGenerateRows="False" Width="100%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <Fields>
                     <asp:BoundField DataField="p_id" HeaderText="Appointment ID" />
                     <asp:BoundField DataField="p_appointment_date" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Appointment Issued Date" />
            <asp:TemplateField HeaderText="Appointment Issued Time">
    <ItemTemplate>
        <asp:Label ID="lblAppointmentTime" runat="server" Text='<%# FormatAppointmentTime(Eval("p_appointment_time")) %>' />
    </ItemTemplate>
</asp:TemplateField>


                   <asp:BoundField DataField="status" HeaderText="Appointment Status" />
                    <asp:BoundField DataField="p_name" HeaderText="Patient Name" />
                    <asp:BoundField DataField="p_dob" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Date of Birth" />
                    <asp:BoundField DataField="p_bloodtype" HeaderText="Blood Type" />
                    <asp:BoundField DataField="p_gender" HeaderText="Gender" />
                    <asp:BoundField DataField="p_contact" HeaderText="Contact Number" />
                    <asp:BoundField DataField="p_emailid" HeaderText="Email ID" />
                    <asp:BoundField DataField="appointment_date" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Appointment Date" />
                    <asp:BoundField DataField="appointment_time" HeaderText="Appointment Time" />
                    <asp:BoundField DataField="p_problem" HeaderText="Problem / Reason for Appointment" />
                    <asp:BoundField DataField="p_state" HeaderText="State" />
                    <asp:BoundField DataField="p_city" HeaderText="City" />
                    <asp:BoundField DataField="p_pincode" HeaderText="Pincode" />
                    <asp:BoundField DataField="p_address" HeaderText="Address" />
                </Fields>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            </asp:DetailsView>

            <asp:TextBox ID="AppointmentIdTextBox" runat="server" CssClass="appointment-id-textbox" placeholder="Enter Appointment ID" />
            <asp:Button ID="Button1" runat="server" Text="Cancel Appointment" CssClass="cancel-button" OnClick="Button1_Click" />
             <asp:Button ID="Button2" runat="server" Text="Download Details" CssClass="cancel-button" OnClick="Button2_Click"/>
        </asp:Panel>
    </div>
</asp:Content>
