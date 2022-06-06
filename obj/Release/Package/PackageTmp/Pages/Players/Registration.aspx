<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SabongLive.Pages.Players.Registration" %>

<!DOCTYPE>

<html>
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
    <div class="row">
        <div class="col-md-12">

            <form id="form1" runat="server">
   

    <div class="row" >
        <div class="col-md-12" >
                <div class="login-box" >
                    <div class="login-box-body" style="padding-top:120px; border-radius: 15px; background-color:#282828">
                            
                            <div class="containersz" style="position:absolute; margin-top:-270px; margin-left:-185px;z-index:1;">
                            <img src="../../Photos/phoenex.png" class="login-logo" />
                        </div>
                        <div class="containersz" style="position:absolute; margin-top:-270px; margin-left:-185px; z-index:-1;">
                            <img src="../../Photos/phoenextail.png" class="login-logo" />
                        </div>
                        
                        <div class="form-group has-feedback">
                            <h3 style="color:white; text-align:center; margin-top:-50px; ">Already have an account?</h3>
                        </div>
                        <div class="row" style="">
                            <div class="col-xs-12 text-center" >
                                <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-flat" OnClick="click_login" BorderStyle="None" style="border-radius:15px;" Text="Sign In" />
                            </div>
                        </div>
                        
                        <hr />
                        <div class="form-group has-feedback" >
                            <h3 style="color:white; text-align:center; ">Registration</h3>
                        </div>

                        
                         <div class="form-group has-feedback" >
                            <label>Username:</label>
                            <asp:TextBox ID="txt_username" runat="server" CssClass="form-control" ClientIDMode="Static" BorderStyle="None" onchange="validateUser(this)"  required></asp:TextBox>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            <label style="color:#f82741;" id="lblusererror1"></label>
                        </div>
                      
                        <div class="form-group has-feedback" >
                            <label>Password:</label>
                            <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control" BorderStyle="None" ClientIDMode="Static" onchange="validatePass(this)" TextMode="Password" required></asp:TextBox>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            <label style="color:red;" id="lblpasserror1"></label>
                        </div>
                        <div class="form-group has-feedback" >
                            <label>Confirm Password:</label>
                            <asp:TextBox ID="txt_conpass" runat="server" CssClass="form-control" BorderStyle="None"  ClientIDMode="Static" onchange="validatePass(this)"  TextMode="Password"  required></asp:TextBox>
                            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            <label style="color:#f82741;" id="lblpasserror2"></label>
                        </div>
                        <div class="form-group has-feedback" >
                            <label>First Name:</label>
                            <asp:TextBox ID="txt_Fname" runat="server" CssClass="form-control" BorderStyle="None" required></asp:TextBox>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                        
                        <div class="form-group has-feedback" >
                            <label>Last Name:</label>
                            <asp:TextBox ID="txt_Lname" runat="server" CssClass="form-control" BorderStyle="None"  required></asp:TextBox>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                         <div class="form-group has-feedback " >
                            <label>Contact Number:</label>
                            <asp:TextBox ID="txt_Contact" runat="server" CssClass="form-control" BorderStyle="None"   required></asp:TextBox>
                            <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                        </div>
                         
                        <div class="row">
                            <div class="col-xs-12 text-center" style="z-index:100;">
                                <asp:Button ID="btn_login" runat="server" class="btn btn-primary btn-block btn-flat" OnClientClick="return confirm('Referral code will expire and cannot be reused after a successful registration. Confirm Registration?');" OnClick="click_register" BorderStyle="None" style="border-radius:15px;" Text="Register" />
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
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
    
       
    <!-- InputMask -->
<script src="../../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"></script>

    <script>
        function validatePass(evs) {

            console.log($(evs).val());

            if ($("[id$=txt_conpass]").val() != "" && $("[id$=txt_pass]").val() != "") {
                if ($("[id$=txt_conpass]").val() != $("[id$=txt_pass]").val()) {
                    console.log("a");
                    $("[id$=lblpasserror2]").text("Password do not match. Try Again");
                    $("[id$=txt_conpass]").val("");
                }
                else {
                    console.log("b");
                    $("[id$=lblpasserror2]").text("");

                }
            }
        }

        function validateUser(evs) {
            var usernem = $(evs).val();
            console.log(usernem);
            $.ajax({
                type: "POST",
                url: "Pages/Players/Registration.aspx/OnCheckUserName",
                data: JSON.stringify({ username: usernem}),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {
                    if (result.d != "") {
                        $("[id$=lblusererror1]").text(result.d);
                        $(evs).val("");
                    }
                    else {
                        $("[id$=lblusererror1]").text("");
                    }

                }, error: function (result) {
                    console.log(result.responseText);
                }
            });
        }


        $('[data-mask]').inputmask()
    </script>


</body>

</html>
