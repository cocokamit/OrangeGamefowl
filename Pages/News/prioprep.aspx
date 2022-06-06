<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="prioprep.aspx.cs" Inherits="SabongLive.Pages.News.prioprep" %>
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
                <div class="col-md-12">
                    <h4>READY</h4>
                    <div class="input-group">
                        <input type="text" class="form-control" id="txtready" value="">
                        <div class="input-group-btn">
                            <input type="button" id="btnready" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="GO" />
                        </div>
                    </div>
                </div>
            </div>
           <div class="row rowclass">
                <div class="col-md-12">
                    <h4>LIMBER</h4>
                    <div class="input-group">
                        <input type="text" class="form-control" id="txtlimber" value="">
                        <div class="input-group-btn">
                            <input type="button" id="btnlimber" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="GO" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row rowclass">
                <div class="col-md-12">
                    <h4>HEELING</h4>
                    <div class="input-group">
                        <input type="text" class="form-control" id="txtheeling" value="">
                        <div class="input-group-btn">
                            <input type="button" id="btnheeling" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="GO" />
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

    
   
    
            <input type="hidden" id="hftype"  value="0"/>
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

                    registerEvents(chatHub);

                });
            });

            function registerEvents(chatHub) {

                $("#btnready").click(function () {
                    var value = $("#txtready").val();
                    $.ajax({
                        type: "Post",
                        url: 'Pages/News/prioprep.aspx/onready',
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ id: value}),
                        dataType: "json",
                        success: function (data) {
                            $("#txtready").val("");
                            console.log("success!");
                            chatHub.server.onPost();
                        },
                        error: function (result) {
                            alert(result.responseText);
                        }
                    });
                });

                $("#btnlimber").click(function () {

                    var value = $("#txtlimber").val();
                    $.ajax({
                        type: "Post",
                        url: 'Pages/News/prioprep.aspx/onlimber',
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ id: value}),
                        dataType: "json",
                        success: function (data) {
                            $("#txtlimber").val("");
                            console.log("success!");
                            chatHub.server.onPost();
                        },
                        error: function (result) {
                            alert(result.responseText);
                        }
                    });
                });

                $("#btnheeling").click(function () {
                    var value = $("#txtheeling").val();
                    $.ajax({
                        type: "Post",
                        url: 'Pages/News/prioprep.aspx/onheeling',
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ id: value }),
                        dataType: "json",
                        success: function (data) {
                            $("#txtheeling").val("");
                            console.log("success!");
                            chatHub.server.onPost();
                        },
                        error: function (result) {
                            alert(result.responseText);
                        }
                    });
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


                chatHub.client.onpost = function () {

                }
            }

        </script>
</asp:Content>
