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
    public partial class activationkey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable dt = dbhelper.getdata("Select Top 1 * from ActivationKeys where Status is null and Convert(Date,ExpirationDate)<GETDATE() order by Convert(Date,ExpirationDate) asc");
            if (dt.Rows.Count == 0)
            {
                Response.Redirect("Login");
            }

            divone.Visible = true;
            divtwo.Visible = false;
        }

        protected void getactivate(object sender, EventArgs e)
        {
            if (txt_user.Text != "")
            {
                // DataTable db=dbhelper.getdata("Select Top 1 * from ActivationKeys where Status is null and Convert(Date,ExpirationDate)<GETDATE() order by Convert(Date,ExpirationDate) asc");
                DataTable dt = dbhelper.getdata("Select * from ActivationKeys where ActivationKey='"+txt_user.Text.Trim().ToString()+"' and Status is null");
                if (dt.Rows.Count > 0)
                {
                    dbhelper.getdata("Update ActivationKeys set Status='Done' where ActivationKey='"+txt_user.Text.Trim().ToString()+"'");

                    divone.Visible = false;
                    divtwo.Visible = true;

                    lbl_error.Text = "";
                    txt_user.Text = "";
                }
                else
                {
                    lbl_error.Text = "Activation Key Invalid!";
                    txt_user.Text = "";
                }
            }
        }

    }
}