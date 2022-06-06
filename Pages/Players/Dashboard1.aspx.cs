using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.Players
{
    public partial class Dashboard1 : System.Web.UI.Page
    {
        public string UserName = "";
        public string winrate = "0";
        public string loserate = "0";
        public string drawrate = "0";
        public string total = "100";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientId"] != null)
            {
                UserName = Session["ClientId"].ToString();

                loadable(UserName);
            }
            else
                Response.Redirect("Login");
        }

        private void loadable(string id)
        {
            DataTable dt = dbhelper.getdata2("Select Distinct case when (Select Count(*) from BetHistory where ClientId=" + id + " and Status='win') is null then 0 else (Select Count(*) from BetHistory where ClientId=" + id + " and Status='win') end [win], case when (Select Count(*) from BetHistory where ClientId=" + id + " and Status='lose') is null then 0 else (Select Count(*) from BetHistory where ClientId=" + id + " and Status='lose') end [lose], case when (Select Count(*) from BetHistory where ClientId=" + id + " and Status='draw') is null then 0 else (Select Count(*) from BetHistory where ClientId=" + id + " and Status='draw') end [draw],(Select top 1 Credits from Credits where Status='onsystem' and ClientId=" + id + ")[credits] from Credits");
            if (dt.Rows.Count > 0)
            {
                winrate=totalwin.InnerText = dt.Rows[0]["win"].ToString();
                loserate=totallose.InnerText = dt.Rows[0]["lose"].ToString();
                drawrate=totaldraw.InnerText = dt.Rows[0]["draw"].ToString();
                total=totalcredits.InnerText = dt.Rows[0]["credits"].ToString();
            }

            dt = dbhelper.getdata2("Select a.*,case when a.choice>0 then (case when choice=1 then 'RED' else 'BLUE' end) else 'none' end [Choicer] from BetHistory a where a.ClientId="+id+" order by a.Sysdate desc");
            ViewState["BetHistory"]=dt;

            dt = dbhelper.getdata2("Select * from ClientInfo where Id="+id+"");

            wdnumber.Value = dt.Rows[0]["ContactNo"].ToString();
            inputfnamee.Value = dt.Rows[0]["Firstname"].ToString();
            inputlnamee.Value = dt.Rows[0]["Lastname"].ToString();
            inputusername.Value = dt.Rows[0]["Username"].ToString();
            inputpassword.Value = dt.Rows[0]["Password"].ToString();
            inputNumber.Value = dt.Rows[0]["ContactNo"].ToString();
            inputfb.Value = dt.Rows[0]["FB"].ToString();
            dt = dbhelper.getdata2("Select * from Credits where ClientId=" + id + "");
            ViewState["CreditHistory"] = dt;

            dt = dbhelper.getdata2("Select b.* from Approvers a left join ClientInfo b on a.ClientId=b.Id where a.UnderId=" + id + "");
            ViewState["Personnels"] = dt;

            dt = dbhelper.getdata2("Select * from Withdrawals where ClientId=" + id + " order by Id desc ");
            ViewState["data"] = dt;
        }

        [WebMethod]
        public static void Onsavers(string clientid, string fname,string lname,string username,string password, string contactno, string fb)
        {
            DataTable dt = dbhelper.getdata2("Update ClientInfo set Firstname='"+fname+"', Lastname='"+lname+"', Username='"+username+"', Password='"+password+"', ContactNo='"+contactno+"', FB='"+fb+"' where Id='"+clientid+"'");
            dbhelper.getdata2("Insert Into ActivityLogs values(GETDATE(),'Updated profile information',"+clientid+") ");
        }

        [WebMethod]
        public static string OnCheckUser(string cID,string credits,string outlet,string bankname,string accountno,string accountname,string contactno)
        {
            string result = "Data not valid.";
            DataTable dt = dbhelper.getdata2("Select * from Credits where ClientId="+cID+ " and Status='onsystem' order by SysDate desc");

            if (dt.Rows.Count > 0)
            {
                double doblecalc = Convert.ToDouble(dt.Rows[0]["Credits"].ToString()) - Convert.ToDouble(credits);
                if (doblecalc >= 0)
                {
                    dt = dbhelper.getdata2("Insert into Credits values(" + cID + "," + dt.Rows[0]["AgentId"].ToString() + "," + dt.Rows[0]["OperatorId"].ToString() + "," + doblecalc + ",GETDATE(),GetDate(),'onsystem') " +
                                          " Update Credits set Status=NULL where Id=" + dt.Rows[0]["Id"].ToString() + "" + " Insert into Withdrawals values(" + cID + ",'" + credits + "','" + outlet + "','" + bankname + "','" + accountno + "','" + accountname + "','" + contactno + "','Waiting','Withdraw',GETDATE()) SELECT SCOPE_IDENTITY() AS [Id]  ");

                    result = credits + "~" + outlet + "~" + bankname + "~" + accountno + "~" + "Waiting";
                 
                }
            }

            return result;
        }

    }
}