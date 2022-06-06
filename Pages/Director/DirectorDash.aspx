<%@ Page Title="" Language="C#" MasterPageFile="~/AgentMaster.Master" AutoEventWireup="true" CodeBehind="DirectorDash.aspx.cs" Inherits="SabongLive.Pages.Director.DirectorDash" %>

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
        .rowclass
        {
            margin-bottom:20px;
        }
    </style>
  
</asp:Content>
<asp:Content ContentPlaceHolderID="content" runat="server" ID="content2">
    
        <input id="hdId" type="hidden" />
        <input id="hdUserName" type="hidden" />
        <input id="hdchoice" type="hidden" value="0" />
    <section class="content-header">

        <section class="content-header">
            <h1><i class="fa fa-circle" style="color: green;"></i>&nbsp;<span class="btn btn-danger">LIVE</span>
            </h1>

            <input type="button" id="btnwith" class="btn btn-flat pull-right" style="background-color: rgba(73,73,73,0.5); color: white;" value="Withdraw" />
            <input type="button" id="btndep" class="btn btn-flat pull-right" style="background-color: rgba(73,73,73,0.5); color: white;" value="Deposit" />
          
           
        </section>
        <hr />
        <div class="page-title">
            <div class="row" style="margin-top: 40px;">
                <div class="col-md-7">
                   <div class="row" >
                        <div class="col-md-12">
                                <p style="color: white; font-size: 20px;text-align:center; font-weight: 10px;" id="titlebar">Please standby for the next round!!!!!!!!!!!!</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            
<iframe style="width:100%; height:400px;" src="https://rtsp.me/embed/5eFAQtGe/" frameborder="0" allowfullscreen></iframe>
<%--                          
  <image src="http://192.168.6.14:554" class="image-fluid" style="width:100%; height:400px;"></image>--%>
                           <%-- <iframe class=" img-fluid " style="width:100%; height:400px;"
                            src="http://192.168.6.146:554">
                            </iframe>
                            <iframe class="image-fluid" style="width:100%; height:400px;" src="https://rtsp.me/embed/GskEDAS3/" frameborder="0" allowfullscreen></iframe>
                            
                            
                            --%>
                        </div>
                    </div>
                     <div class="row" >
                        <div class="col-md-12">
                            <div class="marquee">
                                <p style="color: white; font-size: 20px; font-weight: 10px;" id="lblannouncement">Please standby for the next round!!!!!!!!!!!!</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    
                 <%--Director's view @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row rowclass">
                                <div class="col-md-12">
                                     <div class="input-group ">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;">TITLE</button>
                                        </span>
                                        <input type="text" class="form-control" id="text_title" >
                                        <div class="input-group-btn">
                                            <button type="button" class="btn " id="btn_title" style="background-color: rgba(73,73,73,0.5); color: white;" >Go Live</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                             <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_message" >
                                         <div class="input-group-btn">
                                       <input type="button" id="btnStatuser" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="SET STATUS" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_openbet" >
                                         <div class="input-group-btn">
                                       <input type="button" id="btnOpenbet" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="OPEN BET" onclick="chooseDirect(this)" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_closebet" >
                                         <div class="input-group-btn">
                                         <input type="button" id="btnCloseBet" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="CLOSE BET" onclick="chooseDirect(this)" />
                                       </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_lastcall"  >
                                         <div class="input-group-btn">
                                          <input type="button" id="btnLastcall" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="LASTCALL BET" onclick="chooseDirect(this)" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row rowclass">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="text_cancelbet" >
                                         <div class="input-group-btn">
                                        <input type="button" id="btnCancelBet" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="CANCEL BET" onclick="chooseDirect(this)" />
                                        </div>
                                    </div>
                                </div>
                               
                            </div>
                            <div class="row rowclass">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <input type="button" id="btnAnnouce" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;" value="ANNOUNCE" onclick="chooseDirect(this)" />
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <input type="button" id="btnRed" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white; width: 100%;" value="RED" onclick="chooseannounce(this)"  />
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <input type="button" id="btnBlue" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white; width: 100%;" value="BLUE" onclick="chooseannounce(this)" />
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <input type="button" id="btnDraw" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white; width: 100%;" value="Draw" onclick="chooseannounce(this)" />
                                </div>
                            </div>
                        </div>
                    </div>

                 <%--Player's view @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--%>
                    <div class="row"> 
                        <div class="col-md-12" id="announcemessage">

                 
                            
                        </div>
                    </div>

                </div>
        
            </div>

            <div class="row" style="margin-top: 20px;">
                <div class="col-md-3">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Count Board</h3>
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
                                        <label class="label label-danger">Pula</label></td>
                                    <td>
                                        <div class="progress progress-xs">
                                            <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                                        </div>
                                    </td>
                                    <td><span class="badge bg-red">55%</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="label label-primary">Bughaw</label></td>
                                    <td>
                                        <div class="progress progress-xs">
                                            <div class="progress-bar progress-bar-primary" style="width: 70%"></div>
                                        </div>
                                    </td>
                                    <td><span class="badge bg-blue">70%</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="label label-warning">Draw</label></td>
                                    <td>
                                        <div class="progress progress-xs">
                                            <div class="progress-bar progress-bar-yellow" style="width: 50%"></div>
                                        </div>
                                    </td>
                                    <td><span class="badge bg-yellow">30%</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="label label-default">Cancelled</label></td>
                                    <td>
                                        <div class="progress progress-xs">
                                            <div class="progress-bar " style="width: 20%; background-color: darkgrey;"></div>
                                        </div>
                                    </td>
                                    <td><span class="badge bg-primary">5%</span></td>
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
                                <label class="label" id="lblmanok"></label></h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <input type="button" class="btn btn-danger pull-left" id="btnyes" value="Yes" />
                            <input type="button" class="btn btn-default pull-right" id="btnno" value="No"  data-dismiss="modal" />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>

    </section>
</asp:Content>


<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">

        <script src="../../Scripts/jquery-3.4.1.min.js"></script>
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
       

              if (name.length > 0) {
                  chatHub.server.connect(name);

              }


              $('#btn_title').click(function () {

                  $('#titlebar').html($('#text_title').val());
                   
                  var title = $('#text_title').val();
                  var going = $('#btn_title').html();
                  console.log(going);

                      $.ajax({
                          type: "POST",
                          url: "Pages/Players/LiveBattle.aspx/OnSaveEvent",
                          data: JSON.stringify({ title: title, status:going}),
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
                  
                  if (this.value== "SET STATUS") {

                      this.value = "REOPEN";
                  } else if (this.value=="REOPEN") {

                      this.value = "SET STATUS";
                  }
                  console.log(this.value);
                  chatHub.server.announcerets(this.id, message, status );
              });

              // Send Button Click Event
              $('#btnyes').click(function () {

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
                              data: JSON.stringify({ username: userName, bet: msg, curdate: date, fightno: fight }),
                              contentType: 'application/json; charset=utf-8',
                              dataType: 'json',
                              success: function (result) {
                                  console.log('Success');
                                  $("#txtcredits").html(parseFloat(parseFloat(curcredits).toFixed(2)) - parseFloat(parseFloat(msg).toFixed(2)));

                              }, error: function (result) {
                                  console.log(result.responseText);
                              }
                          });


                          $("#text_bet").val('');
                          $("#txtcurbet").html(msg);
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
                              $('#lblmanok').html("RED SIDE?");
                          }
                          else if ($('#hdchoice').val() == "2") {
                              $('#lblmanok').attr("style", "color:blue;");
                              $('#lblmanok').html("BLUE SIDE?");
                          }

                          $('#btn_modal').click();
                      } else {
                          $('#errorred').html("Please choose your side");
                      }
                  }
              });
          }

          function registerClientMethods(chatHub) {


              // Calls when user successfully logged in
              chatHub.client.onConnected = function (id, userName, Announce, messages,GoLive) {

                  $('#hdId').val(id);
                  $('#hdUserName').val(userName);
                  // Add Existing Messages

                  if (GoLive.Status != "" && GoLive.Status != null) {
                      eventitler(GoLive.Title, GoLive.Status);

                      console.log(GoLive.Status+"sdsd");
                      if (Announce.Status != "") {
                          AnnounceStatus(Announce.Button, Announce.Message, Announce.Status);

                          if (Announce.Status == "SET STATUS") {
                              var credits = '<%= this.StartCredits %>';
                              $("#txtcredits").html(credits);
                          }
                      }
                  }

                  if (messages.UserName != "") {

                      AddMessage(messages.UserName, messages.Message, messages.Time, messages.Choice, messages.Total1, messages.Total2);

                  }
                  console.log(Announce.Status);
              }


              chatHub.client.onUserDisconnected = function (id, userName) {

              }

              chatHub.client.announceEvent = function (title, status) {
                  eventitler(title, status);
                  console.log("gggg");
              }

              chatHub.client.messageReceived = function (userName, message, time,choice,total1,total2) {
                  AddMessage(userName, message, time,choice,total1,total2);
              }

              chatHub.client.announceStatus = function (button, message, status) {
                  AnnounceStatus(button, message, status);

                  var userName = $('#hdUserName').val();

                  $.ajax({
                      type: "POST",
                      url: "Pages/Players/LiveBattle.aspx/OnGetCredits",
                      data: JSON.stringify({ username: userName }),
                      contentType: 'application/json; charset=utf-8',
                      dataType: 'json',
                      success: function (result) {
                          console.log("Success");
                          $("#txtcredits").html(result.d);

                      }, error: function (result) {
                          console.log(result.responseText);
                      }
                  });
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
              $('#announcemessage').html('');
              var code;
              if (status == "SET STATUS") {
                  $('#btnStatuser').val("REOPEN");
                  $('#text_message').val(message);
                  code = $(' <div class="row">'+
                      '<div class="col-md-12 small-box"  style ="background-color: rgba(73,73,73,0.5); color:white; text-align:center;" >'+
                      '<h4 id="lblann">'
                      + message+
                            '</h4>'+
                       ' </div >'+
                      '</div >');
                  console.log('a');
              }
              else if (status == "REOPEN") {
                  $('#btnStatuser').val("SET STATUS");
                  $('#text_message').val(message);

                  code = $(' <div class="row">'+
                      '<div class="col-md-12" >'+
                      '<div class="row" style="margin-bottom:20px;">'+
                          '<div class="col-xs-6 col-sm-6 col-md-6 m-0" id="divred" tabindex="1" onclick="divclicker1(this)">'+
                              '<div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">'+
                                  '<div class="widget-user-header" style="padding: 0px; background-color: transparent;">'+
                                      '<div class="small-box " style="background-color: rgba(73,73,73,0.5); border-bottom-left-radius: 50%; border-bottom-right-radius: 50%; padding-bottom: 40px; text-align: center;">'+
                                       '   <div class="inner">'+
                                          '    <h3 style="font-size:3vw;" id="overallbet1">0</h3>'+
                                           '   <hr />'+
                                          '    <p>Payout: <span id="txtpayout1">0</span></p>'+
                                       '   </div>'+
                                   '   </div>'+
                                 ' </div>'+
                               '   <div class="widget-user-image" style="">'+
                                   '   <img class="img-circle" style="border: none; margin-top: 60px;" src="../../Photos/chickenhead2.png" alt="User Avatar">'+
                                     '   </div>'+
                                    '  <div class="box-footer" style="border-top: none; background-color: transparent; padding-top: 100px;">'+
                                       '   <div class="row">'+
                                            '  <div class="col-md-12">'+

                                                '  <input type="button" class="btn btn-danger" id="btnbetred" value="Choose Red" style="width: 100%;" />'+
                                             ' </div>'+
                                        '  </div>'+
                                     ' </div>'+
                                 ' </div>'+
                             ' </div>'+
                             ' <div class="col-xs-6 col-sm-6 col-md-6  m-0" id="divblue" tabindex="1" onclick="divclicker2(this)">'+
                                '  <div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">'+
                                    '  <div class="widget-user-header" style="padding: 0px; background-color: transparent;">'+
                                        '  <div class="small-box " style="background-color: rgba(73,73,73,0.5); border-bottom-left-radius: 50%; border-bottom-right-radius: 50%; padding-bottom: 40px; text-align: center;">'+
                                           '   <div class="inner">'+
                                               '   <h3 style="font-size:3vw;" id="overallbet2">0</h3>'+
                                                '  <hr />'+
                                                '  <p>Payout: <span id="txtpayout2">0</span></p>'+
                                           '   </div>'+
                                         ' </div>'+
                                     ' </div>'+
                                    '  <div class="widget-user-image" style="">'+
                                       '   <img class="img-circle" style="border: none; margin-top: 60px;" src="../../Photos/chickenhead1.png" alt="User Avatar">'+
                                      '  </div>'+
                                         ' <div class="box-footer" style="border-top: none; background-color: transparent; padding-top: 100px;">'+
                                            '  <div class="row">'+
                                                '  <div class="col-md-12">'+

                                                   '   <input type="button" class="btn btn-primary" id="btnbetblue" value="Choose Blue" style="width: 100%;" />'+
                                                '  </div>'+
                                             ' </div>'+
                                        '  </div>'+
                                     ' </div>'+
                                 ' </div>'+
                             ' </div>'+
                             ' <div class="row">'+
                                '  <div class="col-sm-6 col-xs-6 col-md-6">'+
                                    '  <div class="row">'+
                                        '  <div class="col-md-6 col-sm-6 col-xs-6 text-center">'+
                                             ' <h4> Fight #:</h4>'+
                                         ' </div>'+
                                          '<div class="col-md-6 col-sm-6 col-xs-6">'+
                                             ' <h4 id="lblfight">12</h4>'+
                                         ' </div>'+
                                     ' </div>'+
                                 ' </div>'+
                                 ' <div class="col-sm-6 col-xs-6 col-md-6">'+
                                     '<div class="row">'+
                                         ' <div class="col-md-5 col-sm-5 col-xs-5 text-center">'+
                                          '    <h4> Status: </h4>'+
                                         '</div>'+
                                         ' <div class="col-md-5 col-sm-5 col-xs-5">'+
                                              '<input type="button" class="btn btn-primary" id="btnstatus" value="OPEN" style="width: 100%; background:green; border:none;" />'+
                                         ' </div>'+
                                      '</div>'+
                                  '</div>'+
                              '</div>'+
                              '<div class="row" style="margin-top: 30px;">'+
                                 ' <div class="col-md-12">'+
                                      '<div class="box box-widget widget-user" style="background-color: transparent; box-shadow: none;">'+
                                          '<div class="small-box " style="background-color: rgba(73,73,73,0.5);">'+
                                              '<div class="inner">'+
                                                 ' <div class="pull-left">'+
                                                     ' <h4>Current Bet: <span id="txtcurbet">0</span></h4>'+
                                                  '</div>'+
                                                  '<div class="pull-right">'+
                                                     ' <h4>Credits: <span id="txtcredits">0</span></h4>'+
                                                  '</div>'+
                                             ' </div>'+
                                             ' <div class="inner">'+
                                                  '<hr />'+

                                                  '<label id="errorred" style="color:#f82741" ></label>'+

                                                 ' <div class="row">'+
                                                      '<div class="col-md-12">'+
                                                          '<div class="input-group margin">'+
                                                              '<span class="input-group-btn">'+
                                                                 ' <button type="button" class="btn btn-flat" style="background-color: rgba(73,73,73,0.5); color: white;">BET</button>'+
                                                              '</span>'+
                                                              '<input type="number" class="form-control" id="text_bet" placeholder="0.00" onkeypress="return isNumberKey(event);">'+
                                                                  '<div class="input-group-btn">'+
                                                                      '<button type="button" class="btn " id="btn_enter" onclick="enterclick();" style="background-color: rgba(73,73,73,0.5); color: white;" >ENTER</button>'+
                                                                  '</div>'+
                                                '</div>'+
                                                          '</div>'+
                                                          '<input type="hidden" class="btn " id="btn_modal" style="background-color: rgba(73,73,73,0.5); color: white;" data-toggle="modal" data-target="#modalForm" />'+

                                                      '</div>'+
                                                      '<div class="row">'+
                                                          '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; " >'+
                                                              '<input type="button" id="green100" class="btn btn-success " value="100" onclick="javascript:greenclick(this.value);" />'+

                                                         ' </div>'+
                                                          '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; " >'+
                                                              '<input type="button" id="green200" class="btn btn-success " value="200" onclick="javascript: greenclick(this.value);" />'+

                                                          '</div>'+
                                                          '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; ">'+

                                                             ' <input type="button" id="green300" class="btn btn-success" value="300" onclick="javascript: greenclick(this.value);" />'+

                                                          '</div>'+
                                                          '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; ">'+
                                                              '<input type="button" id="green500" class="btn btn-success " value="500" onclick="javascript: greenclick(this.value);" />'+

                                                          '</div>'+
                                                          '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 20px; ">'+
                                                              '<input type="button" id="green1000" class="btn btn-success " value="1000" onclick="javascript: greenclick(this.value);" />'+

                                                          '</div>'+
                                                          '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 20px; ">'+
                                                              '<input type="button" id="green2000" class="btn btn-success" value="2000" onclick="javascript: greenclick(this.value);" />'+

                                                          '</div>'+
                                                          '<div class="col-xs-1 col-sm-1 col-md-1" style="margin-right: 15px; ">'+
                                                              '<input type="button" id="green10000" class="btn btn-success" value="10000" onclick="javascript: greenclick(this.value);" />'+

                                                          '</div>'+
                                                      '</div>'+
                                                 ' </div>'+
                                             ' </div>'+

                                          '</div>'+
                                      '</div>'+

                                 ' </div>'+
                             ' </div>'+
                      '</div>');

                  console.log('b');
              } 


              $("#announcemessage").append(code);

          }

          function AddMessage(userName, message, time, choice, total1,total2) {

              var CurrUser = $('#hdUserName').val();
              var obetq = total1;
              var obetw = total2;
              var obet1 = obetq, obet2 = obetw;

              if (choice == "1") {
                  $('#overallbet1').html(parseFloat(parseFloat(obetq).toFixed(2)) + parseFloat(parseFloat(parseFloat(message)).toFixed(2)));
                  obet1=(parseFloat(parseFloat(obetq).toFixed(2)) + parseFloat(parseFloat(parseFloat(message)).toFixed(2)));
              }
              else if (choice == "2") {
                  $('#overallbet2').html(parseFloat(parseFloat(obetw).toFixed(2)) + parseFloat(parseFloat(parseFloat(message)).toFixed(2)));
                  obet2=(parseFloat(parseFloat(obetw).toFixed(2)) + parseFloat(parseFloat(parseFloat(message)).toFixed(2)));
              }

              var payout1 = parseFloat(((parseFloat(parseFloat(obet2).toFixed(2)) + parseFloat(parseFloat(obet1).toFixed(2))) / parseFloat(parseFloat(obet1).toFixed(2))) + 187).toFixed(2);

              var payout2 = parseFloat(((parseFloat(parseFloat(obet1).toFixed(2)) + parseFloat(parseFloat(obet2).toFixed(2))) / parseFloat(parseFloat(obet2).toFixed(2))) + 187).toFixed(2);
; 

              $('#txtpayout1').html(payout1);

              $('#txtpayout2').html(payout2);

              console.log("asd2");
              console.log("Payout1=(" + parseFloat(parseFloat(obet2).toFixed(2)) + "+" + parseFloat(parseFloat(obet1).toFixed(2)) + ")/" + parseFloat(parseFloat(obet1).toFixed(2))+"+187");
              console.log("Payout2=(" + parseFloat(parseFloat(obet1).toFixed(2)) + "+" + parseFloat(parseFloat(obet2).toFixed(2)) + ")/" + parseFloat(parseFloat(obet2).toFixed(2)) + "+187");
             
              console.log(choice);

          }

          function divclicker1(evs) {
              $('#divblue').attr("style", "background:transparent;");
              $(evs).attr("style", "background: rgba(255,255,255, 0.5);");
              $('#hdchoice').val("1");
          } function divclicker2(evs) {
              $('#divred').attr("style", "background:transparent;");
              $(evs).attr("style", "background: rgba(255,255,255, 0.5);");
              $('#hdchoice').val("2");
          }

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

              if (evs.id== "btnRed") {
                  $(evs).attr("style", "background-color: red; color: white; width: 100%;");
              }
              else if (evs.id == "btnBlue") {
                  $(evs).attr("style", "background-color: blue; color: white; width: 100%;");
              }
              else if (evs.id == "btnDraw") {
                  $(evs).attr("style", "background-color: grey; color: white; width: 100%;");
              }
          }

          function chooseDirect(evs) {

              $('#btnOpenbet').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
              $('#btnCloseBet').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
              $('#btnCancelBet').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
              $('#btnAnnouce').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");
              $('#btnLastcall').attr("style", "background-color: rgba(73,73,73,0.5); color: white;");

              if (evs.id == "btnOpenbet") {
                  $(evs).attr("style", "background-color: maroon; color: white; width: 100%;");
                  $('#lblannouncement').html($('#text_openbet').val());
              }
              else if (evs.id == "btnCloseBet") {
                  $(evs).attr("style", "background-color: maroon; color: white; width: 100%;");
                  $('#lblannouncement').html($('#text_closebet').val());
              }
              else if (evs.id == "btnCancelBet") {
                  $(evs).attr("style", "background-color: maroon; color: white; width: 100%;");
                  $('#lblannouncement').html($('#text_cancelbet').val());
              }
              else if (evs.id == "btnLastcall") {
                  $(evs).attr("style", "background-color: maroon; color: white; width: 100%;");
                  $('#lblannouncement').html($('#text_lastcall').val());
              }
              else if (evs.id == "btnAnnouce") {
                  $(evs).attr("style", "background-color: maroon; color: white; width: 100%;");
              }
             
                
          }
      </script>
</asp:Content>
