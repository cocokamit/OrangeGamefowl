<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printpadaug.aspx.cs" Inherits="SabongLive.Pages.News.printpadaug" %>

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
                    lblfightno.InnerText = dttt.Rows[0]["FightId"].ToString();
                    lbldate.InnerText = dttt.Rows[0]["Datetimes"].ToString();
                    lblmeronamount.InnerText = dttt.Rows[0]["MeronAmount"].ToString();
                    lblmeronname.InnerText = dttt.Rows[0]["MeronName"].ToString();
                    lblwalaamount.InnerText = dttt.Rows[0]["WalaAmount"].ToString();
                    lblwalaname.InnerText = dttt.Rows[0]["WalaName"].ToString();
                    lblside.InnerText = dttt.Rows[0]["Status"].ToString().ToUpper();
                    lblmasyada.InnerText = dttt.Rows[0]["EqualizeAmount"].ToString();
                    lbltotal.InnerText = dttt.Rows[0]["TotalWinAmount"].ToString();
                    lblrentas.InnerText = "-"+dttt.Rows[0]["Rentas"].ToString();
                }
                %>
            <h2 style="font-size:70px; text-align:center; font-weight:900; letter-spacing:5px;">ORANGE COCKPIT ARENA</h2>
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
                        <strong>Meron</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong><label runat="server" id="lblmeronname"></label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong>Amount:</strong>
                    </td>
                    <td style="text-align:right;">
                        <strong> <label runat="server" id="lblmeronamount"></label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>Wala</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong><label runat="server" id="lblwalaname"></label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong>Amount:</strong>
                    </td>
                    <td style="text-align:right;">
                        <strong> <label runat="server" id="lblwalaamount"></label></strong>
                    </td>
                </tr>

                <tr>
                    <td>
                         <strong>Masyada:</strong>
                    </td>
                    <td style="text-align:right;">
                         <strong><label runat="server" id="lblmasyada"></label></strong>
                    </td>
                </tr>

                <tr>
                    <td>
                         <strong>Rentas:</strong>
                    </td>
                    <td style="text-align:right;">
                         <strong><label runat="server" id="lblrentas"></label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong>Ariba:</strong>
                    </td>
                    <td style="text-align:right;">
                         <strong><label runat="server" id="Label1">-10%</label></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                         <strong>Total win:</strong>
                    </td>
                    <td style="text-align:right;">
                         <strong><label runat="server" id="lbltotal"></label></strong>
                    </td>
                </tr>

                <tr>
                    <td>
                         <strong>Winner:</strong>
                    </td>
                    <td>
                         <strong><label runat="server" id="lblside"></label></strong>
                    </td>
                </tr>
                
            </table>
        </div>    
    </div>
        <hr />
    </form>


<script type="text/javascript">
    window.print();
   
</script>


</body>
</html>