<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="match_print.aspx.cs" Inherits="SabongLive.Pages.Admin.Promoter.match_print" %>

<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Orange Game Fowl</title>
    <link rel="icon" type="image/png" href="../../dist/img/cebcar-fav.ico"/>
    <link rel="stylesheet" href="../../vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../dist/css/base.css">
    <link rel="stylesheet" href="../../dist/css/custom.css" />
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body>
    <form id="form1" runat="server">

    <section class="invoice">
      <!-- title row -->
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <asp:LinkButton ID="lbDownlaod" runat="server" OnClick="ExportToExcel" Text="Download"></asp:LinkButton>
            <img src="style/img/logo.png" width="300px" class="login-logo pull-right" />
                
                <% DataTable dt = (DataTable)ViewState["data"]; %>

              <address>
                <h1 class="no-margin"><%= dt.Rows[0]["cockpit_name"] %></h1>
                <%= dt.Rows[0]["location"] %><br>
                <%= dt.Rows[0]["promoter"] %><br>
                <%= dt.Rows[0]["date"] %>
              </address>
           
 
                
            </div>         
          </h2>
        </div>
        <!-- /.col -->
      </div>
 

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
        
         
        <asp:GridView  ID="gv_match" runat="server" AutoGenerateColumns="false" ShowHeader="false" CssClass='table table-bordered no-margin'>
                        <Columns>
                            <asp:BoundField DataField="id" ItemStyle-CssClass="none" HeaderStyle-CssClass="none"/>
                            <asp:TemplateField HeaderText="Matching List">
                                <ItemTemplate> 
                                    <div class="row text-center">
                                        <div class="col-lg-1">
                                            <span class="badge bg-danger" style="margin-top:10px"> # <%# Container.DataItemIndex + 1 %></span>
                                        </div>
                                        <div class="col-lg-5">
                                            <h5 class="users-list-name  no-margin" href="javascript:void(0)"><%# Eval("a_entry")%></h5>
                                            <span class="users-list-date"><%# Eval("a_weight")%></span>
                                        </div>
                                        <div class="col-lg-1">VS</div>
                                        <div class="col-lg-5">
                                            <h5 class="users-list-name no-margin" href="javascript:void(0)"><%# Eval("b_entry")%></h5>
                                            <span class="users-list-date"><%# Eval("b_weight")%></span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

  
    </section>
    <div>
             
    </div>

    <asp:GridView ID="gvDownload" runat="server" AutoGenerateColumns="false" style=" visibility:hidden">
            <Columns>
                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                 <asp:BoundField DataField="a_entry" HeaderText="Entry"  />
                 <asp:BoundField DataField="a_weight" HeaderText="Weight"  />
                 <asp:BoundField DataField="a_parada" HeaderText="Parada"  />
                 <asp:BoundField DataField="b_entry" HeaderText="Entry"  />
                 <asp:BoundField DataField="b_weight" HeaderText="Weight"  />
                 <asp:BoundField DataField="b_parada" HeaderText="Parada"  />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>