using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void click_go(object sender, EventArgs e)
        {
            if (txt_pass.Text != "" && txt_user.Text != "")
            {
                DataTable dt = dbhelper.getdata("Select * from Users where Username='" + txt_user.Text + "' and Password='" + txt_pass.Text + "'");
                if (dt.Rows.Count > 0)
                {
                    Session["ClientId"] = dt.Rows[0]["Id"].ToString();
                    Session["Role"] = dt.Rows[0]["Type"].ToString();
                    Session["Name"] = dt.Rows[0]["Name"].ToString();

                    //dbhelper.getdata("Insert into ActivityLogs Values(GETDATE(),'Login'," + dt.Rows[0]["Id"].ToString() + ") ");

                    if (dt.Rows[0]["Type"].ToString() == "1")
                    {
                        Response.Redirect("screen");
                    }
                    else if (dt.Rows[0]["Type"].ToString() == "2")
                    {
                        Response.Redirect("sampler");
                    }
                    else if (dt.Rows[0]["Type"].ToString() == "3")
                    {
                        Response.Redirect("director");
                    }
                    else if (dt.Rows[0]["Type"].ToString() == "4")
                    {
                        Response.Redirect("admin");
                    }
                    else if (dt.Rows[0]["Type"].ToString() == "5")
                    {
                        Response.Redirect("history");
                    }
                    else if (dt.Rows[0]["Type"].ToString() == "6")
                    {
                        Response.Redirect("monton");
                    }
                    else if (dt.Rows[0]["Type"].ToString() == "7")
                    {
                        Response.Redirect("ticketing");
                    }
                    else if (dt.Rows[0]["Type"].ToString() == "10")
                    {
                        Response.Redirect("Dashboard2");
                    }
                    else if (dt.Rows[0]["Type"].ToString() == "11")
                    {
                        Response.Redirect("prioprep");
                    }
                    else if (dt.Rows[0]["Type"].ToString() == "12")
                    {
                        Response.Redirect("prioscreen");
                    }

                }
            }

            Response.Redirect("Login");
        }
        [WebMethod]
        public static string click_gos(string username, string password)
        {
            string result = "";
            if (username != "" && password != "")
            {
                DataTable dt = dbhelper.getdata("Select * from Users where Username='" + username + "' and Password='" + password + "'");
                if (dt.Rows.Count > 0)
                {
                    result += dt.Rows[0]["Id"].ToString() + "~";
                    result += dt.Rows[0]["Type"].ToString();

                }
                else
                {

                }
            }
            return result;
        }
    }
}