<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="director.aspx.cs" Inherits="SabongLive.Pages.News.director" %>

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
    <hr />
    <div class="row" >
        <div class="col-md-4">
            </div>
        <div class="col-md-4" style="border:1px solid; color:grey;">
            <br />
            <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <input type="button" id="btnStart" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="START" />
                     
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <input type="button" id="btnEnd" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="END" />
                        </div>

                    </div>
                     
                </div>
            </div>
            <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12">
                     <input type="button" id="btnOpenbet" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="OPEN BET" />
                </div>
            </div>
            <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12">
                       <input type="button" id="btnCloseBet" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="CLOSE BET" />
                </div>
            </div>

              <div class="row rowclass">
                <div class="col-md-6 col-sm-6 col-xs-6">
                       <input type="button" id="btnholdmeron" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="HOLD MERON" />
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6">
                       <input type="button" id="btnholdwala" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="HOLD WALA" />
                </div>
            </div>
            <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12" style="text-align:center;">
                      <h4>Announce</h4>
                </div>
            </div>


            <div class="row rowclass">
                <div class="col-md-3 col-sm-3 col-xs-3">
                       <input type="button" id="btnMeron" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="MERON" />
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                       <input type="button" id="btnWala" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="WALA" />
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                       <input type="button" id="btnDraw" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="DRAW" />
                </div>
                <div class="col-md-3 col-sm-3 col-xs-3">
                       <input type="button" id="btnCancel" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="CANCEL" />
                </div>
            </div>

            <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <input type="button" id="btnNextMatch" class="btn btn-flat form-control" style="background-color: rgba(73,73,73,0.5); color: white;" value="NEXT MATCH" />
                </div>
            </div>
        </div>
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

               var name = 'director';
               var role = 'director';


               if (name.length > 0) {
                   chatHub.server.connect(name, role);
               }

               $('#btnOpenbet').click(function () {
                   var redeclare = "1";
                   var marquee ="";
                   var status = "OPEN";
                   console.log(marquee);

                   var fightno =<%= this.fightno %>;
                     var eventid =<%= this.eventid%>;
                     chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

                 });
               $('#btnCloseBet').click(function () {
                   var redeclare = "1";
                   var marquee = "";
                   var status = "CLOSED";

                   var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

              });
               $('#btnStart').click(function () {
                   var redeclare = "1";
                   var marquee = "";
                   var status = "START";

                   var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

              });
               $('#btnEnd').click(function () {
                  var redeclare = "1";
                  var marquee ="";
                  var status = "END";

                  var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

               });

               $('#btnholdmeron').click(function () {
                   var redeclare = "1";
                   var marquee = "";
                   var status = "HOLDMERON";

                   var fightno =<%= this.fightno %>;
                   var eventid =<%= this.eventid%>;
                   chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

               }); $('#btnholdwala').click(function () {
                   var redeclare = "1";
                   var marquee = "";
                   var status = "HOLDWALA";

                   var fightno =<%= this.fightno %>;
                   var eventid =<%= this.eventid%>;
                   chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

               });
               $('#btnMeron').click(function () {
                   var redeclare = "1";
                   var marquee = "";
                   var status = "MERON";

                   var fightno =<%= this.fightno %>;
                       var eventid =<%= this.eventid%>;
                       chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

               });

               $('#btnWala').click(function () {
                   var redeclare = "1";
                   var marquee = "";
                   var status = "WALA";

                   var fightno =<%= this.fightno %>;
                       var eventid =<%= this.eventid%>;
                       chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

               });

               $('#btnDraw').click(function () {
                   var redeclare = "1";
                   var marquee = "";
                   var status = "DRAW";

                   var fightno =<%= this.fightno %>;
                       var eventid =<%= this.eventid%>;
                       chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

               });

               $('#btnCancel').click(function () {
                   var redeclare = "1";
                   var marquee = "";
                   var status = "CANCEL";

                   var fightno =<%= this.fightno %>;
                       var eventid =<%= this.eventid%>;
                       chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

               });


               $('#btnNextMatch').click(function () {
                   $.ajax({
                       type: "POST",
                       url: "Pages/News/director.aspx/checklast",
                       data: JSON.stringify({ username: "" }),
                       contentType: 'application/json; charset=utf-8',
                       dataType: 'json',
                       success: function (result) {
                           if (result.d == 1) {
                               alert("Please annnouce the last fight's result.");
                           }
                           else {
                               var status = "NEXT";
                               var marquee = "";
                               var redeclare = "1";
                               var fightno =<%= this.fightno %>;
                               var eventid =<%= this.eventid%>;
                               chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);
                           }

                       }, error: function (result) {
                           console.log(result.responseText);
                       }
                   });
                 

              });


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
           

           function DirectorsOrder(marquee, status, fightnoss, eventidss, redeclare) {
               if (status == "START") {
                   $.ajax({
                       type: "POST",
                       url: "Pages/News/director.aspx/onstart",
                       data: JSON.stringify({ username: "" }),
                       contentType: 'application/json; charset=utf-8',
                       dataType: 'json',
                       success: function (result) {

                           chatHub.server.directorbtns1(status);
                       }, error: function (result) {
                           console.log(result.responseText);
                       }
                   });
               }
               else if (status == "END") {
                   $.ajax({
                       type: "POST",
                       url: "Pages/News/director.aspx/onend",
                       data: JSON.stringify({ username: "" }),
                       contentType: 'application/json; charset=utf-8',
                       dataType: 'json',
                       success: function (result) {
                           chatHub.server.directorbtns1(status);
                       }, error: function (result) {
                           console.log(result.responseText);
                       }
                   });
               }
               else if (status == "MERON" || status=="WALA" || status=="DRAW"||status=="CANCEL") {
                   $.ajax({
                       type: "POST",
                       url: "Pages/News/director.aspx/onannounce",
                       data: JSON.stringify({ username: status }),
                       contentType: 'application/json; charset=utf-8',
                       dataType: 'json',
                       success: function (result) {
                           chatHub.server.directorbtns1(status);

                       }, error: function (result) {
                           console.log(result.responseText);
                       }
                   });
               }
               else if (status == "NEXT") {
                   $.ajax({
                       type: "POST",
                       url: "Pages/News/director.aspx/onnext",
                       data: JSON.stringify({ username: "" }),
                       contentType: 'application/json; charset=utf-8',
                       dataType: 'json',
                       success: function (result) {
                           chatHub.server.directorbtns1(status);

                       }, error: function (result) {
                           console.log(result.responseText);
                       }
                   });
               }
             }
           }
           function AnnounceStatus(button, message, status) {


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
