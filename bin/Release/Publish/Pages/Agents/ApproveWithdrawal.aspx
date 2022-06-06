<%@ Page Title="" Language="C#" MasterPageFile="~/AgentMaster.Master" AutoEventWireup="true" CodeBehind="ApproveWithdrawal.aspx.cs" Inherits="SabongLive.Pages.Agents.ApproveWithdrawal" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
            .x_panel {
            width: 100%;
            padding: 0 10px;
            display: inline-block;
            color:black;
            background: #fff;
            border: 1px solid #E6E9ED;
            border-top-color: rgb(230, 233, 237);
            border-top-style: solid;
            border-top-width: 1px;
            -webkit-column-break-inside: avoid;
            -moz-column-break-inside: avoid;
            column-break-inside: avoid;
            opacity: 1;
            transition: all .2s ease;


        }
         .minimal { position:absolute; z-index:5}
        .table {border-bottom:2px solid #dddddd}
        .table thead tr th { line-height:35px}
        .table tbody tr td { line-height:40px}
        .page-title {margin-bottom:39px}
        .dataTables_filter {width:100% !important}
        .dataTables_filter input {border-color:#d2d6de !imortant; width:300px !important; padding:17px 10px !important; box-shadow:none !important;}
        .dataTables_filter i {margin-left:-25px; color:#d2d6de; margin-top:-25px; position:absolute}
        @-moz-document url-prefix() {
                .dataTables_filter i { margin-top:11px !important}
            }
        .dataTables_paginate {margin-top:-20px}
        .dataTables_paginate a {background: #fff !important;}
        .dataTables_paginate .active a { padding:6.5px 10px !important; background-color: #337ab7 !important;border-color: #337ab7; !important}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
      <section class="content-header">
        <h1>Users' Withrawal 
      </h1>
        <hr />
        <div class="page-title">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">

                                <hr />
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="" style="padding-top:20px;"> 
		       
                                          <table id="example1" class="table table-condensed">
                                                    <thead>
                                                        <tr>
                                                          <th>Date</th>
                                                          <th>Name</th>
                                                          <th>Amount</th>
                                                          <th>Outlet</th>
                                                          <th>Bank Name</th>
                                                          <th>Account Number</th>
                                                          <th>Account Name</th>
                                                          <th>Contact Number </th>
                                                          <th>Status</th>

                                                        </tr>
                                                    </thead>
                                                  <tbody>
                                                  <% DataTable dt = (DataTable)ViewState["data"]; %>
                                                  <% foreach (DataRow row in dt.Rows) { %>
                                                  <tr>
                                                      <td><%= row["Sysdate"] %></td>
                                                      <td class="text-capitalize"><%=row["Name"]%></td>
                                                      <td><%=row["Credits"]%></td>
                                                      <td><%=row["BankName"]%></td>
                                                      <td><%=row["AccountNo"]%></td>
                                                      <td><%=row["AccountName"]%></td>
                                                      <td><%=row["ContactNo"]%></td>
                                                      <td><% if (row["Status"].ToString() == "Waiting")
                                                              { %> <label class="label label-default">Waiting</label>
                                                          <%}else if(row["Status"].ToString() == "For Approval"){ %> 
                                                                   <label class="label label-warning">For Approval</label> 
                                                          <%}else if(row["Status"].ToString() == "Declined"){%> 
                                                                   <label class="label label-danger">Declined</label>
                                                          <%}else if(row["Status"].ToString() == "Approved"){ %>
                                                                   <label class="label label-success">Approved</label><%} %> 
                                                      </td>
                                                  
                                                      <td>
                                                          <%if (row["Status"].ToString() != "Approved" )
                                                              { %>
                                                          <div class="row">
                                                          <div class="col-md-4">

                                                          </div>
                                                          <div class="col-md-4">
                                                              <a href="javascript:;" id="btnaccept~<%=row["Id"]%>" onclick="myJsFunc(this);" style="color:orangered"><i class="fa fa-check" ></i> </a>
                                                          </div>
                                                          <div class="col-md-4">
                                                              <a href="javascript:;" id="btndecline~<%=row["Id"]%>" onclick="myJsFunc(this);" style="color:orangered"><i class="fa fa-close" ></i> </a>
                                                          </div>
                                                          </div><%} %></td>
                                                  
                                                      </tr>
                                                  <% } %>
               
                                                    </tbody>
                                                  </table>
                                            </div>
                                     </div>
                                </div>
                      
                    </div>
                </div>
                          <asp:HiddenField ID="hfcid" ClientIDMode="Static" runat="server" Value="" />
                          <asp:HiddenField ID="hfrole" ClientIDMode="Static" runat="server" Value="" />
        </div>

    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function myJsFunc(evs) {
            var splitter = evs.id.split("~");
            if (splitter[0] == "btnaccept") {
                var status = "";
                if ($("[id$=hfrole]").val() == "3") {
                    status = "Approved";
                }
                else if ($("[id$=hfrole]").val() == "2") {
                   status = "For Approval";
                }
                var clientId = $("[id$=hfcid]").val();
                var apID = splitter[1];
                console.log(clientId);
                console.log(apID);
                console.log(status);

                if (confirm("Are you sure you want to accept this request?") == true) {
                    $.ajax({
                        type: "POST",
                        url: "Pages/Agents/ApproveWithdrawal.aspx/Onsavers",
                        data: JSON.stringify({ clientid: clientId, approveId: apID, status: status}),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (result) {
                            alert("Data successfully saved.");
                            window.location.reload(true); 
                        }, error: function (result) {
                            alert("Failed to save data.");
                            console.log(result.responseText);
                        }
                    });
                }
            }
            else if (splitter[0] == "btndecline") {
                var status = "Declined";
                if (confirm("Are you sure you want to decline this request?") == true) {
                    $.ajax({
                        type: "POST",
                        url: "Pages/Agents/ApproveWithdrawal.aspx/Onsavers",
                        data: JSON.stringify({ clientid: clientId, approveId: apID, status: status}),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (result) {
                            alert("Data successfully saved.");
                            window.location.reload(true); 
                        }, error: function (result) {
                            alert("Failed to save data.");
                            console.log(result.responseText);
                        }
                    });
                }
            }

        }
    </script>
</asp:Content>
