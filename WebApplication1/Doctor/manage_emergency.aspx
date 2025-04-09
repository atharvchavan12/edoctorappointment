<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="manage_emergency.aspx.cs" Inherits="WebApplication1.Doctor.manage_emergency" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
    <!-- Add Font Awesome CSS if not already included -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .container-fluid {
            margin-top: 35px;
        }
        
        /* Custom style to position the back button at the upper left corner */
        .back-btn {
            position: fixed;
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

    <!-- Back button with Font Awesome icon -->
 <button type="button" class="back-btn" onclick="window.location.assign('appointment.aspx');">
    <i class="fas fa-arrow-left"></i> Back
</button>



    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Emergency Appointment List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="e_id" HeaderText="Patient ID" />
                                        <asp:BoundField DataField="e_name" HeaderText="Name" />
                                        <asp:BoundField DataField="e_contact" HeaderText="Contact" />
                                        <asp:BoundField DataField="e_appointment_date" HeaderText="Appointment Date" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                        <asp:BoundField DataField="status" HeaderText="Status" />
                                        
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("e_id") %>' CssClass="btn btn-success btn-sm" />
                                                <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("e_id") %>' CssClass="btn btn-danger btn-sm" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div> <!-- card-body -->
                </div> <!-- card -->
            </div> <!-- col-md-12 -->
        </div> <!-- main row -->
    </div>
</asp:Content>
