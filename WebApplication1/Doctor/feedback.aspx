<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="WebApplication1.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
       <style>
        /* Background styling */
      

        /* Header styling */
        h2 {
            color:darkblue;
            text-align: center;
            font-family: Arial, sans-serif;
            font-size: 40px;
            font-weight: bold;
            padding: 20px 0;
            margin: 0;
            text-transform: uppercase;
            transition: color 0.3s ease;
        }
       
       /* Table styling */
.feedback-table {
    width: 80%;
    margin: 40px auto;
    border-collapse: collapse;
    background-color: rgba(255, 255, 255, 0.85); /* Slightly transparent background */
    font-family: Arial, sans-serif;
    border-radius: 8px;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.feedback-table:hover {
    transform: scale(1.02); /* Slightly enlarge the table on hover */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* Add shadow on hover */
}
.feedback-table th, .feedback-table td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}
.feedback-table th {
    background-color: #4CAF50;
    color: white;
    font-size: 18px;
}
.feedback-table tr:nth-child(even) {
    background-color: #f2f2f2;
}
.feedback-table tr:hover {
    background-color: #ddd;
    transition: background-color 0.3s ease; /* Smooth transition for row background color */
}


        /* Delete button styling */
        .delete-button {
            background-color: #ff4c4c;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border-radius: 4px;
        }
        .delete-button:hover {
            background-color: #ff0000;
            color: #fff;
        }
        
          .back-btn {
      position: absolute;
      top: 20px;
      left: 20px;
      font-size: 20px;
      color: #007bff; /* Blue color for the icon */
      background-color: transparent;
      border: none;
      cursor: pointer;
      margin-top:65px;
  }

  .back-btn:hover {
      color: #0056b3; /* Darker blue on hover */
  }
    </style>
   
  <%-- <div style="background-image: url('../img/clinic.png'); background-size: cover; background-position: center; background-attachment: fixed; opacity: 0.5; width: 100%; height: 100%; position: absolute; top: 0; left: 0; z-index: -1;"></div>  --%>
   
     <div style="background-color: azure; width: 100%; height:150%; position: absolute; top: 0; left: 0; z-index: -1;"></div>
         <button type="button" class="back-btn" onclick="window.location.assign('dashboard1.aspx');">
    <i class="fas fa-arrow-left"></i> Back
</button>

    <h2>Patient Feedbacks</h2>
    <asp:GridView ID="GridViewFeedback" runat="server" CssClass="feedback-table" AutoGenerateColumns="false" OnRowCommand="GridViewFeedback_RowCommand">
        <Columns>
            <asp:BoundField DataField="p_name" HeaderText="Patient Name" />
            <asp:BoundField DataField="p_email" HeaderText="Email" />
            <asp:BoundField DataField="p_subject" HeaderText="Subject" />
            <asp:BoundField DataField="p_message" HeaderText="Message" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteFeedback" CommandArgument='<%# Eval("p_fid") %>' CssClass="delete-button" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
