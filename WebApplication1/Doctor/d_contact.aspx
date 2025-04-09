<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="d_contact.aspx.cs" Inherits="WebApplication1.Doctor.d_contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Contact Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef3f9;
            margin: 0;
            padding: 20px;
        }

        h2, h3 {
            color: #343a40;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
        }

        .query-list {
            flex: 3;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 60%;
        }

        .query-list h2 {
            text-align: center;
            font-size: 1.5em;
            margin-bottom: 15px;
            color: #007bff;
        }

        .query-table {
            width: 100%;
            border-collapse: collapse;
        }

        .query-table th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
        }

        .query-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .query-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .query-table tr:hover {
            background-color: #f1f1f1;
        }

        .respond-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 0.9em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .respond-button:hover {
            background-color: #0056b3;
        }

        .visited-link {
    background-color: #6c757d; /* Gray background */
    color: white; /* White text color */
    border: none; /* Remove border */
    cursor: default; /* Change cursor to default */
    font-weight: bold; /* Bold text */
    pointer-events: none; /* Disable further clicks */
    box-shadow: none; /* Remove shadow */
    transition: all 0.3s ease-in-out;
}


        .response-panel {
            flex: 2;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 35%;
        }

        .response-panel h3 {
            text-align: center;
            color: #343a40;
            font-size: 1.4em;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #343a40;
        }

        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: none;
            font-size: 1em;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1em;
            display: block;
            width: 100%;
            text-align: center;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .btn-submit:hover {
            background-color: #218838;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        #loadingMessage {
            display: none;
            text-align: center;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1000;
        }

        #loadingMessage h2 {
            margin-top: 20%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Query List -->
            <div class="query-list">
                <h2>Patient Queries</h2>
                <asp:GridView ID="gvPatientQueries" runat="server" AutoGenerateColumns="False" CssClass="query-table"
                    EnableViewState="true" OnRowCommand="gvPatientQueries_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="pat_name" HeaderText="Name" />
                        <asp:BoundField DataField="pat_subject" HeaderText="Subject" />
                        <asp:BoundField DataField="pat_email" HeaderText="Email" />
                        <asp:BoundField DataField="pat_mobile_no" HeaderText="Mobile" />
                        <asp:BoundField DataField="pat_message" HeaderText="Message" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnRespond" runat="server" Text="Respond" CssClass="respond-button"
                                    CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Response Panel -->
            <div class="response-panel">
                <h3>Respond to Query</h3>
                <asp:Label ID="lblSelectedPatient" runat="server" CssClass="form-group" ForeColor="#007bff" Font-Bold="True"></asp:Label>
                <div class="form-group">
                    <label for="responseMessage">Your Response</label>
                    <asp:TextBox ID="txtResponse" runat="server" CssClass="form-control" TextMode="MultiLine" Placeholder="Type your response here..." Rows="6"></asp:TextBox>
                </div>
                <asp:Button ID="btnSendResponse" runat="server" Text="Send Response" CssClass="btn-submit"
                    OnClick="btnSendResponse_Click" OnClientClick="showLoadingMessage();" />
                <div id="loadingMessage">
                    <h2>Please wait...</h2>
                </div>
            </div>
        </div>
    </form>
    <script>
        function showLoadingMessage() {
            document.getElementById("loadingMessage").style.display = "block";
        }
    </script>
</body>
</html>
