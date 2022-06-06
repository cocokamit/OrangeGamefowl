<%@ Page Title="" Language="C#" MasterPageFile="~/site1.Master" AutoEventWireup="true" CodeBehind="Dashboard2.aspx.cs" Inherits="SabongLive.Pages.Admin.Dashboard2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <section class="content-header">
        <h1>DASHBOARD
      </h1>
        <hr />
        <div class="page-title">
                <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon label-primary"><i class="fa fa-twitter"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Head Count</span>
              <asp:Label ID="l_hcount" runat="server" CssClass="info-box-number"></asp:Label>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-balance-scale"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Total Events</span>
              <asp:Label ID="l_battle" runat="server" CssClass="info-box-number" Text="0"></asp:Label>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-comment-o"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Forum</span>
              <asp:Label ID="l_cock" runat="server" CssClass="info-box-number"></asp:Label>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-orange"><i class="fa fa-group "></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Population</span>
              <asp:Label ID="l_hen" runat="server" CssClass="info-box-number"></asp:Label>
            </div>
          </div>
        </div>
       </div>
                  <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Curent Event Recap Report</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-wrench"></i></button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-8">
                  <p class="text-center">
                    <strong>RED - Blue Sales Realtime Statistic</strong>
                  </p>

                  <div class="chart">
                    <!-- Sales Chart Canvas -->
                    <canvas id="salesChart" style="height: 180px;"></canvas>
                  </div>
                  <!-- /.chart-responsive -->
                </div>
                <!-- /.col -->
                <div class="col-md-4">
                  <p class="text-center">
                    <strong><span id="lbtitle"></span></strong>
                  </p>

                  <div class="progress-group">
                    <span class="progress-text">STATUS</span>
                    <div>
                        <label class="label label-default" id="lbstatus1">OFFLINE</label>
                    </div>
                    <div class="progress progress-sm progress-striped active" id="lbstatus2">
                      <div class="progress-bar progress-bar-red" style="width: 100%"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                  <div class="progress-group">
                    <span class="progress-text">Total Deposits</span>
                    <span class="progress-number"><b id="lbtdepostion"></b></span>

                    <div class="progress xs">
                      <div class="progress-bar progress-bar-aqua" style="width: 100%"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                  <div class="progress-group">
                    <span class="progress-text">Total Withdraw</span>
                    <span class="progress-number"><b id="lbtwithdraw"></b></span>

                    <div class="progress xs">
                      <div class="progress-bar progress-bar-green" style="width: 100%"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                  <div class="progress-group">
                    <span class="progress-text">Total Fights</span>
                    <span class="progress-number"><b id="lbfnumber"></b>/<span id="lbftotalnumber"></span></span>

                    <div class="progress sm">
                      <div class="progress-bar progress-bar-yellow" id="usercountper" style="width: 80%"></div>
                    </div>
                  </div>
                  <!-- /.progress-group -->
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- ./box-body -->
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <span id="span1" class="description-percentage text-green"><i id="icon1" class="fa fa-caret-up"></i> <span id="lbsaleper1">0</span>%</span>
                    <h5 class="description-header">₱<span id="lbtsales"></span></h5>
                    <span class="description-text">TOTAL SALES</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <span id="span2" class="description-percentage text-yellow"><i id="icon2" class="fa fa-caret-left"></i><span id="lbsaleper2">0</span>%</span>
                    <h5 class="description-header">₱<span id="lbtsalesred"></span></h5>
                    <span class="description-text">TOTAL RED</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <span id="span3" class="description-percentage text-green"><i id="icon3" class="fa fa-caret-up"></i> <span id="lbsaleper3">0</span>%</span>
                    <h5 class="description-header">₱<span id="lbtsalesblue"></span></h5>
                    <span class="description-text">TOTAL BLUE</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block">
                    <span id="span4" class="description-percentage text-red"><i id="icon4" class="fa fa-caret-down"></i> <span id="lbsaleper4">0</span>%</span>
                    <h5 class="description-header"><span id="lbonlineuser"></span></h5>
                    <span class="description-text">Online Users</span>
                  </div>
                  <!-- /.description-block -->
                </div>
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>

            <div class="row">
                <div class="col-md-6">
                  
                      <!-- BAR CHART -->
                      <div class="box box-success">
                        <div class="box-header with-border">
                          <h3 class="box-title">Monthly Sales-Revenue Recap Report <hr /><asp:DropDownList ID="ddlyear" runat="server" ClientIDMode="Static" onchange="barchartupdate(0)" CssClass="form-control" ></asp:DropDownList></h3>

                          <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                          </div>
                        </div>
                        <div class="box-body">
                          <div class="chart" id="barcharthtml">
                            <canvas id="barChart" style="height:230px"></canvas>
                          </div>
                        </div>
                        <!-- /.box-body -->
                      </div>
                      <!-- /.box -->
                </div>
            </div>
        </div>


    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="../../Scripts/jquery.signalR-2.2.2.min.js"></script>
    <script src="../../Scripts/date.format.js"></script>
    <!--Reference the autogenerated SignalR hub script. -->
    <script src="signalr/hubs"></script>

    <script type="text/javascript">

        var IntervalVal;
        $(function () {

            // Declare a proxy to reference the hub.
            var chatHub = $.connection.chatHub;
            registerClientMethods(chatHub);
            // Start Hub
            $.connection.hub.start().done(function () {

                registerEvents(chatHub)

            });

        });


        function registerEvents(chatHub) {

            var name = '<%= this.UserName %>';
            var role = '<%= this.UserName %>';

            if (name.length > 0) {
                chatHub.server.connect(name,role);

            }
        }


 

        function format_currency(v, number_of_decimals, decimal_separator, currency_sign) {
            return (isNaN(v) ? v : currency_sign + parseInt(v || 0).toLocaleString() + decimal_separator + (v * 1).toFixed(number_of_decimals).slice(-number_of_decimals));
        }

        // -----------------------
        // - MONTHLY SALES CHART -
        // -----------------------
        console.log(format_currency(1122332.2322, 2, '.','₱'));
        // Get context with jQuery - using jQuery's .get() method.
        var salesChartCanvas = $('#salesChart').get(0).getContext('2d');
        // This will get the first returned node in the jQuery collection.
        var salesChart = new Chart(salesChartCanvas);

  
        function registerClientMethods(chatHub) {
            chatHub.client.onConnected = function (id, userName, Announce, messages, GoLive, director) {
                charter(userName);
                barchartupdate(userName); 

            }
        }



        function charter(username) {

            var sales1=$("[id$=lbsaleper1]").html();
            var sales2 =$("[id$=lbsaleper2]").html();
            var sales3 =$("[id$=lbsaleper3]").html();
            var sales4 = $("[id$=lbsaleper4]").html();

            console.log(sales1);
            console.log(sales2);
            console.log(sales3);
            console.log(sales4);

            $.ajax({
                type: "POST",
                url: "Pages/Admin/Dashboard2.aspx/OnGetStats",
                data: JSON.stringify({ id: username, startvalue: sales4, starttsale: sales1, startred: sales2, startblue: sales3 }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {
                    console.log('Success');
                    var splitter = result.d.toString().split('~');

                    if (splitter.length > 0) {
                        console.log(splitter[1]);
                        console.log(splitter[2]);
                        console.log(splitter[3]);
                        console.log(splitter[4]);
                        console.log(splitter[5]);
                        console.log(splitter[6]);
                        console.log(splitter[7]);
                        console.log(splitter[8]);
                        console.log(splitter[9]);

                        $("[id$=lbtitle]").html(splitter[0]);
                        if (splitter[1] == "on") {
                            $("[id$=lbstatus2]").attr("style", "display:block");
                            $("[id$=lbstatus1]").attr("style", "display:none");
                        }
                        else {
                            $("[id$=lbstatus2]").attr("style", "display:none");
                            $("[id$=lbstatus1]").attr("style", "display:block");
                        }

                        $("[id$=lbfnumber]").html(splitter[2]);
                        $("[id$=lbftotalnumber]").html(splitter[3]);
                        $("[id$=lbtsales]").html(splitter[4]);
                        $("[id$=lbtsalesred]").html(splitter[5]);
                        $("[id$=lbtsalesblue]").html(splitter[6]);
                        $("[id$=lbonlineuser]").html(splitter[7]);

                        var chartter1 = splitter[8].split(",");
                        var chartter2 = splitter[9].split(",");

                        if (parseInt($("[id$=lbsaleper1]").html()) > parseInt(splitter[11])) {
                            $("[id$=span1]").attr("class", "description-percentage text-red");
                            $("[id$=icon1]").attr("class", "fa fa-caret-down");
                        }
                        else if (parseInt($("[id$=lbsaleper1]").html()) < parseInt(splitter[11])) {
                            $("[id$=span1]").attr("class", "description-percentage text-green");
                            $("[id$=icon1]").attr("class", "fa fa-caret-up");
                        }
                        else if (parseInt($("[id$=lbsaleper1]").html()) == parseInt(splitter[11])) {
                            $("[id$=span1]").attr("class", "description-percentage text-yellow ");
                            $("[id$=icon1]").attr("class", "fa fa-caret-left");
                        }

                        if (parseInt($("[id$=lbsaleper2]").html()) > parseInt(splitter[12])) {
                            $("[id$=span2]").attr("class", "description-percentage text-red");
                            $("[id$=icon2]").attr("class", "fa fa-caret-down");
                        }
                        else if (parseInt($("[id$=lbsaleper2]").html()) < parseInt(splitter[12])) {
                            $("[id$=span2]").attr("class", "description-percentage text-green");
                            $("[id$=icon2]").attr("class", "fa fa-caret-up");
                        }
                        else if (parseInt($("[id$=lbsaleper2]").html()) == parseInt(splitter[12])) {
                            $("[id$=span2]").attr("class", "description-percentage text-yellow ");
                            $("[id$=icon2]").attr("class", "fa fa-caret-left");
                        }

                        if (parseInt($("[id$=lbsaleper3]").html()) > parseInt(splitter[13])) {
                            $("[id$=span3]").attr("class", "description-percentage text-red");
                            $("[id$=icon3]").attr("class", "fa fa-caret-down");
                        }
                        else if (parseInt($("[id$=lbsaleper3]").html()) < parseInt(splitter[13])) {
                            $("[id$=span3]").attr("class", "description-percentage text-green");
                            $("[id$=icon3]").attr("class", "fa fa-caret-up");
                        }
                        else if (parseInt($("[id$=lbsaleper3]").html()) == parseInt(splitter[13])) {
                            $("[id$=span3]").attr("class", "description-percentage text-yellow ");
                            $("[id$=icon3]").attr("class", "fa fa-caret-left");
                        }

                        if (parseInt($("[id$=lbsaleper4]").html()) > parseInt(splitter[10])) {
                            $("[id$=span4]").attr("class", "description-percentage text-red");
                            $("[id$=icon4]").attr("class", "fa fa-caret-down");
                        }
                        else if (parseInt($("[id$=lbsaleper4]").html()) < parseInt(splitter[10])) {
                            $("[id$=span4]").attr("class", "description-percentage text-green");
                            $("[id$=icon4]").attr("class", "fa fa-caret-up");
                        }
                        else if (parseInt($("[id$=lbsaleper4]").html()) == parseInt(splitter[10])) {
                            $("[id$=span4]").attr("class", "description-percentage text-yellow ");
                            $("[id$=icon4]").attr("class", "fa fa-caret-left");
                        }

                        $("[id$=lbsaleper1]").html(splitter[11]);
                        $("[id$=lbsaleper2]").html(splitter[12]);
                        $("[id$=lbsaleper3]").html(splitter[13]);
                        $("[id$=lbsaleper4]").html(splitter[10]);

                        var counter = parseInt(splitter[2]);
                        var labelarray = [];
                        for (var i = 0; i < counter; i++) {
                            labelarray[i] = i + 1;
                        }

                        var countpercent = (parseInt(splitter[2]) / parseInt(splitter[3])) * 100;
                        $("[id$=usercountper]").attr("style", "width:" + countpercent + "%");

                        var salesChartData = {
                            labels: labelarray,
                            datasets: [
                                {
                                    label: 'Electronics',
                                    fillColor: 'rgb(210, 214, 222)',
                                    strokeColor: 'rgb(210, 214, 222)',
                                    pointColor: 'rgb(210, 214, 222)',
                                    pointStrokeColor: '#c1c7d1',
                                    pointHighlightFill: '#fff',
                                    pointHighlightStroke: 'rgb(220,220,220)',
                                    data: chartter1
                                },
                                {
                                    label: 'Digital Goods',
                                    fillColor: 'rgba(60,141,188,0.9)',
                                    strokeColor: 'rgba(60,141,188,0.8)',
                                    pointColor: '#3b8bba',
                                    pointStrokeColor: 'rgba(60,141,188,1)',
                                    pointHighlightFill: '#fff',
                                    pointHighlightStroke: 'rgba(60,141,188,1)',
                                    data: chartter2
                                }

                            ]
                        };

                        var salesChartOptions = {
                            // Boolean - If we should show the scale at all
                            showScale: true,
                            // Boolean - Whether grid lines are shown across the chart
                            scaleShowGridLines: false,
                            // String - Colour of the grid lines
                            scaleGridLineColor: 'rgba(0,0,0,.05)',
                            // Number - Width of the grid lines
                            scaleGridLineWidth: 1,
                            // Boolean - Whether to show horizontal lines (except X axis)
                            scaleShowHorizontalLines: true,
                            // Boolean - Whether to show vertical lines (except Y axis)
                            scaleShowVerticalLines: true,
                            // Boolean - Whether the line is curved between points
                            bezierCurve: true,
                            // Number - Tension of the bezier curve between points
                            bezierCurveTension: 0.3,
                            // Boolean - Whether to show a dot for each point
                            pointDot: false,
                            // Number - Radius of each point dot in pixels
                            pointDotRadius: 4,
                            // Number - Pixel width of point dot stroke
                            pointDotStrokeWidth: 1,
                            // Number - amount extra to add to the radius to cater for hit detection outside the drawn point
                            pointHitDetectionRadius: 20,
                            // Boolean - Whether to show a stroke for datasets
                            datasetStroke: true,
                            // Number - Pixel width of dataset stroke
                            datasetStrokeWidth: 2,
                            // Boolean - Whether to fill the dataset with a color
                            datasetFill: true,
                            // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                            maintainAspectRatio: true,
                            // Boolean - whether to make the chart responsive to window resizing
                            responsive: true
                        };

                        // Create the line chart
                        salesChart.Line(salesChartData, salesChartOptions);

                     

                    }
                }, error: function (result) {
                    console.log(result.responseText);
                }
            });
        }


  // ---------------------------
  // - END MONTHLY SALES CHART -
  // ---------------------------


        function barchartupdate(username) {

            var VarName = $('[id$=ddlyear]').val();

            $.ajax({
                type: "POST",
                url: "Pages/Admin/Dashboard2.aspx/OnGetMonthlyStats",
                data: JSON.stringify({ id: username, year: VarName}),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {
                    console.log('Success');
                    var splitter = result.d.toString().split('-');

                    if (splitter[0] != "0" && splitter[2] != "0") {


                        var d1 = splitter[0].split("~");
                        var d2 = splitter[1].split("~");

                        var areaChartData = {
                            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                            datasets: [
                                {
                                    label: 'Sales',
                                    fillColor: 'rgba(210, 214, 222, 1)',
                                    strokeColor: 'rgba(210, 214, 222, 1)',
                                    pointColor: 'rgba(210, 214, 222, 1)',
                                    pointStrokeColor: '#c1c7d1',
                                    pointHighlightFill: '#fff',
                                    pointHighlightStroke: 'rgba(220,220,220,1)',
                                    data: d1
                                },
                                {
                                    label: 'Revenue',
                                    fillColor: 'rgba(60,141,188,0.9)',
                                    strokeColor: 'rgba(60,141,188,0.8)',
                                    pointColor: '#3b8bba',
                                    pointStrokeColor: 'rgba(60,141,188,1)',
                                    pointHighlightFill: '#fff',
                                    pointHighlightStroke: 'rgba(60,141,188,1)',
                                    data: d2
                                }
                            ]
                        }

                        $("[id$=barcharthtml]").html('<canvas id="barChart" style="height:230px"></canvas>');
                        //-------------
                        //- BAR CHART -
                        //-------------
                        var barChartCanvas = $('#barChart').get(0).getContext('2d');
                        var barChart = new Chart(barChartCanvas);
                        var barChartData = areaChartData;
                        barChartData.datasets[1].fillColor = '#00a65a';
                        barChartData.datasets[1].strokeColor = '#00a65a';
                        barChartData.datasets[1].pointColor = '#00a65a';
                        var barChartOptions = {
                            //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
                            scaleBeginAtZero: true,
                            //Boolean - Whether grid lines are shown across the chart
                            scaleShowGridLines: true,
                            //String - Colour of the grid lines
                            scaleGridLineColor: 'rgba(0,0,0,.05)',
                            //Number - Width of the grid lines
                            scaleGridLineWidth: 1,
                            //Boolean - Whether to show horizontal lines (except X axis)
                            scaleShowHorizontalLines: true,
                            //Boolean - Whether to show vertical lines (except Y axis)
                            scaleShowVerticalLines: true,
                            //Boolean - If there is a stroke on each bar
                            barShowStroke: true,
                            //Number - Pixel width of the bar stroke
                            barStrokeWidth: 2,
                            //Number - Spacing between each of the X value sets
                            barValueSpacing: 5,
                            //Number - Spacing between data sets within X values
                            barDatasetSpacing: 1,
                            //Boolean - whether to make the chart responsive
                            responsive: true,
                            maintainAspectRatio: true
                        };

                        barChartOptions.datasetFill = false;
                        barChart.Bar(barChartData, barChartOptions);
                    }

                }, error: function (result) {
                    console.log(result.responseText);
                }
            });
        }
    </script>
</asp:Content>
