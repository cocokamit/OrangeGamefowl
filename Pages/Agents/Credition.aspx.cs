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
    public partial class Credition : System.Web.UI.Page
    {
        public string UserName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientId"] != null)
            {
                hfcid.Value = Session["ClientId"].ToString();
                hfrole.Value = Session["Role"].ToString();
                loadable(hfcid.Value);
            }
            else
                Response.Redirect("Login");
        }

        protected void loadable(string cID)
        {
            if (hfrole.Value == "2")
            {
                DataTable dt = dbhelper.getdata2("Select a.Id,a.Firstname+' '+a.Lastname [Name],case when (Select Credits from Credits where Status='onsystem' and ClientId=a.Id) IS NULL then 0 else (Select Credits from Credits where Status='onsystem' and ClientId=a.Id) end Credits,(Select COUNT(*) from AddedCredits where ClientId=a.Id) Norequest from ClientInfo a left join Approvers b on a.Id=b.UnderId where b.ClientId=" + cID+"");
                ViewState["data"] = dt;
            }
            else if (hfrole.Value == "3")
            {
                DataTable dt = dbhelper.getdata2("Select a.Id,a.Firstname+' '+a.Lastname [Name],case when (Select Credits from Credits where Status='onsystem' and ClientId=a.Id) IS NULL then 0 else (Select Credits from Credits where Status='onsystem' and ClientId=a.Id) end Credits,(Select COUNT(*) from AddedCredits where ClientId=a.Id) Norequest from ClientInfo a left join Approvers b on a.Id=b.UnderId");
                ViewState["data"] = dt;
            }

        }


        [WebMethod]
        public static void Onsavers(string clientid, string agent, string amountcred)
        {
            DataTable dt = dbhelper.getdata2("Select top 1 b.*,case when (Select Credits from Credits where Status='onsystem' and ClientId=a.Id) IS NULL then 0 else (Select Credits from Credits where Status='onsystem' and ClientId=a.Id) end Creditss, case when(Select top 1 ClientId from Approvers where UnderId = " + agent+" ) IS NULL then 0 else (Select top 1 ClientId from Approvers where UnderId = "+agent+" )end Operatord from ClientInfo a left join Credits b on a.Id = b.ClientId where a.Id ="+clientid+" order by b.Status desc");
            var result = "";
            if (dt.Rows.Count > 0)
            {
                    dbhelper.getdata2("Update Credits set Status=NULL where Id=" + dt.Rows[0]["Id"].ToString() );
            }

            double d = (Convert.ToDouble(dt.Rows[0]["Creditss"].ToString()) + Convert.ToDouble(amountcred));
            dbhelper.getdata2(" Insert into Credits values(" + dt.Rows[0]["ClientId"].ToString() + "," + agent + "," + dt.Rows[0]["Operatord"].ToString() + "," + d + ",GETDATE(),GETDATE(),'onsystem')" +
                             " Insert into AddedCredits values(" + dt.Rows[0]["ClientId"].ToString() + "," + agent + "," + amountcred + ",GETDATE())");
        }

    }
}