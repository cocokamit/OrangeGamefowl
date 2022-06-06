<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="monton.aspx.cs" Inherits="SabongLive.Pages.News.monton" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
            background-color: #5b5b5b;
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
        .entryclass {
            padding-top:20px;
            
            padding-bottom:20px;
            text-align:center;
            border:1px dashed #b0b0b0;
        }
        .entryclass:hover {
            background-color:#5b5b5b;
        }

         .entryclass2 {
            text-align:center;
            border:1px dashed #b0b0b0;
        }
        .entryclass2:hover {
            background-color:#5b5b5b;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <hr />
    <div class="row">
        <div class="col-md-10">
            <div class="row">
                <div class="col-xs-6 col-sm-3 col-md-3 m-0">
                    <asp:DropDownList runat="server" ID="ddl_gamename" CssClass="form-control" ClientIDMode="Static">
                        <asp:ListItem Value="asdsadas" Text="asdsada"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-3 m-0">
                    <input type="button" id="btnGo" value="Go" class="btn btn-success" />
                    <input type="button" id="btnNew" value="New" class="btn btn-default" />
                </div>
                <div class="col-md-1">
                </div>
            </div>
        </div>
        
        <div class="col-md-2">
            <div class="row">
                <div class="col-md-12">
                    <h4 id="totalrentas" style="color:white;"></h4>
                </div>
                <div class="col-md-12">
                    <h4 id="totalariba" style="color:white;"></h4>
                </div>
            </div>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col-md-12">

            <div class=" card">
                <div class=" card-body p-0">
                    <div class="row">
                        <div class="col-md-3" style="text-align:center; color:white;"><h4 id="fightnumber">0</h4></div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-xs-12 col-sm-5 col-md-5 m-0">
                                    <input type="text" id="txtname" class="form-control" placeholder="Name" />
                                    <br />
                                </div>
                                <div class="col-xs-12 col-sm-5 col-md-5 m-0">
                                    <input type="number" id="txtamount" class="form-control" placeholder="Amount" />
                                    <br />
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 m-0">
                                    <input type="button" id="btnenter" class="btn btn-success" value="Enter" />
                                    <br />
                                </div>
                            </div>

                        </div>
                        <div class="col-md-3"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">
            <table id="tblmonton" class=" table table-responsive">
                <thead style="color: white;">
                    <tr>
                        <th></th>
                        <th style="background-color:red;">Meron</th>
                        <th></th>
                        <th style="background-color:blue;">Wala</th>
                        <th></th>
                        <th></th>
                        <th>Monton</th>
                        <th>Padaug</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody style="color: white;">
                </tbody>
            </table>
        </div>
    </div>

    
<div class="modal fade" id="modal-sm">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <h4>Name</h4>
                        <input type="text" id="txtname2" class="form-control" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h4>Amount</h4>
                        <input type="number" id="txtamount2" class="form-control" value="" />
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" id="modalcloser" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" id="onenternew2" >CONFIRM</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
    

       
<div class="modal fade" id="modal-padaug">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <h4 style="background-color:red; color:white;">Meron</h4>
                        <input type="text" id="txtmeron1" class="form-control" disabled />
                        
                        <input type="text" id="txtmeronamount1" class="form-control" value="0" disabled />
                    </div>
                    <div class="col-md-6">
                        <h4 style="background-color:blue; color:white;">Wala</h4>
                        <input type="text" id="txtwala1" class="form-control"  disabled/>
                        
                        <input type="text" id="txtwalaamount1" class="form-control" value="0" disabled />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <h4>Diff:</h4>
                        <input type="text" id="txtdiff" class="form-control" value="0" />
                    </div>
                    <div class="col-md-6">
                        <h4>Amount:</h4>
                        <input type="number" id="txtcollectamount1" class="form-control" value="" />
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-12">
                        <select id="ddl_winner" style="text-align:center;" class="form-control" >
                            <option value="0" selected>--Select Winner!--</option>
                            <option value="Meron">Meron Wins</option>
                            <option value="Wala">Wala Wins</option>
                            <option value="Draw">Draw</option>
                            <option value="Cancel">Canceled</option>
                        </select>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12" style="text-align:center;">
                       <a id="onddlchange" class='btn btn-warning'><strong>PRINT </strong><i class=" glyphicon glyphicon-print"></i></a>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" id="modalcloser2" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
    <input type="button" id="btnclickerist" style="display:none;"/>
    <input type="hidden" id="hffightid" value="0"/>
    <input type="hidden" id="hfbtnid" value="0"/>
    <input type="hidden" id="hfmontonmatchid" value="0"/>
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



        var fightno = '<%=this.fightno%>';
        var montonno = '<%=this.montonno%>';
            var das = "";
            var iddd = "";
            function registerEvents(chatHub) {

                ongo();
                console.log(fightno);
                console.log(montonno);
                $("#fightnumber").html("Fight No. 1");

                $("#btnNew").click(function () {
                    var name = "";
                    if (confirm("Are you sure you want to change matching?")) {
                        $.ajax({
                            type: "Post",
                            url: 'Pages/News/monton.aspx/onnewcontent',
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ id: name }),
                            dataType: "json",
                            success: function (data) {
                                if (data.d.toString() != null) {
                                    var split1 = data.d.toString().split("~");
                                    console.log(split1);
                                    $("#ddl_gamename").html("");
                                    for (var i = 0; i < split1.length - 1; i++) {
                                        var split2 = split1[i].split("-");
                                        var newOption = "<option value='" + split2[1] + "'>" + split2[0] + "</option>";
                                        $("#ddl_gamename").append(newOption);
                                    }
                                    fightno = '1';
                                    $("#fightnumber").html("Fight No. " + fightno);
                                    montonno = data.d.toString().split("~")[0].split("-")[1];
                                    console.log(montonno);

                                    chatHub.server.onGos();
                                }
                            },
                            error: function (result) {
                                alert(result);
                            }
                        });
                    }
                });

                $("#btnGo").click(function () {
                    chatHub.server.onGos();
                });

                $("#btnenter").click(function () {
                    var meronn = $("#txtname").val();
                    var merona = $("#txtamount").val();
                    if (meronn == "" || merona == "") {
                        alert("Please fill in the textboxes!");
                    } else {
                        $.ajax({
                            type: "Post",
                            url: 'Pages/News/monton.aspx/onenternew',
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ id: fightno, montonid: montonno, MeronName: meronn, MeronAmount: merona }),
                            dataType: "json",
                            success: function (data) {
                                $("#txtname").val("");
                                $("#txtamount").val("");
                                chatHub.server.onGos();
                            },
                            error: function (result) {
                                alert(result.responseText);
                            }
                        });
                    }
                });

                $("#onenternew2").click(function () {
                    var walan = $("#txtname2").val();
                    var walaa = $("#txtamount2").val();
                    var evs = $("#hffightid").val();
                    var sav = $("#hfbtnid").val();

                    if (walan == "" || walaa == "") {
                        alert("Please fill in the textboxes!");
                    }
                    else {
                        $.ajax({
                            type: "Post",
                            url: 'Pages/News/monton.aspx/onenternew2',
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ id: evs, WalaName: walan, WalaAmount: walaa }),
                            dataType: "json",
                            success: function (data) {
                                $("#txtname2").val("");
                                $("#txtamount2").val("");
                                chatHub.server.onGos();
                                $("#modalcloser").click();
                            },
                            error: function (result) {
                                alert(result.responseText);
                            }
                        });
                    }
                });
                $("#onddlchange").click(function () {

                    if (confirm("Save input data?")) {
                        var masyada = $("#txtcollectamount1").val();
                        var status = $("#ddl_winner :selected").val();
                        var evs = $("#hfmontonmatchid").val()

                        $.ajax({
                            type: "Post",
                            url: 'Pages/News/monton.aspx/onddlchange',
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ id: evs, statusside: status, equalizer: masyada }),
                            dataType: "json",
                            success: function (data) {
                                chatHub.server.onGos();
                                window.open('printpadaug?payid=' + evs, '_newtab');
                            },
                            error: function (result) {
                                alert(result.responseText);
                            }
                        });
                    }
                });

                $("#btnclickerist").click(function () {
                    if (confirm("Remove this entry?")) {
                        var ens = das;
                        var evs = iddd;
                        var enss = $(ens).attr("name");
                        $.ajax({
                            type: "Post",
                            url: 'Pages/News/monton.aspx/removeentry',
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ id: evs, statusside: enss }),
                            dataType: "json",
                            success: function (data) {
                                chatHub.server.onGos();
                            },
                            error: function (result) {
                                alert(result.responseText);
                            }
                        });
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


                chatHub.client.ongo = function () {
                    ongo();
                }
            }

            function removeentry(evs, ens) {
                das = ens;
                iddd = evs;
                $("#btnclickerist").click();
            }
     

        function ongo() {
            var name = "";
            console.log("aaaaa");
            var idd = $("#ddl_gamename :selected").val();
            $.ajax({
                type: "Post",
                url: 'Pages/News/monton.aspx/ongocontent',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: idd }),
                dataType: "json",
                success: function (data) {
                    fightno = "1";
                    $("#fightnumber").html("Fight No." + fightno);
                    if (data.d.toString() != null) {
                        var split1 = data.d.toString().split("=");
                        console.log(split1);
                        var dal = document.getElementById('tblmonton');
                        var tbodyRef = dal.getElementsByTagName('tbody')[0];
                        tbodyRef.innerHTML = "";
                        for (var i = 0; i < split1.length; i++) {

                            var tr = tbodyRef.insertRow(-1);
                            var tabCell = tr.insertCell(-1);
                            var split2 = split1[i].split("=");
                            if (split2[0] != "") {
                                for (var j = 0; j < split2.length; j++) {

                                    var split3 = split2[j].split("~");
                                    fightno = split3[7].trim();
                                    $("#fightnumber").html("Fight No." + fightno);

                                    //Fight Number
                                    tabCell.innerHTML = "<h4 style='text-align:center;'>" + (split3[1]) + ".)&nbsp;</h4>";

                                    var entryclass2 = "";
                                    var entryclass3 = "";
                                    var merons = "'Meron'";
                                    var walas = "'Wala'";
                                    if (split3[6] == "") {
                                        entryclass2 = "<div class='col-md-2' style='align-text:right;'><div class='entryclass2' onclick ='removeentry(" + split3[0] + ",this)' name='Meron'>X</div></div>";
                                        entryclass3 = "<div class='col-md-2' style='align-text:right;'><div class='entryclass2' onclick ='removeentry(" + split3[0] + ",this)' name='Wala' >X</div></div>";
                                    }

                                    //Meron Side
                                    tabCell = tr.insertCell(-1);
                                    if (split3[2] == "") {
                                        tabCell.innerHTML = "<div class='entryclass' data-toggle='modal' data-target='#modal-sm' onclick='getid(" + split3[0] + ",this)'>Enter Entry</div>";
                                    }
                                    else {
                                        tabCell.innerHTML = "<div class='row'><div class='col-md-10'><h3 style='margin-top:0;'>" + split3[2] + "</h3></div>" + entryclass2 + "<div class='col-md-12'><h4>" + Comma(split3[3]) + "</h4></div></div>";
                                    }
                                    //Versus
                                    tabCell = tr.insertCell(-1);
                                    tabCell.innerHTML = "<h3>VS</h3>";

                                    //Wala Side
                                    tabCell = tr.insertCell(-1);
                                    if (split3[4] == "") {
                                        tabCell.innerHTML = "<div class='entryclass' data-toggle='modal' data-target='#modal-sm' onclick='getid(" + split3[0] + ",this)' >Enter Entry</div>";
                                    }
                                    else {
                                        tabCell.innerHTML = "<div class='row'><div class='col-md-10'><h3 style='margin-top:0;'>" + split3[4] + "</h3></div>" + entryclass3 + "<div class='col-md-12'><h4>" + Comma(split3[5]) + "<h4/><div/></div>";
                                    }

                                    var disabler = "";
                                    if (split3[6] == "canceled") {
                                        disabler = "disabled";
                                    }

                                    //Meron button
                                    tabCell = tr.insertCell(-1);
                                    if (split3[2] != "") {
                                        tabCell.innerHTML = "<a  href='printmeronwala?&payid=" + split3[0] + "&tpe=Meron' target='_new' class='btn btn-danger' " + disabler + ">Meron </a> ";
                                    }
                                    else {
                                        tabCell.innerHTML = "<input type='button' id='btn" + split3[0] + "' Value='Meron' class='btn btn-secondary' disabled/>";
                                    }

                                    //Wala button
                                    tabCell = tr.insertCell(-1);
                                    if (split3[4] != "") {
                                        tabCell.innerHTML = "<a  href='printmeronwala?&payid=" + split3[0] + "&tpe=Wala' target='_new' class='btn btn-primary' " + disabler + ">Wala </a> ";
                                    }
                                    else {
                                        tabCell.innerHTML = "<input type='button' id='btn" + split3[0] + "' Value='Wala' class='btn btn-secondary' disabled/>";
                                    }

                                    //Monton button
                                    tabCell = tr.insertCell(-1);
                                    if (split3[4] != "") {
                                        tabCell.innerHTML = "<a  href='printmeronwala?&payid=" + split3[0] + "&tpe=Monton' target='_new' class='btn btn-warning' " + disabler + ">Monton </a> ";
                                    }
                                    else {
                                        tabCell.innerHTML = "<input type='button' id='btn" + split3[0] + "' Value='Monton' class='btn btn-secondary' disabled/>";
                                    }

                                    //Padaug button
                                    tabCell = tr.insertCell(-1);
                                    if (split3[4] != "") {
                                        tabCell.innerHTML = "<input type='button' data-toggle='modal' data-target='#modal-padaug' onclick='onpadaug(" + split3[0] + ")' id='btn" + split3[0] + "' Value='Padaug' class='btn btn-info' " + disabler + " />";
                                    }
                                    else {
                                        tabCell.innerHTML = "<input type='button' id='btn" + split3[0] + "' Value='Padaug' class='btn btn-secondary' disabled/>";
                                    }

                                    tabCell = tr.insertCell(-1);
                                    var classadd = "";
                                    if (split3[6] == "Meron") {
                                        classadd = "style='color:red;'";
                                    }
                                    else if (split3[6] == "Wala") {
                                        classadd = "style='color:blue;'";
                                    }
                                    else if (split3[6] == "Draw") {
                                        classadd = "style='color:grey;'";
                                    } else {
                                        classadd = "style='color:white;'";
                                    }

                                    tabCell.innerHTML = "<h3 " + classadd + " >" + split3[6] + "</h3>";

                                    $("#totalrentas").html("Total Rentas: "+Comma(split3[8]));
                                    $("#totalariba").html("Total Ariba: "+Comma(split3[9]));
                                }
                            }

                        }
                    }
                },
                error: function (result) {
                    alert(result.responseText);
                }
            });

        }

        function getid(evs, sav) {
            $("#hffightid").val(evs);
            $("#hfbtnid").val($(sav).attr("id"));
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

        function onpadaug( evs) {
            $.ajax({
                type: "Post",
                url: 'Pages/News/monton.aspx/onpadaug',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: evs }),
                dataType: "json",
                success: function (data) {

                    if (data.d.toString() != "") {
                        var split1 = data.d.split("~");
                        console.log(split1);
                        $("#txtmeron1").val(split1[2]);
                        $("#txtwala1").val(split1[3]);
                        $("#txtmeronamount1").val(Comma(split1[4]));
                        $("#txtwalaamount1").val(Comma(split1[5]));
                        $("#txtdiff").val(Comma(split1[9]));
                        $("#txtcollectamount1").val(split1[8]);
                        $("#hfmontonmatchid").val(split1[0]);
                        $("#ddl_winner").val(split1[10]);
                    }
                },
                error: function (result) {
                    alert(result.responseText);
                }
            });
        }


       
       
        </script>
</asp:Content>
