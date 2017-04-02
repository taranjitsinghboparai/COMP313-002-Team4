using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GameAddict : System.Web.UI.MasterPage
{
    string t;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null){
            login.Visible = false;
            signin.Visible = false;
            Logout.Visible = true;
            register.Visible = false;
        }
        else { 
            login.Visible = true;
            signin.Visible = true;
            register.Visible = true;
            Logout.Visible = false;
           }

        if(IsPostBack)
            if (Session["search"] != null) {
                //Session.Remove("search");
                Session.Add("search", tbx_search.Text);
            }
    }

 
    protected void btn_search_Click(object sender, EventArgs e)
    {

            if (!String.IsNullOrEmpty(tbx_search.Text))
            {
                Session.Add("search", tbx_search.Text);
                if (Session["platform"] == null)
                    Response.Redirect("Redirector.aspx?search=" + Session["search"]);
                else
                    Response.Redirect("Redirector.aspx?pid=" + Session["platform"] + "&search=" + Session["search"]);
            }
            else
            {
                Session.Remove("search");
            }
        
    }   
}
