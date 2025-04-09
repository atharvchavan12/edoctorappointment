<%@ Page Title="" Language="C#" MasterPageFile="~/navfooter.Master" AutoEventWireup="true" CodeBehind="manageconsultancy.aspx.cs" Inherits="WebApplication1.Doctor.manageconsultancy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                               <style>
                                    
    .copy-icon {
        font-size: 16px;
        margin-left: 5px;
        cursor: pointer;
    }
    .copy-icon:hover {
        color: green;
    }


.container-fluid{
  
    margin-top:35px;
    }
 .back-btn {
     position: fixed;
     top: 85px;
     left: 20px;
     font-size: 20px;
     color: #007bff; /* Blue color for the icon */
     background-color: transparent;
     border: none;
     cursor: pointer;
 }

 .back-btn:hover {
     color: #0056b3; /* Darker blue on hover */
 }
                                   </style>
        <button type="button" class="back-btn" onclick="window.location.assign('doctorconsultancy.aspx');">
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
                                    <h4>Issued Consultancy List</h4>
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
                                        <asp:BoundField DataField="formatted_c_id" HeaderText="Patient ID" />
                                        <asp:BoundField DataField="c_patientname" HeaderText="Patient Name" />
                                        <asp:BoundField DataField="c_contact" HeaderText="Contact Number" />
                                        <asp:BoundField DataField="ap_date" HeaderText="Date" />
                                        <asp:BoundField DataField="ap_time" HeaderText="Time" />
                                        <asp:BoundField DataField="status" HeaderText="Status" />
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="Accept" CommandArgument='<%# Eval("formatted_c_id") %>' CssClass="btn btn-success btn-sm" />
                                                <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("formatted_c_id") %>' CssClass="btn btn-danger btn-sm" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          
   <asp:TemplateField HeaderText="Video Link">
    <ItemTemplate>
        <%# Eval("video_link") %>
        <i class="fa fa-copy copy-icon" 
           style="cursor: pointer; margin-left: 5px; color: #007bff;" 
           onclick="copyLinkContent('<%# Eval("video_link") %>')"></i>
    </ItemTemplate>
</asp:TemplateField>


                                        <asp:TemplateField HeaderText="Calling">
                                            <ItemTemplate>
                                                <asp:Button ID="btnStartVideoCall" runat="server" Text="Start Calling" CommandName="StartCall" CommandArgument='<%# Eval("formatted_c_id") %>' CssClass="btn btn-primary btn-sm" OnCommand="btnStartVideoCall_Command" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div> <!-- card-body -->
                </div> <!-- card -->
            </div>
        </div>
    </div>
  <script>
      function copyLinkContent(fullLink) {
          // Extract the part of the link after the third "/"
          const extractedContent = fullLink.split('/').slice(3).join('/');
          navigator.clipboard.writeText(extractedContent).then(function () {
              alert("Copied: " + extractedContent);
          }, function (err) {
              alert("Failed to copy: " + err);
          });
      }
  </script>


</asp:Content>
