using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.News
{
    public partial class printpadaug : System.Web.UI.Page
    {
        public static string payid, padaug;
        public static DataTable dttt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = dbhelper.getdata("Select Top 1 * from ActivationKeys where Status is null and Convert(Date,ExpirationDate)<GETDATE() order by Convert(Date,ExpirationDate) asc");
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("activationpage");
            }

            if (!IsPostBack)
            {

                payid = Request.QueryString["payid"].ToString();

                string query = "Select '" + DateTime.Now.ToString("MM/dd/yyyy") + "' Datetimes,* from MontonMatch where Id=" + payid + "";
                DataTable dtt = dbhelper.getdata(query);
                dttt = dtt;

                /* Run();*/
            }
        }

    }
}