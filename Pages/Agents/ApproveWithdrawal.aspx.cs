using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace SabongLive.Pages.Agents
{
    public partial class ApproveWithdrawal : System.Web.UI.Page
    {
        public string UserName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientId"] != null)
            {
                hfcid.Value = Session["ClientId"].ToString();
                hfrole.Value = Session["Role"].ToString();
                loadable(hfcid.Value);
            }
            else
                Response.Redirect("Login");
        }


        protected void loadable(string cID)
        {
            if (hfrole.Value == "2")
            {
                DataTable dt = dbhelper.getdata2("Select *,c.Firstname+' '+c.Lastname [Name] from Withdrawals a left join Approvers b on a.ClientId=b.UnderId left join ClientInfo c on a.ClientId=c.Id where b.ClientId=" + cID + " order by a.Sysdate desc");
                ViewState["data"] = dt;
            }
            else if (hfrole.Value == "3")
            {
                DataTable dt = dbhelper.getdata2("Select *,c.Firstname+' '+c.Lastname [Name] from Withdrawals a left join Approvers b on a.ClientId=b.UnderId left join Approvers d on b.ClientId=d.UnderId left join ClientInfo c on a.ClientId=c.Id where d.ClientId=" + cID + " and a.Status !='Waiting' order by a.Sysdate desc");
                ViewState["data"] = dt;
            }

        }
        [WebMethod]
        public static void Onsavers(string clientid, string approveId,string status)
        {   if (status != "Declined") 
            {
                DataTable dt = dbhelper.getdata2("Update Withdrawals set Status='" + status + "' where Id=" + approveId + ""); 
            }
            else
            {
                DataTable dt = dbhelper.getdata2("Select * from Withdrawals where Id="+approveId+"");
                if(dt.Rows.Count>0)
                {
                    dt = dbhelper.getdata2("Update Credits set Status=NULL where ClientId="+dt.Rows[0]["ClientId"].ToString()+"" +
                                          " Insert into Credits(ClientId,AgentId,OperatorId,Credits,SysDate,Date,Status) Select top 1 a.ClientId,a.AgentId,a.OperatorId,(a.Credits+"+ dt.Rows[0]["ClientId"].ToString() + " Credits,GETDATE() Sysdate,GETDATE() Date,'onsystem' Status from Credits a where ClientId="+ dt.Rows[0]["ClientId"].ToString() + " order by a.SysDate desc");

                }
            }

        }
        [WebMethod]
        public static string getnote(string cid)
        {
            DataTable dt = dbhelper.getdata2("Select *,c.Firstname+' '+c.Lastname [Name] from Withdrawals a left join Approvers b on a.ClientId=b.UnderId left join ClientInfo c on a.ClientId=c.Id where b.ClientId=" + cid + " and a.Status='Waiting' order by a.Sysdate desc");

            return dt.Rows.Count.ToString();
        }

    }
}