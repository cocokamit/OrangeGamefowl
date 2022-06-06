<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="activationkey.aspx.cs" Inherits="SabongLive.Pages.News.activationkey" %>

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
    <div class="row">
        <div class="col-md-12">
            <div class="login-box" style="z-index: 2;">
                <div class="login-box-body" style="padding-top: 50px; margin-top: 20%; border-radius: 15px; background-color: #282828">
                    <div runat="server" id="divone">
                        <div>
                            <span class="glyphicon glyphicon-warning-sign" style="font-size: 30px; color: red;"></span>
                        </div>
                        <div style="z-index: 100;">
                            <h2 style="color: white;">To continue using this system, please enter the activation key.</h2>

                        </div>
                        <div class="form-group has-feedback" style="z-index: 100;">
                            <asp:TextBox ID="txt_user" runat="server" CssClass="form-control" BorderStyle="None" Style="border-radius: 5px;" ClientIDMode="Static" placeholder="Activation Key" required></asp:TextBox>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            <asp:Label ID="lbl_error" runat="server" ClientIDMode="Static" CssClass="" Style="color: red; font-size: 14px;"></asp:Label>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-center" style="z-index: 100;">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block btn-flat" Style="border-style: none; border-radius: 15px;" ClientIDMode="Static" OnClick="getactivate" Text="CONFIRM" />
                            </div>
                        </div>

                    </div>
                    <div runat="server" id="divtwo" style="text-align:center;">
                        <div>
                            <span class="glyphicon glyphicon glyphicon-ok-circle" style="font-size: 150px; color: lightgreen; "></span>
                        </div>
                        <div>
                            <h2 style="color:lightgreen;"><strong>SUCCESS!</strong></h2>
                        </div>
                        
                        <div>
                            <a href="login">LOGIN</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
