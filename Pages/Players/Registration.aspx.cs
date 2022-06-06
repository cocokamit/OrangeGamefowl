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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void click_login(object sender, EventArgs e)
        {
            Response.Redirect("Login");
        }

        protected void click_register(object sender, EventArgs e)
        {
            string refcode=Request.QueryString["Refcode"];
            dbhelper.getdata2("Update ClientInfo set Firstname='"+txt_Fname.Text+"', Lastname='"+txt_Lname.Text+"', Username='"+txt_username.Text+"',Password='"+txt_pass.Text+"',ContactNo='"+txt_Contact.Text+"' where RefCode="+ refcode + " ");
            Response.Write("<script>alert('You have successfully registered. Please login your account.');</script>");
            Response.Redirect("Login");
        }

        [WebMethod]
        public static string OnCheckUserName(string username)
        {
            string result = "";
            DataTable dt = dbhelper.getdata2("Select * from ClientInfo where Username like '%"+username+"%'");

            if (dt.Rows.Count > 0)
            {
                result = "Username already exist.";
            }

            return result;
        }
    }
}