<%@ Page Title="" Language="C#" MasterPageFile="~/site1.Master" AutoEventWireup="true" CodeBehind="Journal.aspx.cs" Inherits="SabongLive.Pages.Admin.Journal" %>


<asp:Content ContentPlaceHolderID="head" runat="server" ID="head_fowl">
<!-- fullCalendar -->
<link rel="stylesheet" href="vendors/fullcalendar/dist/fullcalendar.css">
<link rel="stylesheet" href="vendors/fullcalendar/dist/fullcalendar.print.css" media="print">

<script src="script/datepicker/commonJScript.js" type="text/javascript"></script>
<script src="script/datepicker/jquery-1.8.3.js" type="text/javascript"></script>     
<script src="script/datepicker/jquery-ui.js" type="text/javascript"></script>
<link href="script/datepicker/jquery-ui-1.8.16.custom.css" rel="Stylesheet" type="text/css" />

<script type="text/javascript">
    jQuery.noConflict();
    (function ($) {
        $(function () {
            $(".datee").datepicker();
        });
    })(jQuery);
</script>
 <script type="text/javascript">
     function Confirm() {
         var confirm_value = document.getElementById("<%= TextBox1.ClientID %>")
         if (confirm("Are you sure to cancel this transaction?"))
         { confirm_value.value = "Yes"; } else { confirm_value.value = "No"; }
     } 
</script>
    <style type="text/css">
      .fc-time,.fc-ltr .fc-axis { display:none !important}
    </style>
</asp:Content>


<asp:Content ContentPlaceHolderID="content" runat="server" ID="content_journal">
<section class="content-header">
    <h1>Journal</h1>
    <ol class="breadcrumb">
    <li><a href="dashboard"><i class="fa fa-dashboard"></i> Dashboard</a></li>
    <li class="active">Journal</li>
    </ol>
</section>
<section class="content">
<div class="row">
      <div class="col-md-7">
          <div class="box box-primary">
            <div class="box-body">
              <div id="calendar"></div>
            </div>
          </div>
        </div>
          <div class="col-md-5">
            <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Today's Journal</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div id="alert" runat="server" class="alert alert-empty">
                <i class="fa fa-info-circle"></i>
                <span>No record found</span>
            </div>
            <asp:GridView ID="grid_view" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered no-margin">
                <Columns>
                    <asp:BoundField DataField="id" ItemStyle-CssClass="none" HeaderStyle-CssClass="none"/>
                    <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="act" HeaderText="Activity" />
                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="70px">
                        <ItemTemplate> 
                            <asp:LinkButton runat="server" ID="lnk_view" OnClick="viewedit" Tooltip="Edit" ><i class="fa fa-pencil border-right pad-right"></i></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lnk_delete" OnClick="btn_delete" OnClientClick="Confirm()" Tooltip="Delete" ><i class="fa fa-trash no-padding-right"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <asp:Button ID="Button1" runat="server" OnClick="view" Text="ADD" CssClass="btn btn-primary margin" />
            </div>
            <!-- /.box-footer -->
          </div>
    </div>
</div>
    
</section>

<div class="modal fade in" id="modal-info" >
    <div class="modal-dialog">
        <div class="modal-content col-centered">
            <div class="box box-widget widget-user">
        <div class="widget-user-header bg-aqua-active no-radius">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h3 id="H1" class="widget-user-username"></h3>
            <h5 id="H2" class="widget-user-desc"></h5>
            <div class="box-tools pull-left">
                <a id="A1" href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Edit"><i class="fa fa-pencil"></i></a>
                <a href="javascript:void(0)"  data-toggle="modal" data-target="#modal-warning" class="btn btn-box-tool" data-toggle="tooltip" title="Delete"><i class="fa fa-trash-o"></i></a>
            </div>
        </div>
            
        <div class="box-footer">
            <ul class="nav nav-pills nav-stacked">
            <li><a href="javascript:void(0)"><i class="fa fa-clock-o"></i> <span id="Span1"></span> <span id="Span2"></span></a></li>
            <li><a href="#"><i class="fa fa-map-marker"></i> <span id="Span3"></span></a></li>
            <li><a href="#"><i class="fa fa-users"></i> <span id="Span4"></span> Attendee <span id="Span5" class="label label-primary pull-right">+</span></a>
                    <ul id="Ul1" style=" display:none; margin:5px 0 10px 15px">
                </ul>
            </li>
            <li><a href="#">
                <label>NOTE:</label>
                <span id="Span6"></span></a></li>
            </ul>
        </div>
        </div>
        </div>
        </div>
</div>

<div class="modal fade in" id="modal_default" runat="server">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <asp:LinkButton ID="lb_close" runat="server" CssClass="close" OnClick="cpop">&times;</asp:LinkButton>
        <h4 class="modal-title"><asp:Label ID="l_ModalTitle" runat="server" Text="New Journal"></asp:Label></h4>
        </div>
        <div class="modal-body">
             <div class="form-group">
                <label>Date</label>
                <asp:Label ID="lbl_name" style=" color:Red;" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txt_date" CssClass="datee form-control" runat="server"></asp:TextBox>
                <button  id="add-new-event" type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default" style="background-color:<%= hf_color.Value  %> ; border:none; position:absolute; margin-top:-27px; right:25px; padding:10px"></button>
            </div>
            <div class="form-group">
                <label>Journal Activity</label>
                <asp:Label ID="lbl_activity" style=" color:Red;" runat="server" Text=""></asp:Label>
                 <asp:DropDownList ID="drop_act" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group hide">
                <label>Weather</label>
                <asp:Label ID="lbl_weather" style=" color:Red;" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txt_weather"  CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group no-margin">
                <label>Note</label>
                <asp:Label ID="l_note" style=" color:Red;" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="tb_note"  CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
             <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_savee" CssClass="btn btn-primary"/>
        </div>
    </div>
    </div>
</div>

<div class="modal fade in" id="modal_edit" runat="server">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClick="cpop">&times;</asp:LinkButton>
        <h4 class="modal-title">Edit Journal</h4>
        </div>
        <div class="modal-body">
             <div class="form-group">
                <label>Date</label>
                <asp:Label ID="Label1" style=" color:Red;" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txt_d" CssClass="datee form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group none">
                <label>Weather</label>
                <asp:Label ID="Label2" style=" color:Red;" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="txt_w"  CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Journal Activity</label>
                <asp:Label ID="Label3" style=" color:Red;" runat="server" Text=""></asp:Label>
                 <asp:DropDownList ID="drop_a" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group no-margin">
                <label>Note</label>
                <asp:Label ID="Label4" style=" color:Red;" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="tb_EditNote"  CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="modal-footer">
             <asp:Button ID="Button2" runat="server" Text="Update" OnClick="btn_update" CssClass="btn btn-primary"/>
        </div>
    </div>
    </div>
</div>

<div class="modal fade in" id="Div1" >
    <div class="modal-dialog">
        <div class="modal-content col-centered">
            <div class="box box-widget widget-user">
        <div class="widget-user-header bg-aqua-active no-radius">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h3 id="title" class="widget-user-username"></h3>
            <h5 id="bookby" class="widget-user-desc"></h5>
            <div class="box-tools pull-left">
                <a id="editevent" href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Edit"><i class="fa fa-pencil"></i></a>
                <a href="javascript:void(0)"  data-toggle="modal" data-target="#modal-warning" class="btn btn-box-tool" data-toggle="tooltip" title="Delete"><i class="fa fa-trash-o"></i></a>
            </div>
        </div>
            
        <div class="box-footer">
            <ul class="nav nav-pills nav-stacked">
            <li><a href="javascript:void(0)"><i class="fa fa-clock-o"></i> <span id="start"></span> <span id="end"></span></a></li>
            <li><a href="#"><i class="fa fa-map-marker"></i> <span id="facility"></span></a></li>
            <li><a href="#"><i class="fa fa-users"></i> <span id="no_attendee"></span> Attendee <span id="guestlist" class="label label-primary pull-right">+</span></a>
                    <ul id="guest" style=" display:none; margin:5px 0 10px 15px">
                </ul>
            </li>
            <li><a href="#">
                <label>NOTE:</label>
                <span id="note"></span></a></li>
            </ul>
        </div>
        </div>
        </div>
    </div>
</div>

<asp:TextBox ID="TextBox1" runat="server" class="hide"></asp:TextBox> 
<asp:HiddenField ID="hf_id" runat="server" ClientIDMode="Static" />
 <div class="modal fade in" id="modal-default" >
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Event Legend</h4>
        </div>
        <div class="modal-body">
            <ul class="fc-color-picker" id="color-chooser">
            <li><a class="text-aqua" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-blue" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-light-blue" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-teal" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-yellow" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-orange" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-green" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-lime" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-red" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-purple" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-fuchsia" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-muted" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
            <li><a class="text-navy" href="#" data-dismiss="modal"><i class="fa fa-square"></i></a></li>
        </ul>
            <div class="clearfix">
            </div>
        </div>
    </div>
    </div>
</div>
<asp:HiddenField ID="hf_color" runat="server" Value="rgb(210, 214, 222)" ClientIDMode="Static"/>
<asp:HiddenField ID="hf_action" runat="server" ClientIDMode="Static"/>

<asp:Button ID="btn_GetInfo" runat="server" OnClick="click_GetInfo" />
</asp:Content>

<asp:Content ID="footer" runat="server" ContentPlaceHolderID="footer">
<!-- jQuery UI 1.11.4 -->
<script src="vendors/jquery-ui/jquery-ui.min.js"></script>

<!-- fullCalendar -->
<script src="vendors/moment/moment.js"></script>
<script src="vendors/fullcalendar/dist/fullcalendar.js"></script>

<script>

function GetDetails(id)
{
    $("#hf_id").val(id);
     $("#<%=btn_GetInfo.ClientID %>")[0].click();
}

  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function init_events(ele) {
      ele.each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    init_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()
    $('#calendar').fullCalendar({
      eventClick: function(calEvent, jsEvent, view) {

       GetDetails(calEvent.uid);

      //calEvent is found sa DC
       //showEvent(calEvent.uid);
//           alert('Event: ' + calEvent.title);
//    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//    alert('View: ' + view.name);
 

        },
      header    : {
        left  : 'prev,next today',
        center: 'title',
        right : 'month,agendaWeek,agendaDay'
      },
      buttonText: {
        today: 'today',
        month: 'month',
        week : 'week',
        day  : 'day'
      },
      //Random default events
        <%= ViewState["events"].ToString() %>
     ,
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
      drop      : function (date, allDay) { // this function is called when something is dropped

        // retrieve the dropped element's stored Event Object
        var originalEventObject = $(this).data('eventObject')

        // we need to copy it, so that multiple events don't have a reference to the same object
        var copiedEventObject = $.extend({}, originalEventObject)

        // assign it the date that was reported
        copiedEventObject.start           = date
        copiedEventObject.allDay          = allDay
        copiedEventObject.backgroundColor = $(this).css('background-color')
        copiedEventObject.borderColor     = $(this).css('border-color')

        // render the event on the calendar
        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true)

        // is the "remove after drop" checkbox checked?
        if ($('#drop-remove').is(':checked')) {
          // if so, remove the element from the "Draggable Events" list
          $(this).remove()
        }

      }
    })

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    //Color chooser button
    var colorChooser = $('#color-chooser-btn')
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      //Save color
      currColor = $(this).css('color')
      //Add color effect to button
      $('#add-new-event').css({ 'background-color': currColor, 'border-color': currColor })
       $("#hf_color").val(currColor);
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      //Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      //Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.html(val)
      $('#external-events').prepend(event)

      //Add draggable funtionality
      init_events(event)

      //Remove event from text input
      $('#new-event').val('')
    })
  })
  </script>
</asp:Content>
