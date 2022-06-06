using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using SabongLive.App_Code;

namespace SabongLive.Pages.Admin.Promoter
{
    public partial class match_print : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String query = "select a.id, bb.name a_entry, b.participant, b.[weight] a_weight, b.parada a_parada, c.[weight] b_weight, c.parada b_parada, " +
            "case when  cc.name is null then 'Joker' else  cc.name end b_entry, " +
            "case when  c.participant is null then 0 else  c.participant end entry_id " +
            "from match a " +
            "left join [entry] b on a.sentinel = b.id " +
            "left join [participant] bb on b.participant = bb.id " +
            "left join [entry] c on a.scourge = c.id " +
            "left join [participant] cc on c.participant = cc.id " +
            "where bb.event_id= " + Request.QueryString["key"].ToString() + " " +
            "order by a.Sequence";
            gv_match.DataSource = dbhelper.getdata2(query);
            gv_match.DataBind();

            gvDownload.DataSource = dbhelper.getdata2(query);
            gvDownload.DataBind();



            ViewState["data"] = dbhelper.getdata2("select convert(varchar,event_date, 101) date, * from event where id=" + Request.QueryString["key"].ToString());

        }

        protected void ExportToExcel(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["data"];
            string filename = dt.Rows[0]["cockpit_name"].ToString().Replace(" ", "");
            ExportGridToExcel(filename);
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        private void ExportGridToExcel(string filename)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = filename + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            gvDownload.GridLines = GridLines.Both;
            gvDownload.HeaderStyle.Font.Bold = true;
            gvDownload.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
    }
}