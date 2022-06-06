<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="printslip.aspx.cs" Inherits="SabongLive.Pages.News.printslip" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms,  Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payslip</title>
    <style type="text/css">
        *{margin:0; padding:0; font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;}
        .content { min-width:900px; width:100%; margin:0 auto; font-size:12px }
        .slip {border:1px solid #eee; padding:40px; margin:auto;}
        table { text-align:left; margin:10px 0 0; border:none;}
        table th { text-transform:uppercase; font-size:9px;}
        table tr { vertical-align:top; font-size:60px;}
        .Grid td,.Grid th {padding:2px 4px; border:none;}
        .style1
        {
            height: 19px;
        }
    </style>
</head>
<body>

    
    <form id="form1" runat="server">

        
    <div class="content">
        
        <div class="slip">
            <%
                if (dttt.Rows.Count > 0)
                {
                    lblfightno.InnerText = dttt.Rows[0]["Fightno"].ToString();
                    lbldate.InnerText = dttt.Rows[0]["Datetimes"].ToString();
                    lblbetno.InnerText = dttt.Rows[0]["Betno"].ToString();
                    lblamount.InnerText = dttt.Rows[0]["Betamount"].ToString();
                    lblside.InnerText = dttt.Rows[0]["Statusside"].ToString().ToUpper();
                    lblagent.InnerText = dttt.Rows[0]["AgentName"].ToString();

                }
                %>
            <h2 style="font-size:70px; text-align:center; font-weight:900; letter-spacing:5px;">SANFRAN COCKPIT</h2>
            <table>
                <tr>
                    <th>
                   
                    </th>
                    <th>
                   
                    </th>
                </tr>
                <tr>
                    <td>
                        <strong>Fight No.:</strong>
                    </td>
                    <td>
                         <strong><label runat="server" id="lblfightno"></label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong>Date:</strong>
                    </td>
                    <td>
                         <strong><label runat="server" id="lbldate"></label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong>Bet No.:</strong>
                    </td>
                    <td>
                         <strong><label runat="server" id="lblbetno"></label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong>Amount:</strong>
                    </td>
                    <td>
                        <strong> <label runat="server" id="lblamount"></label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong>Side:</strong>
                    </td>
                    <td>
                         <strong><label runat="server" id="lblside"></label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong>Agent:</strong>
                    </td>
                    <td>
                         <strong><label runat="server" id="lblagent"></label></strong>
                    </td>
                </tr>
            </table>
        </div>    
    </div>

    </form>


<script type="text/javascript">
    window.print();
   
</script>


</body>
</html>