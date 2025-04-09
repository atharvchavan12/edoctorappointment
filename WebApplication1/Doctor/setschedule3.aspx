<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="setschedule3.aspx.cs" Inherits="WebApplication1.Doctor.setschedule3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            // Apply DataTables only to GridView table
            $("#<%= GridView1.ClientID %>").prepend($("<thead></thead>").append($("#<%= GridView1.ClientID %> tr:first"))).dataTable();
        });
    </script> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* General Container Styling */
        .container { 
            margin-top: 30px;
        }

        /* Calendar Styling */
        .calendar-container .aspNetCalendar {
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
        }

        /* Calendar Header and Date Cell Styling */
        .aspNetCalendar th, .aspNetCalendar td {
            padding: 8px;
            text-align: center;
        }

        .aspNetCalendar th {
            background-color: #4CAF50;
            color: white;
        }

        .aspNetCalendar td {
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .aspNetCalendar td:hover {
            background-color: #f1f1f1;
        }

        /* Textbox Styling with Hover and Focus Effects */
        #txtVacationDate {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        #txtVacationDate:hover, #txtVacationDate:focus {
            border-color: #4CAF50;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Button Styling */
        .btn {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

    

        /* GridView Styling */
        .table {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow: hidden;
        }

        .table tr:hover {
            background-color: #f9f9f9;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        /* Action Button */
        .btn-danger {
            background-color: #f44336;
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #d32f2f;
        }
                .back-btn {
   
    top: 20px;
    left: 20px;
    font-size: 20px;
    color:green; /* Blue color for the icon */
    background-color: transparent;
    border: none;
    cursor: pointer;
    margin-top:10px;
}

.back-btn:hover {
    color: #0056b3; /* Darker blue on hover */
}
    </style>
            <!-- Back button with Font Awesome icon -->
 <button type="button" class="back-btn" onclick="window.location.assign('dashboard1.aspx');">
    <i class="fas fa-arrow-left"></i> Back
</button>
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <h4>Set Schedule</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <img width="140px" src="../img/setschedule2.png" />
                            </div>
                        </div>

                        <hr />
                        <br />

                        <!-- Calendar Control Section -->

                        <div class="row">
                            <div class="col-md-12">
                                <div class="calendar-container"> 
                                    <asp:Calendar ID="Calendar1" runat="server" CssClass="aspNetCalendar"  OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender"></asp:Calendar>
                                </div>
                            </div>
                        </div>

                        <!-- Date TextBox -->
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <center>
                                <asp:TextBox ID="txtVacationDate" runat="server" placeholder="DD/MM/YYYY"></asp:TextBox>
                         </center>   </div>
                        </div>
                        <br />

                        <!-- Buttons Section -->
                        <div class="row">
                            <div class="col-6">
                               
                                <asp:Button CssClass="btn btn-lg btn-block btn-success" ID="Button2" runat="server" Text="Add Date" OnClick="Button2_Click" />
                          </div>

                              <div class="col-6">
     
      <asp:Button CssClass="btn btn-lg btn-block btn-danger" ID="Button1" runat="server" Text="Emergency Leave" OnClick="Button1_Click" />
</div>
                        </div>
                    </div> <!-- card-body -->
                </div> <!-- card -->

                <div class="text-center mt-3">
                    <a href="/Doctor/dashboard1.aspx">← Dashboard</a>
                </div>
            </div> <!-- col-md-5 -->

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <h4>Vacation date list</h4>
                            </div>
                        </div>

                        <hr />

                        <!-- GridView with DataTables -->
                        <div class="col">
                            <asp:GridView CssClass="table table-striped table-bordered text-center" 
                                ID="GridView1" runat="server" 
                                AutoGenerateColumns="False" 
                                DataKeyNames="id" 
                                OnRowCommand="GridView1_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="Vacation ID" 
                                        ReadOnly="True" SortExpression="id" 
                                        ItemStyle-HorizontalAlign="Center" 
                                        HeaderStyle-HorizontalAlign="Center" />

                                    <asp:BoundField DataField="non_availability_date" HeaderText="Date" 
                                        SortExpression="non_availability_date" 
                                        DataFormatString="{0:dd/MM/yyyy}" 
                                        HtmlEncode="False" ItemStyle-HorizontalAlign="Center" 
                                        HeaderStyle-HorizontalAlign="Center" />

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDelete" runat="server" CommandName="DeleteRecord" 
                                                CommandArgument='<%# Eval("id") %>' Text="Delete" CssClass="btn btn-danger" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div> <!-- card-body -->
                </div> <!-- card -->
            </div> <!-- col-md-7 -->
        </div> <!-- main row -->
    </div>
</asp:Content>
