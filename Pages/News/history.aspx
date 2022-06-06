<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="SabongLive.Pages.News.history" %>

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

        #divred {
            background: transparent;
            cursor: pointer;
        }

            #divred:hover, #divred:focus, #divred:focus-within {
                background: rgba(255,255,255, 0.5);
            }



        #divblue {
            background: transparent;
            cursor: pointer;
        }

            #divblue:hover, #divblue:focus, #divblue:focus-within {
                background: rgba(255,255,255, 0.5);
            }

        .marquee {
            height: 50px;
            overflow: hidden;
            position: relative;
            background: #dd4b39;
            color: #333;
        }

            .marquee p {
                position: absolute;
                width: 100%;
                height: 100%;
                margin: 0;
                line-height: 50px;
                text-align: center;
                -moz-transform: translateX(100%);
                -webkit-transform: translateX(100%);
                transform: translateX(100%);
                -moz-animation: scroll-left 2s linear infinite;
                -webkit-animation: scroll-left 2s linear infinite;
                animation: scroll-left 10s linear infinite;
            }

        @-moz-keyframes scroll-left {
            0% {
                -moz-transform: translateX(100%);
            }

            100% {
                -moz-transform: translateX(-100%);
            }
        }

        @-webkit-keyframes scroll-left {
            0% {
                -webkit-transform: translateX(100%);
            }

            100% {
                -webkit-transform: translateX(-100%);
            }
        }

        @keyframes scroll-left {
            0% {
                -moz-transform: translateX(100%);
                -webkit-transform: translateX(100%);
                transform: translateX(100%);
            }

            100% {
                -moz-transform: translateX(-100%);
                -webkit-transform: translateX(-100%);
                transform: translateX(-100%);
            }
        }

        .rowclass {
            margin-bottom: 20px;
        }

        #trapezoid {
            border-bottom: 50px solid red;
            border-right: 25px solid transparent;
            width: 100%;
            top: 0px;
            left: -20px;
            position: absolute;
            z-index: -1;
        }

        #trapezoid2 {
            border-bottom: 50px solid blue;
            border-right: 25px solid transparent;
            width: 90%;
            top: 0px;
            position: absolute;
            z-index: -1;
        }


        .card {
            box-shadow: 0 0 1px rgba(0,0,0,.125),0 1px 3px rgba(0,0,0,.2);
            margin-bottom: 1rem;
        }

        .card {
            padding: 20px;
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0,0,0,.125);
            border-radius: .25rem;
        }

        .p-0 {
            padding: 0 !important;
        }

        .card-body {
            -ms-flex: 1 1 auto;
            flex: 1 1 auto;
            padding: 1.25rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <hr />
    <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-4 m-0"></div>
        <div class="col-xs-4 col-sm-4 col-md-4 m-0">
            <div class="row">
                <div class="col-xs-8 col-sm-8 col-md-8 m-0">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 m-0">
                            <input type="text" class="form-control" style="text-align: center;" id="txtfightno" placeholder="Enter FIGHT number">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 m-0">
                            <input type="text" class="form-control" style="text-align: center;" id="txtbetno" placeholder="Enter BET number">
                        </div>
                    </div>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 m-0">
                    <input type="button" id="btngo" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); margin-top: 10px; color: white;" value="GO" />
                </div>
            </div>

        </div>

        <div class="col-xs-4 col-sm-4 col-md-4 m-0"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6 m-0" style="background: transparent; text-align: center;">
            <div class="inner">

                <div class="row">

                    <div class="col-md-6" style="text-align: left;">

                        <h1 style="color: white; margin-top: 0px;">MERON</h1>
                        <div id="trapezoid">
                        </div>

                    </div>
                    <div class="col-md-6" style="text-align: left; color: white;">
                        <h3 id="lblmerontotalbet" style="margin-top: 0px;">0</h3>
                        <h4 id="lblmerontotalpayout">0</h4>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">

                        <div class=" card">
                            <div class=" card-body p-0">

                                <div class="row">
                                    <div class="col-md-12" style="overflow-x: scroll;">
                                        <table id="tablemeron" class="table table-striped" style="text-align: left;">
                                            <thead>
                                                <tr>
                                                    <th>AMOUNT</th>
                                                    <th>WINNING AMT.</th>
                                                    <th></th>
                                                    <th>STATUS</th>
                                                    <th>AGENT</th>
                                                    <th>PRINT</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6 m-0" style="background: transparent; text-align: center;">
            <div class="inner">

                <div class="row">
                    <div class="col-md-6" style="text-align: left;">
                        <div id="trapezoid2">
                        </div>
                        <h1 style="color: white; z-index: 1; padding-left: 20px; margin-top: 0px;">WALA</h1>

                    </div>
                    <div class="col-md-6" style="text-align: left; color: white;">
                        <h3 id="lblwalatotalbet" style="margin-top: 0px;">0</h3>
                        <h4 id="lblwalatotalpayout">0</h4>
                    </div>

                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">

                        <div class=" card">
                            <div class=" card-body p-0">

                                <div class="row">
                                    <div class="col-md-12" style="overflow-x: scroll;">
                                        <table id="tablewala" class="table table-striped" style="text-align: left;">
                                            <thead>
                                                <tr>
                                                    <th>AMOUNT</th>
                                                    <th>WINNING AMT.</th>
                                                    <th></th>
                                                    <th>STATUS</th>
                                                    <th>AGENT</th>
                                                    <th>PRINT</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<div class="modal fade" id="modal-sm">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-body">
                <h4>Enter lacking amount</h4>
                <input type="text" id="txtgetlackingamount" class="form-control" value="0" />
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" id="modalcloser" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" onclick="onclaimedamount()">CONFIRM</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
    <input type="hidden" id="hffightid" value="0"/>
    <input type="hidden" id="hfbtnid" value="0"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script src="../../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../../Scripts/jquery.signalR-2.2.2.min.js"></script>
    <script src="../../Scripts/date.format.js"></script>

    <script>
        $('#btngo').click(function () {
            var dal = document.getElementById('tablemeron');
            var valss = $("#txtfightno").val();
            var valsx = $("#txtbetno").val();
            console.log(valss);
            $.ajax({
                type: "POST",
                url: 'Pages/News/history.aspx/ongettable',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: valss }),
                dataType: "json",
                success: function (data) {
                    if (data != "") {
                        console.log(data);
                        var tbodyRef = dal.getElementsByTagName('tbody')[0];
                        tbodyRef.innerHTML = "";
                        if (data != "") {

                            var split1 = data.d.split("~");

                            for (var i = split1.length; i >= 1; i--) {

                                tr = tbodyRef.insertRow(-1);
                                var split2 = split1[i - 1].split("-");
                                var tabCell = tr.insertCell(-1);
                                if (split2[0] != "") {
                                    tabCell.innerHTML = "" + (i) + ".)&nbsp;" + Comma(split2[0]) + "";

                                    tabCell = tr.insertCell(-1);
                                    if (split2[4].trim() == "DRAW") {

                                        tabCell.innerHTML = "" + Comma(split2[0]) + "";

                                    }
                                    else {

                                        tabCell.innerHTML = "" + Comma(split2[1]) + "";

                                    }

                                    tabCell = tr.insertCell(-1);
                                    if (split2[4].trim() != "") {
                                        if (split2[5].trim() == "") {
                                            tabCell.innerHTML = "<input type='button' id='btnclaim" + split2[2] + "' value='CLAIM' data-toggle='modal' data-target='#modal-sm' onclick='getid(" + split2[2] + ",this)' class='btn btn-success'>";
                                        }
                                        else if (split2[5].trim() == "Claimed" && (split2[6].trim() == "" || split2[6].trim() == "0")) {
                                            tabCell.innerHTML = "<label style='color:green'>CLAIMED</label>";
                                        }
                                        else if (split2[5].trim() == "Claimed" && split2[6].trim() != "") {
                                            tabCell.innerHTML = "<label style='color:red'>" + split2[6].trim() + "</label> <br/> <input type='button' value='COMPLETE' onclick='onclaimcomplete(" + split2[2] + ",this)' class='btn btn-primary'>";
                                        }
                                    }

                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "" + split2[4] + "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "" + split2[3] + "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "<a href='printslip?&payid=" + split2[2] + "&fno=" + i + "' target='_new'><i class='fa fa-print'></i> </a>";


                                    if ((split2[4].trim() == "WIN" || split2[4].trim() == "DRAW" || split2[4].trim() == "CANCEL") && i == valsx) {

                                        $(tr).attr("style", "background:#e88a7e;");
                                    }
                                }
                                else {
                                    tabCell.innerHTML = "" + (i) + ".)";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                }

                            }
                        }
                    }
                },
                error: function (result) {
                    alert(result.responseText);
                }
            });

            var dal1 = document.getElementById('tablewala');
            $.ajax({
                type: "POST",
                url: 'Pages/News/history.aspx/ongettablewala',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: valss }),
                dataType: "json",
                success: function (data) {
                    if (data != "") {
                        console.log(data);
                        var tbodyRef = dal1.getElementsByTagName('tbody')[0];
                        tbodyRef.innerHTML = "";
                        if (data != "") {

                            var split1 = data.d.split("~");

                            for (var i = split1.length; i >= 1; i--) {

                                tr = tbodyRef.insertRow(-1);
                                var split2 = split1[i - 1].split("-");
                                var tabCell = tr.insertCell(-1);
                                if (split2[0] != "") {
                                    tabCell.innerHTML = "" + (i) + ".)&nbsp;" + Comma(split2[0]) + "";

                                    tabCell = tr.insertCell(-1);
                                    if (split2[4].trim() == "DRAW") {
                                        tabCell.innerHTML = "" + Comma(split2[0]) + "";
                                    }
                                    else {
                                        tabCell.innerHTML = "" + Comma(split2[1]) + "";
                                    }

                                    tabCell = tr.insertCell(-1);
                                    if (split2[4].trim() != "") {

                                        if (split2[5].trim() == "") {
                                            tabCell.innerHTML = "<input type='button' id='btnclaim" + split2[2] + "' value='CLAIM' data-toggle='modal' data-target='#modal-sm' onclick='getid(" + split2[2] + ",this)' class='btn btn-success'>";
                                        }
                                        else if (split2[5].trim() == "Claimed" && (split2[6].trim() == "" || split2[6].trim() == "0")) {
                                            tabCell.innerHTML = "<label style='color:green'>CLAIMED</label>";
                                        }
                                        else if (split2[5].trim() == "Claimed" && split2[6].trim() != "") {

                                            tabCell.innerHTML = "<label style='color:red'>" + split2[6].trim() + "</label> <br/> <input type='button' value='COMPLETE' onclick='onclaimcomplete(" + split2[2] + ",this)' class='btn btn-primary'>";

                                        }
                                    }

                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "" + split2[4] + "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "" + split2[3] + "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "<a href='printslip?&payid=" + split2[2] + "&fno=" + i + "' target='_new'><i class='fa fa-print'></i> </a>";


                                    if ((split2[4].trim() == "WIN" || split2[4].trim() == "DRAW" || split2[4].trim() == "CANCEL") && i == valsx) {

                                        $(tr).attr("style", "background:#e88a7e;");
                                    }
                                }
                                else {
                                    tabCell.innerHTML = "" + (i) + ".)";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                }


                            }
                        }
                    }
                },
                error: function (result) {
                    alert(result.responseText);
                }
            });
            $.ajax({
                type: "POST",
                url: 'Pages/News/history.aspx/ongetmatchdata',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: valss }),
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        console.log(data);
                        var split1 = data.d.split("-");
                        if (split1[0] != "") {
                            $('#lblmerontotalbet').html(Comma(split1[0]));
                            $('#lblwalatotalbet').html(Comma(split1[1]));
                            $('#lblmerontotalpayout').html(parseInt(split1[2]) + "%");
                            $('#lblwalatotalpayout').html(parseInt(split1[3]) + "%");
                        }
                    }
                },
                error: function (result) {
                    alert(result.responseText);
                }
            });


        });

        function Comma(Num) { //function to add commas to textboxes
            Num += '';
            Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
            Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
            x = Num.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;

            while (rgx.test(x1))
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            return x1 + x2;
        }

        function getid(evs, sav) {
            $("#hffightid").val(evs);
            $("#hfbtnid").val($(sav).attr("id"));

        }

        function onclaimedamount() {

            var evs = $("#hffightid").val();
            var sav = $("#hfbtnid").val();
            var sss = $("#txtgetlackingamount").val();

            if (evs != "") {
                $.ajax({
                    type: "POST",
                    url: 'Pages/News/history.aspx/onclaimed',
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ id: evs, amount: sss }),
                    dataType: "json",
                    success: function (data) {
                        var split1 = data.d.split("-");
                        console.log(split1[0])
                        if (split1[0].trim() == "Claimed") {
                            document.getElementById(sav).parentElement.innerHTML = "<label style='color:green'>CLAIMED</label>";
                        }
                        else if (split1[0].trim() == "Lacking") {
                            document.getElementById(sav).parentElement.innerHTML ="<label style='color:red'>" + split1[1] + "</label> <br/> <input type='button' value='COMPLETE' onclick='onclaimcomplete(" + evs + ",this)' class='btn btn-primary'>";
                        }
                        $("#modalcloser").click();
                    },
                    error: function (result) {
                        alert(result.responseText);
                    }
                });
            }
        }

        function onclaimcomplete(evs,savs) {

            if (confirm('Are you sure that the complete amount has been claimed?')) {
                $.ajax({
                    type: "POST",
                    url: 'Pages/News/history.aspx/oncomplete',
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ id: evs }),
                    dataType: "json",
                    success: function (data) {
                        $(savs).parent().html("<label style='color:green'>CLAIMED</label>");
                    },
                    error: function (result) {
                        alert(result.responseText);
                    }
                });
            }
        }
    </script>
</asp:Content>
