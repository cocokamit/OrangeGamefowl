using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.Admin
{
    public partial class Dashboard2 : System.Web.UI.Page
    {
        public string UserName = "";
        public string UserRole = "1";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ClientId"] != null)
            {
                UserName = Session["ClientId"].ToString();
                UserRole = Session["Role"].ToString();
            }
            else
            {
                Response.Redirect("Login");
            }
            loadable();
        }

        private void loadable() {

            ddlyear.Items.Clear();
            DataTable dt = dbhelper.getdata2("SELECT YEAR(s.CurrDate) yearer FROM BetHistory s left join BetHistory a on a.Id = s.Id WHERE s.Status is not NULL GROUP BY Year(s.CurrDate) ORDER BY  YEAR(s.CurrDate)");
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (row["yearer"].ToString() == DateTime.Now.ToString("yyyy"))
                    {
                        ddlyear.Items.Add(new ListItem(row["yearer"].ToString(), row["yearer"].ToString()));
                        ddlyear.Items.FindByValue(row["yearer"].ToString()).Selected = true;
                    }
                    else
                    {
                        ddlyear.Items.Add(new ListItem(row["yearer"].ToString(), row["yearer"].ToString()));
                    }
                }
            }
            else
            {
                ddlyear.Items.Add(new ListItem(DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("yyyy")));
                ddlyear.Items.FindByValue(DateTime.Now.ToString("yyyy")).Selected = true;
            }

            dt = dbhelper.getdata2("SELECT Count(*) counter from ClientInfo");

            if (dt.Rows.Count > 0)
            {
                l_hen.Text = dt.Rows[0]["counter"].ToString();
            }
            else
            {
                l_hen.Text = "0";
            }

            dt = dbhelper.getdata2("SELECT Count(*) counter from event");

            if (dt.Rows.Count > 0)
            {
                l_battle.Text = dt.Rows[0]["counter"].ToString();
            }
            else
            {
                l_battle.Text = "0";
            }

        }


        [WebMethod]
        public static string OnGetMonthlyStats(string id,string year)
        {
            string result = "0";
            string sales = "0~";
            string revenue = "0~";
            DataTable dt = dbhelper.getdata2("SELECT DATENAME(month, s.CurrDate) SalesMonth,SUM(s.bet) Sales,(SUM(s.bet)-SUM(Distinct a.Gain)) AS Revenue, SUM(Distinct a.Gain) Gain FROM BetHistory s left join BetHistory a on a.Id = s.Id WHERE s.Status is not NULL and Year(s.CurrDate)='" + year + "' GROUP BY Year(s.CurrDate),DATENAME(month, s.CurrDate) ORDER BY DATENAME(month, s.CurrDate)");

            if (dt.Rows.Count > 0)
            {
                result = "";
                sales = "";
                revenue = "";
                string[] months= { "January", "February","March", "April'", "May", "June", "July", "August", "September", "October", "November", "December"};
                string[,] dtmonths = new string[dt.Rows.Count, 3];
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dtmonths[i, 0] = dt.Rows[0]["SalesMonth"].ToString();
                    dtmonths[i, 1] = dt.Rows[0]["Sales"].ToString();
                    dtmonths[i, 2] = dt.Rows[0]["Revenue"].ToString();
                }
                for (int i = 0; i < dt.Rows.Count; i++) {
                    for (int j = 0; j < 12; j++)
                    {

                        if (dtmonths[i, 0] == months[j])
                        {
                            sales += dtmonths[i, 1] + "~";
                            revenue += dtmonths[i, 2] + "~";
                        }
                        else
                        {
                            sales += "0~";
                            revenue += "0~";
                        }
                    }
                }
            }
            result = sales.Remove(sales.Length-1) + "-" + revenue.Remove(revenue.Length-1);
            return result;
        }
        [WebMethod]
        public static string OnGetStats(string id,string startvalue,string starttsale,string startred,string startblue)
        {
            string result = "";

            DataTable dt =dbhelper.getdata2("Select top 1 * from event where Status='ongoing' order by event_date asc");

            if(dt.Rows.Count>0)
            {
                result += dt.Rows[0]["event_name"].ToString()+"~";
                result += "on" + "~";

                DataTable dtt = dbhelper.getdata2("Select * from match where event_id="+dt.Rows[0]["Id"].ToString()+" order by Sequence asc");

                if (dtt.Rows.Count > 0)
                {
                    result += dtt.Select("Status='done'").Length + "~";
                    result += dtt.Rows.Count + "~";
                }
                else
                {
                    result += "0~";
                    result += "0~";
                }

                DataTable dttt = dbhelper.getdata2("Select SUM(Bet)Tsale,case when(Select SUM(Bet) from BetHistory where Choice=1 ) is Null then 0 else (Select SUM(Bet) from BetHistory where Choice=1 )end  RedSale,case when(Select SUM(Bet) from BetHistory where Choice=2 ) is Null then 0 else (Select SUM(Bet) from BetHistory where Choice=2 )end BlueSale  from BetHistory where EventId="+ dt.Rows[0]["Id"].ToString() + "");
                string sales1 = "0", sales2 = "0", sales3 = "0";
                if (dttt.Rows.Count > 0)
                {
                    sales1 = dttt.Rows[0]["Tsale"].ToString();
                    sales2 = dttt.Rows[0]["RedSale"].ToString();
                    sales3 = dttt.Rows[0]["BlueSale"].ToString();
                    result += dttt.Rows[0]["Tsale"].ToString() + "~";
                    result += dttt.Rows[0]["RedSale"].ToString() + "~";
                    result += dttt.Rows[0]["BlueSale"].ToString() + "~";
                }
                else
                {
                    result += "0~";
                    result += "0~";
                    result += "0~";
                }

                //dttt = dbhelper.getdata("Select Count(Distinct a.ClientId)userCount from ActivityLogs a where (Select Top 1 Activity from ActivityLogs where ClientId=a.ClientId and (Activity='Login' or Activity='Logout') order by Date desc)='Login'");

                dttt = dbhelper.getdata2("Select Count(*)userCount from ActivePlayersRecord where Status='Online'");
                string tol = "0";
                if (dttt.Rows.Count > 0)
                {
                    result += dttt.Rows[0]["userCount"].ToString() + "~";
                    tol = dttt.Rows[0]["userCount"].ToString();
                }
                else
                {
                    result += "0~";                
                }

                dttt = dbhelper.getdata2("Select Sum(Bet) bet,Choice from BetHistory where EventId=2  group by Choice,Fightno order by Fightno asc");
                string red = "0", blue = "0";

                if (dttt.Rows.Count > 0)
                {
                    foreach (DataRow row in dttt.Rows)
                    {
                        if (row["Choice"].ToString() == "1")
                        {
                            red += row["bet"].ToString() + ",";
                        }
                        else {
                            blue += row["bet"].ToString() + ",";
                        }
                    }
                }

                result += red + "~" + blue+"~";

                if (Convert.ToInt32(startvalue) > 0)
                {
                    result += ((Convert.ToInt32(tol) - Convert.ToInt32(startvalue)) / Convert.ToInt32(startvalue)) * 100 + "~";
                }
                else
                {
                    result += "0~";
                }
                
                if (Convert.ToInt32(starttsale) > 0)
                {
                    result += ((Convert.ToInt32(sales1) - Convert.ToInt32(starttsale)) / Convert.ToInt32(starttsale)) * 100 + "~";
                }
                else
                {
                    result += "0~";
                }
                
                if (Convert.ToInt32(startred) > 0)
                {
                    result += ((Convert.ToInt32(sales2) - Convert.ToInt32(startred)) / Convert.ToInt32(startred)) * 100 + "~";
                }
                else
                {
                    result += "0~";
                }
                
                if (Convert.ToInt32(startblue) > 0)
                 {
                    result += ((Convert.ToInt32(sales3) - Convert.ToInt32(startblue)) / Convert.ToInt32(startblue)) * 100 + "~";
                }
                else
                {
                    result += "0~";
                }
            }

            return result;
        }
    }
 
}