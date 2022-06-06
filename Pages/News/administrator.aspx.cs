using ClosedXML.Excel;
using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.News
{
    public partial class administrator : System.Web.UI.Page
    {
        public string UserName = "admin";
        public string agentname = "";
        public string UserRole = "1";
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
                if (Session["Role"].ToString() != "4")
                {
                    Response.Redirect("Login");
                }
                else
                {
                    UserName = Session["ClientId"].ToString();
                    UserRole = Session["Role"].ToString();
                    agentname = Session["Name"].ToString();
                }
            }
            else
                Response.Redirect("Login");

            if (!IsPostBack)
            {
                loadable();
            }
        }


        private void loadable()
        {

            DataTable dt = dbhelper.getdata("Select distinct Year(Sysdate) as sysyear from Fightusers where Sysdate is not null order by Year(Sysdate) asc ");

            ddl_years.Items.Clear();

            foreach (DataRow dr in dt.Rows)
            {
                ddl_years.Items.Add(new ListItem(dr["sysyear"].ToString(), dr["sysyear"].ToString()));

                if (dr["sysyear"].ToString() == DateTime.Now.ToString("yyyy"))
                { 
                    ddl_years.Items.FindByValue(dr["sysyear"].ToString()).Selected = true;
                }

            }

            dt = dbhelper.getdata("Select distinct Datename(month ,DateAdd( month , month(Sysdate),-1)) as sysmonths,month(Sysdate) as nummonths from Fightusers where Sysdate is not null and Year(Sysdate)=" + ddl_years.SelectedValue + " order by Datename(month ,DateAdd( month , month(Sysdate),-1)) asc");

           ddl_months.Items.Clear();

            ddl_months.Items.Add(new ListItem("All", "0"));
            foreach (DataRow dr in dt.Rows)
            {
                ddl_months.Items.Add(new ListItem(dr["sysmonths"].ToString(), dr["nummonths"].ToString()));

                if (dr["nummonths"].ToString() == DateTime.Now.ToString("M"))
                {
                    ddl_years.Items.FindByValue(dr["nummonths"].ToString()).Selected = true;
                }
            }

            dt = dbhelper.getdata("Select * from Amounts");

            txtgateamount.Text = dt.Rows[0]["GateAmount"].ToString();
            txtpercentpayout.Text = dt.Rows[0]["PercentAmount"].ToString();

        }
        protected void onchangegate(object sender, EventArgs e)
        {
            DataTable dt = dbhelper.getdata("Update Amounts set GateAmount="+ txtgateamount.Text + "");
            grid_view.DataSource = dt;
            grid_view.DataBind();

            dts = dt;

        }

        protected void onchangepercent(object sender, EventArgs e)
        {
            DataTable dt = dbhelper.getdata("Update Amounts set PercentAmount=" + txtpercentpayout.Text + "");
            grid_view.DataSource = dt;
            grid_view.DataBind();

            dts = dt;

        }

        protected void onrangesearch(object sender, EventArgs e)
        {
            DataTable dt = dbhelper.getdata("Select ROW_NUMBER() OVER(ORDER BY a.Id ASC) AS nummatches,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='MERON') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2)) as meronwinrate,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='WALA') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2)) as walawinrate,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='DRAW') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2))as drawwinrate,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='CANCEL') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2)) as cancelwinrate,a.Id,count(b.Fightno) numfights, SUM(b.TotalMeron) totalmeron,SUM(b.TotalWala) totalwala,SUM((case when b.status1='DRAW' or b.status1='CANCEL' then 0 else((b.TotalMeron +b.TotalWala)-v.asd) end)) totalsales, la.Sysdate from Matches a left join Fights b on a.Id=b.MatchId cross apply (values( case when b.status1='MERON' then (Select SUM(d.GainAmount) from Fightusers d where d.MatchId=a.Id and d.Fightno=b.Fightno and d.Statusside='meron') else (case when b.status1='WALA' then (Select SUM(d.GainAmount) from Fightusers d where d.MatchId=a.Id and d.Fightno=b.Fightno and d.Statusside='wala') else 0 end) end))v(asd) outer apply (Select top 1 c.* from Fightusers c where c.Fightno=b.Fightno and c.MatchId=a.Id order by c.Sysdate asc) la where la.Sysdate between '" + Convert.ToDateTime(txt_from.Text).ToString("yyyy-MM-dd")+"' and '"+ Convert.ToDateTime(txt_to.Text).ToString("yyyy-MM-dd") + "' group by a.Id,la.Sysdate order by a.Id asc");
            grid_view.DataSource = dt;
            grid_view.DataBind();

            dts = dt;

        }

        protected void onmonthyearsearch(object sender, EventArgs e)
        {
            if (ddl_months.SelectedValue == "0")
            {
                DataTable dt = dbhelper.getdata("Select ROW_NUMBER() OVER(ORDER BY a.Id ASC) AS nummatches,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='MERON') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2)) as meronwinrate,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='WALA') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2)) as walawinrate,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='DRAW') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2))as drawwinrate,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='CANCEL') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2)) as cancelwinrate,a.Id,count(b.Fightno) numfights, SUM(b.TotalMeron) totalmeron,SUM(b.TotalWala) totalwala,SUM((case when b.status1='DRAW' or b.status1='CANCEL' then 0 else((b.TotalMeron +b.TotalWala)-v.asd)end)) totalsales, la.Sysdate from Matches a left join Fights b on a.Id=b.MatchId cross apply (values( case when b.status1='MERON' then (Select SUM(d.GainAmount) from Fightusers d where d.MatchId=a.Id and d.Fightno=b.Fightno and d.Statusside='meron') else (case when b.status1='WALA' then (Select SUM(d.GainAmount) from Fightusers d where d.MatchId=a.Id and d.Fightno=b.Fightno and d.Statusside='wala') else 0 end) end))v(asd) outer apply (Select top 1 c.* from Fightusers c where c.Fightno=b.Fightno and c.MatchId=a.Id order by c.Sysdate asc) la where year(la.Sysdate)=" + ddl_years.SelectedValue + " group by a.Id,la.Sysdate order by a.Id asc");
                grid_view.DataSource = dt;
                grid_view.DataBind();

                dts = dt;
            }
            else
            {
                DataTable dt = dbhelper.getdata("Select ROW_NUMBER() OVER(ORDER BY a.Id ASC) AS nummatches,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='MERON') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2)) as meronwinrate,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='WALA') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2)) as walawinrate,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='DRAW') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2))as drawwinrate,CAST(((CAST((Select COUNT(k.Id) from Fights k where k.MatchId=a.Id and k.status1='CANCEL') as decimal(18,2))/(Select COUNT(k.Id) from Fights k where k.MatchId=a.Id))*100)as decimal(18,2)) as cancelwinrate,a.Id,count(b.Fightno) numfights, SUM(b.TotalMeron) totalmeron,SUM(b.TotalWala) totalwala,SUM((case when b.status1='DRAW' or b.status1='CANCEL' then 0 else((b.TotalMeron +b.TotalWala)-v.asd)end)) totalsales, la.Sysdate from Matches a left join Fights b on a.Id=b.MatchId cross apply (values( case when b.status1='MERON' then (Select SUM(d.GainAmount) from Fightusers d where d.MatchId=a.Id and d.Fightno=b.Fightno and d.Statusside='meron') else (case when b.status1='WALA' then (Select SUM(d.GainAmount) from Fightusers d where d.MatchId=a.Id and d.Fightno=b.Fightno and d.Statusside='wala') else 0 end) end))v(asd) outer apply (Select top 1 c.* from Fightusers c where c.Fightno=b.Fightno and c.MatchId=a.Id order by c.Sysdate asc) la where year(la.Sysdate)=" + ddl_years.SelectedValue + " and month(la.Sysdate)="+ddl_months.SelectedValue+" group by a.Id,la.Sysdate order by a.Id asc");
                grid_view.DataSource = dt;
                grid_view.DataBind();

                dts = dt;
            }

        }
        public static DataTable dts = null;
        public static DataTable dts2 = null;
        public static DataTable dts3 = null;
        protected void onexcel(object sender, EventArgs e)
        {
            if (dts != null)
            {
                DataSet ds = new DataSet();
            using (XLWorkbook wb = new XLWorkbook())
            {
                DataTable dt = dts;
                var ws = wb.Worksheets.Add(dt, "SAN CARLOS ARENA REPORT"); ;
                //Export the Excel file.
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=SANCARLOSARENAREPORT.xlsx");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }

        }
                
        }

        protected void onexcel2(object sender, EventArgs e)
        {
            if (dts2 != null)
            {
                DataSet ds = new DataSet();
                using (XLWorkbook wb = new XLWorkbook())
                {
                    DataTable dt = dts2;
                    var ws = wb.Worksheets.Add(dt, "SAN CARLOS ARENA REPORT PER FIGHT"); ;
                    //Export the Excel file.
                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=SANCARLOSARENAREPORTPERFIGHT.xlsx");
                    using (MemoryStream MyMemoryStream = new MemoryStream())
                    {
                        wb.SaveAs(MyMemoryStream);
                        MyMemoryStream.WriteTo(Response.OutputStream);
                        Response.Flush();
                        Response.End();
                    }
                }

            }

        }

        protected void onexcel3(object sender, EventArgs e)
        {
            if (dts2 != null)
            {
                DataSet ds = new DataSet();
                using (XLWorkbook wb = new XLWorkbook())
                {
                    DataTable dt = dts2;
                    var ws = wb.Worksheets.Add(dt, "SAN CARLOS ARENA REPORT PER AGENT"); ;
                    //Export the Excel file.
                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=SANCARLOSARENAREPORTPERAGENT.xlsx");
                    using (MemoryStream MyMemoryStream = new MemoryStream())
                    {
                        wb.SaveAs(MyMemoryStream);
                        MyMemoryStream.WriteTo(Response.OutputStream);
                        Response.Flush();
                        Response.End();
                    }
                }

            }

        }
        protected void Closereportperfight(object sender, EventArgs e)
        {
            modal_reportperfight.Style.Add("display", "none");
        }

        protected void onclickperfight(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                string id = row.Cells[1].Text;
                DataTable dt = dbhelper.getdata("Select a.Fightno, a.TotalMeron totalmeron, a.TotalWala totalwala, (case when a.status1 = 'DRAW' or a.status1 = 'CANCEL' then 0 else ((a.TotalMeron + a.TotalWala) - v.asd) end) totalsales,a.status1 as [status] from Fights a cross apply(values( case when a.status1= 'MERON' then (Select SUM(d.GainAmount) from Fightusers d where d.MatchId= a.MatchId and d.Fightno= a.Fightno and d.Statusside= 'meron') else (case when a.status1 = 'WALA' then(Select SUM(d.GainAmount) from Fightusers d where d.MatchId = a.MatchId and d.Fightno = a.Fightno and d.Statusside = 'WALA') else 0 end) end))v(asd) where a.MatchId ="+ id + " group by a.Fightno,a.TotalMeron,a.TotalWala,a.status1,v.asd");
                grid_perfight.DataSource = dt;
                grid_perfight.DataBind();

                dts2 = dt;

                hfmatchid.Value = id;
                modal_reportperfight.Style.Add("display", "block");
            }
        }
        protected void Closereportperagent(object sender, EventArgs e)
        {
            modal_reportperagent.Style.Add("display", "none");
        }


        protected void onclickperagent(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                string id = row.Cells[0].Text;
                DataTable dt = dbhelper.getdata(" Select a.Fightno,a.AgentName,SUM(a.Amount) TotalAmount from Fightusers a where a.Fightno="+id+" and a.MatchId="+hfmatchid.Value+" group by a.Fightno,a.AgentName");
                grid_peragent.DataSource = dt;
                grid_peragent.DataBind();

                dts3 = dt;


                modal_reportperagent.Style.Add("display", "block");
            }
        }

    }
}