<%@ Page Title="" Language="C#" MasterPageFile="~/site1.Master" AutoEventWireup="true" CodeBehind="match.aspx.cs" Inherits="SabongLive.Pages.Admin.Promoter.match" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .validator { position:absolute; font-size:10px; margin: 10px 0 0 170px}
        .modal .table .fa {padding:0 !important}
        .border-right {padding-left :5px}
    </style>
    <link href="../../../style/css/tablechkbx.css" rel="stylesheet" />
    
  <link rel="stylesheet" href="vendors/select2/dist/css/select2.min.css">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">


    <section class="content-header">
    <h1>Matching</h1>
    <ol class="breadcrumb">
        <li><a href="promoter-dashboard"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li class="active">Matching</li>
    </ol>
</section>

<section class="content">
    <div class="box box-primary color-palette-box">
    <div class="box-header with-border">
        <div class="row">
            <div class="col-lg-3">
                <div class="input-group">
                    <input type="text" class="form-control">
                    <asp:LinkButton ID="lb_search" runat="server" CssClass="input-group-addon"><i class="fa fa-search"></i></asp:LinkButton>
                </div>
            </div>
            <div class="col-lg-9">
                <asp:Button ID="btn_add" CssClass="btn btn-primary pull-right" runat="server" OnClick="Add" Text="Add" />
            </div>
        </div>
    </div>
    <div class="box-body">
        <asp:GridView ID="grid_view" runat="server" AutoGenerateColumns="false" EmptyDataText="No record found." CssClass="table table-bordered no-margin">
            <Columns>
                <asp:BoundField DataField="id" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
                <asp:BoundField DataField="event_name" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
                <asp:TemplateField HeaderText="Event" >
                    <ItemTemplate> 
                        <asp:LinkButton runat="server" ID="lb_event" OnClick="EventParticipants" Tooltip="Edit" CssClass="text-black"><%# Eval("event_name")%></asp:LinkButton>
                        <span class="text-muted pull-right"><%# Eval("event_date")%></span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action" ItemStyle-Width="100px">
                    <ItemTemplate> 
                        <asp:LinkButton runat="server" ID="lb_edit" Tooltip="Edit" OnClick="EditEvent"><i class="fa fa-pencil border-right pad-right"></i></asp:LinkButton>
                         <a href='final-matching?key=<%# Eval("id")%>' title="Print"><i class="fa fa-print border-right"></i></a>
                        <a href="#" class="deletemodal" data-id='<%# Eval("id")%>' data-title="event" data-toggle="modal" data-target="#modal-danger"><i class="fa fa-trash no-padding-right"></i></a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </div>
</section>

<div class="modal fade in" id="modal_default" runat="server">
    <div class="modal-dialog" id="modal_dialog" runat="server">
    <div class="modal-content">
        <div class="modal-header">
        <asp:LinkButton ID="lb_close" runat="server" CssClass="close" OnClick="Close">&times;</asp:LinkButton>
        <h4 class="modal-title"><asp:Label ID="l_ModalTitle" runat="server" Text="New Matching"></asp:Label></h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <asp:Panel ID="pnl_a" runat="server" CssClass="col-lg-12">
                    <div class="form-group">
                        <label>Event</label>
                        <span class="form-control"><%= ViewState["event"] %></span>
                    </div>
             <div class="form-group no-margin">
                <label>Participants</label>
                <asp:GridView ID="gv_participants" runat="server" AutoGenerateColumns="false" ShowHeader="false" OnRowDataBound="DataBoundParticipant" CssClass="table table-bordered no-margin">
                    <Columns>
                        <asp:BoundField DataField="id" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                 <%# Container.DataItemIndex + 1 %>.
                            </ItemTemplate>
                            <ItemStyle Width="10" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Participants" >
                            <ItemTemplate> 
                                <asp:LinkButton ID="lb_participant" runat="server" Text='<%# Eval("name")%>' OnClick="EditEntry"></asp:LinkButton>
                                <span data-id='<%# Eval("id") %>' data-count='<%# Eval("cnt") %>' class="badge bg-red pull-right entry"><%# Eval("cnt") %></span>
                                <div id='grid_<%# Eval("id") %>' class="none">
                                <asp:GridView  ID="gv_entry" runat="server" AutoGenerateColumns="false" CssClass='table table-bordered' style="margin:5px 0 10px 0 !important">
                                    <Columns>
                                        <asp:BoundField DataField="id" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate> 
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="weight" HeaderText="Weight"/>
                                        <asp:BoundField DataField="parada" HeaderText="Parada" DataFormatString="{0:#,##0.00}"/>
                                    </Columns>
                                </asp:GridView>
                                <span class='badge bg-default <%# Eval("fname").ToString().Length  == 0 ? "hidden" : "" %>'><i class="fa fa-flag"></i><%# Eval("fname") %></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

              </div>
                 </asp:Panel>
                 <asp:Panel ID="pnl_b" runat="server" Visible="false" CssClass="col-lg-8">
                    <div class="form-group">
                        <label>Match List</label>
                    <asp:GridView  ID="gv_match" runat="server" AutoGenerateColumns="false" ShowHeader="false" CssClass='table table-bordered no-margin'>
                        <Columns>
                            <asp:BoundField DataField="id" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
                            <asp:TemplateField HeaderText="Matching List">
                                <ItemTemplate> 
                                    <div class="row text-center">
                                        <div class="col-lg-1">
                                            <span class="badge bg-danger" style="margin-top:10px"> # <%# Container.DataItemIndex + 1 %></span>
                                        </div>
                                        <div class="col-lg-5">
                                            <a class="users-list-name" href="#"><%# Eval("a_entry")%></a>
                                            <span class="users-list-date"><%# Eval("a_parada")%> | <%# Eval("a_weight")%></span>
                                        </div>
                                        <div class="col-lg-1">VS</div>
                                        <div class="col-lg-5">
                                            <a class="users-list-name" href="#"><%# Eval("b_entry")%></a>
                                            <span class="users-list-date"><%# Eval("b_parada")%> | <%# Eval("b_weight")%></span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lb_edit" runat="server" OnClick="ModifyMatch" CssClass="none"><i class="fa fa-pencil"></i></asp:LinkButton >
                                <asp:LinkButton ID="lnkUp" CommandArgument = "up" runat="server" OnClick="ChangePreference" style="margin-bottom:10px"><i class="fa fa-chevron-circle-up"></i></asp:LinkButton>
                                <asp:LinkButton ID="lnkDown" CommandArgument = "down" runat="server" OnClick="ChangePreference"><i class="fa fa-chevron-circle-down"></i></asp:LinkButton>
                                <a href="javascript:void(0)" class="delfight none" data-id='<%# Eval("id")%>' data-title="fight" data-toggle="modal" data-target="#modal-danger"><i class="fa fa-times-circle  no-border no-pad-right"></i></a>
                            </ItemTemplate>
                            <ItemStyle Width="10px" CssClass="action" />
                        </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    </div>
                 </asp:Panel>
            </div>
        </div>
        <div class="modal-footer">
             <asp:Button ID="Button5" runat="server" Text="Add" OnClick="AddParticipants" CssClass="btn btn-default pull-left"/>
             <asp:Button ID="btn_proceed" runat="server" Text="Match" OnClick="InitiateMatching" CssClass="btn btn-primary"/>
        </div>
    </div>
    </div>
</div>

<div class="modal fade in" id="modal_action" runat="server">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="close" OnClick="ClsoeModifyMatch">&times;</asp:LinkButton>
        <h4 class="modal-title">Edit Match</h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-lg-5">
                    <div class="form-group no-margin">
                        <asp:DropDownList ID="ddl_a" runat="server">
                            <asp:ListItem Value="0">Joker</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                 <div class="col-lg-2 text-center">
                     <span class="badge bg-red" style="margin-top:10px">VS</span>
                 </div>
                <div class="col-lg-5">
                    <div class="form-group no-margin">
                        <asp:DropDownList ID="ddl_b" runat="server">
                            <asp:ListItem Value="0">Joker</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button ID="Button1" runat="server" Text="Proceed" CssClass="btn btn-primary"/>
        </div>
    </div>
    </div>
</div>

<div class="modal fade in" id="modal_add" runat="server">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="close" OnClick="Close">&times;</asp:LinkButton>
        <h4 class="modal-title">New Event</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Date</label>
                <asp:Label ID="lbl_date" CssClass="text-red" runat="server"></asp:Label>
                <asp:TextBox ID="txt_date" CssClass="form-control datee" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Event Name</label>
                <asp:Label ID="lbl_name" CssClass="text-red" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txt_name" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Promoter</label>
                <asp:Label ID="lbl_promoter" CssClass="text-red" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txt_promoter" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Cockpit Name</label>
                <asp:Label ID="lbl_cock" CssClass="text-red" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txt_cock" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group no-margin">
                <label>Location</label>
                <asp:Label ID="lbl_location" CssClass="text-red" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txt_location" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="click_submit" CssClass="btn btn-primary"/>
        </div>
    </div>
    </div>
</div>

<div class="modal fade in" id="modal_participant" runat="server">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="close" OnClick="Close">&times;</asp:LinkButton>
        <h4 class="modal-title">Event Participant</h4>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label>Event</label>
               <span class="form-control"><%= ViewState["event"] %></span>
            </div>
          <div class="form-group">
            <label>Entry Name</label>
            <asp:Label ID="l_owner" CssClass="text-danger" runat="server" Text=""></asp:Label>
            <asp:TextBox ID="tb_owner" CssClass="form-control" runat="server"></asp:TextBox>
          </div>
          <div id="fg_flag" runat="server"  class="form-group">
            <label>Flag</label>
            <asp:Label ID="Label2" CssClass="text-danger " runat="server" Text=""></asp:Label>
            <asp:DropDownList ID="ddl_flag" CssClass="form-control select2" multiple="multiple" runat="server">
                <asp:ListItem Value="0">None</asp:ListItem>
            </asp:DropDownList>
          </div>

            <asp:GridView ID="grid_item" runat="server" ShowFooter="True" onrowdeleting="grid_item_RowDeleting" AutoGenerateColumns="False" CssClass="tbl table table-bordered no-margin">
                <Columns>
                    <asp:TemplateField  HeaderText="#" ItemStyle-Width="35px"> 
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("RowNumber") %>' style="margin-top:20px !important" ></asp:Label>.
                            <asp:Label ID="lbl_bid" Visible="false" runat="server" Text='<%# Bind("col_0") %>' ></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>             
                            <asp:ImageButton ID="btn" runat="server" ImageUrl="~/style/img/add.png" OnClick="AddEntry" style=" position:absolute" />
                        </FooterTemplate>
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Weight">
                        <ItemTemplate>
                            <asp:Label ID="lbl_date" runat="server" CssClass="text-red" Text=""></asp:Label>
                            <asp:Label ID="lbl_date_desp"  runat="server" Text=""></asp:Label>
                            <asp:RegularExpressionValidator ID="r_amount" runat="server" CssClass="text-red validator" ControlToValidate="txt_date" ErrorMessage="Invalid input" ValidationExpression="^(\d|,)*\.?\d*$"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txt_date" CssClass="form-control" MaxLength="6" autocomplete="off" onkeydown ="return (event.keyCode!=13)" onpaste="return false"  runat="server"></asp:TextBox> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount">
                        <ItemTemplate>
                            <asp:Label ID="lbl_code" runat="server" CssClass="text-red" Text=""></asp:Label>
                            <asp:Label ID="lbl_code_desp"  runat="server" Text=""></asp:Label>
                            <asp:RegularExpressionValidator ID="ev_parada" runat="server" CssClass="text-red validator" ControlToValidate="drop_code" ErrorMessage="Invalid input" ValidationExpression="^(\d|,)*\.?\d*$"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="drop_code" CssClass="form-control" Text="0"  autocomplete="off"  runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                    <asp:ImageButton ID="can" runat="server" CausesValidation="false" CommandName="Delete" ImageUrl="~/style/img/delete.png" />
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                    </asp:TemplateField>
                </Columns>            
            </asp:GridView>
        </div>
        <div class="modal-footer">
            <asp:LinkButton ID="Button6" runat="server" OnClick="Back"  CssClass="btn btn-default pull-left"><i class="fa fa-arrow-circle-left"></i> Back</asp:LinkButton>
            <%--<asp:LinkButton ID="lbPrint" runat="server" OnClick="Print" CssClass="btn btn-default pull-left"><i class="fa fa-print"></i> Print</asp:LinkButton>--%>
            <asp:Button ID="Button4" runat="server" Text="Submit" OnClick="NewParticipant" CssClass="btn btn-primary"/>
        </div>
    </div>
    </div>
</div>

<div class="modal modal-danger fade in" id="modal-danger">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span></button>
        <h4 class="modal-title">Delete <span class="del-msg"></span></h4>
        </div>
        <div class="modal-body">
        <p class="no-margin">Continue deleting <span class="del-msg"></span>?</p>
        </div>
        <div class="modal-footer">
            <asp:Button ID="Button3" runat="server" Text="Submit" OnClick="DeleteEvent" CssClass="btn btn-outline"/>
        </div>
    </div>
    </div>
</div>

<asp:HiddenField ID="hf_id" ClientIDMode="Static" runat="server" /> 
<asp:HiddenField ID="hf_hold" ClientIDMode="Static" runat="server" /> 
<asp:HiddenField ID="hf_action" ClientIDMode="Static" runat="server" />


</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <script>
    $(".entry").click(function () {
        x = $(this).html();
        $(this).html(x == "x" ? $(this).attr("data-count") : "x");
        $("#grid_" + $(this).attr("data-id")).toggle("slow");
    });

    $(".delfight").click(function () {
        $("#hf_hold").val($(this).attr("data-id"));
        $("#hf_action").val($(this).attr("data-title"));
        $(".del-msg").html($(this).attr("data-title"));
    });

    $(".deletemodal").click(function () {
        $("#hf_id").val($(this).attr("data-id"));
        $("#hf_action").val($(this).attr("data-title"));
        $(".del-msg").html($(this).attr("data-title"));
    });
</script>

<!-- fullCalendar -->
<link rel="stylesheet" href="vendors/fullcalendar/dist/fullcalendar.css">
<link rel="stylesheet" href="vendors/fullcalendar/dist/fullcalendar.print.css" media="print">

<script src="script/datepicker/commonJScript.js" type="text/javascript"></script>
<script src="script/datepicker/jquery-1.8.3.js" type="text/javascript"></script>     
<script src="script/datepicker/jquery-ui.js" type="text/javascript"></script>
<link href="script/datepicker/jquery-ui-1.8.16.custom.css" rel="Stylesheet" type="text/css" />
    
<script src="vendors/select2/dist/js/select2.full.min.js"></script>
<script type="text/javascript">
    jQuery.noConflict();
    (function ($) {
        $(function () {
            $(".datee").datepicker();

            $('.select2').select2();
        });
    })(jQuery);
</script>

</asp:Content>
