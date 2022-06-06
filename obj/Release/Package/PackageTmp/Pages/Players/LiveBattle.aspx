<%@ Page Title="" Language="C#" MasterPageFile="~/AgentMaster.Master" AutoEventWireup="true" CodeBehind="LiveBattle.aspx.cs" Inherits="SabongLive.Pages.Players.LiveBattle" %>

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
  <%--<link href="../../vendors/videojs/video-js.min.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ContentPlaceHolderID="content" runat="server" ID="content2">


    <section class="content-header">

        <section class="content-header">
            <h1><i class="fa fa-circle" style="color: green;"></i>&nbsp;<span class="btn btn-danger">LIVE</span>
            </h1>

            <input type="button" id="btnwith" class="btn btn-flat pull-right" style="background-color: rgba(73,73,73,0.5); color: white;" value="Withdraw" data-toggle="modal" data-target="#modelform2" />
            <input type="button" id="btndep" class="btn btn-flat pull-right" style="background-color: rgba(73,73,73,0.5); color: white;" value="Deposit" data-toggle="modal" data-target="#modalForm3" />


        </section>
        <hr />
        <div class="page-title">
            <div class="row" style="margin-top: 40px;">
                <div class="col-md-12">
                    <%--Player's view @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>
                    <div class="row">
                        <div class="col-md-12">
                            <p style="color: white; font-size: 20px; text-align: center; font-weight: 10px;" id="titlebar" runat="server"></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="marquee">
                                <p style="color: white; font-size: 20px; font-weight: 10px;" id="lblannouncement"></p>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        
                        <div class="col-md-12" id="announcemessage">
                        </div>
                        <div class="col-md-3" id="announcemessage">
                        </div>
                        <div class="col-md-6" id="betting">
                            <div class="row" style="margin-bottom: 20px;">
                                <div class="col-xs-6 col-sm-6 col-md-6 m-0" id="divred" tabindex="1" onclick="divclicker1(this)" style="background: transparent;">
                                    <div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">
                                        <div class="widget-user-header" style="padding: 0px; background-color: transparent;">
                                            <div class="small-box " style="background-color: rgba(73,73,73,0.5); border-bottom-left-radius: 50%; border-bottom-right-radius: 50%; padding-bottom: 40px; text-align: center;">
                                                <div class="inner">
                                                    <h3 style="font-size: 3vw;" id="overallbet1">0</h3>
                                                    <hr>
                                                    <p>Payout: <span id="txtpayout1">0</span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget-user-image" style="">
                                            <img class="img-circle" style="border: none; margin-top: 60px;" src="../../Photos/chickenhead2.png" alt="User Avatar">
                                        </div>
                                        <div class="box-footer" style="border-top: none; background-color: transparent; padding-top: 100px;">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input type="button" class="btn btn-danger" id="btnbetred" value="Choose Red" style="width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6  m-0" id="divblue" tabindex="1" onclick="divclicker2(this)" style="background: rgba(255,255,255, 0.5);">
                                    <div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">
                                        <div class="widget-user-header" style="padding: 0px; background-color: transparent;">
                                            <div class="small-box " style="background-color: rgba(73,73,73,0.5); border-bottom-left-radius: 50%; border-bottom-right-radius: 50%; padding-bottom: 40px; text-align: center;">
                                                <div class="inner">
                                                    <h3 style="font-size: 3vw;" id="overallbet2">0</h3>
                                                    <hr>
                                                    <p>Payout: <span id="txtpayout2">0</span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget-user-image" style="">
                                            <img class="img-circle" style="border: none; margin-top: 60px;" src="../../Photos/chickenhead1.png" alt="User Avatar">
                                        </div>
                                        <div class="box-footer" style="border-top: none; background-color: transparent; padding-top: 100px;">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <input type="button" class="btn btn-primary" id="btnbetblue" value="Choose Blue" style="width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-xs-6 col-md-6">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                            <h4>Fight #:</h4>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <h4 id="lblfight">1</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-6 col-md-6">
                                    <div class="row">
                                        <div class="col-md-5 col-sm-5 col-xs-5 text-center">
                                            <h4>Status: </h4>
                                        </div>
                                        <div class="col-md-5 col-sm-5 col-xs-5">
                                            <input type="button" class="btn btn-primary" id="btnstatus" value="BLUE" style="width: 100%; background: grey; border: none;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% string id = Session["Role"].ToString();
                                if (id == "1")
                                {%>
                            <div class="row" style="margin-top: 30px;">
                                <div class="col-md-12">
                                    <div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">
                                        <div class="small-box " style="background-color: rgba(73,73,73,0.5);">
                                            <div class="inner">
                                                <div class="pull-left">
                                                    <h4>Current Bet: <span id="txtcurbet">0</span></h4>
                                                </div>
                                                <div class="pull-right">
                                                    <h4>Credits: <span id="txtcredits">0</span></h4>
                                                </div>
                                            </div>
                                            <div class="inner">
                                                <hr>
                                                <label id="errorred" style="color: #f82741"></label>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="input-group margin">
                                                            <span class="input-group-btn">
                                                                <button type="button" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;">BET</button></span><input type="number" class="form-control" id="text_bet" placeholder="0.00" onkeypress="return isNumberKey(event);"><div class="input-group-btn">
                                                                    <button type="button" class="btn " id="btn_enter" onclick="" style="background-color: rgba(73,73,73,0.5); color: white;">ENTER</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" class="btn " id="btn_modal" style="background-color: rgba(73,73,73,0.5); color: white;" data-toggle="modal" data-target="#modalForm">
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px;">
                                                        <input type="button" id="green100" class="btn btn-success " value="100" onclick="">
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px;">
                                                        <input type="button" id="green200" class="btn btn-success " value="200" onclick="">
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px;">
                                                        <input type="button" id="green300" class="btn btn-success" value="300" onclick="">
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px;">
                                                        <input type="button" id="green500" class="btn btn-success " value="500" onclick="">
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 20px;">
                                                        <input type="button" id="green1000" class="btn btn-success " value="1000" onclick="">
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 20px;">
                                                        <input type="button" id="green5000" class="btn btn-success" value="5000" onclick="javascript: greenclick(this.value);">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                            }%>
                        </div>
                    </div>
                </div>
            </div>

            <%--<div class="row" >
                        <div class="col-md-12">
                                <p style="color: white; font-size: 20px;text-align:center; font-weight: 10px;" id="titlebar" runat="server"></p>
                        </div>
                    </div>--%>
            <%--<div class="row">
                        <div class="col-md-12">
                       <video-js id="live_stream" class="video-js vjs-fluid vjs-default-skin vjs-big-play-centered" controls  playsinline preload="auto" autoplay="true" muted="muted" width="auto" height="auto" poster="../../Photos/poster.jpg" >
				     <source src="http://18.166.110.103:8080/hls/infra183/index.m3u8" type="application/x-mpegURL">
                                <p class='vjs-no-js'>
                                  To view this video please enable JavaScript, and consider upgrading to a web browser that
                                  <a href='https://videojs.com/html5-video-support/' target='_blank'>supports HTML5 video</a>
                                </p>
                            </video-js>--%>

            <%--      <iframe style="width:100%; height:400px;" src="https://rtsp.me/embed/5eFAQtGe/" frameborder="0" allowfullscreen></iframe>--%>

            <%--                          
                     <image src="http://192.168.6.14:554" class="image-fluid" style="width:100%; height:400px;"></image>--%>
            <%-- <iframe class=" img-fluid " style="width:100%; height:400px;"
                            src="http://192.168.6.146:554">
                            </iframe>
                            <iframe class="image-fluid" style="width:100%; height:400px;" src="https://rtsp.me/embed/GskEDAS3/" frameborder="0" allowfullscreen></iframe>
                            
                            
            --%>

            <%-- </div>
                    </div>--%>
            <%--<div class="row" >
                        <div class="col-md-12">
                            <div class="marquee">
                                <p style="color: white; font-size: 20px; font-weight: 10px;" id="lblannouncement"></p>
                            </div>
                        </div>--%>
            <hr />
                <div class="col-md-5">

                    <%--Director's view @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>
                    <% if (id == "4")
                        {%>
                    <div class="row">
                        <div class="col-md-12">

                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_standby" value="Please stand by for the next match.">
                                        <div class="input-group-btn">
                                            <input type="button" id="btnStandBy" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="STAND BY" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_message" value="The match will start at 7:00 A.M. (UTC+08:00).">
                                        <div class="input-group-btn">
                                            <input type="button" id="btnStatuser" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="SET STATUS" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_openbet" value="Betting is now OPEN. Choose your best fighter.">
                                        <div class="input-group-btn">
                                            <input type="button" id="btnOpenbet" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="OPEN BET" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_closebet" value="Betting is now CLOSED. Wish you goodluck!">
                                        <div class="input-group-btn">
                                            <input type="button" id="btnCloseBet" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="CLOSE BET" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_lastcall" value="Last call: betting will close after a few seconds.">
                                        <div class="input-group-btn">
                                            <input type="button" id="btnLastcall" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="LASTCALL BET" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_cancelbet" value="kancel na ang match kay walay ayo.">
                                        <div class="input-group-btn">
                                            <input type="button" id="btnCancelBet" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="CANCEL BET" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row rowclass">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <input type="button" id="btnAnnouce" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="ANNOUNCE" />
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <input type="button" id="btnRed" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white; width: 100%;" value="RED" onclick="chooseannounce(this)" />
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <input type="button" id="btnBlue" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white; width: 100%;" value="BLUE" onclick="chooseannounce(this)" />
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <input type="button" id="btnDraw" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white; width: 100%;" value="Draw" onclick="chooseannounce(this)" />
                                </div>
                            </div>

                            <div class="row rowclass">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <input type="button" id="btnNextMatch" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="NEXT MATCH" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%} %>
                </div>

        </div>

            <div class="row" style="margin-top: 20px;">
                <div class="col-md-3">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Count Board</h3>
                            <span runat="server" id="totalfights">0</span>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-condensed">
                                <tr>

                                    <th style="width: 20%"></th>
                                    <th style="width: 60%"></th>
                                    <th style="width: 20%"></th>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="label label-danger">RED</label></td>
                                    <td>
                                        <div class="progress progress-xs">
                                            <div class="progress-bar progress-bar-danger" id="divredcount"></div>
                                        </div>
                                    </td>
                                    <td><span class="badge bg-red" id="spanredcount">0</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="label label-primary">BLUE</label></td>
                                    <td>
                                        <div class="progress progress-xs">
                                            <div class="progress-bar progress-bar-primary" id="divbluecount"></div>
                                        </div>
                                    </td>
                                    <td><span class="badge bg-blue" id="spanbluecount">0</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="label label-warning">Draw</label></td>
                                    <td>
                                        <div class="progress progress-xs">
                                            <div class="progress-bar progress-bar-yellow" id="divdrawcount"></div>
                                        </div>
                                    </td>
                                    <td><span class="badge bg-yellow" id="spandrawcount">0</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="label label-default">Cancelled</label></td>
                                    <td>
                                        <div class="progress progress-xs">
                                            <div class="progress-bar " id="divcancelcount"></div>
                                        </div>
                                    </td>
                                    <td><span class="badge bg-primary" id="spancancelcount">0</span></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="x_panel">asdasd</div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content x_panel" style="width: 300px;">
                    <div class="modal-header text-center">
                        <button type="button" id="btnclose" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="color: black;">
                            <h4>Are you sure you want to bet it to the
                                <label class="label" id="lblmanok"></label>
                            </h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <input type="button" class="btn btn-danger pull-left" id="btnyes" value="Yes" />
                            <input type="button" class="btn btn-default pull-right" id="btnno" value="No" data-dismiss="modal" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>




        <div class="modal fade" id="modelform2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content x_panel">
                    <div class="modal-header text-center">
                        <button type="button" id="btnclose2" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="color: black;">
                            <h4>WITHDRAWAL REQUEST</h4>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-12" style="color: black;">
                            <label>Amount</label>
                            <input type="text" class="form-control" id="wamount" placeholder="0.00" onkeypress="return isNumberKey(event);">
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px;">
                        <div class="col-md-12" style="color: black;">
                            <label>OUTLET</label>
                            <asp:DropDownList ID="ddlOutlet" CssClass="select2-dropdown form-control" runat="server" ClientIDMode="Static" onchange="getComboA(this)">
                                <asp:ListItem Text="--Select--" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Coordinator" Value="Coordinator"></asp:ListItem>
                                <asp:ListItem Text="Bank" Value="Bank"></asp:ListItem>
                                <asp:ListItem Text="Coins.ph" Value="Coins.ph"></asp:ListItem>
                                <asp:ListItem Text="GCash" Value="GCash"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px; display: none;" id="idbankname">
                        <div class="col-md-12" style="color: black;">

                            <label>Bank Name</label>
                            <asp:DropDownList ID="ddlBankname" CssClass="select2-dropdown form-control" runat="server" ClientIDMode="Static">
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
                    <div class="row" style="margin-bottom: 10px; display: none;" id="idaccountname">
                        <div class="col-md-12" style="color: black;">

                            <label>Account Name</label>
                            <input type="text" class="form-control" id="Text2" placeholder=" " runat="server">
                        </div>
                    </div>
                    <div class="row" style="margin-bottom: 10px; display: none;" id="idaccountnumber">
                        <div class="col-md-12" style="color: black;">

                            <label id="lbAccNum">Account Number</label>
                            <input type="text" class="form-control" id="Text3" placeholder=" " runat="server">
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-12" style="color: black;">
                            <label>We will send you an update through this number.</label>
                            <input type="text" class="form-control" id="wdnumber" placeholder="+639231234123" runat="server">
                        </div>
                    </div>

                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <input type="button" class="btn btn-danger pull-left" id="btnsubmit" value="Submit" />
                            <input type="button" class="btn btn-default pull-right" id="btncanceler" value="No" data-dismiss="modal" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>


        <div class="modal fade" id="modalForm3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content x_panel">
                    <div class="modal-header text-center">
                        <button type="button" id="btnClose3" class="close" data-dismiss="modal" aria-label="Close">
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


    <input id="hdId" type="hidden" />
    <input id="hdUserName" type="hidden" />
    <input id="hdchoice" type="hidden" value="0" />
    <input id="hdchoice2" type="hidden" value="0" />
    <input id="hdwdfd" type="hidden" value="0" />
    <input id="hdconnectionid" type="hidden" value="0" />
    <input id="hdredeclare" type="hidden" value="0" />
</asp:Content>


<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">

    <script src="../../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../../Scripts/jquery.signalR-2.2.2.min.js"></script>
    <script src="../../Scripts/date.format.js"></script>
    <!--Reference the autogenerated SignalR hub script. -->
    <script src="signalr/hubs"></script>
    <%--<script src="../../vendors/videojs/video.js"></script>--%>
    <script>
       /* var player = videojs('live_stream');
        player.play();*/

    </script>
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
              var role = '<%= this.UserRole %>';


              if (name.length > 0) {
                  chatHub.server.connect(name, role);

              }

              $('#btnOpenbet').click(function () {
                  chooseDirect(this.id);
                  console.log(this.id);
                  var redeclare = "1";
                  var marquee = $("#text_openbet").val();
                  var status = "OPEN";
                  console.log(marquee);

                  var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

              });
              $('#btnCloseBet').click(function () {
                  chooseDirect(this.id);
                  var redeclare = "1";
                  var marquee = $("#text_closebet").val();
                  var status = "CLOSED";

                  var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

              });
              $('#btnLastcall').click(function () {
                  chooseDirect(this.id);
                  var redeclare = "1";
                  var marquee = $("#text_lastcall").val();
                  var status = "LASTCALL";

                  var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

              });
              $('#btnCancelBet').click(function () {
                  chooseDirect(this.id);
                  var redeclare = "1";
                  var marquee = $("#text_cancelbet").val();
                  var status = "CANCELLED";

                  var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

              });
              $('#btnNextMatch').click(function () {
                  var status = "NEXT"; var marquee = "";
                  var redeclare = "1";
                  var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

                  chatHub.server.sendMessageToAll("", "", "", "", "", "");

              });
              $('#btnAnnouce').click(function () {
                  chooseDirect(this.id);
                  var winner = $("#hdwdfd").val();
                  var redeclare = $("#hdredeclare").val();

                  if (redeclare == "0") {
                      redeclare = "1";
                  }
                  else if (redeclare == "1") {
                      redeclare = "2";
                  }


                  var status = "0"; var marquee = "";
                  if (winner == "1") {
                      marquee = "Red fighter won the match";
                      status = "RED";
                  }
                  else if (winner == "2") {
                      marquee = "Blue fighter won the match";
                      status = "BLUE";
                  }
                  else if (winner == "3") {
                      marquee = "The match was a draw";
                      status = "DRAW";
                  }

                  var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);
              });

              $('#btnStandBy').click(function () {

                  chooseDirect(this.id);
                  var marquee = $("#text_standby").val();
                  var status = "STAND BY";
                  var redeclare = "1";
                  var fightno =<%= this.fightno %>;
                  var eventid =<%= this.eventid%>;
                  chatHub.server.directorBtns(marquee, status, fightno, eventid, redeclare);

              });

              $('#btn_title').click(function () {

                  $('#titlebar').html($('#text_title').val());
                  var title = $('#text_title').val();
                  var going = $('#btn_title').html();
                  console.log(going);

                  $.ajax({
                      type: "POST",
                      url: "Pages/Players/LiveBattle.aspx/OnSaveEvent",
                      data: JSON.stringify({ title: title, status: going }),
                      contentType: 'application/json; charset=utf-8',
                      dataType: 'json',
                      success: function (result) {
                          console.log('Success');

                      }, error: function (result) {
                          console.log(result.responseText);
                      }
                  });
                  if (going == "REOPEN") { chatHub.server.clearEvent() }

                  chatHub.server.addevent(title, going);
              });

              $('#btnStatuser').click(function () {
                  console.log(this);
                  console.log(this.id);
                  var message = $('#text_message').val();
                  var status = this.value;

                  if (this.value == "SET STATUS") {

                      this.value = "REOPEN";
                  } else if (this.value == "REOPEN") {
                      this.value = "SET STATUS";
                      $("[id$=btnStandBy]").click();
                  }
                  console.log(this.value);
                  chatHub.server.announcerets(this.id, message, status);
              });

              // Send Button Click Event
              $('#btnyes').click(function () {

                  var event = '<%= this.eventid %>';

                  var msg = $("#text_bet").val();
                  var curcredits = $('#txtcredits').html();
                  if (parseFloat(parseFloat(msg).toFixed(2)) <= parseFloat(parseFloat(curcredits).toFixed(2)) && parseFloat(parseFloat(msg).toFixed(2)) > 0) {
                      if (msg.length > 0) {
                          var choice = $('#hdchoice').val();
                          var total1 = $('#overallbet1').html();
                          var total2 = $('#overallbet2').html();
                          console.log(choice);
                          var userName = $('#hdUserName').val();

                          var date = GetCurrentDateTime(new Date());

                          chatHub.server.sendMessageToAll(userName, msg, date, choice, total1, total2);
                          var fight = $('#lblfight').html();

                          $.ajax({
                              type: "POST",
                              url: "Pages/Players/LiveBattle.aspx/OnSendBet",
                              data: JSON.stringify({ username: userName, bet: msg, curdate: date, fightno: fight, eventid: event, choice: choice }),
                              contentType: 'application/json; charset=utf-8',
                              dataType: 'json',
                              success: function (result) {
                                  console.log('Success');
                                  $("#hdchoice2").val(choice);
                                  disablers(3);
                                  $("#txtcredits").html(parseFloat(parseFloat(curcredits).toFixed(2)) - parseFloat(parseFloat(msg).toFixed(2)));

                              }, error: function (result) {
                                  console.log(result.responseText);
                              }
                          });
                          $("#text_bet").val('');
                          $("#txtcurbet").html(parseFloat($("#txtcurbet").val()) + parseFloat(msg));
                      }
                      $('#btnclose').click();
                  } else {
                      alert('The value you have entered is not valid.');
                  }
              });

            // Send Message on Enter Button
            $("#text_bet").keypress(function (e) {
                if (e.which == 13) {

                    $('#errorred').html("");
                    if ($('#hdchoice').val() != "0") {
                        if ($('#hdchoice').val() == "1") {
                            $('#lblmanok').attr("style", "color:red;");
                            $('#lblmanok').html("MERON SIDE?");
                        }
                        else if ($('#hdchoice').val() == "2") {
                            $('#lblmanok').attr("style", "color:blue;");
                            $('#lblmanok').html("WALA SIDE?");
                        }

                        $('#btn_modal').click();
                    } else {
                        $('#errorred').html("Please choose your side");
                    }
                }
            });

        }

        function registerClientMethods(chatHub) {

            chatHub.client.duplicateLogin = function (id) {
            
              }

              // Calls when user successfully logged in
              chatHub.client.onConnected = function (id, userName, Announce, messages, GoLive, director) {

                  $('#hdId').val(id);
                  $('#hdUserName').val(userName);
                  // Add Existing Messages
                  $("#hdconnectionid").val(id);

                  if (Announce.Status != "") {
                      AnnounceStatus(Announce.Button, Announce.Message, Announce.Status);

                  }

                  var credits = '<%= this.StartCredits %>';
                  var fightno = '<%= this.fightno %>';
                console.log(credits + "wewe");
                $("#txtcredits").html(credits);
                $("#lblfight").html(fightno);

                if (director.Marquee != "") {
                    DirectorsOrder2(director.Marquee, director.Status);
                }

                if (messages.UserName != "") {

                    AddMessage(messages.UserName, messages.Message, messages.Time, messages.Choice, messages.Total1, messages.Total2);

                }
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

            chatHub.client.directorOrder = function (marquee, status, fightno, eventid, redeclare) {
                DirectorsOrder(marquee, status, fightno, eventid, redeclare);

            }

            chatHub.client.announceEvent = function (title, status) {
                eventitler(title, status);
                console.log("gggg");
            }

            chatHub.client.messageReceived = function (userName, message, time, choice, total1, total2) {
                AddMessage(userName, message, time, choice, total1, total2);
            }

            chatHub.client.announceStatus = function (button, message, status) {
                AnnounceStatus(button, message, status);

            }
        }

        function connectioRemover(id) {

            var idd = $("#hdconnectionid").val();

            if (idd == id) {
                console.log("connectionRemover");
<%--                      <%=Page.ClientScript.GetPostBackEventReference(lnkLogouters, String.Empty)%>      --%>   

            }
        }

        function CounBoard(Totalfight, redcount, bluecount, drawcount, cancelcount) {
            $("#totalfights").html(Totalfight);
            var red = (parseFloat(redcount) / parseFloat(Totalfight)) * 100;
            var blue = (parseFloat(bluecount) / parseFloat(Totalfight)) * 100;
            var draw = (parseFloat(drawcount) / parseFloat(Totalfight)) * 100;
            var cancel = (parseFloat(cancelcount) / parseFloat(Totalfight)) * 100;

            $("#divredcount").attr("style", "width:" + red);
            $("#spanredcount").html(red + "%");
            $("#divbluecount").attr("style", "width:" + blue);
            $("#spanbluecount").html(blue + "%");
            $("#divdrawcount").attr("style", "width:" + draw);
            $("#spandrawcount").html(draw + "%");
            $("#divcancelcount ").attr("style", "width:" + cancel + "; background-color: darkgrey;");
            $("#spancancelcount").html(cancel + "%");

        }
        function DirectorsOrder2(marquee, status) {
            $("#lblannouncement").html(marquee);
            $("#btnstatus").val(status);

            if (status == "OPEN") {
                $("#btnstatus").attr("style", "width: 100%; background:green; border:none;");
                disablers(2);

                chooseDirect("btnOpenbet");
            }
            else if (status == "CLOSED") {
                $("#btnstatus").attr("style", "width: 100%; background:#d73925; border:none;");
                disablers(1);
                chooseDirect("btnCloseBet");
            }
            else if (status == "STAND BY") {
                $("#btnstatus").attr("style", "width: 100%; background:#d73925; border:none;");
                disablers(1);
                chooseDirect("btnStandBy");
            }
            else if (status == "LASTCALL") {
                $("#btnstatus").attr("style", "width: 100%; background:#f39c12; border:none;");
                disablers(2);
                chooseDirect("btnLastcall");
            }
            else if (status == "CANCELLED" || status == "RED" || status == "BLUE" || status == "DRAW") {
                $("#btnstatus").attr("style", "width: 100%; background:grey; border:none;");
                disablers(1);
            }
        }

        function DirectorsOrder(marquee, status, fightnoss, eventidss, redeclare) {
            $("#lblannouncement").html(marquee);
            $("#btnstatus").val(status);

            if (status == "OPEN") {
                $("#btnstatus").attr("style", "width: 100%; background:green; border:none;");
                disablers(2);
                disablers(4);
                chooseDirect("btnOpenbet");
            }
            else if (status == "CLOSED") {
                $("#btnstatus").attr("style", "width: 100%; background:#d73925; border:none;");
                disablers(1);
                chooseDirect("btnCloseBet");
            }
            else if (status == "STAND BY") {
                $("#btnstatus").attr("style", "width: 100%; background:#d73925; border:none;");
                disablers(1);
                chooseDirect("btnStandBy");
            }
            else if (status == "LASTCALL") {
                $("#btnstatus").attr("style", "width: 100%; background:#f39c12; border:none;");
                disablers(2);
                chooseDirect("btnLastcall");
            }
            else if (status == "CANCELLED" || status == "RED" || status == "BLUE" || status == "DRAW") {
                $("#btnstatus").attr("style", "width: 100%; background:grey; border:none;");
                disablers(1);

                var id = <%= this.UserName %>;
                var payout1 = $('#txtpayout1').html();
                var payout2 = $('#txtpayout2').html();
                var choice = $('#hdchoice2').val();
                var fightnos = fightnoss;
                var eventids = eventidss;

                $.ajax({
                    type: "POST",
                    url: "Pages/Players/LiveBattle.aspx/OnCancelBet",
                    data: JSON.stringify({ clientID: id, status: status, pyout1: payout1, pyout2: payout2, choice: choice, fightno: fightnos, eventid: eventids, redeclared: redeclare }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        var splitresult = result.d.toString().split("~");
                        console.log('Success');
                        if (status == "CANCELLED") {
                            $("#txtcredits").html(splitresult[0]);
                            $("#hdredeclare").val("1");
                            console.log("1");
                        }
                        else if (status == "RED") {
                            $("#txtcredits").html(splitresult[0]);
                            $("#hdredeclare").val("1");
                            alert("" + splitresult[1]);
                            console.log("2");
                        }
                        else if (status == "BLUE") {
                            $("#txtcredits").html(splitresult[0]);
                            $("#hdredeclare").val("1");
                            alert("" + splitresult[1]);
                            console.log("3");
                        }
                        else if (status == "DRAW") {
                            $("#txtcredits").html(splitresult[0]);
                            $("#hdredeclare").val("1");
                            console.log("4");
                        }
                    }, error: function (result) {
                        console.log(result.responseText);
                    }
                });
            }
            else if (status == "NEXT") {
                $("#btnstatus").attr("style", "width: 100%; background:grey; border:none;");
                disablers(1);
                disablers2();
                $.ajax({
                    type: "POST",
                    url: "Pages/Players/LiveBattle.aspx/OnChangeFightno",
                    data: JSON.stringify({ fightno: fightnos, eventid: eventids }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        $("#lblfight").html(result.d);

                        $("#hdredeclare").val("0");

                    }, error: function (result) {
                        console.log(result.responseText);
                    }
                });
            }
        }
        function disablers2() {
            $('#overallbet1').html("0");
            $('#overallbet2').html("0");
            $('#txtpayout1').html("0");
            $('#txtpayout2').html("0");
            $('#hdchoice').val("0");
            $('#hdchoice2').val("0");
            $('#txtcurbet').html("0");
        }


        function disablers(evs) {
            if (evs == 1) {
                $("#btn_enter").attr("onclick", "");
                $("#green100").attr("onclick", "");
                $("#green200").attr("onclick", "");
                $("#green300").attr("onclick", "");
                $("#green500").attr("onclick", "");
                $("#green1000").attr("onclick", "");
                $("#green2000").attr("onclick", "");
            }
            else if (evs == 2) {
                $("#btn_enter").attr("onclick", "enterclick()");
                $("#green100").attr("onclick", "javascript: greenclick(this.value);");
                $("#green200").attr("onclick", "javascript: greenclick(this.value);");
                $("#green300").attr("onclick", "javascript: greenclick(this.value);");
                $("#green500").attr("onclick", "javascript: greenclick(this.value);");
                $("#green1000").attr("onclick", "javascript: greenclick(this.value);");
                $("#green2000").attr("onclick", "javascript: greenclick(this.value);");
            }
            else if (evs == 3) {
                if ($("#hdchoice2").val() == "1") {
                    $('#hdchoice').val("1");
                    $('#divblue').attr("onclick", "nothing()");
                    $('#divblue').attr("id", "tempblue");
                    console.log("ggg");

                }
                else if ($("#hdchoice2").val() == "2") {
                    $('#hdchoice').val("2");
                    $('#divred').attr("onclick", "nothing()");
                    $('#divred').attr("id", "tempred");
                    console.log("fff");
                }
            }
            else if (evs == 4) {

                $('#tempblue').attr("id", "divblue");
                $('#tempred').attr("id", "divred");

                $('#divblue').attr("onclick", "divclicker2(this)");
                $('#divred').attr("onclick", "divclicker1(this)");
            }
        }

        function GetCurrentDateTime(now) {

            var localdate = dateFormat(now, "dddd, mmmm dS, yyyy, h:MM:ss TT");

            return localdate;
        }

        function eventitler(title, status) {
            console.log(status);
            $('#titlebar').html(title);
            if (status == "Go Live") {
                console.log("dddd");
                $('#btn_title').html('Exit');
                $('#btn_title').attr("style", "background-color:#d73925; color: white;");
                $('#text_title').val(title);
            }
            else if (status == "Exit") {
                $('#btn_title').html('Go Live');
                $('#btn_title').attr("style", "background-color:rgba(73,73,73,0.5); color: white;");
                $('#text_title').val(title);

            }
        }

        function greenclick(evs) {

            $('#errorred').html("");
            if ($('#hdchoice').val() != "0") {
                $("#text_bet").val(evs);

                if ($('#hdchoice').val() == "1") {
                    $('#lblmanok').attr("style", "color:red;");
                    $('#lblmanok').html("RED SIDE?");
                }
                else if ($('#hdchoice').val() == "2") {
                    $('#lblmanok').attr("style", "color:blue;");
                    $('#lblmanok').html("BLUE SIDE?");
                }

                $('#btn_modal').click();
            }
            else {
                $('#errorred').html("Please choose your side");
            }
        }

        function enterclick() {

            $('#errorred').html("");
            if ($('#hdchoice').val() != "0") {
                var evs = $("#text_bet").val();
                $("#text_bet").val(evs);

                if ($('#hdchoice').val() == "1") {
                    $('#lblmanok').attr("style", "color:red;");
                    $('#lblmanok').html("RED SIDE?");
                }
                else if ($('#hdchoice').val() == "2") {
                    $('#lblmanok').attr("style", "color:blue;");
                    $('#lblmanok').html("BLUE SIDE?");
                }
                $('#btn_modal').click();
            }
            else {

                $('#errorred').html("Please choose your side");
            }
        }

        function AnnounceStatus(button, message, status) {

            var userName = $('#hdUserName').val();

            var eventids = <%= this.eventid %>;
              var currentbet =<%= this.currentbets%>;
            $.ajax({
                type: "POST",
                url: "Pages/Players/LiveBattle.aspx/OnGetCredits",
                data: JSON.stringify({ username: userName, evenid: eventids }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {
                    console.log("Success");
                    var splitter = result.d.toString().split("~");
                    $("#txtcredits").html(splitter[0]);

                    CounBoard(splitter[5], splitter[1], splitter[2], splitter[3], splitter[4]);

                }, error: function (result) {
                    console.log(result.responseText);
                }
            });

            $('#announcemessage').html('');
            var code;
            if (status == "SET STATUS") {
                $('#btnStatuser').val("REOPEN");
                $('#text_message').val(message);
                code = $(' <div class="row">' +
                    '<div class="col-md-12 small-box"  style ="background-color: rgba(73,73,73,0.5); color:white; text-align:center;" >' +
                    '<h4 id="lblann">'
                    + message +
                    '</h4>' +
                    ' </div >' +
                    '</div >');

                $("#announcemessage").append(code);
                $("#betting").hide();
                console.log('a');
            }
            else if (status == "REOPEN") {
                $('#btnStatuser').val("SET STATUS");
                $('#text_message').val(message);

                $("#betting").show();
                //code = $(' <div class="row">' +
                //    '<div class="col-md-12" >' +
                //    '<div class="row" style="margin-bottom:20px;">' +
                //    '<div class="col-xs-6 col-sm-6 col-md-6 m-0" id="divred" tabindex="1" onclick="divclicker1(this)">' +
                //    '<div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">' +
                //    '<div class="widget-user-header" style="padding: 0px; background-color: transparent;">' +
                //    '<div class="small-box " style="background-color: rgba(73,73,73,0.5); border-bottom-left-radius: 50%; border-bottom-right-radius: 50%; padding-bottom: 40px; text-align: center;">' +
                //    '   <div class="inner">' +
                //    '    <h3 style="font-size:3vw;" id="overallbet1">0</h3>' +
                //    '   <hr />' +
                //    '    <p>Payout: <span id="txtpayout1">0</span></p>' +
                //    '   </div>' +
                //    '   </div>' +
                //    ' </div>' +
                //    '   <div class="widget-user-image" style="">' +
                //    '   <img class="img-circle" style="border: none; margin-top: 60px;" src="../../Photos/chickenhead2.png" alt="User Avatar">' +
                //    '   </div>' +
                //    '  <div class="box-footer" style="border-top: none; background-color: transparent; padding-top: 100px;">' +
                //    '   <div class="row">' +
                //    '  <div class="col-md-12">' +

                //    '  <input type="button" class="btn btn-danger" id="btnbetred" value="Choose Red" style="width: 100%;" />' +
                //    ' </div>' +
                //    '  </div>' +
                //    ' </div>' +
                //    ' </div>' +
                //    ' </div>' +
                //    ' <div class="col-xs-6 col-sm-6 col-md-6  m-0" id="divblue" tabindex="1" onclick="divclicker2(this)">' +
                //    '  <div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">' +
                //    '  <div class="widget-user-header" style="padding: 0px; background-color: transparent;">' +
                //    '  <div class="small-box " style="background-color: rgba(73,73,73,0.5); border-bottom-left-radius: 50%; border-bottom-right-radius: 50%; padding-bottom: 40px; text-align: center;">' +
                //    '   <div class="inner">' +
                //    '   <h3 style="font-size:3vw;" id="overallbet2">0</h3>' +
                //    '  <hr />' +
                //    '  <p>Payout: <span id="txtpayout2">0</span></p>' +
                //    '   </div>' +
                //    ' </div>' +
                //    ' </div>' +
                //    '  <div class="widget-user-image" style="">' +
                //    '   <img class="img-circle" style="border: none; margin-top: 60px;" src="../../Photos/chickenhead1.png" alt="User Avatar">' +
                //    '  </div>' +
                //    ' <div class="box-footer" style="border-top: none; background-color: transparent; padding-top: 100px;">' +
                //    '  <div class="row">' +
                //    '  <div class="col-md-12">' +

                //    '   <input type="button" class="btn btn-primary" id="btnbetblue" value="Choose Blue" style="width: 100%;" />' +
                //    '  </div>' +
                //    ' </div>' +
                //    '  </div>' +
                //    ' </div>' +
                //    ' </div>' +
                //    ' </div>' +
                //    ' <div class="row">' +
                //    '  <div class="col-sm-6 col-xs-6 col-md-6">' +
                //    '  <div class="row">' +
                //    '  <div class="col-md-6 col-sm-6 col-xs-6 text-center">' +
                //    ' <h4> Fight #:</h4>' +
                //    ' </div>' +
                //    '<div class="col-md-6 col-sm-6 col-xs-6">' +
                //    ' <h4 id="lblfight">0</h4>' +
                //    ' </div>' +
                //    ' </div>' +
                //    ' </div>' +
                //    ' <div class="col-sm-6 col-xs-6 col-md-6">' +
                //    '<div class="row">' +
                //    ' <div class="col-md-5 col-sm-5 col-xs-5 text-center">' +
                //    '    <h4> Status: </h4>' +
                //    '</div>' +
                //    ' <div class="col-md-5 col-sm-5 col-xs-5">' +
                //    '<input type="button" class="btn btn-primary" id="btnstatus" value="OPEN" style="width: 100%; background:green; border:none;" />' +
                //    ' </div>' +
                //    '</div>' +
                //    '</div>' +
                //    '</div>' +

                //    '<div class="row" style="margin-top: 30px;">' +
                //    ' <div class="col-md-12">' +
                //    '<div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">' +
                //    '<div class="small-box " style="background-color: rgba(73,73,73,0.5);">' +
                //    '<div class="inner">' +
                //    ' <div class="pull-left">' +
                //    ' <h4>Current Bet: <span id="txtcurbet">' + currentbet + '</span></h4>' +
                //    '</div>' +
                //    '<div class="pull-right">' +
                //    ' <h4>Credits: <span id="txtcredits">0</span></h4>' +
                //    '</div>' +
                //    ' </div>' +
                //    ' <div class="inner">' +
                //    '<hr />' +

                //    '<label id="errorred" style="color:#f82741" ></label>' +

                //    ' <div class="row">' +
                //    '<div class="col-md-12">' +
                //    '<div class="input-group margin">' +
                //    '<span class="input-group-btn">' +
                //    ' <button type="button" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;">BET</button>' +
                //    '</span>' +
                //    '<input type="number" class="form-control" id="text_bet" placeholder="0.00" onkeypress="return isNumberKey(event);">' +
                //    '<div class="input-group-btn">' +
                //    '<button type="button" class="btn " id="btn_enter" onclick="enterclick();" style="background-color: rgba(73,73,73,0.5); color: white;" >ENTER</button>' +
                //    '</div>' +
                //    '</div>' +
                //    '</div>' +
                //    '<input type="hidden" class="btn " id="btn_modal" style="background-color: rgba(73,73,73,0.5); color: white;" data-toggle="modal" data-target="#modalForm" />' +

                //    '</div>' +
                //    '<div class="row">' +
                //    '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; " >' +
                //    '<input type="button" id="green100" class="btn btn-success " value="100" onclick="javascript:greenclick(this.value);" />' +

                //    ' </div>' +
                //    '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; " >' +
                //    '<input type="button" id="green200" class="btn btn-success " value="200" onclick="javascript: greenclick(this.value);" />' +

                //    '</div>' +
                //    '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; ">' +

                //    ' <input type="button" id="green300" class="btn btn-success" value="300" onclick="javascript: greenclick(this.value);" />' +

                //    '</div>' +
                //    '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; ">' +
                //    '<input type="button" id="green500" class="btn btn-success " value="500" onclick="javascript: greenclick(this.value);" />' +

                //    '</div>' +
                //    '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 20px; ">' +
                //    '<input type="button" id="green1000" class="btn btn-success " value="1000" onclick="javascript: greenclick(this.value);" />' +

                //    '</div>' +
                //    '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 20px; ">' +
                //    '<input type="button" id="green5000" class="btn btn-success" value="5000" onclick="javascript: greenclick(this.value);" />' +

                //    '</div>' +
                //    '</div>' +
                //    ' </div>' +
                //    ' </div>' +

                //    '</div>' +
                //    '</div>' +

                //    ' </div>' +

                //    ' </div>' +
                //    '</div>');

                console.log('b');
            }

        }

        function AddMessage(userName, message, time, choice, total1, total2) {

            var CurrUser = $('#hdUserName').val();
            var obetq = total1;
            var obetw = total2;
            var obet1 = obetq, obet2 = obetw;

            if (choice == "1") {
                $('#overallbet1').html(parseFloat(parseFloat(obetq).toFixed(2)) + parseFloat(parseFloat(parseFloat(message)).toFixed(2)));
                obet1 = (parseFloat(parseFloat(obetq).toFixed(2)) + parseFloat(parseFloat(parseFloat(message)).toFixed(2)));
                $('#overallbet2').html(total2);
            }
            else if (choice == "2") {
                $('#overallbet2').html(parseFloat(parseFloat(obetw).toFixed(2)) + parseFloat(parseFloat(parseFloat(message)).toFixed(2)));
                obet2 = (parseFloat(parseFloat(obetw).toFixed(2)) + parseFloat(parseFloat(parseFloat(message)).toFixed(2)));
                $('#overallbet1').html(total1);
            }

            var payout1 = parseFloat(((parseFloat(parseFloat(obet2).toFixed(2)) - parseFloat(parseFloat(obet1).toFixed(2))) / parseFloat(parseFloat(obet1).toFixed(2))) + 187).toFixed(2);

            var payout2 = parseFloat(((parseFloat(parseFloat(obet1).toFixed(2)) - parseFloat(parseFloat(obet2).toFixed(2))) / parseFloat(parseFloat(obet2).toFixed(2))) + 187).toFixed(2);

            if (payout1 != "Infinity" && payout2 != "NaN") {
                $('#txtpayout1').html(payout1);
            }
            else {
                $('#txtpayout1').html("0");
            }

            if (payout2 != "Infinity" && payout2!="NaN") {
                $('#txtpayout2').html(payout2);
            }
            else {
                $('#txtpayout2').html("0");
            }
            console.log(payout2);
            console.log("asd2");
            console.log("Payout1=((" + parseFloat(parseFloat(obet2).toFixed(2)) + "+" + parseFloat(parseFloat(obet1).toFixed(2)) + ")/" + parseFloat(parseFloat(obet1).toFixed(2)) + ")+187");
            console.log("Payout2=((" + parseFloat(parseFloat(obet1).toFixed(2)) + "+" + parseFloat(parseFloat(obet2).toFixed(2)) + ")/" + parseFloat(parseFloat(obet2).toFixed(2)) + ")+187");

            console.log(choice);

        }

        function moneyconverter(evs) {

            var spltter = evs.split(".");
            //for (var i = 0;i<evs.)
        }
        function divclicker1(evs) {
            $('#divblue').attr("style", "background:transparent;");
            $(evs).attr("style", "background: rgba(255,255,255, 0.5);");
            $('#hdchoice').val("1");
            console.log("1");
        } function divclicker2(evs) {
            $('#divred').attr("style", "background:transparent;");
            $(evs).attr("style", "background: rgba(255,255,255, 0.5);");
            $('#hdchoice').val("2");
            console.log("2");
        }

        //function Comma(Num) { //function to add commas to textboxes

        //        Num += '';
        //        Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
        //        Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
        //        x = Num.split('.');
        //        x1 = x[0];
        //        x2 = x.length > 1 ? '.' + x[1] : '';
        //        var rgx = /(\d+)(\d{3})/;
        //        while (rgx.test(x1))
        //            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        //        return x1 + x2;

        //}

        function isNumberKey(evt) {
            console.log(evt);
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
                && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }


        function chooseannounce(evs) {
            $('#btnRed').attr("style", "background-color: rgba(73,73,73,0.5); color: white; width: 100%;");
            $('#btnBlue').attr("style", "background-color: rgba(73,73,73,0.5); color: white; width: 100%;");
            $('#btnDraw').attr("style", "background-color: rgba(73,73,73,0.5); color: white; width: 100%;");

            if (evs.id == "btnRed") {
                $(evs).attr("style", "background-color: red; color: white; width: 100%;");
                $("#hdwdfd").val("1");
            }
            else if (evs.id == "btnBlue") {
                $(evs).attr("style", "background-color: blue; color: white; width: 100%;");
                $("#hdwdfd").val("2");
            }
            else if (evs.id == "btnDraw") {
                $(evs).attr("style", "background-color: grey; color: white; width: 100%;");
                $("#hdwdfd").val("3");
            }

        }

        function chooseDirect(evs) {

            $('#btnOpenbet').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
            $('#btnCloseBet').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
            $('#btnCancelBet').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
            $('#btnAnnouce').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
            $('#btnLastcall').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
            $('#btnStandBy').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
            var idd = "#" + evs + "";
            $(idd).attr("style", "background-color: maroon; color: white; width: 100%;");



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
                    else {
                        alert(result.d);
                    }

                }, error: function (result) {
                    console.log(result.responseText);
                }
            });


        }

        function nothing() {
            alert("You already have chosen a fighter!")
        }
    </script>
</asp:Content>


<%--
   <div class="row">
                        <div class="col-md-12 small-box "  style="background-color: rgba(73,73,73,0.5); color:white; text-align:center;">
                            <h3 id="lblann"> 
                                asda
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6 m-0" id="divred" tabindex="1" onclick="divclicker1(this)">
                                    <div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">
                                        <div class="widget-user-header" style="padding: 0px; background-color: transparent;">
                                            <div class="small-box " style="background-color: rgba(73,73,73,0.5); border-bottom-left-radius: 50%; border-bottom-right-radius: 50%; padding-bottom: 40px; text-align: center;">
                                                <div class="inner">
                                                    <h3 style="font-size:3vw;" id="overallbet1">0</h3>
                                                    <hr />
                                                    <p>Payout: <span id="txtpayout1">0</span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget-user-image" style="">
                                            <img class="img-circle" style="border: none; margin-top: 60px;" src="../../Photos/chickenhead2.png" alt="User Avatar">
                                        </div>
                                        <div class="box-footer" style="border-top: none; background-color: transparent; padding-top: 100px;">
                                            <div class="row">
                                                <div class="col-md-12">

                                                    <input type="button" class="btn btn-danger" id="btnbetred" value="Choose Red" style="width: 100%;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6  m-0" id="divblue" tabindex="1" onclick="divclicker2(this)">
                                    <div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">
                                        <div class="widget-user-header" style="padding: 0px; background-color: transparent;">
                                            <div class="small-box " style="background-color: rgba(73,73,73,0.5); border-bottom-left-radius: 50%; border-bottom-right-radius: 50%; padding-bottom: 40px; text-align: center;">
                                                <div class="inner">
                                                    <h3 style="font-size:3vw;" id="overallbet2">0</h3>
                                                    <hr />
                                                    <p>Payout: <span id="txtpayout2">0</span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget-user-image" style="">
                                            <img class="img-circle" style="border: none; margin-top: 60px;" src="../../Photos/chickenhead1.png" alt="User Avatar">
                                        </div>
                                        <div class="box-footer" style="border-top: none; background-color: transparent; padding-top: 100px;">
                                            <div class="row">
                                                <div class="col-md-12">

                                                    <input type="button" class="btn btn-primary" id="btnbetblue" value="Choose Blue" style="width: 100%;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-xs-6 col-md-6">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                            <h4> Fight #:</h4>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <h4 id="lblfight">12</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-6 col-md-6">
                                     <div class="row">
                                        <div class="col-md-5 col-sm-5 col-xs-5 text-center">
                                            <h4> Status: </h4>
                                        </div>
                                        <div class="col-md-5 col-sm-5 col-xs-5">
                                            <input type="button" class="btn btn-primary" id="btnstatus" value="OPEN" style="width: 100%; background:green; border:none;" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 30px;">
                                <div class="col-md-12">
                                    <div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">
                                        <div class="small-box " style="background-color: rgba(73,73,73,0.5);">
                                            <div class="inner">
                                                <div class="pull-left">
                                                    <h4>Current Bet: <span id="txtcurbet">1000</span></h4>
                                                </div>
                                                <div class="pull-right">
                                                    <h4>Credits: <span id="txtcredits">1000</span></h4>
                                                </div>
                                            </div>
                                            <div class="inner">
                                                <hr />
                                                      
                                                <label id="errorred" style="color:#f82741" ></label>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                <div class="input-group margin">
                                                    <span class="input-group-btn">
                                                        <button type="button" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;">BET</button>
                                                    </span>
                                                    <input type="number" class="form-control" id="text_bet" placeholder="0.00" onkeypress="return isNumberKey(event);">
                                                    <div class="input-group-btn">
                                                        <button type="button" class="btn " id="btn_enter" onclick="enterclick();" style="background-color: rgba(73,73,73,0.5); color: white;" >ENTER</button>
                                                    </div>
                                                </div>
                                                    </div>
                                                        <input type="hidden" class="btn " id="btn_modal"  style="background-color: rgba(73,73,73,0.5); color: white;" data-toggle="modal" data-target="#modalForm" />
                                                    
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; " >
                                                         <input type="button" id="green100" class="btn btn-success "  value="100"  onclick="javascript:greenclick(this.value);"/>
                                              
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; " >
                                                         <input type="button" id="green200" class="btn btn-success " value="200" onclick="javascript: greenclick(this.value);" />
                                             
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; ">
                                                               
                                                         <input type="button" id="green300" class="btn btn-success"  value="300" onclick="javascript: greenclick(this.value);"/>
                                           
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; ">
                                                         <input type="button" id="green500" class="btn btn-success " value="500" onclick="javascript: greenclick(this.value);"/>
                                                
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 20px; ">
                                                         <input type="button" id="green1000" class="btn btn-success " value="1000" onclick="javascript: greenclick(this.value);"/>
                                               
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 20px; ">
                                                          <input type="button" id="green2000" class="btn btn-success"  value="2000" onclick="javascript: greenclick(this.value);"/>
                                              
                                                    </div>
                                                    <div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; ">
                                                          <input type="button" id="green10000" class="btn btn-success" value="10000" onclick="javascript: greenclick(this.value);" />
                                              
                                                    </div>
                                                    </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>--%>
