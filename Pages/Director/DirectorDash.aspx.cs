using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.Director
{
    public partial class DirectorDash : System.Web.UI.Page
    {
        public string UserName = "admin";
        public string StartCredits = "";
        public string titler = "";
        ConnClass ConnC = new ConnClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.AddHeader("Set-Cookie", "HttpOnly;Secure;SameSite=Strict");
            if (Session["ClientId"] != null)
            {
                UserName = Session["ClientId"].ToString();

            }
            else
                Response.Redirect("Login");

            loadable(UserName);
        }

        private void loadable(string id)
        {
            DataTable dt = dbhelper.getdata2("Select top 1 * from Credits where ClientId=" + id + " and Status='onsystem' order by SysDate desc");
            if (dt.Rows.Count > 0)
            {
                StartCredits = dt.Rows[0]["Credits"].ToString();
            }

            dt = dbhelper.getdata2("Select top 1 * from Event where Status='ongoing' order by SysDate desc");
            if (dt.Rows.Count > 0)
            {
                titler = dt.Rows[0]["Title"].ToString();
            }
        }




    }
}