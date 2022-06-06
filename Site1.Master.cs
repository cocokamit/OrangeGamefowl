using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string idclient = "";
        public string userole = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientId"] != null)
            {
                idclient = Session["ClientId"].ToString();
                userole = Session["Role"].ToString();
            }
            else
                Response.Redirect("Login");

        }

        protected void clicklogout(object sender, EventArgs e)
        {
            //   dbhelper.getdata("Insert into ActivityLogs values(GETDATE(),'Logout',"+ idclient + ")");
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login");
        }
    }
}