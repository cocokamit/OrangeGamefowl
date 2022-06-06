using Microsoft.Reporting.WebForms;
using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.News
{
    public partial class printslip : System.Web.UI.Page, IDisposable
    {
        public static string payid, betno;
        public static DataTable dttt=null;
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
                betno = Request.QueryString["fno"].ToString();
                DataTable dt1 = dbhelper.getdata("Select * from Fightusers where Id=" + payid + "");

                //DataTable dt2 = dbhelper.getdata("Select ROW_NUMBER() over (order by Id asc) Betno,Fightno,Amount Betamount,Statusside,AgentName,'" + DateTime.Now.ToString("MM/dd/yyyy") + "' Datetimes from Fightusers where Statusside='" + dt1.Rows[0]["Statusside"].ToString() + "' and MatchId=" + dt1.Rows[0]["MatchId"].ToString() + " and Fightno=" + dt1.Rows[0]["Fightno"].ToString() + " order by Id asc");

                string query = "Select  d.Betno,d.Fightno,d.Betamount,d.Statusside,d.AgentName,d.Datetimes from (Select ROW_NUMBER() over (order by Id asc) Betno,Id,Fightno,Amount Betamount,Statusside,AgentName,'" + DateTime.Now.ToString("MM/dd/yyyy") + "' Datetimes from Fightusers where Statusside='" + dt1.Rows[0]["Statusside"].ToString() + "' and MatchId=" + dt1.Rows[0]["MatchId"].ToString() + " and Fightno=" + dt1.Rows[0]["Fightno"].ToString() + ") d where d.Id="+payid+"";
                DataTable dtt = dbhelper.getdata(query);
                dttt = dtt;

                /* Run();*/
            }
        }

        protected void disp()
        {
           
        }
   /*     private int m_currentPageIndex;
        private IList<Stream> m_streams;

        private Stream CreateStream(string name,
   string fileNameExtension, Encoding encoding,
   string mimeType, bool willSeek)
        {
            Stream stream = new MemoryStream();
            m_streams.Add(stream);
            return stream;
        }
        private void Export(LocalReport report)
        {
            string deviceInfo =
              @"<DeviceInfo>
                <OutputFormat>EMF</OutputFormat>
                <PageWidth>3in</PageWidth>
                <PageHeight>3in</PageHeight>
                <MarginTop>0</MarginTop>
                <MarginLeft>0</MarginLeft>
                <MarginRight>0</MarginRight>
                <MarginBottom>0</MarginBottom>
            </DeviceInfo>";
            Warning[] warnings;
            m_streams = new List<Stream>();
            report.Render("Image", deviceInfo, CreateStream,
               out warnings);
            foreach (Stream stream in m_streams)
                stream.Position = 0;
        }
        private void PrintPage(object sender, PrintPageEventArgs ev)
        {
            Metafile pageImage = new
               Metafile(m_streams[m_currentPageIndex]);

            // Adjust rectangular area with printer margins.
            Rectangle adjustedRect = new Rectangle(
                ev.PageBounds.Left - (int)ev.PageSettings.HardMarginX,
                ev.PageBounds.Top - (int)ev.PageSettings.HardMarginY,
                265,
                220);

            int asd = ev.PageBounds.Left;
            int dsa = ev.PageBounds.Top;
            int sad = ev.PageBounds.Width;
            int das = ev.PageBounds.Height;
            int las = (int)ev.PageSettings.HardMarginX;
            int sal = (int)ev.PageSettings.HardMarginY;

            // Draw a white background for the report
            ev.Graphics.FillRectangle(Brushes.White, adjustedRect);

            // Draw the report content
            ev.Graphics.DrawImage(pageImage, adjustedRect);

            // Prepare for the next page. Make sure we haven't hit the end.
            m_currentPageIndex++;
            ev.HasMorePages = (m_currentPageIndex < m_streams.Count);
        }

        private void Print()
        {
            if (m_streams == null || m_streams.Count == 0)
                throw new Exception("Error: no stream to print.");
            PrintDocument printDoc = new PrintDocument();
            if (!printDoc.PrinterSettings.IsValid)
            {
                throw new Exception("Error: cannot find the default printer.");
            }
            else
            {
                printDoc.PrintPage += new PrintPageEventHandler(PrintPage);
                m_currentPageIndex = 0;
                printDoc.Print();
            }
        }

        private void Run()
        {
            string query = "Select Fightno,'" + DateTime.Now.ToString("MM/dd/yyyy") + "' Datetimes,'" + betno + "' Betno,Amount Betamount,Statusside,AgentName from Fightusers where Id=" + payid + "";

            DataTable dt = dbhelper.getdata(query);

            List<CustomDs.printster> data = CustomDs.GetAllPayReg(dt);

            rv_payreg.ProcessingMode = ProcessingMode.Local;
            rv_payreg.LocalReport.ReportPath = Server.MapPath("~/Pages/News/Report1.rdlc");
            ReportDataSource datasource = new ReportDataSource("DataSet1", data);

            rv_payreg.LocalReport.DataSources.Clear();
            rv_payreg.LocalReport.DataSources.Add(datasource);

            rv_payreg.LocalReport.Refresh();

            LocalReport report = new LocalReport();

            report.ReportPath = Server.MapPath("~/Pages/News/Report1.rdlc");
            report.DataSources.Add(
               new ReportDataSource("DataSet1", data));
            Export(report);
            Print();

            Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage","window.onunload=CloseWindow();");
        }

        public void Dispose()
        {
            if (m_streams != null)
            {
                foreach (Stream stream in m_streams)
                    stream.Close();
                m_streams = null;
            }
        }*/
    }
}