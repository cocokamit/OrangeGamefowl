using SabongLive.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SabongLive.Pages.Players
{
    public partial class LiveBattle : System.Web.UI.Page
    {
        public string UserName = "admin";
        public string StartCredits = "";
        public string titler = "";
        public string eventid = "0";
        public string fightno = "0";
        public string TotalFight = "0";
        public string currentbets = "0";

        public string UserRole = "1";
        ConnClass ConnC = new ConnClass();
        protected void Page_Load(object sender, EventArgs e)
        {
           HttpContext.Current.Response.AddHeader("Set-Cookie", "HttpOnly;Secure;SameSite=Strict");
            if (Session["ClientId"] != null)
            {
                UserName = Session["ClientId"].ToString();
                UserRole = Session["Role"].ToString();
            }
            else
                Response.Redirect("Login");

            loadable(UserName);
        }
        protected void clicklogouter(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login");
        }

        private void loadable(string id) {

            DataTable dt = dbhelper.getdata2("Select top 1 * from Credits where ClientId=" + id + " and Status='onsystem' order by SysDate desc");
            string agentid = "";
            string operatorid = "";
           
            if (dt.Rows.Count > 0)
            {
                agentid = dt.Rows[0]["AgentId"].ToString();
                operatorid = dt.Rows[0]["OperatorId"].ToString();
                StartCredits = dt.Rows[0]["Credits"].ToString();
            }

            dt = dbhelper.getdata2("Select top 1 * from event where Status='ongoing' order by event_date asc");
            if (dt.Rows.Count > 0)
            {
                titler = dt.Rows[0]["event_name"].ToString();
                eventid = dt.Rows[0]["Id"].ToString();
                titlebar.InnerText = dt.Rows[0]["event_name"].ToString() == "" ? "No match was scheduled today. Please check your event calendar for more information." : dt.Rows[0]["event_name"].ToString();

                dt = dbhelper.getdata2("Select * from match where event_id=" + eventid + " and Status is NULL order by Sequence asc");

                if (dt.Rows.Count > 0)
                {
                    fightno = dt.Rows[0]["Sequence"].ToString();
                    TotalFight = dt.Rows.Count.ToString();

                    //dt = dbhelper.getdata("Select * from BetHistory where Fightno!=" + fightno + " and ClientId=" + id + " and EventId=" + eventid + " and Status is null");
                    //double returned = 0;
                    //if (dt.Rows.Count > 0)
                    //{
                    //    foreach(DataRow row in dt.Rows)
                    //    {
                    //        dbhelper.getdata("Update BetHistory set Status='returned' where Id="+row["Id"].ToString()+"");
                    //        returned += Convert.ToDouble(row["Bet"].ToString());
                    //    }
                    //    StartCredits += returned;
                    //    dbhelper.getdata("Update Credits set Status=NULL where ClientId="+id+" Insert into Credits values(" + id + ", " + agentid + ", " + operatorid + ", " + StartCredits + ", GETDATE(), GetDate(), 'onsystem')");
                    //}

                    dt = dbhelper.getdata2("Select SUM(Bet) totalbet from BetHistory where Fightno="+fightno+" and ClientId="+id+" and EventId="+eventid+" and Status is null");
                    currentbets = dt.Rows[0]["totalbet"].ToString()==""?"0" : dt.Rows[0]["totalbet"].ToString();
                }
            }
            dt = dbhelper.getdata2("Select * from ClientInfo where Id=" + id + "");
            wdnumber.Value = dt.Rows[0]["ContactNo"].ToString();

            dt = dbhelper.getdata2("Select b.* from Approvers a left join ClientInfo b on a.ClientId=b.Id where a.UnderId=" + id + "");
            ViewState["Personnels"] = dt;
        }

        [WebMethod]
        public static void OnSendBet(string username,string bet,string curdate,string fightno,string eventid,string choice)
        {
            string query="Insert into BetHistory values("+username+","+bet+","+ fightno + ",GetDate(),GetDate(),"+eventid+ ",NULL,NULL,NULL,"+ choice + ") ";

            DataTable dt = dbhelper.getdata2("Select top 1 * from Credits where ClientId=" + username + " and Status='onsystem' order by SysDate desc");
            if (dt.Rows.Count > 0)
            {
                double d = Convert.ToDouble(dt.Rows[0]["Credits"].ToString()) - Convert.ToDouble(bet);

                query += "Insert into Credits values("+ username + ","+ dt.Rows[0]["AgentId"].ToString() + ","+ dt.Rows[0]["OperatorId"].ToString() + ","+d+ ",GETDATE(),GetDate(),'onsystem') " +
                    " Update Credits set Status='NULL' where Id="+ dt.Rows[0]["Id"].ToString() + "";

                dbhelper.getdata2(query);
            }

        }

        [WebMethod]
        public static string OnGetCredits(string username,string evenid)
        {
            string credits = "";
            DataTable dt = dbhelper.getdata2("Select top 1 * from Credits where ClientId=" + username + " and Status='onsystem' order by SysDate desc");
            if (dt.Rows.Count > 0)
            {
                credits += dt.Rows[0]["Credits"].ToString()+"~";
            }
            dt = dbhelper.getdata2("Select distinct (Select Count(*) from match where event_id="+ evenid + " and Status='RED') [red],(Select Count(*) from match where event_id="+ evenid + " and Status='BLUE') [blue],(Select Count(*) from match where event_id="+ evenid + " and Status='CANCELLED') [cancel],(Select Count(*) from match where event_id=" + evenid + " and Status='DRAW') [draw],(Select Count(*) from match where event_id="+evenid+") [total] from match ");
            if (dt.Rows.Count > 0)
            {
                credits += dt.Rows[0]["red"].ToString()+"~"+ dt.Rows[0]["blue"].ToString() + "~"+ dt.Rows[0]["draw"].ToString() + "~"+ dt.Rows[0]["cancel"].ToString() + "~"+dt.Rows[0]["total"].ToString();

            }

            return credits;
        }

        [WebMethod]
        public static string OnChangeFightno( string fightno, string eventid)
        {
            string upfightno = "";

            if (eventid != "")
            {
                string query = "Update match set Status='done' where event_id=" + eventid + " and Sequence="+fightno+"" +
                    " Select top 1 * from match where event_id=" + eventid + " and Status is NULL order by Sequence asc";
                DataTable dt= dbhelper.getdata2(query);
                if (dt.Rows.Count > 0)
                {
                    upfightno = dt.Rows[0]["Sequence"].ToString();
                }
            }
            return upfightno;
        }

        [WebMethod]
        public static string OnSaveEvent( string title,string status,string eventid)
        {
            if (status == "Exit")
            {
                string query = "Update event set Status='done' where id="+eventid+"";
                dbhelper.getdata2(query);

            }
            return eventid;
        }

        [WebMethod]
        public static string OnCancelBet(string clientID, string status,string pyout1,string pyout2,string choice,string fightno,string eventid,string redeclared)
        {
            if (redeclared == "2")
            {
                dbhelper.getdata2("Update Credits set Status=NULL From Credits a inner join ActivityLogs b on a.ClientId=b.ClientId where ((Select top 1 Activity from ActivityLogs where ClientId=a.ClientId order by Date desc)='Logout' or a.ClientId=" + clientID + ") and (Select COUNT(Id) from BetHistory where ClientId=a.ClientId and Fightno= " + fightno + " and EventId = " + eventid + " and Status is NULL)>0"

                                + "Insert into Credits(ClientId, AgentId, OperatorId, Credits, SysDate, Date, Status) Select top 1 a.ClientId, b.AgentId, b.OperatorId,case when a.Status = 'win' then ( b.Credits-(Select SUM(bet) from BetHistory where Fightno = " + fightno + " and EventId = " + eventid + " and ClientId=a.ClientId and Status is not NULL)) else ( b.Credits + (Select SUM(bet) from BetHistory where Fightno = " + fightno + " and EventId = " + eventid + " and ClientId=a.ClientId and Status is not NULL)) end Credits, GETDATE()SysDate,GETDATE() Date,'onsystem' Status from BetHistory a left join Credits b on a.ClientId = b.ClientId where a.Fightno = " + fightno + " and a.EventId = " + eventid + " and a.Status is not NULL and((Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc) = 'Logout' or a.ClientId = "+clientID+") group by a.ClientId,b.AgentId,b.OperatorId,a.Sysdate,b.Credits order by a.Sysdate desc"

                                +"Update BetHistory set Status = NULL, Payout = NULL, Gain = NULL from BetHistory a inner join ActivityLogs b on a.ClientId = b.ClientId where Fightno = " + fightno + " and EventId = " + eventid + " and Status is NULL and ((Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout' or a.ClientId = "+clientID+")");
            }

            string value = "";
            DataTable dt = dbhelper.getdata2("Select SUM(bet) as bet from BetHistory where ClientId=" + clientID + " and Status is NULL group by Sysdate order by SysDate desc");
            string query =" Update match set Status='"+status+"' where Sequence=" + fightno + " and event_id=" + eventid + "";
            DataTable dtt = dbhelper.getdata2("Select top 1 * from Credits where ClientId=" + clientID + " and Status='onsystem' order by SysDate desc");
                
            double d = 0;
            double total = 0;
            if (dtt.Rows.Count > 0)
            {
                total = Convert.ToDouble(dtt.Rows[0]["Credits"].ToString());
            }
            string payout = "0";
            string message = "";
            string winstatus = "";
            if (dt.Rows.Count > 0)
            {
                if (status == "CANCELLED")
                {
                    if (dtt.Rows.Count > 0)
                    {  
                        d = Convert.ToDouble(dtt.Rows[0]["Credits"].ToString()) + Convert.ToDouble(dt.Rows[0]["Bet"].ToString());
                        total = d;
                        query += "Insert into Credits values(" + clientID + "," + dtt.Rows[0]["AgentId"].ToString() + "," + dtt.Rows[0]["OperatorId"].ToString() + "," + d + ",GETDATE(),GetDate(),'onsystem') " +
                            " Update Credits set Status=NULL where Id=" + dtt.Rows[0]["Id"].ToString() + "";
                        winstatus = "cancelled";

                        //offline players
                        dbhelper.getdata2("Update Credits set Status=NULL From Credits a inner join ActivityLogs b on a.ClientId=b.ClientId where (Select top 1 Activity from ActivityLogs where ClientId=a.ClientId order by Date desc)='Logout' and (Select COUNT(Id) from BetHistory where ClientId=a.ClientId and Fightno= " + fightno + " and EventId = " + eventid + " and Status is NULL)>0"
                                        + "Insert into Credits(ClientId, AgentId, OperatorId, Credits, SysDate, Date, Status) Select top 1 a.ClientId, b.AgentId, b.OperatorId, (b.Credits+(Select SUM(bet) from BetHistory where Fightno = " + fightno+" and EventId = "+eventid+" and ClientId=a.ClientId and Status is NULL) ) Credits,GETDATE()SysDate,GETDATE() Date,'onsystem' Status from BetHistory a left join Credits b on a.ClientId = b.ClientId where a.Fightno = "+fightno+" and a.EventId = "+eventid+" and a.Status is NULL and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout' group by a.ClientId,b.AgentId,b.OperatorId,a.Sysdate,b.Credits order by a.Sysdate desc"
                                        + "Update BetHistory set Status ='cancelled',Payout=0,Gain=0 from BetHistory a inner join ActivityLogs b on a.ClientId = b.ClientId where Fightno = " + fightno + " and EventId =  " + eventid + " and Status is NULL and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout'");
                    }
                }
                else if (status == "RED")
                {
                    if (choice == "1")
                    {
                         if (dtt.Rows.Count > 0)
                        {
                            d = (Convert.ToDouble(pyout1)/100) * Convert.ToDouble(dt.Rows[0]["Bet"].ToString()) ;
                            total = Convert.ToDouble(dtt.Rows[0]["Credits"].ToString()) + d;
                            query += "Insert into Credits values(" + clientID + "," + dtt.Rows[0]["AgentId"].ToString() + "," + dtt.Rows[0]["OperatorId"].ToString() + "," + (Convert.ToDouble(dtt.Rows[0]["Credits"].ToString()) + d) + ",GETDATE(),GetDate(),'onsystem') " +
                                " Update Credits set Status=NULL where Id=" + dtt.Rows[0]["Id"].ToString() + "";
                            payout = pyout1;
                            message = "You won "+d+" ("+payout+"%) in fight #"+ fightno + "";
                            winstatus = "win";


                            //offline players
                            dbhelper.getdata2("Update Credits set Status=NULL From Credits a inner join ActivityLogs b on a.ClientId=b.ClientId where (Select top 1 Activity from ActivityLogs where ClientId=a.ClientId order by Date desc)='Logout' and (Select COUNT(Id) from BetHistory where ClientId=a.ClientId and Fightno= " + fightno + " and EventId = " + eventid + " and Status is NULL and Choice=1)>0"
                                           + "Insert into Credits(ClientId, AgentId, OperatorId, Credits, SysDate, Date, Status) Select top 1 a.ClientId, b.AgentId, b.OperatorId, ("+d+" + b.Credits) Credits,GETDATE()SysDate,GETDATE() Date,'onsystem' Status from BetHistory a left join Credits b on a.ClientId = b.ClientId where a.Fightno = " + fightno + " and a.EventId = " + eventid + " and a.Status is NULL and a.Choice=1 and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout' group by a.ClientId,b.AgentId,b.OperatorId,a.Sysdate,b.Credits order by a.Sysdate desc"
                                           + "Update BetHistory set Status ='win',Payout="+payout+",Gain="+d+" from BetHistory a inner join ActivityLogs b on a.ClientId = b.ClientId where Fightno = " + fightno + " and EventId =  " + eventid + " and Status is NULL and Choice=1 and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout'");

                        }
                    }
                    else if (choice == "2")
                    {
                        message = "You lose in fight #" + fightno + "";
                        payout = pyout1;
                        winstatus = "lose";

                        //offline players
                        dbhelper.getdata2("Update BetHistory set Status ='lose',Payout=" + payout + ",Gain=" + d + " from BetHistory a inner join ActivityLogs b on a.ClientId = b.ClientId where Fightno = " + fightno + " and EventId =  " + eventid + " and Status is NULL and Choice=2 and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout'");

                    }
                }
                else if (status == "BLUE")
                {
                    if (choice == "1")
                    {
                        message = "You lose in fight #" + fightno + ""; 
                        payout = pyout2;
                        winstatus = "lose";

                        //offline players
                        dbhelper.getdata2("Update BetHistory set Status ='lose',Payout=" + payout + ",Gain=" + d + " from BetHistory a inner join ActivityLogs b on a.ClientId = b.ClientId where Fightno = " + fightno + " and EventId =  " + eventid + " and Choice=1 and Status is NULL and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout'");

                    }
                    else if (choice == "2")
                    {
                        if (dtt.Rows.Count > 0)
                        {
                            d = (Convert.ToDouble(pyout2) / 100) * Convert.ToDouble(dt.Rows[0]["Bet"].ToString());
                            total = Convert.ToDouble(dtt.Rows[0]["Credits"].ToString()) + d;
                            query += "Insert into Credits values(" + clientID + "," + dtt.Rows[0]["AgentId"].ToString() + "," + dtt.Rows[0]["OperatorId"].ToString() + "," + (Convert.ToDouble(dtt.Rows[0]["Credits"].ToString()) + d) + ",GETDATE(),GetDate(),'onsystem') " +
                                " Update Credits set Status=NULL where Id=" + dtt.Rows[0]["Id"].ToString() + "";
                            payout = pyout2;

                            message = "You won " + d + " (" + payout + "%) in fight #" + fightno + "";
                            winstatus = "win";

                            //offline players
                            dbhelper.getdata2("Update Credits set Status=NULL From Credits a inner join ActivityLogs b on a.ClientId=b.ClientId where (Select top 1 Activity from ActivityLogs where ClientId=a.ClientId order by Date desc)='Logout' and (Select COUNT(Id) from BetHistory where ClientId=a.ClientId and Fightno= " + fightno + " and EventId = " + eventid + " and Choice=2 and Status is NULL)>0"
                                           + "Insert into Credits(ClientId, AgentId, OperatorId, Credits, SysDate, Date, Status) Select top 1 a.ClientId, b.AgentId, b.OperatorId, (" + d + " + b.Credits) Credits,GETDATE()SysDate,GETDATE() Date,'onsystem' Status from BetHistory a left join Credits b on a.ClientId = b.ClientId where a.Fightno = " + fightno + " and a.EventId = " + eventid + " and a.Status is NULL and a.Choice=2 and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout' group by a.ClientId,b.AgentId,b.OperatorId,a.Sysdate,b.Credits order by a.Sysdate desc"
                                           + "Update BetHistory set Status ='win',Payout=" + payout + ",Gain=" + d + " from BetHistory a inner join ActivityLogs b on a.ClientId = b.ClientId where Fightno = " + fightno + " and EventId =  " + eventid + " and Status is NULL and Choice=2 and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout'");

                        }
                    }
                }
                else if (status == "DRAW")
                {
                    if (dtt.Rows.Count > 0)
                    {
                        d = Convert.ToDouble(dtt.Rows[0]["Credits"].ToString()) + Convert.ToDouble(dt.Rows[0]["Bet"].ToString());
                        total = d;
                        query += "Insert into Credits values(" + clientID + "," + dtt.Rows[0]["AgentId"].ToString() + "," + dtt.Rows[0]["OperatorId"].ToString() + "," + d + ",GETDATE(),GetDate(),'onsystem') " +
                            " Update Credits set Status=NULL where Id=" + dtt.Rows[0]["Id"].ToString() + "";
                        winstatus = "draw";

                        //offline players
                        dbhelper.getdata2("Update Credits set Status=NULL From Credits a inner join ActivityLogs b on a.ClientId=b.ClientId where (Select top 1 Activity from ActivityLogs where ClientId=a.ClientId order by Date desc)='Logout' and (Select COUNT(Id) from BetHistory where ClientId=a.ClientId and Fightno= " + fightno + " and EventId = " + eventid + " and Status is NULL)>0"
                                        + "Insert into Credits(ClientId, AgentId, OperatorId, Credits, SysDate, Date, Status) Select top 1 a.ClientId, b.AgentId, b.OperatorId, (b.Credits+(Select SUM(bet) from BetHistory where Fightno = " + fightno + " and EventId = " + eventid + "  and ClientId=a.ClientId and Status is NULL) ) Credits,GETDATE()SysDate,GETDATE() Date,'onsystem' Status from BetHistory a left join Credits b on a.ClientId = b.ClientId where a.Fightno = " + fightno + " and a.EventId = " + eventid + " and a.Status is NULL and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout' group by a.ClientId,b.AgentId,b.OperatorId,a.Sysdate,b.Credits order by a.Sysdate desc"
                                        + "Update BetHistory set Status ='draw',Payout=0,Gain=0 from BetHistory a inner join ActivityLogs b on a.ClientId = b.ClientId where Fightno = " + fightno + " and EventId =  " + eventid + " and Status is NULL and (Select top 1 Activity from ActivityLogs where ClientId = a.ClientId order by Date desc)= 'Logout'");

                    }

                }
               
                value = total + "~"+message;

                query += " Update BetHistory set Status='"+ winstatus + "',Payout="+payout+",Gain="+d+" where ClientId=" + clientID + " and Fightno="+fightno+" and EventId="+eventid+"";
                
                dbhelper.getdata2(query);

             }
            return value;
        }





        //[WebMethod]
        //public static string OnGetEvent(string username)
        //{
        //    string credits = "";
        //    DataTable dt = dbhelper.getdata("Select top 1 * from Credits where ClientId=" + username + " and Status='onsystem' order by SysDate desc");
        //    if (dt.Rows.Count > 0)
        //    {
        //        credits = dt.Rows[0]["Credits"].ToString();
        //    }

        //    return credits;
        //}
    }
}