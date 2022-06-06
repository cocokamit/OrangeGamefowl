<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="administrator.aspx.cs" Inherits="SabongLive.Pages.News.administrator" %>
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

        #rectangle {
          width: 200px;
          height: 100px;
          background: red;
        }


           .card {
            box-shadow: 0 0 1px rgba(0,0,0,.125),0 1px 3px rgba(0,0,0,.2);
            margin-top:20px;
            width:100%;
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
         .heightmaxer {
            max-height:600px;
            overflow-x:scroll;

         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="row">
         <div class="col-md-12" >
              <div class=" card">
                <div class=" card-body p-0">
                    <div class="row">    
                        <div class="col-md-12">
                                 <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary btn-block btn-flat pull-right" Style="border-style: none; border-radius: 15px; width:70px; margin-left:10px;" ClientIDMode="Static" Text="Update" OnClick="onchangepercent" />
                            <asp:TextBox runat="server" ID="txtpercentpayout" CssClass="form-control pull-right" Style="width:150px; margin-left:10px;" placeholder="Percent Payout"></asp:TextBox>
                               
                              <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary btn-block btn-flat pull-right" Style="border-style: none; border-radius: 15px; width:70px; margin-left:10px;" ClientIDMode="Static" Text="Update" OnClick="onchangegate" />
                            <asp:TextBox runat="server" ID="txtgateamount" CssClass="form-control pull-right" Style="width:150px;" placeholder="Gate Amount"></asp:TextBox>
                                

                            </div>
                        </div>
                    </div>
                  </div>
             </div>
        <div class="col-md-12" >
              <div class=" card">
                <div class=" card-body p-0">
                    <div class="row">    
                        <div class="col-md-3">
                            
                            From:
                        <div class="form-group has-feedback" >
                            <asp:TextBox ID="txt_from" runat="server" TextMode="Date" CssClass="form-control" BorderStyle="None" Style="border-radius: 5px;" ClientIDMode="Static" placeholder="Activation Key" ></asp:TextBox>
                            <span class=" glyphicon glyphicon-calendar form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="col-md-3">
                            
                            To:
                        <div class="form-group has-feedback" >
                            <asp:TextBox ID="txt_to" runat="server" TextMode="Date" CssClass="form-control" BorderStyle="None" Style="border-radius: 5px;" ClientIDMode="Static" placeholder="Activation Key" ></asp:TextBox>
                            <span class=" glyphicon glyphicon-calendar form-control-feedback"></span>
                            </div>
                        </div>

                        
                        <div class="col-md-1">
                            <br />
                              <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block btn-flat" Style="border-style: none; border-radius: 15px;" ClientIDMode="Static" OnClick="onrangesearch" Text="Go" />
                          
                        </div>
                        <div class="col-md-2">
                            <br />
                               <asp:DropDownList ID="ddl_months" runat="server" CssClass="form-control" >
                               </asp:DropDownList>
                        </div>
                        <div class="col-md-2">
                            <br />
                               <asp:DropDownList ID="ddl_years" runat="server" CssClass="form-control" >
                               </asp:DropDownList>
                        </div>

                        <div class="col-md-1">
                            <br />
                              <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary btn-block btn-flat" Style="border-style: none; border-radius: 15px;" ClientIDMode="Static" OnClick="onmonthyearsearch" Text="Go" />
                          
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                          <asp:LinkButton ID="asdasd" runat="server" OnClick="onexcel"><i class='fa fa-print'></i></asp:LinkButton>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                             <asp:GridView ID="grid_view" runat="server" AutoGenerateColumns="false" EmptyDataText="No Record Found"  CssClass="table table-striped table-bordered no-margin">
                                <Columns>
                                    <asp:BoundField DataField="nummatches" HeaderText=""/>
                                    <asp:BoundField DataField="Id" HeaderText="Match ID"/>
                                    <asp:BoundField DataField="numfights" HeaderText="# Of Fights"/>
                                    <asp:BoundField DataField="totalmeron" HeaderText="Total MERON Bet"/>
                                    <asp:BoundField DataField="totalwala" HeaderText="Total WALA Bet"/>
                                    <asp:BoundField DataField="totalsales" HeaderText="Total Sales"/>
                                    <asp:BoundField DataField="meronwinrate" HeaderText="MERON win rate(%)"/>
                                    <asp:BoundField DataField="walawinrate" HeaderText="WALA win rate(%)"/>
                                    <asp:BoundField DataField="drawwinrate" HeaderText="Draw rate(%)"/>
                                    <asp:BoundField DataField="cancelwinrate" HeaderText="Cancel rate(%)"/>
                                    <asp:BoundField DataField="Sysdate" HeaderText="Date"/>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="can" runat="server" CausesValidation="false" OnClick="onclickperfight" ><i class=" glyphicon glyphicon-file"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="5px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                    <asp:HiddenField ID="hfmatchid" runat="server" ClientIDMode="Static" Value="" />
                    
<div class="modal fade in" id="modal_reportperfight" runat="server" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <asp:LinkButton ID="lbCloseLeave" runat="server" OnClick="Closereportperfight" CssClass="close">&times;</asp:LinkButton>
            <h4 class="modal-title">Report Per Fight</h4>
        </div>
        <div class="modal-body">
            
                    <div class="row">
                        <div class="col-md-12">
                          <asp:LinkButton ID="LinkButton1" runat="server" OnClick="onexcel2"><i class='fa fa-print'></i></asp:LinkButton>
                        </div>
                    </div>
             <div class="row">
                        <div class="col-md-12" style="max-height:450px; overflow-y:scroll;">
                             <asp:GridView ID="grid_perfight" runat="server" AutoGenerateColumns="false" EmptyDataText="No Record Found"  CssClass="table table-striped table-bordered no-margin">
                                <Columns>
                                    <asp:BoundField DataField="Fightno" HeaderText="Fight No."/>
                                    <asp:BoundField DataField="totalmeron" HeaderText="Total meron bet"/>
                                    <asp:BoundField DataField="totalwala" HeaderText="Total wala bet"/>
                                    <asp:BoundField DataField="totalsales" HeaderText="Total sales"/>
                                    <asp:BoundField DataField="status" HeaderText="Status"/>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="cans" runat="server" CausesValidation="false" OnClick="onclickperagent" ><i class=" glyphicon glyphicon-file"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle Width="5px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

        </div>
    </div>
    </div>
</div>

               
<div class="modal fade in" id="modal_reportperagent" runat="server" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="Closereportperagent" CssClass="close">&times;</asp:LinkButton>
            <h4 class="modal-title">Report Per Fight</h4>
        </div>
        <div class="modal-body">
            
                    <div class="row">
                        <div class="col-md-12">
                          <asp:LinkButton ID="LinkButton3" runat="server" OnClick="onexcel3"><i class='fa fa-print'></i></asp:LinkButton>
                        </div>
                    </div>
             <div class="row">
                        <div class="col-md-12">
                             <asp:GridView ID="grid_peragent" runat="server" AutoGenerateColumns="false" EmptyDataText="No Record Found"  CssClass="table table-striped table-bordered no-margin">
                                <Columns>
                                    <asp:BoundField DataField="Fightno" HeaderText="Fight No."/>
                                    <asp:BoundField DataField="AgentName" HeaderText="Agent"/>
                                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount"/>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

        </div>
    </div>
    </div>
</div>

                </div>
                </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
