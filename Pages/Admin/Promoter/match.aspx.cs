using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SabongLive.App_Code;

namespace SabongLive.Pages.Admin.Promoter
{
    public partial class match : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //PRADA
            //ABOVE 2.40 BISAG KINSA KUNTRA
            //2 GAME LANG PWDI

            if (!IsPostBack)
            {
                config();
                BindData();
            }

        }

        protected void Print(object sender, EventArgs e)
        {
            Response.Redirect("receipt?event=" + hf_id.Value + "&key=" + hf_hold.Value);
        }

        protected void config()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Event");
            dt.Columns.Add("Sentinel");
            dt.Columns.Add("Scourge");
            dt.Columns.Add("Sequence");
            ViewState["MATCH"] = dt;

            dt = new DataTable();
            dt.Columns.Add("Entry");
            dt.Columns.Add("Parada");
            dt.Columns.Add("Action");
            ViewState["HOLD"] = dt;
        }

        protected void EditEntry(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                hf_hold.Value = row.Cells[0].Text;
                hf_action.Value = "edit";
                DTParticipantEntry();
                modal_participant.Style.Add("display", "block");
                modal_default.Style.Add("display", "none");
                Flag();

                DataTable dt = dbhelper.getdata2("select * from participant where id=" + row.Cells[0].Text);
                tb_owner.Text = dt.Rows[0]["name"].ToString();
                ddl_flag.SelectedValue = dt.Rows[0]["flag"].ToString();


                DataTable entry = (DataTable)ViewState["Item_List"];
                entry.Clear();
                DataRow dr = null;
                dt = dbhelper.getdata2("select * from [entry] where participant=" + row.Cells[0].Text);
                foreach (DataRow item in dt.Rows)
                {
                    dr = entry.NewRow();
                    dr["RowNumber"] = 1;
                    dr["col_0"] = item["id"];
                    dr["col_1"] = item["parada"];
                    dr["col_2"] = item["weight"];
                    entry.Rows.Add(dr);

                }

                ViewState["Item_List"] = entry;
                grid_item.DataSource = entry;
                grid_item.DataBind();
                setPreviousData();
            }
        }

        protected void InitiateMatching(object sender, EventArgs e)
        {
            /**BTK 03122020**/
            DataTable setup = dbhelper.getdata2("select * from sys_Setup");
            double confiWeight = double.Parse(setup.Rows[1]["value"].ToString());
            string confiParada = setup.Rows[0]["value"].ToString();


            dbhelper.getdata2("update [entry] set status=null from [entry] a left join participant b on a.participant = b.id where b.event_id=" + hf_id.Value + "; delete match where event_id=" + hf_id.Value);

            int i = 0;
            string query = string.Empty, hold = string.Empty;

            ////SAME Weight
            DataTable dt = dbhelper.getdata2("select a.[weight], a.[status] from [entry] a left join participant b on a.participant = b.id where b.event_id = " + hf_id.Value + " and a.[status] is null group by a.[weight],a.[status] having count(*) > 1");
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    hold += "[weight] = " + row["weight"];
                    if (i < dt.Rows.Count - 1)
                        hold += " or ";
                    i++;
                }
                SameWeight(" and (" + hold + ")");
            }

            //Plus/Minus
            int seq = ViewState["sequence"] == null ? 0 : (int)ViewState["sequence"];
            i = 0;
            while (true)
            {
                dt = dbhelper.getdata2("select * from [entry] a left join participant b on a.participant=b.id where  b.event_id=" + hf_id.Value + " and a.status is null order by a.weight");
                if (dt.Rows.Count > 0)
                {
                    /**BTK 03112020**/
                    string id = dt.Rows[0]["id"].ToString();
                    double weight = double.Parse(dt.Rows[0]["weight"].ToString());
                    double plus = double.Parse(dt.Rows[0]["weight"].ToString()) + confiWeight;
                    double minus = double.Parse(dt.Rows[0]["weight"].ToString()) - confiWeight;

                    double conplus = double.Parse(dt.Rows[0]["parada"].ToString()) + double.Parse(confiParada);
                    double conminus = double.Parse(dt.Rows[0]["parada"].ToString()) - double.Parse(confiParada);


                    query = "select top 1 * from [entry] a left join participant b on a.participant = b.id " +
                    "where  b.event_id=" + hf_id.Value + " and a.[status] is null and  " +
                    "a.[weight] between " + minus + " and " + plus + "  " +
                    "and a.[parada] between " + conminus + " and " + conplus + "  " +
                    "and a.id <> " + id + " and b.flag <>  " + dt.Rows[0]["flag"].ToString() + " and b.id <> " + dt.Rows[0]["participant"].ToString() + " " +
                    "order by a.[weight]";
                    DataTable filter = dbhelper.getdata2(query);

                    string Sentinel = dt.Rows[0][1].ToString();
                    string Scourge = filter.Rows.Count == 0 ? "0" : filter.Rows[0]["flag"].ToString();

                    if (Sentinel != Scourge)
                    {
                        dbhelper.getdata2("insert into [match] values (" + hf_id.Value + "," + dt.Rows[0]["id"] + "," + (filter.Rows.Count == 0 ? "0" : filter.Rows[0]["id"].ToString()) + "," + seq + ",NULL)");

                        if (dt.Rows.Count == 1 || filter.Rows.Count == 0)
                            dbhelper.getdata2("update [entry] set status=0 where id=" + dt.Rows[0]["id"]);
                        else
                        {
                            dbhelper.getdata2("update [entry] set status=0 where id=" + dt.Rows[0]["id"]);
                            dbhelper.getdata2("update [entry] set status=0 where id=" + filter.Rows[0]["id"].ToString());
                        }

                        seq++;
                    }
                    else
                    { 
                    
                    }
                }
                else
                    break;

                i++;

                if (i == 500)
                    break;
            }

            modal_dialog.Style.Add("width", "1000px");
            pnl_a.CssClass = "col-lg-4";
            pnl_b.Visible = true;
            Match();
        }

        protected void SameWeight(string condition)
        {
            int seq = 1;
            int cnt = 1;
            int k = 1;
            DataTable match = (DataTable)ViewState["HOLD"];

            /**BTK 03122020
             * SETUP**/
            DataTable setup = dbhelper.getdata("select * from sys_Setup");
            double confiParada = double.Parse(setup.Rows[0]["value"].ToString());

            while (true)
            {
                DataTable filter = dbhelper.getdata2("select * from [entry] a left join participant b on a.participant=b.id where b.event_id=" + hf_id.Value + " and a.status is null " + condition + " order by a.weight");
                if (filter.Rows.Count > 0)
                {
                    string Sentinel = filter.Rows[0][1].ToString();
                    string SentinelParada = filter.Rows[0]["parada"].ToString();

                    string Scourge = filter.Rows[k][1].ToString();
                    string ScourgeParada = filter.Rows[k]["parada"].ToString();

                    if (Sentinel != Scourge)
                    {
                        k = 1;
                        int i = 1;
                        while (true)
                        {
                            
                            DataTable flag = dbhelper.getdata2("select * from [entry] a left join participant b on a.participant = b.id where  b.event_id=" + hf_id.Value + " and a.[status] is null and a.[weight]=" + filter.Rows[0]["weight"].ToString()+"");
                          

                            if (flag.Rows.Count > 0)
                            {
                                if (flag.Rows.Count == 1)
                                {
                                    dbhelper.getdata2("update [entry] set status=1 where id=" + flag.Rows[0]["id"].ToString());
                                    break;
                                }

                                Sentinel = flag.Rows[0]["id"].ToString();
                                Scourge = flag.Rows[i]["flag"].ToString();

                                if (Sentinel != Scourge)
                                {
                                    /**BTK 03122020
                                     * CONFIG**/
                                    double parada = double.Parse(flag.Rows[0]["parada"].ToString());
                                    double plus = double.Parse(flag.Rows[0]["parada"].ToString()) + confiParada;
                                    double minus = double.Parse(flag.Rows[0]["parada"].ToString()) - confiParada;


                                    string id = flag.Rows[0]["id"].ToString();
                                    string participantid = flag.Rows[0]["participant"].ToString();
                                    DataRow[] hold = flag.Select(" id<> " + id + " and participant<>"+ participantid + "  and parada >=" + minus + " and parada <=" + plus);
                                    if (hold.Count() > 0)
                                    {
                                        dbhelper.getdata2("insert into [match] values (" + hf_id.Value + "," + flag.Rows[0]["id"].ToString() + "," + hold[0]["id"].ToString() + "," + seq + ",NULL)");

                                        dbhelper.getdata2("update [entry] set status=0 where id=" + hold[0]["id"].ToString());
                                        dbhelper.getdata2("update [entry] set status=0 where id=" + flag.Rows[0]["id"].ToString());
                                        seq++;
                                        i = 1;
                                    }
                                    else
                                    {
                                        dbhelper.getdata2("update [entry] set status=1 where id=" + flag.Rows[i]["id"].ToString());

                                        i =1;
                                    }
                                }
                                else
                                {
                                    dbhelper.getdata2("update [entry] set status=1 where id=" + flag.Rows[0]["id"].ToString());
                                    if ((flag.Rows.Count % 2) == 0)
                                        dbhelper.getdata2("update [entry] set status=1 where id=" + flag.Rows[i]["id"].ToString());

                                    i++;
                                }
                            }
                            else
                                break;



                            if (i == 10)
                                break;
                        }

                    }
                    else
                        k++;


                    if (filter.Rows.Count == 2 && Sentinel == Scourge)
                        break;

                }
                else
                    break;


                cnt++;


                if (cnt == 30)
                    break;

            }

            ViewState["sequence"] = seq;

            dbhelper.getdata2("update [entry] set status=null where status=1");

            // Parada(match);
        }

        protected void Parada(DataTable dt)
        {
            int seq = 1;
            int cnt = 1;

            while (true)
            {
                DataTable hold = dt.Select("Action=0").CopyToDataTable();

                if (hold.Rows.Count > 0)
                {
                    string id = hold.Rows[0]["Entry"].ToString();
                    double weight = double.Parse(hold.Rows[0]["Parada"].ToString());
                    double plus = double.Parse(hold.Rows[0]["Parada"].ToString()) + 5000;
                    double minus = double.Parse(hold.Rows[0]["Parada"].ToString()) - 5000;


                    DataRow[] filter = hold.Select("Entry <> " + hold.Rows[0]["participant"].ToString() + " and parada >= " + minus + " and Parada <=" + plus);
                    string Sentinel = filter[0][1].ToString();
                    string Scourge = filter.Length == 0 ? "0" : filter[0]["flag"].ToString();

                    if (Sentinel != Scourge)
                    {
                        dbhelper.getdata2("insert into [match] values (" + hf_id.Value + "," + dt.Rows[0]["id"] + "," + (filter.Length == 0 ? "0" : filter[0]["id"].ToString()) + "," + seq + ",NULL)");

                        if (dt.Rows.Count == 1 || filter.Length == 0)
                            dbhelper.getdata2("update [entry] set status=0 where id=" + dt.Rows[0]["id"]);
                        else
                        {
                            dbhelper.getdata2("update [entry] set status=0 where id=" + dt.Rows[0]["id"]);
                            dbhelper.getdata2("update [entry] set status=0 where id=" + filter[0]["id"].ToString());
                        }

                        seq++;
                    }


                    cnt++;

                    if (cnt == 300)
                        break;
                }
                else
                    break;

            }
        }

        protected void AddParticipants(object sender, EventArgs e)
        {
            hf_action.Value = "add";
            Button6.Visible = true;
            DTParticipantEntry();
            modal_participant.Style.Add("display", "block");
            modal_default.Style.Add("display", "none");
            Flag();
        }

        protected void Back(object sender, EventArgs e)
        {
            modal_participant.Style.Add("display", "none");
            modal_default.Style.Add("display", "block");
            modal_dialog.Style.Add("width", "1000px");
            pnl_a.CssClass = "col-lg-4";
            pnl_b.Visible = true;
            ShowEntry();
            Match();
        }

        protected void Flag()
        {
            ddl_flag.Items.Clear();
            DataTable dt = dbhelper.getdata2("select * from participant where event_id=" + hf_id.Value);
            ddl_flag.Items.Add(new ListItem("None", "0"));
            foreach (DataRow row in dt.Rows)
            {
                ddl_flag.Items.Add(new ListItem(row["name"].ToString(), row["id"].ToString()));
            }
        }

        protected void NewParticipant(object sender, EventArgs e)
        {
            string query = string.Empty;
            setrow();
            DataTable table = ViewState["Item_List"] as DataTable;
            if (hf_action.Value == "add")
            {
                DataTable dt = dbhelper.getdata2("insert into [participant] values('" + tb_owner.Text + "','" + hf_id.Value + "'," + ddl_flag.SelectedValue + ",NULL)select scope_identity()ownid");
                foreach (DataRow row in table.Rows)
                {
                    dbhelper.getdata2("insert into [entry] values('" + dt.Rows[0]["ownid"].ToString() + "','" + row.ItemArray[2].ToString().Replace("'", "") + "','" + row.ItemArray[3].ToString().Replace("'", "") + "',NULL)");
                }
            }
            else
            {
                dbhelper.getdata2("update [participant] set name='" + tb_owner.Text + "',flag='" + ddl_flag.SelectedValue + "' where id=" + hf_hold.Value);
                dbhelper.getdata2("update [entry] set status='2' where participant=" + hf_hold.Value);
                foreach (DataRow row in table.Rows)
                {
                    if (row["col_0"].ToString() == "0")
                    {
                        if (row["col_2"].ToString() == "")
                        {
                            dbhelper.getdata2("delete from [participant] where id=" + hf_hold.Value);
                        }
                        else
                        {
                            dbhelper.getdata2("insert into [entry] values('" + hf_hold.Value + "','" + row["col_1"].ToString().Replace("'", "").Replace(",", "").Replace(" ", "") + "','" + row["col_2"].ToString().Replace("'", "").Replace(" ", "") + "',NULL)");
                        }
                    }
                    else
                        dbhelper.getdata2("update [entry] set status=NULL, weight='" + row["col_2"].ToString().Replace("'", "").Replace(" ", "") + "',parada='" + row["col_1"].ToString().Replace("'", "").Replace(",", "").Replace(" ", "") + "' where id=" + row["col_0"]);
                }
                dbhelper.getdata2("delete [entry] where participant=" + hf_hold.Value + " and status='2'");
                if (tb_owner.Text == "" && hf_hold.Value!="")
                {
                    dbhelper.getdata2("delete from [participant] where id=" + hf_hold.Value);
                }
                //query += "update [participant] set name='" + tb_owner.Text + "',flag='" + ddl_flag.SelectedValue + "' where id=" + hf_id.Value + ";";
                //query += "update [entry] set status='2' where participant=" + hf_id.Value + ";";
                //foreach (DataRow row in table.Rows)
                //{
                //    if (row["col_a"].ToString() == "0")
                //        query += "insert into [entry] values('" + hf_id.Value + "','" + row.ItemArray[2].ToString().Replace("'", "") + "','" + row.ItemArray[3].ToString().Replace("'", "") + "',NULL);";
                //    else
                //        query += "update [entry] set status=NULL, weight='" + row.ItemArray[2].ToString().Replace("'", "") + "',parada='" + row.ItemArray[3].ToString().Replace("'", "").Replace(",", "") + "' where id=" + hf_id.Value + ";";
                //}
                //query += "delete [entry] where participant=" + hf_id.Value + " and status='2'";
                //dbhelper.getdata(query);
            }


            modal_participant.Style.Add("display", "none");
            modal_default.Style.Add("display", "block");
            modal_dialog.Style.Add("width", "1000px");
            pnl_a.CssClass = "col-lg-4";
            pnl_b.Visible = true;
            ShowEntry();
            Match();

            // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='"+Request.RawUrl+"'", true);
        }

        protected void EventParticipants(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                hf_id.Value = row.Cells[0].Text;
                hf_action.Value = "add";
                ViewState["event"] = row.Cells[1].Text;
                DataTable dt = dbhelper.getdata2("select * from [participant] where event_id=" + row.Cells[0].Text);
                if (dt.Rows.Count == 0)
                {
                    Button6.Visible = false;
                    DTParticipantEntry();
                    modal_participant.Style.Add("display", "block");
                }
                else
                {
                    ShowEntry();
                    fg_flag.Visible = true;
                    modal_default.Style.Add("display", "block");

                    dt = dbhelper.getdata2("select * from match where event_id=" + hf_id.Value);
                    if (dt.Rows.Count > 0)
                    {
                        modal_dialog.Style.Add("width", "1000px");
                        pnl_a.CssClass = "col-lg-4";
                        pnl_b.Visible = true;
                        Match();
                    }
                }
            }
        }

        protected void ShowEntry()
        {
            string query = "select a.id, a.name, c.name fname, count(*)  cnt from participant a " +
                    "left join [entry] b on a.id=b.participant " +
                    "left join participant c on a.flag=c.id " +
                    "where a.event_id=" + hf_id.Value + " " +
                    "group by a.id, a.name,c.name " +
                    "order by a.name";
            gv_participants.DataSource = dbhelper.getdata2(query);
            gv_participants.DataBind();
        }

        protected void AddEntry(object sender, EventArgs e)
        {
            int rowIndex = 0;
            DataTable dtCurrentTable = (DataTable)ViewState["Item_List"];
            DataRow drCurrentRow = null;

            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    TextBox drop_code = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("drop_code");
                    TextBox txt_date = (TextBox)grid_item.Rows[rowIndex].Cells[2].FindControl("txt_date");


                    Label lbl_code = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_code");
                    Label lbl_date = (Label)grid_item.Rows[rowIndex].Cells[2].FindControl("lbl_date");
                    Label lbl_code_desp = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_code_desp");
                    Label lbl_date_desp = (Label)grid_item.Rows[rowIndex].Cells[2].FindControl("lbl_date_desp");

                    Label b_id = (Label)grid_item.Rows[rowIndex].Cells[0].FindControl("lbl_bid");


                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = i + 1;
                    dtCurrentTable.Rows[i - 1]["col_0"] = b_id.Text.Length == 0 ? "0" : b_id.Text;
                    dtCurrentTable.Rows[i - 1]["col_1"] = drop_code.Text.Length == 0 ? lbl_code_desp.Text : drop_code.Text;
                    dtCurrentTable.Rows[i - 1]["col_2"] = txt_date.Text.Length == 0 ? lbl_date_desp.Text : txt_date.Text;


                    if (i == dtCurrentTable.Rows.Count)
                    {
                        lbl_date.Text = txt_date.Text.Length == 0 ? "empty" : "";
                       // lbl_code.Text = drop_code.Text.Length == 0 ? "empty" : "";
                    }

                    if ((lbl_date.Text + " " + lbl_code.Text).Contains("empty"))
                        goto exit;


                    rowIndex++;
                }
                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["Item_List"] = dtCurrentTable;

                grid_item.DataSource = dtCurrentTable;
                grid_item.DataBind();
            }

            setPreviousData();
        exit:
            Console.Write("EXIT");
        }

        private void DTParticipantEntry()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("col_0", typeof(string)));
            dt.Columns.Add(new DataColumn("col_1", typeof(string)));
            dt.Columns.Add(new DataColumn("col_2", typeof(string)));

            dr = dt.NewRow();

            dr["Rownumber"] = 1;
            dr["col_0"] = string.Empty;
            dr["col_1"] = string.Empty;
            dr["col_2"] = string.Empty;


            dt.Rows.Add(dr);

            ViewState["Item_List"] = dt;
            grid_item.DataSource = dt;
            grid_item.DataBind();


        }

        protected void grid_item_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (ViewState["Item_List"] != null)
            {
                setrow();
                DataTable dt = (DataTable)ViewState["Item_List"];
                DataRow drCurrentRow = null;
                int rowIndex = Convert.ToInt32(e.RowIndex);

                if (dt.Rows.Count > 1)
                {
                    dt.Rows.Remove(dt.Rows[rowIndex]);
                    drCurrentRow = dt.NewRow();
                    ViewState["Item_List"] = dt;
                    grid_item.DataSource = dt;
                    grid_item.DataBind();


                    setPreviousData();
                }
                else
                {
                    DTParticipantEntry();
                }
            }
        }

        protected void setPreviousData()
        {
            int rowIndex = 0;
            if (ViewState["Item_List"] != null)
            {
                DataTable dt = (DataTable)ViewState["Item_List"];

                if (dt.Rows.Count > 0)
                {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        TextBox drop_code = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("drop_code");
                        TextBox txt_date = (TextBox)grid_item.Rows[rowIndex].Cells[2].FindControl("txt_date");

                        Label lbl_code = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_code");
                        Label lbl_date = (Label)grid_item.Rows[rowIndex].Cells[2].FindControl("lbl_date");
                        Label lbl_code_desp = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_code_desp");
                        Label lbl_date_desp = (Label)grid_item.Rows[rowIndex].Cells[2].FindControl("lbl_date_desp");

                        Label b_id = (Label)grid_item.Rows[rowIndex].Cells[0].FindControl("lbl_bid");
                        Label Label1 = (Label)grid_item.Rows[rowIndex].Cells[0].FindControl("Label1");

                        ImageButton can = (ImageButton)grid_item.Rows[rowIndex].Cells[3].FindControl("can");



                        Label1.Text = Convert.ToString(i + 1);

                        b_id.Text = dt.Rows[i]["col_0"].ToString();
                        drop_code.Text = dt.Rows[i]["col_1"].ToString();
                        txt_date.Text = dt.Rows[i]["col_2"].ToString();


                        rowIndex++;
                    }
                }
            }
        }

        public bool setrow()
        {
            int rowIndex = 0;
            bool oi = true;
            DataTable dtCurrentTable = (DataTable)ViewState["Item_List"];
            dtCurrentTable.Clear();
            DataRow drCurrentRow = null;
            if (dtCurrentTable != null)
            {
                for (int i = 0; i < grid_item.Rows.Count; i++)
                {
                    TextBox drop_code = (TextBox)grid_item.Rows[rowIndex].Cells[1].FindControl("drop_code");
                    TextBox txt_date = (TextBox)grid_item.Rows[rowIndex].Cells[2].FindControl("txt_date");


                    Label lbl_code = (Label)grid_item.Rows[rowIndex].Cells[1].FindControl("lbl_code");
                    Label lbl_date = (Label)grid_item.Rows[rowIndex].Cells[2].FindControl("lbl_date");

                    Label b_id = (Label)grid_item.Rows[rowIndex].Cells[0].FindControl("lbl_bid");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = i + 1;
                    drCurrentRow["col_0"] = b_id.Text == "" ? "0" : b_id.Text;
                    drCurrentRow["col_1"] = drop_code.Text;
                    drCurrentRow["col_2"] = txt_date.Text;

                    dtCurrentTable.Rows.Add(drCurrentRow);


                    lbl_date.Text = txt_date.Text.Length == 0 ? "empty" : "";
                    lbl_code.Text = drop_code.Text.Length == 0 ? "empty" : "";

                    if ((lbl_date.Text + " " + lbl_code.Text).Contains("empty"))
                    {
                        oi = false;
                        break;
                    }


                    rowIndex++;
                }

                ViewState["Item_List"] = dtCurrentTable;
            }
            return oi;
        }

        protected void DeleteEvent(object sender, EventArgs e)
        {
            switch (hf_action.Value)
            {
                case "event":
                    dbhelper.getdata2("update [event] set status='deleted' where id=" + hf_id.Value + " ");
                    break;
                case "fight":
                    dbhelper.getdata2("delete [match] where id=" + hf_hold.Value + " ");
                    break;
            }

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Deleted Successfully'); window.location='" + Request.RawUrl + "'", true);
        }

        protected void EditEvent(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                hf_id.Value = row.Cells[0].Text;
                modal_add.Style.Add("display", "block");

                DataTable dt = dbhelper.getdata2("select left(convert(varchar,event_date,101),10) as datee,event_name,cockpit_name,location,promoter from event where id=" + row.Cells[0].Text + " ");
                txt_date.Text = dt.Rows[0]["datee"].ToString();
                txt_name.Text = dt.Rows[0]["event_name"].ToString();
                txt_cock.Text = dt.Rows[0]["cockpit_name"].ToString();
                txt_location.Text = dt.Rows[0]["location"].ToString();
                txt_promoter.Text = dt.Rows[0]["promoter"].ToString();
            }
        }

        protected void click_submit(object sender, EventArgs e)
        {
            if (checker())
            {


                if (hf_action.Value == "0")
                {
                    dbhelper.getdata2("insert into event values (getdate(),'" + txt_date.Text + "','" + txt_name.Text.Replace("'", "") + "','" + txt_cock.Text.Replace("'", "") + "','" + txt_location.Text.Replace("'", "") + "','" + txt_promoter.Text.Replace("'", "") + "','ongoing')");
                }
                else
                {
                    dbhelper.getdata2("update event set event_date='" + txt_date.Text + "',event_name='" + txt_name.Text.Replace("'", "") + "',cockpit_name='" + txt_cock.Text.Replace("'", "") + "',location='" + txt_location.Text.Replace("'", "") + "',promoter='" + txt_promoter.Text.Replace("'", "") + "' where id=" + hf_id.Value + " ");
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Save Successfully'); window.location='" + Request.RawUrl + "'", true);
            }
        }

        protected bool checker()
        {
            bool oi = true;

            if (txt_date.Text == "")
            {
                oi = false;
                lbl_date.Text = "Empty";
            }
            else
                lbl_date.Text = "";



            if (txt_name.Text == "")
            {
                oi = false;
                lbl_name.Text = "Empty";
            }
            else
                lbl_name.Text = "";

            if (txt_promoter.Text == "")
            {
                oi = false;
                lbl_promoter.Text = "Empty";
            }
            else
                lbl_promoter.Text = "";

            if (txt_cock.Text == "")
            {
                oi = false;
                lbl_cock.Text = "Empty";
            }
            else
                lbl_cock.Text = "";

            if (txt_location.Text == "")
            {
                oi = false;
                lbl_location.Text = "Empty";
            }
            else
                lbl_location.Text = "";


            return oi;
        }

        protected void BindData()
        {
            string query = "select CONVERT(VARCHAR(10), event_date, 101)  event_date, * from [event] where status='ongoing' order by [id] desc";
            grid_view.DataSource = dbhelper.getdata2(query);
            grid_view.DataBind();
        }

        protected void ModifyMatch(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                string query = "select a.id, b.id a_id, bb.name b_name, b.participant a_entry, b.[weight], c.[weight], cc.name, c.participant entry_id " +
                "from match a  " +
                "left join [entry] b on a.sentinel = b.id " +
                "left join participant bb on b.participant = bb.id " +
                "left join [entry] c on a.scourge = c.id  " +
                "left join participant cc on c.participant = cc.id " +
                "where a.id=" + row.Cells[0].Text;
                DataTable dt = dbhelper.getdata2(query);
                modal_action.Style.Add("display", "block");

                ddl_a.Items.Clear();
                foreach (DataRow dr in dt.Rows)
                {
                    ddl_a.Items.Add(new ListItem(dr["b_name"].ToString(), dr["a_id"].ToString()));
                }
                ddl_a.Items.Add(new ListItem("Joker", "0"));

                ddl_b.Items.Clear();
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["entry_id"].ToString().Length > 0)
                        ddl_b.Items.Add(new ListItem(dr["name"].ToString(), dr["entry_id"].ToString()));
                }
                ddl_b.Items.Add(new ListItem("Joker", "0"));
            }
        }

        protected void DeleteMatch(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                DataTable dt = dbhelper.getdata2("");
            }
        }

        protected void ClsoeModifyMatch(object sender, EventArgs e)
        {
            modal_action.Style.Add("display", "none");
        }

        protected void Add(object sender, EventArgs e)
        {
            hf_action.Value = "0";
            modal_add.Style.Add("display", "block");
        }

        public void Match()
        {
            String query = "select a.id, bb.name a_entry, b.participant, b.[weight] a_weight, c.[weight] b_weight, " +
            "case when  cc.name is null then 'Joker' else  cc.name end b_entry, " +
            "case when  c.participant is null then 0 else  c.participant end entry_id ," +
            "REPLACE(CONVERT(VARCHAR(50), (CAST(b.parada AS money)), 1), '.00', '') a_parada, " +
            "REPLACE(CONVERT(VARCHAR(50), (CAST(c.parada AS money)), 1), '.00', '') b_parada " +
            "from match a " +
            "left join [entry] b on a.sentinel = b.id " +
            "left join [participant] bb on b.participant = bb.id " +
            "left join [entry] c on a.scourge = c.id " +
            "left join [participant] cc on c.participant = cc.id " +
            "where bb.event_id= " + hf_id.Value + " " +
            "order by a.Sequence";
            gv_match.DataSource = dbhelper.getdata2(query);
            gv_match.DataBind();


            if (gv_match.Rows.Count > 0)
            {
                LinkButton lnkUp = (gv_match.Rows[0].FindControl("lnkUp") as LinkButton);
                LinkButton lnkDown = (gv_match.Rows[gv_match.Rows.Count - 1].FindControl("lnkDown") as LinkButton);
                lnkUp.Enabled = false;
                lnkUp.CssClass = "button disabled";
                lnkDown.Enabled = false;
                lnkDown.CssClass = "button disabled";
            }
        }

        protected void ChangePreference(object sender, EventArgs e)
        {
            string commandArgument = (sender as LinkButton).CommandArgument;

            int rowIndex = ((sender as LinkButton).NamingContainer as GridViewRow).RowIndex;
            int locationId = Convert.ToInt32(gv_match.Rows[rowIndex].Cells[0].Text);
            int preference = Convert.ToInt32(rowIndex);
            preference = commandArgument == "up" ? preference - 1 : preference + 1;
            this.UpdatePreference(locationId, preference);

            rowIndex = commandArgument == "up" ? rowIndex - 1 : rowIndex + 1;
            locationId = Convert.ToInt32(gv_match.Rows[rowIndex].Cells[0].Text);
            preference = Convert.ToInt32(rowIndex);
            preference = commandArgument == "up" ? preference + 1 : preference - 1;
            this.UpdatePreference(locationId, preference);

            Match();
        }

        private void UpdatePreference(int locationId, int preference)
        {
            dbhelper.getdata2("update match set [Sequence]=" + preference + " where id=" + locationId);
        }

        protected void DataBoundParticipant(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView entry = (GridView)e.Row.FindControl("gv_entry");
                string query = "select * from participant a left join [entry] b on a.id=b.participant where a.id=" + e.Row.Cells[0].Text;
                entry.DataSource = dbhelper.getdata2(query);
                entry.DataBind();
            }
        }

        protected void Close(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void Modal(bool x)
        {
            modal_default.Style.Add("display", x ? "block" : "none");
        }
    }
}