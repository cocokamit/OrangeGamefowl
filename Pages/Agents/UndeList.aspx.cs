using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.Agents
{
    public partial class UndeList : System.Web.UI.Page
    {
        public string UserName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientId"] != null)
            {

                UserName = Session["ClientId"].ToString();

                loadable(UserName);
            }
            else
                Response.Redirect("Login");

        }

        protected void loadable(string cID)
        {
            DataTable dt = dbhelper.getdata2("Select *, a.Lastname+' '+a.Firstname as [Name] from ClientInfo a left join Approvers b on a.Id=b.UnderId where b.ClientId="+ cID + " order by a.Id desc ");
            ViewState["data"] = dt;

            dt = dbhelper.getdata2("Select * from ClientInfo where Id=" + cID + "");

            inputfnamee.Value = dt.Rows[0]["Firstname"].ToString();
            inputlnamee.Value = dt.Rows[0]["Lastname"].ToString();
            inputusername.Value = dt.Rows[0]["Username"].ToString();
            inputpassword.Value = dt.Rows[0]["Password"].ToString();
            inputNumber.Value = dt.Rows[0]["ContactNo"].ToString();
            inputfb.Value = dt.Rows[0]["FB"].ToString();

        }


        [WebMethod]
        public static void Onsavers(string clientid, string fname, string lname, string username, string password, string contactno, string fb)
        {
            DataTable dt = dbhelper.getdata2("Update ClientInfo set Firstname='" + fname + "', Lastname='" + lname + "', Username='" + username + "', Password='" + password + "', ContactNo='" + contactno + "', FB='" + fb + "' where Id='" + clientid + "'");
            dbhelper.getdata2("Insert Into ActivityLogs values(GETDATE(),'Updated profile information'," + clientid + ") ");
        }



        [WebMethod]
        public static string OnCheckUser(string cID)
        {

            Random generator = new Random();
            string r = generator.Next(0, 999999).ToString("D6");
            string result = "";
            DataTable dt = dbhelper.getdata2("Insert into ClientInfo values(NULL,NULL,NULL,NULL,NULL,NULL,NULL,"+ r + ",1) SELECT SCOPE_IDENTITY() AS [Id]  ");

             dbhelper.getdata2("Insert into Approvers values("+ cID + "," + dt.Rows[0]["Id"].ToString() + ") ");

            if (dt.Rows.Count > 0)
            {
                result = dt.Rows[0]["Id"].ToString()+"~"+r;
            }

            return result;
        }
    }
}