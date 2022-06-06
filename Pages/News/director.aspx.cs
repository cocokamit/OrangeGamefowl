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
    public partial class director : System.Web.UI.Page
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
                //titlebar.InnerText = dt.Rows[0]["Name"].ToString() == "" ? "No match was scheduled today." : dt.Rows[0]["Name"].ToString();

                dt = dbhelper.getdata("Select top 1 * from Fights where MatchId=" + eventid + " and Status is NULL order by Fightno desc");

                if (dt.Rows.Count > 0)
                {
                    fightno = dt.Rows[0]["Fightno"].ToString();
                    TotalFight = dt.Rows.Count.ToString();
                }
            }
        }

        [WebMethod]
        public static void onstart(string username)
        {
            string result = "";
            dbhelper.getdata("Update Matches set Status='end'");
            dbhelper.getdata("Insert into Matches (Name,Status) values('Match','ongoing')");

            DataTable dt = dbhelper.getdata("Select top 1 * from Matches where Status='ongoing' order by Id desc");
            if (dt.Rows.Count > 0) {
            dbhelper.getdata("Insert into Fights(MatchId,Fightno,TotalMeron,TotalWala,MeronParada,WalaParada,Status,status1) values(" + dt.Rows[0]["Id"].ToString() + ",1,0,0,0,0,NULL,NULL)");
            }
        }

        [WebMethod]
        public static void onend(string username)
        {
            dbhelper.getdata("Update Matches set Status='end'");
        }
        [WebMethod]
        public static void onannounce(string username)
        {
            DataTable dt = dbhelper.getdata("Select top 1 * from Matches where Status='ongoing' order by Id desc");
            if (dt.Rows.Count > 0)
            {
                DataTable dd = dbhelper.getdata("Select top 1 * from Fights where MatchId=" + dt.Rows[0]["Id"].ToString() + " order by Id desc");
                if (dd.Rows.Count > 0)
                {
                    dbhelper.getdata("Update Fights set status1='"+username+"' where Id="+dd.Rows[0]["Id"].ToString()+"");
                }
            }
        }
        [WebMethod]
        public static void onnext(string username)
        {
            DataTable dt = dbhelper.getdata("Select top 1 * from Matches where Status='ongoing' order by Id desc");
            if (dt.Rows.Count > 0)
            {
                DataTable dd = dbhelper.getdata("Select * from Fights where MatchId="+dt.Rows[0]["Id"].ToString()+" order by Id desc");
                if (dd.Rows.Count > 0)
                {
                    if (dd.Rows[0]["status1"].ToString() != "")
                    {
                        dbhelper.getdata("Insert into Fights(MatchId,Fightno,TotalMeron,TotalWala,MeronParada,WalaParada,Status,status1) values(" + dt.Rows[0]["Id"].ToString() + "," + (dd.Rows.Count + 1) + ",0,0,0,0,NULL,NULL)");
                    }
                }
                else
                {
                    dbhelper.getdata("Insert into Fights(MatchId,Fightno,TotalMeron,TotalWala,MeronParada,WalaParada,Status,status1) values(" + dt.Rows[0]["Id"].ToString() + ",1,0,0,0,0,NULL,NULL)");
                }
               
            }

        }
        [WebMethod]
        public static string checklast(string username)
        {
            string result = "";
            DataTable dt = dbhelper.getdata("Select top 1 * from Matches where Status='ongoing' order by Id desc");
            if (dt.Rows.Count > 0)
            {
                DataTable dtt = dbhelper.getdata("Select top 1 * from Fights where MatchId=" + dt.Rows[0]["Id"].ToString() + " order by Id desc");

                if (dtt.Rows.Count > 0)
                {
                    if (dtt.Rows[0]["status1"].ToString() == "")
                    {
                        result = "1";
                    }
                    else
                    {
                        result = "";
                    }
                }
            }

            return result;
        }


    }
}