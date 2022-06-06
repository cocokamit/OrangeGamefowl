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
    public partial class ticketing : System.Web.UI.Page
    {
        public string UserName = "admin";
        public string UserRole = "1";
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
        public static string onticketers(string types, string amounts)
        {
            string result = "";
            if (types == "1")
            {
                DataTable dt2 = dbhelper.getdata("Select * from Amounts");
                amounts = dt2.Rows[0]["GateAmount"].ToString();
            }

            DataTable dt = dbhelper.getdata("insert into Gate(Amount,Sysdate,Type) values('" + amounts + "','" + DateTime.Now.ToString("MM/dd/yyyy") + "','" + types + "') SELECT SCOPE_IDENTITY() AS [scopeid];  ");

            if (dt.Rows.Count > 0)
            {
                result = dt.Rows[0]["scopeid"].ToString();
            }
            return result;
        }


        [WebMethod]
        public static string ongetall (string id)
        {
            string result = "";

            DataTable dt1 = dbhelper.getdata("Select ISNULL(SUM(Convert(int,Amount)),0) totalAmount from Gate where (Type=1 or Type=3) and CONVERT(date,Sysdate)=CONVERT(Date,GETDATE())  ");

            DataTable dt2 = dbhelper.getdata("Select ISNULL(COUNT(Amount), 0) totalAmount from Gate where (Type=1 or Type=3) and CONVERT(date, Sysdate) = CONVERT(Date, GETDATE())");


            DataTable dt3 = dbhelper.getdata("Select ISNULL(COUNT(Amount), 0) totalAmount from Gate where Type = 2 and CONVERT(date, Sysdate) = CONVERT(Date, GETDATE())");  

            if (dt1.Rows.Count > 0)
            {
                result = dt1.Rows[0]["totalAmount"].ToString();
            }

            if (dt2.Rows.Count > 0)
            {
                result = result+"~"+ dt2.Rows[0]["totalAmount"].ToString();
            }

            if (dt3.Rows.Count > 0)
            {
                result = result +"~"+ dt3.Rows[0]["totalAmount"].ToString();
            }
            return result;
        }

    }
}