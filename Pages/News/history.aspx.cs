using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.News
{
    public partial class history : System.Web.UI.Page
    {
        public static string UserName = "admin";
        public static string UserRole = "1";
        public static string agentname = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = dbhelper.getdata("Select Top 1 * from ActivationKeys where Status is null and Convert(Date,ExpirationDate)<GETDATE() order by Convert(Date,ExpirationDate) asc");
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("activationpage");
            }

            HttpContext.Current.Response.AddHeader("Set-Cookie", "HttpOnly;Secure;SameSite=Strict");
            if (Session["ClientId"] != null)
            {
                UserName = Session["ClientId"].ToString();
                UserRole = Session["Role"].ToString();
                agentname = Session["Name"].ToString();
            }
            else
                Response.Redirect("Login");


        }

        [WebMethod]
        public static string ongettable(string id)
        {
            string result = "";

            string query = "Select a.*,(case when b.status1='MERON' then 'WIN' else (case when b.status1='DRAW' then 'DRAW' else ' ' end) end) [winning],(Select top 1 d.Status from Claimable d where d.FightuserId=a.Id order by Id desc) Status, (Select top 1 d.Lacking from Claimable d where d.FightuserId=a.Id order by Id desc) Lacking from Fightusers a left join Fights b on a.MatchId=b.MatchId left join Matches c on b.MatchId=c.Id  where c.Status='ongoing' and a.Statusside='meron' and a.Fightno=" + id+" and b.Fightno="+id+"";
            DataTable dt = dbhelper.getdata(query);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    decimal a = Convert.ToDecimal(Math.Floor(Convert.ToDecimal(row["GainAmount"].ToString()) / 10)) * 10;
                    result += row["Amount"].ToString() + " - " + a + ".00-" + row["Id"].ToString() + " - " + row["AgentName"].ToString() + " - " + row["winning"].ToString() + " - " + row["Status"].ToString() + " - " + row["Lacking"].ToString() + "~";
                }
                return result;
            }

            return result;

        }
        [WebMethod]
        public static string ongettablewala(string id)
        {
            string result = "";
            string query = "Select a.*,(case when b.status1='WALA' then 'WIN' else (case when b.status1='DRAW' then 'DRAW' else ' ' end) end) [winning],(Select top 1 d.Status from Claimable d where d.FightuserId=a.Id order by Id desc) Status, (Select top 1 d.Lacking from Claimable d where d.FightuserId=a.Id order by Id desc) Lacking from Fightusers a left join Fights b on a.MatchId=b.MatchId left join Matches c on b.MatchId=c.Id  where c.Status='ongoing' and a.Statusside='wala' and a.Fightno=" + id + " and b.Fightno=" + id + "";
            DataTable dt = dbhelper.getdata(query);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    decimal a = Convert.ToDecimal(Math.Floor(Convert.ToDecimal(row["GainAmount"].ToString()) / 10)) * 10;

                    result += row["Amount"].ToString() + " - " + a + ".00-" + row["Id"].ToString() + " - " + row["AgentName"].ToString() + " - " + row["winning"].ToString() + " - " + row["Status"].ToString() + " - " + row["Lacking"].ToString() + "~";
                }
                return result;
            }

            return result;

        }

        [WebMethod]
        public static string ongetmatchdata(string id)
        {
            string result = "";

            if (id != "" && id != "0")
            {
                string query = "Select * from Fights a left join Matches b on a.MatchId = b.Id where b.Status = 'ongoing' and Fightno=" + id + "";
                DataTable dt = dbhelper.getdata(query);

                if (dt.Rows.Count > 0)
                {
                    result += dt.Rows[0]["TotalMeron"].ToString() + "-" + dt.Rows[0]["TotalWala"].ToString() + "-" + dt.Rows[0]["MeronParada"].ToString() + "-" + dt.Rows[0]["WalaParada"].ToString();
                    return result;
                }
            }
            return result;
        }

        [WebMethod]
        public static string onclaimed(string id,string amount)
        {
            string result = "";
            string statts = "";
            if (amount == "0" || amount == "")
            {
                statts = "Claimed";
                result = statts;
            }
            else
            {
                statts = "Claimed";
                result = "Lacking-" + amount;
            }


            string query = "Insert into Claimable values("+id+",'"+statts+"','"+ amount + "','"+ UserName + "',NULL) ";
            DataTable dt = dbhelper.getdata(query);

            return result;
        }

        [WebMethod]
        public static string oncomplete(string id)
        {
            string result = "";
         
            string query = "Update Claimable set Lacking=0, ClaimerAgentName='"+UserName+"' where FightuserId=" + id + " ";
            DataTable dt = dbhelper.getdata(query);

            return result;
        }
    }
}