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
    public partial class screen : System.Web.UI.Page
    {
        public string UserName = "admin";
        public string StartCredits = "";
        public string titler = "";
        public string eventid = "0";
        public string fightno = "0";
        public string TotalFight = "0";
        public string currentbets = "0";

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
        public static string ongetcounts(string username)
        {
            string result = "";
            string query = "Select top 1 a.*,b.Name from Fights a left join Matches b on a.MatchId=b.Id where b.Status='ongoing' order by Fightno desc";
            DataTable dt = dbhelper.getdata(query);

            if (dt.Rows.Count > 0)
            {
                return result = dt.Rows[0]["TotalMeron"].ToString() + "~" + dt.Rows[0]["TotalWala"].ToString() + "~" + dt.Rows[0]["MeronParada"].ToString() + "~" + dt.Rows[0]["WalaParada"].ToString() + "~" + dt.Rows[0]["status1"].ToString() + "~" + dt.Rows[0]["Fightno"].ToString();
            }
            else
            {
                return result = "0~0~0~0~-~";
            }
        }
        [WebMethod]
        public static string onfightwinners(string username)
        {
            string result = "";
            string query = "Select top 11 status1,Fightno from Fights a left join Matches b on a.MatchId=b.Id where b.Status='ongoing' order by Fightno desc";

            DataTable dt = dbhelper.getdata(query);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    result += row["Fightno"].ToString() + "-" + row["status1"].ToString()+"~";
                }
            }
            return result;
        }

    }
}