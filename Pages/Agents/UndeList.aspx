<%@ Page Title="" Language="C#" MasterPageFile="~/AgentMaster.Master" AutoEventWireup="true" CodeBehind="UndeList.aspx.cs" Inherits="SabongLive.Pages.Agents.UndeList" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">

    
    <style>
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
    <script type="text/javascript">
        function CopyToClipboard(val) {
            var link = window.location.origin + "/Register?Refcode=" + val;
            console.log(link);
            $("[id$=txt_hfrecode]").val(link);
            var copyTextarea = $("[id$=txt_hfrecode]");
            copyTextarea.focus();
            copyTextarea.select();
            try {
                var successful = document.execCommand('copy');
                var msg = successful ? 'successful' : 'unsuccessful';
                console.log('Copying text command was ' + msg);
            } catch (err) {
                console.log('Oops, unable to copy');
            }
        }

    </script>

</asp:Content>

<asp:Content ContentPlaceHolderID="content" runat="server" ID="content2">
    <section class="content-header">
        <h1>Under Users 
      </h1>
        <hr />
        <div class="page-title">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">

                    <div class="nav-tabs-custom" style="background-color: transparent;">
                        <ul class="nav nav-tabs" style="background-color: white;">
                            <li class="active"><a href="#tab_1" data-toggle="tab">Add Client</a></li>
                            <li><a href="#tab_2" data-toggle="tab">Personal Profile</a></li>

                        </ul>
                        <div class="tab-content" style="background-color: rgba(73,73,73,0.5);">
                            <div class="tab-pane active" id="tab_1">
                                <hr />
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="" style="padding-top:20px;"> 
                                            <input type="button" id="btnadd" class="btn btn-default minimal" onclick="myFunction()" value="Add New" /> 
		       
                                          <table id="example1" class="table table-condensed">
                                                    <thead>
                                                        <tr>
                                                          <th>Id</th>
                                                          <th>Name</th>
                                                          <th>Phone Number</th>
                                                          <th>Status</th>
                                                          <th>RefCode</th>
                                                          <th></th>

                                                        </tr>
                                                    </thead>
                                                  <tbody>
                                                  <% DataTable dt = (DataTable)ViewState["data"]; %>
                                                  <% foreach (DataRow row in dt.Rows) { %>
                                                  <tr>
                                                      <td>
                                                      <%= row["Id"] %>
                                                      </td>
                                                      <td class="text-capitalize"><%=row["Name"]%></td>
                                                      <td><%=row["ContactNo"]%></td>
                                                      <td><%=row["Status"]%></td>
                                                      <td><%=row["RefCode"]%></td>
                                                      <td><input type="button" id="lnk_can" class="btn btn-default" onclick='CopyToClipboard("<%=row["RefCode"]%>")' value="Copy Link" /></td>
                                                  
                                                      </tr>
                                                  <% } %>
               
                                                    </tbody>
                                                  </table>
                                            </div>
                                     </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab_2">

                                <h3 style="margin-left:50px; margin-bottom:40px;"> Personal Info:</h3>
                                 <div class="form-horizontal">

                                  <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">First Name</label>

                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="inputfnamee" placeholder="First Name" runat="server">
                                    </div>
                                  </div>
                                    <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">Last Name</label>

                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="inputlnamee" placeholder="Last Name"  runat="server" >
                                    </div>
                                  </div>
                                     <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">Phone Number:</label>

                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="inputNumber" placeholder="+639231234123" runat="server">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">FaceBook Url:</label>

                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="inputfb" placeholder="" runat="server" value=" ">
                                    </div>
                                  </div>
                                     <hr />
                     
                                  <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">USERNAME</label>

                                    <div class="col-sm-10">
                                      <input type="text" class="form-control" id="inputusername" placeholder="Username" runat="server">
                                    </div>
                                  </div>
                     
                                  <div class="form-group">
                                    <label for="inputEmail" class="col-sm-2 control-label">PASSWORD</label>

                                    <div class="col-sm-10">
                                      <input type="password" class="form-control" id="inputpassword" placeholder="Password" runat="server">
                                    </div>
                                  </div>

                                  <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                      <button type="button" class="btn btn-danger" id="onsaver" onclick="Onsaving()" >Save</button>
                                    </div>
                                  </div>
                                </div>

                            </div>
                         
                        </div>

                    </div>
                </div>

            </div>Link: &nbsp;<input type="text" id="txt_hfrecode" class=".js-copytext"  value="" style="color:black;" readonly="readonly" />
                <asp:HiddenField ID="hfcid" ClientIDMode="Static" runat="server" Value="" />
        </div>

    </section>

    
  
</asp:Content>



<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">
    
<script src="../../vendors/datatables.net/js/jquery.dataTables.js"></script>
<script src="../../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script>
    $(function () {
        $('#example1').DataTable({
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            'paging': true,
            'lengthChange': false,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': false 
        })

        $('.fa-search').attr("style","display:none;");
    })
    function myFunction() {
        var usernem = $("[id$=hfcid]").val();

        $.ajax({
            type: "POST",
            url: "Pages/Agents/UndeList.aspx/OnCheckUser",
            data: JSON.stringify({ cID: usernem }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (result) {
                var r = result.d.split("~");

                var table = document.getElementById("example1");
                var row = table.insertRow(1);
                row.insertCell(0).innerHTML = r[0].toString();
                row.insertCell(1).innerHTML = "";
                row.insertCell(2).innerHTML = "";
                row.insertCell(3).innerHTML = "";
                row.insertCell(4).innerHTML = r[1].toString();
                row.insertCell(5).innerHTML = '<input type="button" id="lnk_can" class="btn btn-default" onclick="CopyToClipboard(' + r[1].toString() + ')" value="Copy Link" />';

            }, error: function (result) {
                console.log(result.responseText);
            }
        });

       
    }

    function Onsaving() {
        if (confirm("Are you sure you want to save changes?") == true) {
            var fname = $("[id$=inputfnamee]").val();
            var lname = $("[id$=inputlnamee]").val();
            var password = $("[id$=inputpassword]").val();
            var contactno = $("[id$=inputNumber]").val();
            var fb = $("[id$=inputfb]").val();
            var username = $("[id$=inputusername]").val();
            var clientId = <%= this.UserName %>;

                 console.log(fname);
                 console.log(lname);
                 console.log(password);
                 console.log(contactno);
                 console.log(fb);
                 console.log(username);
                 console.log(clientId);

                 $.ajax({
                     type: "POST",
                     url: "Pages/Agents/UndeList.aspx/Onsavers",
                     data: JSON.stringify({ clientid: clientId, fname: fname, lname: lname, username: username, password: password, contactno: contactno, fb: fb }),
                     contentType: 'application/json; charset=utf-8',
                     dataType: 'json',
                     success: function (result) {
                         $("[id$=wdnumber]").val(contactno);
                         alert("Data successfully saved.");
                     }, error: function (result) {
                         alert("Failed to savae data.");
                         console.log(result.responseText);
                     }
                 });

             }
         }

</script>
</asp:Content>

    


