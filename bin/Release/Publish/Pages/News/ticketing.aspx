<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ticketing.aspx.cs" Inherits="SabongLive.Pages.News.ticketing" %>
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
                     <input type="button" id="btnAdmit" class="btn btn-flat form-control" onclick="onticket(1)" style="background-color: rgba(73,73,73,0.5); height:50px; font-size:25px; color: white;" value="ADMIT" />
                </div>
            </div>
            <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12">
                       <input type="button" id="btnManok" class="btn btn-flat form-control" onclick="onticket(2)" style="background-color: rgba(73,73,73,0.5); height: 50px; font-size: 25px; color: white;" value="MANOK" />
                </div>
            </div>
             <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12">
                       <input type="button" id="btncomp" class="btn btn-flat form-control" data-toggle='modal' data-target='#modal-sm' onclick="onticket(3)" style="background-color: rgba(73,73,73,0.5); height: 50px; font-size: 25px; color: white;" value="PARTIAL PAYMENT" />
                </div>
            </div>
            <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12">
                      <h4  style="color:white; text-align:center;"><strong>Total Amount</strong></h4>
                      <h3 id="lbltotalamount" style="color:white; text-align:center;">asdsda</h3>
                </div>
               
            </div>
            <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12">
                      <h4  style="color:white; text-align:center;"><strong>Pax Count</strong></h4>
                      <h3 id="lbltotalpax" style="color:white; text-align:center;">asdsda</h3>
                </div>
               
            </div>
            <div class="row rowclass">
                <div class="col-md-12 col-sm-12 col-xs-12">
                      <h4  style="color:white; text-align:center;"><strong>Manok Count</strong></h4>
                      <h3 id="lbltotalmanok" style="color:white; text-align:center;">asdsda</h3>
                </div>
               
            </div>
            
        </div>
    </div>

    
    
<div class="modal fade" id="modal-sm">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <h4 id="lblh4name">Amount</h4>
                        <input type="number" id="txtamount" class="form-control" value="" />
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" id="modalcloser" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" id="onenternew2" onclick="onconfirm()" >CONFIRM</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
    
            <input type="hidden" id="hftype"  value="0"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>

        $(function () {
            oncall();
        });


        function oncall() {
            var ids = "";
            $.ajax({
                type: "Post",
                url: 'Pages/News/ticketing.aspx/ongetall',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: ids }),
                dataType: "json",
                success: function (data) {
                    if (data.d.toString() != "") {
                        var split1 = data.d.toString().split("~");
                        $("#lbltotalamount").html(split1[0]);
                        $("#lbltotalpax").html(split1[1]);
                        $("#lbltotalmanok").html(split1[2]);
                    }

                },
                error: function (result) {
                    alert(result.responseText);
                }
            });

        }
        function onticket(evs) {
            if (evs == 1) {
                $("#hftype").val(1);
                onconfirm();
            }
            else if (evs == 2) {
                $("#hftype").val(2);
                onconfirm();
            }
            else if (evs == 3) {
                $("#hftype").val(3);

            }
                
        }

        function onconfirm()
        {
            if (confirm('Confirm to continue!')) {
                var type = $("#hftype").val();
                var amountt = $("#txtamount").val();

                if (type == "3" && amountt=="") {
                    type = "";
                }

                if (type != "") {
                    $.ajax({
                        type: "Post",
                        url: 'Pages/News/ticketing.aspx/onticketers',
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ types: type, amounts: amountt }),
                        dataType: "json",
                        success: function (data) {
                            if (data.d.toString() != "") {
                                oncall();
                                window.open('printticket?payid=' + data.d.toString(), '_newtab');
                            }
                        },
                        error: function (result) {
                            alert(result.responseText);
                        }
                    });
                }
                else {
                    alert("Please input on the textbox!");
                }
            }
        }

    </script>

</asp:Content>
