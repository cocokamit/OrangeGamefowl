using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using SabongLive.App_Code;

namespace SabongLive
{
    public class ChatHub : Hub
    {
        static List<Users> ConnectedUsers = new List<Users>();
        static List<Messages> CurrentMessage = new List<Messages>();
        static Announcer CurrentAnnouncer = new Announcer();
        static Messages CurrentMessagev1 = new Messages();
        static UserBet userbet = new UserBet();
        static Director directorbtn = new Director();
        static Eventitler eventitle = new Eventitler();
        static Screen screen = new Screen();
        ConnClass ConnC = new ConnClass();



        public void Connect(string userName,string userRole)
        {
            var id = Context.ConnectionId;

            if (ConnectedUsers.Count(x => x.UserName == userName) == 0)
            {
                string logintime = DateTime.Now.ToString();

                if (userRole == "agent" || userRole=="director")
                {
                    ConnectedUsers.Add(new Users { ConnectionId = id, UserName = userName, LoginTime = logintime });
                    Clients.Caller.onConnected(id, userName, CurrentAnnouncer, CurrentMessagev1, eventitle, directorbtn);
                }
                else if(userRole=="screen")
                {
                    screen.Screens = id;
                    screen.Status = userName;
                    ConnectedUsers.Add(new Users { ConnectionId = id, UserName = userName, LoginTime = logintime });
                    Clients.Caller.onConnected(id, userName, CurrentAnnouncer, CurrentMessagev1, eventitle, directorbtn);
                }
                else
                {
                    Clients.Caller.loginuser();
                }
            }
            else
            {
                Clients.Caller.onConnected(id, userName, CurrentAnnouncer, CurrentMessagev1, eventitle, directorbtn);

            }
        }

        public void RemoveConnection(string connectionId)
        {
            var item = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == connectionId);
                
            if (item != null)
            {
                ConnectedUsers.Remove(item);

                Clients.All.onRemoveConnection(item.ConnectionId);

            }
        }

        public void SendMessageToAll(string userName, string message, string time,string choice,string total1,string total2)
        {
            // store last 100 messages in cache
            AddMessageinCache(userName, message, time,choice,total1,total2);

            // Broad cast message
            Clients.All.messageReceived(userName, message, time,choice,total1,total2);

        }

        private void AddMessageinCache(string userName, string message, string time,string choice,string total1,string total2)
        {
            CurrentMessagev1.UserName = userName;
            CurrentMessagev1.Message = message;
            CurrentMessagev1.Time = time;
            CurrentMessagev1.Choice = choice;
            CurrentMessagev1.Total1 = total1;
            CurrentMessagev1.Total2 = total2;


        }

        public void Addevent(string title, string status)
        {
            eventitle.Title = title;
            eventitle.Status = status;

            Clients.All.announceEvent(title, status);
        }
        public void clearEvent()
        {
            eventitle.Status="";
            eventitle.Title = "";
        }

        public void clearTimeout()
        {
            CurrentMessage.Clear();
        }

        public void Announcerets(string button,string message, string status)
        {
            CurrentAnnouncer.Message =message;
            CurrentAnnouncer.Status = status;
            CurrentAnnouncer.Button = "";
            Clients.All.announceStatus(button, message, status);

        }

        public void DirectorBtns(string marquee, string status,string fightno,string eventid,string redeclare)
        {
            directorbtn.Marquee = marquee;
            directorbtn.Status = status;
            directorbtn.FightNo = fightno;
            directorbtn.EventId = eventid;
            directorbtn.Redeclare = redeclare;

            Clients.All.directorOrder(marquee, status,fightno,eventid, redeclare);

        }

        public void directorbtns1(string status)
        {
            if (status == "START" || status == "END" || status == "NEXT")
            {
                Clients.All.announceStatus("", "", "");
            }
        }

        public void onGos()
        {
            Clients.All.ongo("");
        }
        public void onPost()
        {
            Clients.All.onpost("");
        }

        public void samplergo(string MatchId,string Fightno,string statusside,string amount,string agentname)
        {
            DataTable d1 = dbhelper.getdata("Select top 1 * from Matches where Status='ongoing' order by Id desc");

            if (d1.Rows.Count > 0)
            {
                DataTable d2 = dbhelper.getdata("Select * from Fights where MatchId="+d1.Rows[0]["Id"].ToString()+" order by Fightno desc");

                if (d2.Rows.Count > 0)
                {
                    MatchId = d1.Rows[0]["Id"].ToString();
                    Fightno = d2.Rows[0]["Fightno"].ToString();

                    DataTable dt = dbhelper.getdata("Select * from Fights where Fightno=" + d2.Rows[0]["Fightno"].ToString() + " and MatchId=" + d1.Rows[0]["Id"].ToString() + "");
                    
                    if (dt.Rows.Count > 0)
                    {
                        double totalmeron = Convert.ToDouble(dt.Rows[0]["TotalMeron"].ToString());
                        double totalwala = Convert.ToDouble(dt.Rows[0]["TotalWala"].ToString());
                        double meronpayout = Convert.ToDouble(dt.Rows[0]["MeronParada"].ToString());
                        double walapayout = Convert.ToDouble(dt.Rows[0]["WalaParada"].ToString());

                        if (statusside == "meron")
                        {
                            totalmeron += Convert.ToDouble(amount);
                        }
                        else
                        {
                            totalwala += Convert.ToDouble(amount);
                        }
                        DataTable dt2 = dbhelper.getdata("Select * from Amounts");
                        double percentpay = Convert.ToDouble(dt2.Rows[0]["PercentAmount"].ToString());
                        meronpayout = Math.Floor((((totalwala - totalmeron) / totalmeron) + percentpay) * 100).ToString() != "∞" ? Math.Floor((((totalwala - totalmeron) / totalmeron) + percentpay) * 100) : 0;
                        walapayout = Math.Floor((((totalmeron - totalwala) / totalwala) + percentpay) * 100).ToString() != "∞" ? Math.Floor((((totalmeron - totalwala) / totalwala) + percentpay) * 100) : 0;
                        double meronpayout1 = (((totalwala - totalmeron) / totalmeron) + percentpay).ToString() != "∞" ? (((totalwala - totalmeron) / totalmeron) + percentpay) : 0;
                        double walapayout1 = (((totalmeron - totalwala) / totalwala) + percentpay).ToString() != "∞" ? (((totalmeron - totalwala) / totalwala) + percentpay) : 0;
                        string dd = walapayout.ToString();

                        if (statusside == "maron")
                        {
                            dbhelper.getdata("Insert into Fightusers (MatchId,Fightno,Amount,GainAmount,Statusside,AgentName,Sysdate) values(" + MatchId + "," + Fightno + "," + amount + "," + (Convert.ToDouble(amount) * meronpayout1) + ",'" + statusside + "','"+agentname+"','"+DateTime.Now.ToString("yyyy-MM-dd")+"')");
                        }
                        else
                        {
                            dbhelper.getdata("Insert into Fightusers (MatchId,Fightno,Amount,GainAmount,Statusside,AgentName,Sysdate) values(" + MatchId + "," + Fightno + "," + amount + "," + (Convert.ToDouble(amount) * walapayout1) + ",'" + statusside + "','" + agentname + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "')");
                        }

                        if (meronpayout > 0)
                        {
                            dbhelper.getdata("Update Fightusers set GainAmount=Amount*" + meronpayout1 + " where Statusside='meron' and MatchId=" + MatchId + " and Fightno=" + Fightno + "");
                        }
                        if (walapayout > 0)
                        {
                            dbhelper.getdata("Update Fightusers set GainAmount=Amount*" + walapayout1 + " where Statusside='wala' and MatchId=" + MatchId + " and Fightno=" + Fightno + "");
                        }

                        dbhelper.getdata("Update Fights set TotalMeron=" + totalmeron + ", TotalWala=" + totalwala + ", MeronParada=" + meronpayout + ", WalaParada=" + walapayout + " where MatchId="+MatchId+" and Fightno="+Fightno+"");


                    }
                }

            }

       
            Clients.All.announceStatus("", "", "");

        }
        public override System.Threading.Tasks.Task OnDisconnected(bool stopCalled)
        {
            var item = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);
            if (item != null && stopCalled)
            {
                ConnectedUsers.Remove(item);

            }
            else if(item != null)
            {
                Clients.Caller.onUserDisconnected(1, 1);
            }
            return base.OnDisconnected(stopCalled);
        }
       

    }
}