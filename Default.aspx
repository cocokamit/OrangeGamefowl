<%@ Page Title="Login" Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SabongLive._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../vendors/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../vendors/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../vendors/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css">

    <script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }
    </script>
    <style type="text/css">
        .containersz {
            width: 400px;
            height: 400px;
            overflow: hidden;
            position: absolute;
        }

            .containersz img {
                margin-top: -100px;
                margin-left: -100px;
                width: 600px;
                height: 600px;
            }
        .col-md-12 {
        padding-right:0px;
        
        }

    </style>

</head>
<body onpageshow="if (event.persisted) noBack();" onunload="" class="hold-transition login-page " style="background-color:#19181A;">
    <div class="row" style="margin-bottom:1%;">
        <div class="col-md-12" >
            <div style="width:auto; height:auto; background-color:#314455;">
                &nbsp;
            </div>

        </div>
    </div>
    <div class="row" >
        <div class="col-md-12" >
            <form id="form1" runat="server">
                <div class="login-box" style="z-index:2;" >
                    <div class="login-box-body" style="padding-top:130px; margin-top:50%; border-radius: 15px; background-color:#282828">
                            
                        <div class="containersz" style="position:absolute; margin-top:-270px; margin-left:-185px;z-index:1;">
                            <img src="../Photos/phoenex.png" class="login-logo" />
                        </div>
                        <div class="containersz" style="position:absolute; margin-top:-270px; margin-left:-185px; z-index:-1;">
                            <img src="../Photos/phoenextail.png" class="login-logo" />
                        </div>
                        <div class="form-group has-feedback" style="z-index:100;">
                            <h3 style="color:white; text-align:center; margin-top:-50px; ">ORANGE COCKPIT ARENA</h3>
                        </div>
                        <div class="form-group has-feedback" style="z-index:100;">
                            <asp:TextBox ID="txt_user" runat="server" CssClass="form-control" BorderStyle="None" style="border-radius:5px;" ClientIDMode="Static" placeholder="Username" required></asp:TextBox>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        <div class="form-group has-feedback"  style="z-index:100;">
                            <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control" BorderStyle="None" style="border-radius:5px;" ClientIDMode="Static" TextMode="Password" placeholder="Password" required></asp:TextBox>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-center" style="z-index:100;">
                               <%-- <asp:Button ID="btn_login" runat="server" class="btn btn-primary btn-block btn-flat" ClientIDMode="Static"  BorderStyle="None" style="border-radius:15px;" Text="Sign In" />--%>
                                 <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block btn-flat" style="border-style:none; border-radius:15px;"  ClientIDMode="Static"  OnClick="click_go"  Text="Sign In" />
                            </div>
                        </div>
                    </div>
                </div>
                
                    <%--<asp:Button ID="btn_goer" runat="server" CssClass="btn btn-primary btn-block btn-flat" style="border-style:none; border-radius:15px;"  ClientIDMode="Static"  OnClick="click_go"  Text="Sign In" />
                --%>

            </form>
        </div>
    </div>
    <div class="row" style="margin-top:1%;">
        <div class="col-md-12">
               <div style="width:auto; height:auto; background-color:#314455;">
                &nbsp;
            </div>
        </div>
    </div> 
    <div class="row" >
        <div class="col-md-12">
               <div style="width:auto; height:auto; background-color:black; padding-top:3%; padding-bottom:3%;">
                &nbsp;
            </div>
        </div>
    </div>


    <!-- jQuery 3 -->
    <script src="../../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="../../plugins/iCheck/icheck.min.js"></script>



</body>

</html>
