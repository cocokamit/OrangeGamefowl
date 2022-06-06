using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive
{
    public partial class SiteMaster : MasterPage
    {
        public string idclient = "";
        public string userole = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            idclient = Session["ClientId"].ToString();
            userole = Session["Role"].ToString();
        }
        protected void clicklogout(object sender, EventArgs e)
        {

            dbhelper.getdata("Insert into ActivityLogs values(GETDATE(),'Logout'," + idclient + ")");
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login");
        }
    }
}