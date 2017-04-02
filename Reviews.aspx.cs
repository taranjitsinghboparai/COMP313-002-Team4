using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserPages_Reviews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
            Response.Redirect("~/Login.aspx");

        Session.Add("url", "Reviews.aspx");

    }
    protected void ddl_rev_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "gid")
        {
            Response.Redirect("Details.aspx?gid=" + (String)e.CommandArgument);
        }
    }
}