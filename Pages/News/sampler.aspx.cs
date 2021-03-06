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
    public partial class sampler : System.Web.UI.Page
    {
        public string UserName = "admin";
        public string StartCredits = "";
        public string titler = "";
        public string eventid = "0";
        public string fightno = "0";
        public string TotalFight = "0";
        public string currentbets = "0";
        public string agentname = "";

        public string UserRole = "1";
        ConnClass ConnC = new ConnClass();
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

            loadable();
        }
        protected void clicklogouter(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login");
        }

        private void loadable()
        {

            DataTable dt = dbhelper.getdata("Select top 1 * from Matches where Status='ongoing' order by Id desc");
            if (dt.Rows.Count > 0)
            {
                titler = dt.Rows[0]["Name"].ToString();
                eventid = dt.Rows[0]["Id"].ToString();
                titlebar.InnerText = dt.Rows[0]["Name"].ToString() == "" ? "No match was scheduled today." : dt.Rows[0]["Name"].ToString();

                dt = dbhelper.getdata("Select top 1 * from Fights where MatchId=" + eventid + " and Status is NULL order by Fightno desc");

                if (dt.Rows.Count > 0)
                {
                    fightno = dt.Rows[0]["Fightno"].ToString();
                    TotalFight = dt.Rows.Count.ToString();
                }
            }
        }


        [WebMethod]
        public static string ongettable(string id)
        {
            string result = "";


            string query = "Select a.* ,ROW_NUMBER() over(order by a.Id desc) rownum from Fightusers a left join Fights b on a.MatchId=b.MatchId left join Matches c on b.MatchId=c.Id where c.Status='ongoing' and a.Statusside='meron' and a.Fightno=(Select top 1 Fightno from Fights where MatchId=c.Id  order by Fightno desc) and b.Fightno=(Select top 1 Fightno from Fights where MatchId=c.Id  order by Fightno desc) order by Id asc";
            DataTable dt = dbhelper.getdata(query);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {

                    decimal a = Convert.ToDecimal(Math.Floor(Convert.ToDecimal(row["GainAmount"].ToString()) / 10)) * 10;
                    result += row["Amount"].ToString() + " - " + a + ".00-" + row["Id"].ToString() + " - " + row["AgentName"].ToString() + "~";
                }
                return result;
            }

            return result;
           
        }
        [WebMethod]
        public static string ongettablewala(string id)
        {
            string result = "";
            string query = "Select a.*,ROW_NUMBER() over(order by a.Id desc) rownum  from Fightusers a left join Fights b on a.MatchId=b.MatchId left join Matches c on b.MatchId=c.Id where c.Status='ongoing' and a.Statusside='wala' and a.Fightno=(Select top 1 Fightno from Fights where MatchId=c.Id order by Fightno desc) and b.Fightno=(Select top 1 Fightno from Fights where MatchId=c.Id  order by Fightno desc) order by Id asc";
            DataTable dt = dbhelper.getdata(query);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    decimal a = Convert.ToDecimal(Math.Floor(Convert.ToDecimal(row["GainAmount"].ToString()) / 10)) * 10;

                    result += row["Amount"].ToString() + " - " + a + ".00-" + row["Id"].ToString() + " - " + row["AgentName"].ToString() + "~";
                }
                return result;
            }

            return result;

        }

        [WebMethod]
        public static void oncancels(string id)
        {
         /*   string result = "";
            string query = "Delete from Fightusers where id=" + id;
            DataTable dt = dbhelper.getdata(query);*/

        }
        [WebMethod]
        public static string ongetmatchdata(string id)
        {
            string result = "";
            if (id != "" && id!="0")
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
    }
}