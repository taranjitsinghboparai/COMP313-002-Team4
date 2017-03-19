using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Redirector : System.Web.UI.Page
{
    protected String platform;


    protected void Page_Load(object sender, EventArgs e)
    {



        platform = Request.QueryString["pid"];

        if (Session["search"] != null || !String.IsNullOrEmpty((String)Session["search"])) {
            if (platform == "ALL" || String.IsNullOrEmpty(Page.Request.QueryString["pid"]))
            {
                Session.Remove("platform");

                Response.Redirect("SearchAllGames.aspx?search=" + Session["search"]);

            }
            else
            {
                Session.Add("platform", platform);

                Response.Redirect("SearchAllGamesPlatform.aspx?pid=" + platform + "&search=" + Session["search"]);
            }
        }

        if (platform == "ALL" || String.IsNullOrEmpty(Page.Request.QueryString["pid"]))
        {
            Session.Remove("platform");
            if (Session["page"] != null){
                Response.Redirect(Session["Page"] + "Platform.aspx");
                //System.Diagnostics.Debug.WriteLine("In 3" + (String)Session["platform"]);

            }
            else {
                if (!String.IsNullOrEmpty((String)Session["pageadder"]))
                {
                    Response.Redirect(Session["pageadder"] + ".aspx");
                }
                else
                {
                    Response.Redirect("AllGames.aspx");

                }
            }

        }
        else
        {
            Session.Add("platform", platform);
            if (Session["page"] != null)
                Response.Redirect(Session["Page"] + "Platform.aspx?pid=" + platform);
            else
            {
                if (!String.IsNullOrEmpty((String)Session["pageadder"]))
                    Response.Redirect(Session["pageadder"] + ".aspx");
                else {
                    Response.Redirect("AllGamesPlatform.aspx?pid="+platform);
                }
            }
        }
    }
}