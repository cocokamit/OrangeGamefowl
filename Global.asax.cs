using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace SabongLive
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            Application["UsersLoggedIn"] = new System.Collections.Generic.List<string>();
            RegisterRoutes(RouteTable.Routes);
        }

        void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("", "Login", "~/Default.aspx");
            routes.MapPageRoute("", "Dashboard", "~/Pages/Players/Dashboard1.aspx");
            routes.MapPageRoute("", "Livebattle", "~/Pages/Players/LiveBattle.aspx");
            routes.MapPageRoute("", "Register", "~/Pages/Players/Registration.aspx");

            //Agents
            routes.MapPageRoute("", "UnderList", "~/Pages/Agents/UndeList.aspx");
            routes.MapPageRoute("", "AppWith", "~/Pages/Agents/ApproveWithdrawal.aspx");
            routes.MapPageRoute("", "Credation", "~/Pages/Agents/Credition.aspx");


            //admin
            routes.MapPageRoute("", "Matching", "~/Pages/Admin/Promoter/match.aspx");
            routes.MapPageRoute("", "final-matching", "~/Pages/Admin/Promoter/match_print.aspx");
            routes.MapPageRoute("", "Journal", "~/Pages/Admin/Journal.aspx");
            routes.MapPageRoute("", "Dashboard2", "~/Pages/Admin/Dashboard2.aspx");

            routes.MapPageRoute("", "screen", "~/Pages/News/screen.aspx");
            routes.MapPageRoute("", "director", "~/Pages/News/director.aspx");
            routes.MapPageRoute("", "sampler", "~/Pages/News/sampler.aspx");
            routes.MapPageRoute("", "history", "~/Pages/News/history.aspx");
            routes.MapPageRoute("", "printslip", "~/Pages/News/printslip.aspx");
            routes.MapPageRoute("", "activationpage", "~/Pages/News/activationkey.aspx");
            routes.MapPageRoute("", "admin", "~/Pages/News/administrator.aspx");
            routes.MapPageRoute("", "monton", "~/Pages/News/monton.aspx");
            routes.MapPageRoute("", "printmeronwala", "~/Pages/News/printmeronwala.aspx");
            routes.MapPageRoute("", "printpadaug", "~/Pages/News/printpadaug.aspx");
            routes.MapPageRoute("", "ticketing", "~/Pages/News/ticketing.aspx");
            routes.MapPageRoute("", "printticket", "~/Pages/News/printticket.aspx");
            routes.MapPageRoute("", "prioprep", "~/Pages/News/prioprep.aspx");
            routes.MapPageRoute("", "prioscreen", "~/Pages/News/PrioPrepScreen.aspx");
        }
        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

            string userLoggedIn = Session["UserLoggedIn"] == null ? string.Empty : (string)Session["UserLoggedIn"];
            if (userLoggedIn.Length > 0)
            {
                System.Collections.Generic.List<string> d = Application["UsersLoggedIn"]
                    as System.Collections.Generic.List<string>;
                if (d != null)
                {
                    lock (d)
                    {
                        d.Remove(userLoggedIn);
                    }
                }
            }
        }
    }
}