using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.News
{
    public partial class monton : System.Web.UI.Page
    {
        public string UserName = "admin";
        public string agentname = "";

        public string UserRole = "1";
        public string fightno = "0";
        public string montonno = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = dbhelper.getdata("Select Top 1 * from ActivationKeys where Status is null and Convert(Date,ExpirationDate)<GETDATE() order by Convert(Date,ExpirationDate) asc");
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("activationpage");
            }

            HttpContext.Current.Response.AddHeader("Set-Cookie", "HttpOnly;Secure;SameSite=Strict");
            if (Session["ClientId"] != null)
            {
                UserName = Session["ClientId"].ToString();
                UserRole = Session["Role"].ToString();
                agentname = Session["Name"].ToString();
            }
            else
                Response.Redirect("Login");

            loader();
        }

        public void loader()
        {
            DataTable dt = dbhelper.getdata("Select * from Monton order by Id desc");

            ddl_gamename.Items.Clear();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    ddl_gamename.Items.Add(new ListItem(row["Name"].ToString(), row["Id"].ToString()));
                }

                DataTable dtt =dbhelper.getdata("Select ISNULL(FightId,0) Fightnos,ISNULL(MontonId,0) MontonIds  from MontonMatch where MontonId=" + dt.Rows[0]["Id"].ToString() + " order by FightId desc");

                montonno = dt.Rows[0]["Id"].ToString();
                if (dtt.Rows.Count > 0)
                {
                    fightno = (Convert.ToInt32(dtt.Rows[0]["Fightnos"].ToString()) + 1).ToString();
                }
                else
                {
                    fightno = "1";
                }

            }


        }

        [WebMethod]
        public static string onnewcontent(string id)
        {
            string result = "";
            dbhelper.getdata("Insert into Monton(Name,Sysdate,Status) values('" + DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss") + "','" + DateTime.Now.ToString("MM/dd/yyyy") + "','ongoing')");

            DataTable dt = dbhelper.getdata("Select * from Monton order by Id desc");

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    result += row["Name"].ToString() + "-" + row["Id"].ToString() +"~";
                }
            }

            return result;

        }

        [WebMethod]
        public static string ongocontent(string id)
        {
            string result = "";
            DataTable dt = dbhelper.getdata("Select *,(Select top 1 FightId from MontonMatch where MontonId="+id+ " order by FightId desc) FNumber,(Select sum(CAST(Rentas as int)) from MontonMatch where MontonId=" + id + " and (Status is not null and Status !='Draw' and Status !='Cancel')) TRentas,(Select sum(CAST(Convert(float,Ariba) as int)) from MontonMatch where MontonId=" + id + " and (Status is not null and Status !='Draw' and Status !='Cancel')) TAriba from MontonMatch where MontonId=" + id+" order by FightId desc");

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    result += row["Id"].ToString() + "~" + row["FightId"].ToString() + "~" + row["MeronName"].ToString() + "~" + row["MeronAmount"].ToString() + "~" + row["WalaName"].ToString() + "~" + row["WalaAmount"].ToString() + "~" + row["Status"].ToString() +"~"+ (Convert.ToInt32(dt.Rows[0]["FNumber"].ToString()) + 1).ToString()+"~"+row["TRentas"].ToString()+"~"+row["TAriba"].ToString()+ "=";
                }
            }

            return result;

        }

        [WebMethod]
        public static string onenternew(string id,string montonid,string MeronName,string MeronAmount)
        {
            string result = "";

            DataTable dt = dbhelper.getdata("Insert into MontonMatch(FightId,MontonId,MeronName,MeronAmount,Rentas) Values("+id+","+montonid+",'"+ MeronName + "','"+ MeronAmount + "',200)");

            return result;
        }

        [WebMethod]
        public static string onenternew2(string id, string WalaName, string WalaAmount)
        {
            string result = "";

            DataTable dt = dbhelper.getdata("Select * from MontonMatch where Id="+id+"");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["MeronName"].ToString() == "" || dt.Rows[0]["MeronAmount"].ToString() == "")
                {
                    dbhelper.getdata("Update MontonMatch set  MeronName='" + WalaName + "', MeronAmount='" + WalaAmount + "' where Id=" + id + "");
                }
                else
                {
                    int meronamount = Convert.ToInt32(dt.Rows[0]["MeronAmount"].ToString());
                    int walaamount = Convert.ToInt32(WalaAmount);

                    if (meronamount > walaamount)
                    {
                        int diff = meronamount - walaamount;
                        dbhelper.getdata("Update MontonMatch set WalaName='" + WalaName + "', WalaAmount='" + WalaAmount + "', Diffs='" + diff + "' where Id=" + id + "");
                    }
                    else
                    {
                        string MeronName = dt.Rows[0]["MeronName"].ToString();
                        int diff = walaamount - meronamount;

                        dbhelper.getdata("Update MontonMatch set WalaName='" + MeronName + "',WalaAmount='" + meronamount + "', MeronName='" + WalaName + "', MeronAmount='" + WalaAmount + "', Diffs='" + diff + "' where Id=" + id + "");
                    }
                }
            }

            return result;
        }

        [WebMethod]
        public static string onpadaug(string id)
        {
            string result = "";

            DataTable dt = dbhelper.getdata("Select * from MontonMatch where Id="+id+"");

            if (dt.Rows.Count > 0)
            {
                result = dt.Rows[0]["Id"].ToString()+"~"+ dt.Rows[0]["FightId"].ToString() + "~" + dt.Rows[0]["MeronName"].ToString() + "~" + dt.Rows[0]["WalaName"].ToString() + "~" + dt.Rows[0]["MeronAmount"].ToString() + "~" + dt.Rows[0]["WalaAmount"].ToString() + "~" + dt.Rows[0]["Rentas"].ToString() + "~" + dt.Rows[0]["Ariba"].ToString() + "~" + dt.Rows[0]["EqualizeAmount"].ToString() + "~" + dt.Rows[0]["Diffs"].ToString() + "~" + dt.Rows[0]["Status"].ToString() + "~" + "";
            }

            return result;
             
        }

        [WebMethod]
        public static string onddlchange(string id,string statusside,string equalizer)
        {
            string result = "";

            DataTable dt = dbhelper.getdata("Select * from MontonMatch where Id="+id+"");

            if (dt.Rows.Count > 0) {
                int meronamount = Convert.ToInt32(dt.Rows[0]["MeronAmount"].ToString());
                int walaamount = Convert.ToInt32(dt.Rows[0]["WalaAmount"].ToString());
                double sale = 0;
                double ariba = 0;
                int masyada = 0;
                if (equalizer.Trim() != "" && equalizer.Trim() != "0")
                {
                    masyada=Convert.ToInt32(equalizer);
                }

                double totalwinamount = 0;
                if (statusside == "Meron")
                {
                    sale=((walaamount+ masyada)*.10)+200;
                    ariba = (walaamount + masyada) * .10;
                    totalwinamount = (walaamount + masyada) - ariba-200;
                }
                else if (statusside == "Wala")
                {
                    sale = (walaamount * .10)+200;
                    ariba = walaamount * .10;
                    totalwinamount = (walaamount) - ariba-200;
                }
                else
                {
                    sale = 0;
                }

                dt = dbhelper.getdata("Update MontonMatch set Status='" + statusside + "',Ariba='"+ariba+"',Sale='"+sale+"',TotalWinAmount='"+totalwinamount+"',EqualizeAmount='"+equalizer+"'  where Id=" + id + "");

            }
            return result;
        }

        [WebMethod]
        public static string removeentry(string id, string statusside)
        {
            string result = "";
            if (statusside == "Meron")
            {
                DataTable dtt = dbhelper.getdata("Select * from MontonMatch where Id="+id+"");
                if (dtt.Rows.Count > 0)
                {
                    if (dtt.Rows[0]["WalaName"].ToString() != "")
                    {
                        DataTable dt = dbhelper.getdata("Update MontonMatch set MeronName='"+ dtt.Rows[0]["WalaName"].ToString() + "', MeronAmount='"+ dtt.Rows[0]["WalaAmount"].ToString() + "',WalaName='',WalaAmount='' where Id=" + id + "");
                    }
                    else
                    {
                        DataTable dt = dbhelper.getdata("Update MontonMatch set MeronName='', MeronAmount='' where Id=" + id + "");
                    }
                }
            }
            else
            {
                DataTable dt = dbhelper.getdata("Update MontonMatch set WalaName='', WalaAmount='' where Id=" + id + "");
            }

            return result;
        }
    }
}