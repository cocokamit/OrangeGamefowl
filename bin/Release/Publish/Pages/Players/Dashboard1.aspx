<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard1.aspx.cs" Inherits="SabongLive.Pages.Players.Dashboard1" %>
<%@ Import Namespace="System.Data" %>


<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <style>
        .x_panel {
            width: 100%;
            padding: 0 10px;
            display: inline-block;
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
    </style>
    
    </asp:Content>
<asp:Content ContentPlaceHolderID="content" runat="server" ID="content2">
    <section class="content-header">
         <h1>Profile
      </h1>
        <hr />
    <div class="page-title">
            <div class="row" style="margin-bottom:20px;">
        <div class="col-md-3" style="margin-bottom:50px;" >
          <!-- small box -->
          <div class="small-box " style="background-color:rgba(73,73,73,0.5);">
            <div class="inner" >
              <h3  id="totalcredits" runat="server">0</h3>
              <p class="pull-left">Credits</p>
                <hr />
            </div>
            <div>
               <input type="button" id="btnwith" class="btn btn-flat bg-green-gradient pull-right" value="Withdraw" data-toggle="modal" data-target="#modalForm"/>
               <input type="button" id="btndep" class="btn btn-flat bg-maroon-gradient pull-right" value="Deposit" data-toggle="modal" data-target="#modalForm2"/>
            </div>
          </div>
        </div>

        <div class="col-md-3">
         <div class="info-box " style="background-color:rgba(73,73,73,0.5);">
            <span class="info-box-icon"><i class="fa fa-check-circle"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Wins</span>
              <span class="info-box-number" id="totalwin" runat="server" >0</span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description">
                    Total
                  </span>
            </div>
          </div>
        </div>

                 <div class="col-md-3">
         
           <div class="info-box " style="background-color:rgba(73,73,73,0.5);">
            <span class="info-box-icon"><i class="fa fa-times-circle"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Lose</span>
              <span class="info-box-number" id="totallose" runat="server">0</span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description">
                   Total
                  </span>
            </div>
          </div>
        </div>

                 <div class="col-md-3">
   

           <div class="info-box " style="background-color:rgba(73,73,73,0.5);">
            <span class="info-box-icon"><i class="fa fa-minus-circle"></i></span>

            <div class="info-box-content">
              <span class="info-box-text"  >Draws</span>
              <span class="info-box-number" id="totaldraw" runat="server">0</span>

              <div class="progress">
                <div class="progress-bar" style="width: 100%"></div>
              </div>
                  <span class="progress-description">
                   Total
                  </span>
            </div>
          </div>
        </div>
   
      </div>
        <div class="row">
            <div class="col-md-12">

                        <div class="nav-tabs-custom" style="background-color: transparent;" >
                                <ul class="nav nav-tabs" style="background-color: white;">
                                  <li class="active"><a href="#tab_1" data-toggle="tab"> Statistics</a></li>
                                  <li><a href="#tab_2" data-toggle="tab">Transaction Logs</a></li>
                                  <li><a href="#tab_3" data-toggle="tab">System Request</a></li>
                                  <li><a href="#tab_4" data-toggle="tab">Change Personal Info</a></li>
                                 
                                </ul>
                                <div class="tab-content" style="background-color: rgba(73,73,73,0.5);">
                                  <div class="tab-pane active" id="tab_1" > 
                                      <h3>Personal Statistics<small>&nbsp; overview</small></h3>
                                      <hr />
                                      <div class="row">
                                          <div class="col-md-8"  >
                                                       <p class="lead">Amount</p>
                                                   <table class="table">
                                                        <thead>
                                                        <tr>
                                                          <th>Date</th>
                                                          <th>Fight No</th>
                                                          <th></th>
                                                          <th>Bet</th>
                                                          <th>Status</th>
                                                          <th>Gain</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                  <% DataTable dt = (DataTable)ViewState["BetHistory"]; %>
                                                  <% foreach (DataRow row in dt.Rows)
                                                      { %>
                                                        <tr>
                                                          <td><%=row["Sysdate"]%></td>
                                                          <td><%=row["Fightno"]%></td>
                                                          <td><%=row["Choicer"]%></td>
                                                          <td><%=row["Bet"]%></td>
                                                          <td><%=row["Status"]%></td>
                                                          <td><%=row["Gain"]%></td>
                                                        </tr>
                                                       <%} %>
                                                        </tbody>
                                                      </table>
                                                    </div>
                                          <div class="col-md-4">
                                               <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">WINRATE %</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-8">
                  <div class="chart-responsive">
                    <canvas id="pieChart" height="150"></canvas>
                  </div>
                  <!-- ./chart-responsive -->
                </div>
                <!-- /.col -->
                <div class="col-md-4">
                  <ul class="chart-legend clearfix" style="color:black;">
                    <li><i class="fa fa-circle-o text-red"></i> WIN</li>
                    <li><i class="fa fa-circle-o text-aqua"></i> LOSE</li>
                    <li><i class="fa fa-circle-o text-yellow"></i> DRAW</li>
                  </ul>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="#">Win
                  <span class="pull-right text-red" id="winwinrate"> 0%</span></a></li>
                <li><a href="#">Lose <span class="pull-right text-agua" id="losewinrate"> 0%</span></a>
                </li>
                <li><a href="#">Draw
                  <span class="pull-right text-yellow" id="drawwinrate"> 0%</span></a></li>
              </ul>
            </div>
            <!-- /.footer -->
          </div>
                                          </div>
                                          </div>
                                         
                                  
                                      </div>
                                    <div class="tab-pane" id="tab_2">
                                      <hr />
                                      <div class="row">
                                          <div class="col-md-8"  >
                                                       <p class="lead">Credit Transactions</p>
                                                   <table class="table">
                                                        <thead>
                                                        <tr>
                                                          <th>Credits</th>
                                                          <th>Date</th>
                                                          <th>Status</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                  <% DataTable dtt = (DataTable)ViewState["CreditHistory"]; %>
                                                  <% if (dtt.Rows.Count > 0)
                                                    {
                                                        foreach (DataRow row in dtt.Rows)
                                                        { %>
                                                        <tr>
                                                          <td><%=row["Credits"]%></td>
                                                          <td><%=row["SysDate"]%></td>
                                                          <td><%=row["Status"]%></td>
                                                        </tr>
                                                       <%}
                                                    } %>
                                                        </tbody>
                                                      </table>
                                                    </div>
                                          </div>
                                       

                                  </div>
                                  <div class="tab-pane" id="tab_3">


                                  </div>
                                  <div class="tab-pane" id="tab_4">
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

            </div>

        </div>


        
        <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content x_panel" >
                    <div class="modal-header text-center">
                        <button type="button" id="btnclose" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="color: black;">
                            <h4>WITHDRAWAL REQUEST</h4>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:10px;">
                        <div class="col-md-12" style="color: black;">
                            <label> Amount</label>
                            <input type="text" class="form-control" id="wamount" placeholder="0.00" onkeypress="return isNumberKey(event);">
                        </div>
                    </div>
                     <div class="row" style="margin-bottom:10px;">
                        <div class="col-md-12" style="color: black;">
                            <label> OUTLET</label>
                            <asp:DropDownList ID="ddlOutlet" CssClass="select2-dropdown form-control" runat="server" ClientIDMode="Static" onchange="getComboA(this)">
                                <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Coordinator" Value="Coordinator"></asp:ListItem>
                                <asp:ListItem Text="Bank" Value="Bank"></asp:ListItem>
                                <asp:ListItem Text="Coins.ph" Value="Coins.ph"></asp:ListItem>
                                <asp:ListItem Text="GCash" Value="GCash"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                     <div class="row" style="margin-bottom:10px; display:none;" id="idbankname">
                        <div class="col-md-12" style="color: black;">
                            
                            <label>Bank Name</label>
                             <asp:DropDownList ID="ddlBankname" CssClass="select2-dropdown form-control" runat="server" ClientIDMode="Static" >
                                <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="BPI" Value="BPI"></asp:ListItem>
                                <asp:ListItem Text="Metrobank" Value="Metrobank"></asp:ListItem>
                                <asp:ListItem Text="RCBC" Value="RCBC"></asp:ListItem>
                                <asp:ListItem Text="Landbank" Value="Landbank"></asp:ListItem>
                                <asp:ListItem Text="Unionbank" Value="Unionbank"></asp:ListItem>
                                <asp:ListItem Text="Security Bank" Value="Security Bank"></asp:ListItem>
                                <asp:ListItem Text="PNB" Value="PNB"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:10px; display:none;" id="idaccountname">
                        <div class="col-md-12" style="color: black;">
                            
                            <label>Account Name</label>
                            <input type="text" class="form-control" id="waccname" placeholder=" " runat="server">
                        </div>
                    </div>
                    <div class="row" style="margin-bottom:10px; display:none;" id="idaccountnumber">
                        <div class="col-md-12" style="color: black;">
                            
                            <label id="lbAccNum">Account Number</label>
                            <input type="text" class="form-control" id="waccnumber" placeholder=" " runat="server">
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-12" style="color: black;">
                            <label> We will send you an update through this number.</label>
                            <input type="text" class="form-control" id="wdnumber" placeholder="+639231234123" runat="server">
                        </div>
                    </div>
                  
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <input type="button" class="btn btn-danger pull-left" id="btnyes" value="Submit" onclick="myFunction()" />
                            <input type="button" class="btn btn-default pull-right" id="btnno" value="No"  data-dismiss="modal" />
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12" style="color: black;">
                            <h4>WITHDRAWAL HISTORY</h4>
                        </div>
                    </div>
                     <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="" style="padding-top:20px;"> 
		       
                                          <table id="example1" class="table table-condensed">
                                                    <thead>
                                                        <tr>
                                                          <th></th>

                                                        </tr>
                                                    </thead>
                                                  <tbody>
                                                  <% DataTable dtttt = (DataTable)ViewState["data"]; %>
                                                  <% foreach (DataRow row in dtttt.Rows) { %>
                                                  <tr>
                                                      <td>
                                                        <div class="row">
                                                            <div class="col-md-8">
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <%=row["Credits"] %>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <%=row["Outlet"] %>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <%=row["BankName"] %>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        
                                                                        <%=row["AccountNo"] %>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                
                                                                        <%=row["Status"] %>
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
                </div>
            </div>
        </div>


        <div class="modal fade" id="modalForm2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content x_panel" >
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
                     <div class="row" style="margin-bottom:10px;">
                        <div class="col-md-12" style="color: black;">
                            <label>Please contact these personnel/s :</label>
                              <table class="table">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>ContactNo</th>
                                    <th>Fb</th>
                                </tr>
                                </thead>
                                <tbody>
                            <% DataTable dttt = (DataTable)ViewState["Personnels"]; %>
                            <% if (dttt.Rows.Count > 0)
                            {
                                foreach (DataRow row in dttt.Rows)
                                { %>
                                <tr>
                                    <td><%=row["Firstname"]%></td>
                                    <td><%=row["ContactNo"]%></td>
                                    <td><a href='<%=row["Fb"]%> ' target="_blank">LINK</a></td>
                                    
                                </tr>
                                <%}
                            } %>
                                </tbody>
                                </table>
                        </div>
                    </div>
                     
                    <hr />
                </div>
            </div>
        </div>

</section>
</asp:Content>


<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">
<script src="../../vendors/chart.js/Chart.js"></script>    

    <script type="text/javascript">
        // -------------
        // - PIE CHART -
        // -------------
        // Get context with jQuery - using jQuery's .get() method.
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d');
        var pieChart = new Chart(pieChartCanvas);

        var win = <%= this.winrate%>;
        var lose = <%= this.loserate%>;
        var draw = <%= this.drawrate%>;
        var total = <%= this.total%>;

        var computewin = (parseFloat(win) / parseFloat(total))*100;
        var computewlose = (parseFloat(lose) / parseFloat(total)) * 100;
        var computewdraw = (parseFloat(draw) / parseFloat(total)) * 100;

        $('#winwinrate').html(computewin+"%");
        $('#losewinrate').html(computewlose + "%");
        $('#drawwinrate').html(computewdraw + "%");

        var PieData = [
            {
                value: computewin,
                color: '#00c0ef',
                highlight: '#00c0ef',
                label: 'Win'
            },
            {
                value: computewlose,
                color: '#00c0ef',
                highlight: '#00c0ef',
                label: 'Lose'
            },
            {
                value: computewdraw,
                color: '#d2d6de',
                highlight: '#d2d6de',
                label: 'Draw'
            }
        ];
        var pieOptions = {
            // Boolean - Whether we should show a stroke on each segment
            segmentShowStroke: true,
            // String - The colour of each segment stroke
            segmentStrokeColor: '#fff',
            // Number - The width of each segment stroke
            segmentStrokeWidth: 1,
            // Number - The percentage of the chart that we cut out of the middle
            percentageInnerCutout: 50, // This is 0 for Pie charts
            // Number - Amount of animation steps
            animationSteps: 20,
            // String - Animation easing effect
            animationEasing: 'easeOutBounce',
            // Boolean - Whether we animate the rotation of the Doughnut
            animateRotate: true,
            // Boolean - Whether we animate scaling the Doughnut from the centre
            animateScale: false,
            // Boolean - whether to make the chart responsive to window resizing
            responsive: true,
            // Boolean - whether to ma
        };
        // Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart.Doughnut(PieData, pieOptions);
  // -----------------
  // - END PIE CHART -
  // -----------------

        function Onsaving() {
            if (confirm("Are you sure you want to save changes?")==true) {
                var fname = $("[id$=inputfnamee]").val();
                var lname = $("[id$=inputlnamee]").val();
                var password =  $("[id$=inputpassword]").val();
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
                    url: "Pages/Players/Dashboard1.aspx/Onsavers",
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

        function getComboA(selectObject) {
            var value = selectObject.value;
            console.log(value);

            if (value == "Coordinator") {
                $("[id$=idbankname]").attr("style", "display:none");
                $("[id$=idaccountname]").attr("style", "display:none");
                $("[id$=idaccountnumber]").attr("style", "display:none");
            }
            else if (value == "Bank") {
                $("[id$=idbankname]").attr("style", "display:block");
                $("[id$=idaccountname]").attr("style", "display:block");
                $("[id$=idaccountnumber]").attr("style", "display:block");

                $("[id$=lbAccNum]").html("Account Number");
            }
            else if (value == "Coins.ph") {
                $("[id$=idbankname]").attr("style", "display:none");
                $("[id$=idaccountname]").attr("style", "display:none");
                $("[id$=idaccountnumber]").attr("style", "display:block");

                $("[id$=lbAccNum]").html("Coins.ph Number");
            }
            else if (value == "GCash") {
                $("[id$=idbankname]").attr("style", "display:none");
                $("[id$=idaccountname]").attr("style", "display:none");
                $("[id$=idaccountnumber]").attr("style", "display:block");

                $("[id$=lbAccNum]").html("GCash Number");
            }
        }

        function isNumberKey(evt) {
            console.log(evt);
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
                && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function myFunction() {
            var clientId = <%= this.UserName %>;
            var amount = $("[id$=wamount]").val();
            var outlets = $("#ddlOutlet option:selected").text();
            var banknames = $("#ddlBankname option:selected").text();
            var accountnos = $("[id$=waccname]").val();
            var accountnames = $("[id$=waccnumber]").val();
            var contactnos = $("[id$=wdnumber]").val();

            $.ajax({
                type: "POST",
                url: "Pages/Players/Dashboard1.aspx/OnCheckUser",
                data: JSON.stringify({ cID: clientId, credits: amount, outlet: outlets, bankname: banknames, accountno: accountnos, accountname: accountnames, contactno: contactnos }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {

                    if (result.d != "Data not valid.") {
                        var r = result.d.split("~");

                        var table = document.getElementById("example1");
                        var row = table.insertRow(1);
                        row.insertCell(0).innerHTML = '<div class="row">' +
                            '<div class="col-md-8">' +
                            '<div class="row">' +
                            ' <div class="col-md-12">' +
                            r[0].toString(); +
                                ' </div>' +
                                '</div>' +
                                ' <div class="row">' +
                                '<div class="col-md-12">' +
                                r[1].toString(); +
                                    '</div>' +
                                    '</div>' +
                                    '<div class="row">' +
                                    '<div class="col-md-12">' +
                                    r[2].toString(); +
                                        '</div>' +
                                        '</div>' +
                                        '<div class="row">' +
                                        '<div class="col-md-12">' +
                                        r[3].toString(); +
                                            ' </div>' +
                                            '</div>' +
                                            '</div>' +
                                            '<div class="col-md-4">' +
                            r[4].toString(); +
                                ' </div>' +
                                '</div>';
                                                }
                    else
                    {
                        alert(result.d);
                    }

                }, error: function (result) {
                    console.log(result.responseText);
                }
            });


        }
    </script>
</asp:Content>





 