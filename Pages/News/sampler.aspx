<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="sampler.aspx.cs" Inherits="SabongLive.Pages.Players.sampler" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="SabongLive.App_Code" %>

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

        .card {
            box-shadow: 0 0 1px rgba(0,0,0,.125),0 1px 3px rgba(0,0,0,.2);
            margin-bottom: 1rem;
        }

        .card {
            padding:20px;
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

        .containersz {
            margin-left:-150px;
            margin-top:-350px;
            position:absolute;
            width: 200px;
            height: 200px;
            z-index:-2;
        }

        .containersz img {
            float:left;
            width: 500px;
            height:500px;
        }

        #fightnos {font-family: Impact; color:silver;
        }
            
        #chevron {
            position: relative;
            text-align: center;
            padding: 12px;
            margin: -90px auto 30px ;
            height: 100px;
            width: 55%;
            z-index:-1;
        }
        #chevron:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 51%;
            background: #2b2d42;
            transform: skew(0deg, 6deg);
        }
        #chevron:after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            width: 50%;
            background:  #2b2d42;
            transform: skew(0deg, -6deg);
        }

        #trapezoid {
            border-bottom: 50px solid red;
            border-right: 25px solid transparent;
            height: 70px;
            width: 100%;
            top:-20px;
            left:-20px;
            position:absolute;
            z-index:-1;
        }

        #trapezoid2 {
            border-bottom: 50px solid blue;
            border-right: 25px solid transparent;
            height: 70px;
            width: 90%;
            top:-20px;
            position:absolute;
            z-index:-1;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="content" runat="server" ID="content2">

    <div class="row">
        <div class="col-md-12">
            <p style="color: black; font-size: 20px; text-align: center; font-weight: 10px; visibility:hidden; " id="titlebar" runat="server"></p>
        </div>
    </div>
   
    <%--<div class="row">
        <div class="col-md-12">
            <div class=" pull-right" style="margin-right: 0px; ">
                <a href="history" title="Details" target="_new" style="font-size: 20px"><i class="fa fa-list"></i>HISTORY</a>
            </div>
        </div>
    </div>--%>

    <div class="row">
        <div class="col-md-12" style="text-align:center;" >
            
            <h2 id="fightnos" style="font-size: 50px; margin:0px; "></h2>
            <div id="chevron">
                </div>
            
            <div >
            <div class="containersz" >
                <img src="../Photos/phoenex.png" />
            </div>
            </div>
        </div>
    </div>
     <div class="row">
        <div class="col-md-12">
            <h3 style="margin-top:-70px; margin-left:100px; color:white;" id="txttotalaccbet">0</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6 m-0" style="background: transparent; text-align: center;">

            <div class="inner ">
                <div class="row" >
                    <div class="col-md-12" >
                        <div class="row">
                             <div class="col-md-6" style="text-align: left;">
                                  <div id="trapezoid">
                                </div>
                                <h1 style="color: white; margin-top: 0px;">MERON</h1>
                               

                            </div>
                            <div class="col-md-6" style="text-align: left; color: white;">
                                <h3 id="lblmerontotalbet" style="margin-top: 0px;">0</h3>
                                <h4 id="lblmerontotalpayout">0</h4>
                            </div>

                        </div>
                            
                         <div class="input-group">
                        <input type="text" class="form-control" id="idmerontext"  style="text-align:center;"/>
                         <div class="input-group-btn">
                        <input type="button" class="btn btn-success pull-right" value="Go" id="btnmeron" />
                         </div>
                         </div>
                    </div>
                </div>

                
                <hr />
                <div class=" card">
                <div class=" card-body p-0">
                    <div class="row">
                        <div class="col-md-12" style="overflow-x: scroll;">
                            <table id="tablemeron" class="table table-striped" style="text-align: left;  ">
                                <thead>
                                    <tr>
                                        <th>AMOUNT</th>
                                        <th>WINNING AMT.</th>
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
        <div class="col-xs-6 col-sm-6 col-md-6 m-0" style="background: transparent; text-align: center;">
            <div class="inner ">

                <div class="row">
                    <div class="col-md-12">
                        
                          <div class="row">
                             <div class="col-md-6" style="text-align: left;">
                                  <div id="trapezoid2">
                                </div>
                                <h1 style="color: white; margin-top: 0px;z-index:1; padding-left:10px;">WALA</h1>
                               

                            </div>
                            <div class="col-md-6" style="text-align: left; color: white;">
                                <h3 id="lblwalatotalbet" style="margin-top: 0px;">0</h3>
                                <h4 id="lblwalatotalpayout">0</h4>
                            </div>

                        </div>

                         <div class="input-group">
                        <input type="text" class="form-control" id="idwalatext" style="text-align:center;"/>
                         <div class="input-group-btn">
                        <input type="button" class="btn btn-success pull-right" value="Go" id="btnwala" />
                         </div>
                         </div>
                    </div>
                </div>
                <hr />
                <div class=" card">
                <div class=" card-body p-0">
                <div class="row">
                    <div class="col-md-12"  style="overflow-x: scroll;">
                        <table id="tablewala" class="table table-striped" style="text-align: left;">
                            <thead>
                                <tr>
                                    <th>AMOUNT</th>
                                    <th>WINNING AMT.</th>
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
</asp:Content>


<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">

    <script src="../../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../../Scripts/jquery.signalR-2.2.2.min.js"></script>
    <script src="../../Scripts/date.format.js"></script>
    <!--Reference the autogenerated SignalR hub script. -->
    <script src="signalr/hubs"></script>
    <script type="text/javascript">


        $(function () {

            // Declare a proxy to reference the hub.
            var chatHub = $.connection.chatHub;
            registerClientMethods(chatHub);
            // Start Hub
            $.connection.hub.start().done(function () {

                registerEvents(chatHub);

            });

        });


        var agentname2 = '<%=this.agentname%>';
        function registerEvents(chatHub) {

            var name = 'agent';
            var role = 'agent';
            var matchid = '<%=this.eventid%>';
            var fightid = '<%=this.fightno%>';
            var agentname = '<%=this.agentname%>';
            $("#fightnos").html('Fight No.: ' + '<%=this.fightno%>');
            console.log(agentname);

            var totalaccbet = 0;
            var dal = document.getElementById('tablemeron');
            $.ajax({
                type: "POST",
                url: 'Pages/News/sampler.aspx/ongettable',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: name }),
                dataType: "json",
                success: function (data) {
                    if (data != "") {
                        console.log(data);
                        var tbodyRef = dal.getElementsByTagName('tbody')[0];
                        tbodyRef.innerHTML = "";
                        if (data != "") {

                            var split1 = data.d.split("~");
                            for (var i = split1.length; i >= 1; i--) {

                                var split2 = split1[i - 1].split("-");
                                if (split2[0] != "") {
                                    if (agentname == split2[3].trim()) {

                                        tr = tbodyRef.insertRow(-1);
                                        var tabCell = tr.insertCell(-1);

                                        tabCell.innerHTML = "" + (i) + ".)&nbsp;" + split2[0] + "";
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + split2[1] + "";
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + split2[3] + "";
                                        totalaccbet += parseFloat(split2[0]);

                                        $(tr).attr("style", "border: 2px solid #e88a7e;");
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "<a href='printslip?&payid=" + split2[2] + "&fno=" + i + "' target='_new'><i class='fa fa-print'></i> </a>";
                                        /*tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "<a href='javascript:void(0);' onclick='canceltab(this," + split2[2] + ");'><i class='fa fa-close'></i> </a>";*/
                                    }
                                   
                                } else {

                                    tr = tbodyRef.insertRow(-1);
                                    var tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "" + (i) + ".)";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                }
                            }

                            $("#txttotalaccbet").html(Comma(totalaccbet));
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
                url: 'Pages/News/sampler.aspx/ongettablewala',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: name }),
                dataType: "json",
                success: function (data) {
                    if (data != "") {
                        console.log(data);
                        var tbodyRef = dal1.getElementsByTagName('tbody')[0];
                        tbodyRef.innerHTML = "";
                        if (data != "") {

                            var split1 = data.d.split("~");
                            for (var i = split1.length; i >= 1; i--) {
                                var split2 = split1[i - 1].split("-");
                                if (split2[0] != "") {
                                    if (agentname == split2[3].trim()) {

                                        tr = tbodyRef.insertRow(-1);
                                        var tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + (i) + ".)&nbsp;" + split2[0] + "";
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + split2[1] + "";
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + split2[3] + "";
                                        totalaccbet += parseFloat(split2[0]);
                                        console.log(totalaccbet);
                                        $(tr).attr("style", "border: 2px solid #e88a7e;");
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "<a href='printslip?&payid=" + split2[2] + "&fno=" + i + "' target='_new'><i class='fa fa-print'></i> </a>";

                                    }
                                    
                                } else {

                                    tr = tbodyRef.insertRow(-1);
                                    var tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "" + (i) + ".)";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                }
                            }

                            $("#txttotalaccbet").html(Comma(totalaccbet));
                        }
                    }
                },
                error: function (result) {
                    alert(result.responseText);
                }
            });

            $.ajax({
                type: "POST",
                url: 'Pages/News/sampler.aspx/ongetmatchdata',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: fightid }),
                dataType: "json",
                success: function (data) {

                    console.log(data.d + "123");
                    if (data.d != "") {
                        var split1 = data.d.split("-");
                       
                        if (split1[0] != "") {
                            $('#lblmerontotalbet').html(Comma(split1[0]));
                            $('#lblwalatotalbet').html(Comma(split1[1]));
                            $('#lblmerontotalpayout').html(parseInt(split1[2]) + "%");
                            $('#lblwalatotalpayout').html(parseInt(split1[3]) + "%");
                            if (parseInt(split1[2]) < 140 && parseInt(split1[2]) != 0) {
                                $("#btnmeron").hide();
                            }
                            else {
                                $("#btnmeron").show();
                            }
                            if (parseInt(split1[3]) < 140 && parseInt(split1[3]) != 0) {

                                $("#btnwala").hide();
                            }
                            else {

                                $("#btnwala").show();
                            }
                        }
                    }
                },
                error: function (result) {
                    alert(result.responseText);
                }
            });

            if (name.length > 0) {
                chatHub.server.connect(name, role);

            }

            $('#btnmeron').click(function () {

                if (idmerontext.value.length > 0) {
                    if (confirm("Please confirm your bet amount.")) {

                        console.log(idmerontext.value);
                        chatHub.server.samplergo(matchid, fightid, "meron", idmerontext.value, agentname);
                    }
                }
            });
            $('#btnwala').click(function () {

                if (idwalatext.value.length > 0) {
                    if (confirm("Please confirm your bet amount.")) {
                        console.log(idwalatext.val);
                        chatHub.server.samplergo(matchid, fightid, "wala", idwalatext.value, agentname);
                    }
                }

            });


        }

        function registerClientMethods(chatHub) {


            // Calls when user successfully logged in
            chatHub.client.onConnected = function (id, userName, Announce, messages, GoLive, director) {


                console.log(Announce.Status);
                console.log('connected');
            }


            chatHub.client.onRemoveConnection = function (id) {
                connectioRemover(id);

            }
            chatHub.client.onUserDisconnected = function (id, userName) {
                setTimeout(function () {
                    $.connection.hub.start();
                }, 5000);
            }


            chatHub.client.announceStatus = function (button, message, status) {
                AnnounceStatus(button, message, status);

            }

            chatHub.client.directorOrder = function (marquee, status, fightno, eventid, redeclare) {
                DirectorsOrder(marquee, status, fightno, eventid, redeclare);

            }
        }


        function DirectorsOrder(marquee, status, fightnoss, eventidss, redeclare) {
            $("#btnstatus").val(status);

            if (status == "OPEN") {
                $("#btnwala").show();
                $("#btnmeron").show();
            }
            else if (status == "CLOSED") {
                $("#btnwala").hide();
                $("#btnmeron").hide();
            }
            else if (status == "START") {

            }
            else if (status == "END") {

            }
            else if (status == "HOLDMERON") {

                $("#btnmeron").hide();
            } else if (status == "HOLDWALA") {

                $("#btnwala").hide();
            }
            else if (status == "NEXT") {
                $("#btnwala").hide();
                $("#btnmeron").hide();
            }
        }

        function AnnounceStatus(button, message, status) {

            var userName = $('#hdUserName').val();

            var totalaccbet = 0;
            var dal = document.getElementById('tablemeron');
            $.ajax({
                type: "POST",
                url: 'Pages/News/sampler.aspx/ongettable',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: name }),
                dataType: "json",
                success: function (data) {
                    if (data != "") {
                        console.log(data);
                        var tbodyRef = dal.getElementsByTagName('tbody')[0];
                        tbodyRef.innerHTML = "";
                        if (data != "") {

                            var split1 = data.d.split("~");

                            for (var i = split1.length; i >= 1; i--) {

                                var split2 = split1[i - 1].split("-");
                                if (split2[0] != "") {
                                    if (agentname2 == split2[3].trim()) {
                                    tr = tbodyRef.insertRow(-1);
                                    var tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + (i) + ".)&nbsp;" + split2[0] + "";
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + split2[1] + "";
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + split2[3] + "";

                                        totalaccbet += parseFloat(split2[0]);
                                        $(tr).attr("style", "border: 2px solid #e88a7e;");
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "<a href='printslip?&payid=" + split2[2] + "&fno=" + i + "' target='_new'><i class='fa fa-print'></i> </a>";

                                    }
                                    
                                } else {

                                    tr = tbodyRef.insertRow(-1);
                                    var tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "" + (i) + ".)";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                }
                            }

                            $("#txttotalaccbet").html(Comma(totalaccbet));
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
                url: 'Pages/News/sampler.aspx/ongettablewala',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: name }),
                dataType: "json",
                success: function (data) {
                    if (data != "") {
                        console.log(data);
                        var tbodyRef = dal1.getElementsByTagName('tbody')[0];
                        tbodyRef.innerHTML = "";
                        if (data != "") {

                            var split1 = data.d.split("~");
                            for (var i = split1.length; i >= 1; i--) {

                                var split2 = split1[i - 1].split("-");

                                if (split2[0] != "") {
                                    if (agentname2 == split2[3].trim()) {
                                    tr = tbodyRef.insertRow(-1);
                                    var tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + (i) + ".)&nbsp;" + split2[0] + "";
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + split2[1] + "";
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "" + split2[3] + "";
                                        totalaccbet += parseFloat(split2[0]);
                                        $(tr).attr("style", "border: 2px solid #e88a7e;");
                                        tabCell = tr.insertCell(-1);
                                        tabCell.innerHTML = "<a href='printslip?&payid=" + split2[2] + "&fno=" + i + "' target='_new'><i class='fa fa-print'></i> </a>";

                                    }
                                   
                                } else {
                                    tr = tbodyRef.insertRow(-1);
                                    var tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "" + (i) + ".)";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "";
                                }
                            }

                            $("#txttotalaccbet").html(Comma(totalaccbet));
                        }
                    }
                },
                error: function (result) {
                    alert(result.responseText);
                }
            });

         


            $.ajax({
                type: "POST",
                url: "Pages/News/screen.aspx/ongetcounts",
                data: JSON.stringify({ username: "" }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                    var splitter = result.d.toString().split("~");
                    $("#fightnos").html("Fight No.: " + splitter[5]);

                    $.ajax({
                        type: "POST",
                        url: 'Pages/News/sampler.aspx/ongetmatchdata',
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ id: splitter[5] }),
                        dataType: "json",
                        success: function (data) {
                            if (data != "") {
                                console.log(data);
                                var split1 = data.d.split("-");

                                $('#lblmerontotalbet').html(Comma(split1[0]));
                                $('#lblwalatotalbet').html(Comma(split1[1]));
                                $('#lblmerontotalpayout').html(parseInt(split1[2]) + "%");
                                $('#lblwalatotalpayout').html(parseInt(split1[3]) + "%");
                                if (parseInt(split1[2]) < 140 && parseInt(split1[2])!=0) {
                                    $("#btnmeron").hide();
                                }
                                else {
                                    $("#btnmeron").show();
                                }
                                if (parseInt(split1[3]) < 140 && parseInt(split1[3]) != 0) {

                                    $("#btnwala").hide();
                                }
                                else {

                                    $("#btnwala").show();
                                }
                            }
                        },
                        error: function (result) {
                            alert(result.responseText);
                        }
                    });
                }, error: function (result) {
                    console.log(result.responseText);
                }
            });

        }
       /* function canceltab(evs,sav) {

            if (confirm('Are you sure you want to remove this bet?')) {
                console.log($(evs).parent());
                $.ajax({
                    type: "POST",
                    url: "Pages/News/sampler.aspx/oncancels",
                    data: JSON.stringify({ id: sav }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        console.log("asdas");
                        $(evs).parent().parent().remove();
                    }, error: function (result) {
                        console.log(result.responseText);
                    }
                });
              

            }
        }*/
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

    </script>
</asp:Content>
