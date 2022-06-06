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
    public partial class prioprep : System.Web.UI.Page
    {
        public string UserRole = "1";
        public string UserName = "admin";
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
        }

        [WebMethod]
        public static string onready(string id)
        {
            string result = "";
            DataTable dt = dbhelper.getdata("Select * from PrioPrep");

            if (dt.Rows.Count== 0)
            {
                dbhelper.getdata("Insert into PrioPrep (ReadyNumber) values('" + id + "')");
            }
            else
            {
                dbhelper.getdata("Update PrioPrep set ReadyNumber='"+id+"'");
            }
            return result;
        }

        [WebMethod]
        public static string onlimber(string id)
        {
            string result = "";
            DataTable dt = dbhelper.getdata("Select * from PrioPrep");

            if (dt.Rows.Count == 0)
            {
                dbhelper.getdata("Insert into PrioPrep (LimberNumber) values('" + id + "')");
            }
            else
            {
                dbhelper.getdata("Update PrioPrep set LimberNumber='" + id + "'");
            }
            return result;
        }

        [WebMethod]
        public static string onheeling(string id)
        {
            string result = "";
            DataTable dt = dbhelper.getdata("Select * from PrioPrep");

            if (dt.Rows.Count == 0)
            {
                dbhelper.getdata("Insert into PrioPrep (HeelingNumber) values('" + id + "')");
            }
            else
            {
                dbhelper.getdata("Update PrioPrep set HeelingNumber='" + id + "'");
            }
            return result;
        }
    }
}