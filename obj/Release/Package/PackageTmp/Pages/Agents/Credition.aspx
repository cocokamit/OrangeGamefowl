<%@ Page Title="" Language="C#" MasterPageFile="~/AgentMaster.Master" AutoEventWireup="true" CodeBehind="Credition.aspx.cs" Inherits="SabongLive.Pages.Agents.Credition" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .x_panel {
            width: 100%;
            padding: 0 10px;
            display: inline-block;
            color: black;
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

        .minimal {
            position: absolute;
            z-index: 5
        }

        .table {
            border-bottom: 2px solid #dddddd
        }

            .table thead tr th {
                line-height: 35px
            }

            .table tbody tr td {
                line-height: 40px
            }

        .page-title {
            margin-bottom: 39px
        }

        .dataTables_filter {
            width: 100% !important
        }

            .dataTables_filter input {
                border-color: #d2d6de !imortant;
                width: 300px !important;
                padding: 17px 10px !important;
                box-shadow: none !important;
            }

            .dataTables_filter i {
                margin-left: -25px;
                color: #d2d6de;
                margin-top: -25px;
                position: absolute
            }

        @-moz-document url-prefix() {
            .dataTables_filter i {
                margin-top: 11px !important
            }
        }

        .dataTables_paginate {
            margin-top: -20px
        }

            .dataTables_paginate a {
                background: #fff !important;
            }

            .dataTables_paginate .active a {
                padding: 6.5px 10px !important;
                background-color: #337ab7 !important;
                border-color: #337ab7;
                !important
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <section class="content-header">
        <h1>User Credits
        </h1>
        <hr />
        <div class="page-title">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">

                    <hr />
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="" style="padding-top: 20px;">

                                <table id="example1" class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Credits</th>
                                            <th>No. of Request</th>
                                            <th>Request</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% DataTable dt = (DataTable)ViewState["data"]; %>
                                        <% foreach (DataRow row in dt.Rows)
                                        { %>
                                        <tr>
                                            <td><%= row["Id"] %></td>
                                            <td class="text-capitalize"><%=row["Name"]%></td>
                                            <td><%=row["Credits"]%></td>
                                            <td><%=row["Norequest"]%>
                                            </td>

                                            <td>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <input type="button" id="btnrequest" class="btn btn-flat" style="color: black;" value="ADD" onclick="myFunction(<%=row["Id"]%>)" />
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <input type="button" id="btm" class="btn btn-flat" value="Request" style="visibility: hidden;" data-toggle="modal" data-target="#modalForm" />
                </div>

                <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document" style="width: 300px;">
                        <div class="modal-content x_panel">
                            <div class="modal-header text-center">
                                <button type="button" id="btnClose2" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="row">
                                <div class="col-md-12" style="color: black;">
                                    <h4>Add Credits</h4>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 10px;">
                                <div class="col-md-12" style="color: black;">
                                    <label>Amount</label>
                                    <input type="number" class="form-control" id="wamount" placeholder="0.00" onkeypress="return isNumberKey(event);">
                                </div>
                                <div class="col-md-12" style="color: black;">
                                    <hr />
                                    <input type="button" class="btn btn-danger pull-right" id="btnyes" value="SAVE" onclick="addingsave()" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <asp:HiddenField ID="hfcid" ClientIDMode="Static" runat="server" Value="" />
                <asp:HiddenField ID="hfrole" ClientIDMode="Static" runat="server" Value="" />
                <asp:HiddenField ID="HiddenField1" ClientIDMode="Static" runat="server" Value="" />

            </div>
        </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script type="text/javascript">
        function isNumberKey(evt) {
            console.log(evt);
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
                && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function myFunction(evs) {
            $("[id$=HiddenField1]").val(evs);
            console.log("adsadasda");
            $("[id$=btm]").click();
        }

        function addingsave() {
            var clientId = $("[id$=HiddenField1]").val();
            var agentId = $("[id$=hfcid]").val();
            var amount = $("[id$=wamount]").val();
            $.ajax({
                type: "POST",
                url: "Pages/Agents/Credition.aspx/Onsavers",
                data: JSON.stringify({ clientid: clientId, agent: agentId, amountcred: amount }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {
                    location.reload();
                }, error: function (result) {
                    alert("Failed to savae data.");
                    console.log(result.responseText);
                }
            });


        }
    </script>
</asp:Content>
