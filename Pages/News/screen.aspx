﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="screen.aspx.cs" Inherits="SabongLive.Pages.News.screen" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="row">
        <div class="col-md-12">
            <p style=" font-size: 30px; text-align: center; font-weight: 10px; color:white;" id="titlebar" runat="server"></p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" style="text-align:center; background:#2b2d42;">
            <h1 id="fightnos" style="font-size:50px; font-family:Impact; color:silver;"></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6 m-0" style="background: Red; text-align: center;">
            <div class="inner">
                <h1 style="color:white; font-size:100px;">MERON</h1>
                <h1 style="font-size: 3vw; color:white; font-size:80px " id="overallbet1" >0</h1>
                <hr>
                <h1 style="color:white; font-size:50px"><span id="txtpayout1">0</span></h1>
            </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6 m-0" style="background: blue; text-align: center;">
            <div class="inner">
                <h1 style="color:white; font-size:100px;">WALA</h1>
                <h1 style="font-size: 3vw; color:white; font-size:80px" id="overallbet2">0</h1>
                <hr>
                <h1 style="color:white; font-size:50px"><span id="txtpayout2">0</span></h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" style="text-align: center;">
            <input type="button" class="btn btn-primary" id="btnstatus" value="-" style="width: 100%; background: grey; border: none; font-size:50px;">
        </div>
    </div>
    <div id="fightwinners">
    </div>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

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

                registerEvents(chatHub)

            });

        });


        function registerEvents(chatHub) {

            var name = 'screen';
            var role = 'screen';


            if (name.length > 0) {
                chatHub.server.connect(name, role);


            }
        }
            function registerClientMethods(chatHub) {


                // Calls when user successfully logged in
                chatHub.client.onConnected = function (id, userName, Announce, messages, GoLive, director) {
                    AnnounceStatus("sss");
                    console.log(Announce.Status);
                    console.log('connected');
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

            if (status == "OPEN") {
                $("#btnstatus").val("OPEN");
                $("#btnstatus").attr("style", "width: 100%; background: green; border: none; font-size:50px; ");
            }
            else if (status == "CLOSED") {
                $("#btnstatus").val("CLOSE");

                $("#btnstatus").attr("style", "width: 100%; background: grey; border: none; font-size:50px;");
            }
            else if (status == "START") {
            }
            else if (status == "END") {
            }
            else if (status == "MERON" ) {
                $("#btnstatus").val("MERON WINS");

                $("#btnstatus").attr("style", "width: 100%; background: red; border: none; font-size:50px;");
            }
            else if (status == "WALA" ) {
                $("#btnstatus").val("WALA WINS!");

                $("#btnstatus").attr("style", "width: 100%; background: blue; border: none; font-size:50px;");
            }
            else if (status == "DRAW") {
                $("#btnstatus").val("DRAW!");

                $("#btnstatus").attr("style", "width: 100%; background: grey; border: none; font-size:50px;");
            }
            else if (status == "CANCEL") {
                $("#btnstatus").val("MATCH CANCELLED!");

                $("#btnstatus").attr("style", "width: 100%; background: black; border: none; font-size:50px;");
            }
            else if (status == "NEXT") {
                $("#btnstatus").val("NEXT");

                $("#btnstatus").attr("style", "width: 100%; background: black; border: none; font-size:50px;");
            }
        }

            function AnnounceStatus(button, message, status) {

                $.ajax({
                    type: "POST",
                    url: "Pages/News/screen.aspx/ongetcounts",
                    data: JSON.stringify({ username: "" }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        var splitter = result.d.toString().split("~");
                        $("#overallbet1").html(Comma(splitter[0]));
                        $("#overallbet2").html(Comma(splitter[1]));
                        $("#txtpayout1").html(splitter[2]);
                        $("#txtpayout2").html(splitter[3]);
                        $("#btnstatus").val(splitter[4]);
                        $("#fightnos").html("Fight No.:"+splitter[5]);
                    }, error: function (result) {
                        console.log(result.responseText);
                    }
                });



                $.ajax({
                    type: "POST",
                    url: "Pages/News/screen.aspx/onfightwinners",
                    data: JSON.stringify({ username: "" }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        if (result.d.toString() != "") {
                            var split1 = result.d.toString().split("~");

                            $("#fightwinners").html("");
                            for (var i = 0; i < split1.length; i++) {
                                var split2 = split1[i].split("-");
                                console.log(split2);

                                if (split2[0] != "") {
                                    var newOption = "";
                                    if (split2[1].trim() == "MERON") {
                                        newOption = "<div class='pull-left' style='color:white; margin-right:10px; margin-top:10px; background-color:red; text-align:center; width:90px; height:90px;'><h1 >" + split2[0] + "</h1> </div>";
                                    }
                                    else if (split2[1].trim() == "WALA") {
                                        newOption = "<div  class='pull-left' style='color:white; margin-right:10px; margin-top:10px; background-color:blue; text-align:center; width:90px; height:90px;'><h1>" + split2[0] + "</h1> </div>";
                                    }
                                    else if (split2[1].trim() == "DRAW") {
                                        newOption = "<div  class='pull-left' style='color:white; margin-right:10px; margin-top:10px; background-color:grey; text-align:center;width:90px; height:90px;'><h1>" + split2[0] + "</h1> </div>";
                                    }
                                    else {
                                        newOption = "<div  class='pull-left' style='color:white; margin-right:10px; margin-top:10px; background-color:black; text-align:center;width:90px; height:90px;'><h1>" + split2[0] + "</h1> </div>";
                                    }

                                    $("#fightwinners").append(newOption);
                                }
                            }
                        }
                    }, error: function (result) {
                        console.log(result.responseText);
                    }
                });


            }

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
            function isNumberKey(evt) {
                console.log(evt);
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode != 46 && charCode > 31
                    && (charCode < 48 || charCode > 57))
                    return false;

                return true;
            }




    </script>
</asp:Content>