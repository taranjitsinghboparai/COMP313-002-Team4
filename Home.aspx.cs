using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("search");
        Session.Remove("platform");
        Session.Remove("Page");
        Session.Add("url", "Home.aspx");

    }
}