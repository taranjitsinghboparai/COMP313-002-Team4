using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Upcomming : System.Web.UI.Page
{
    protected int id;
    protected AddWishlist wish;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("Search");

        if (Session["Platform"] != null)
        {
            if (Session["Platform"] != "All")
                Response.Redirect("UpcommingPlatform.aspx?pid=" + (String)Session["Platform"]);
        }
        Session.Add("page", "Upcomming");
        // iterator = 0;
        wish = new AddWishlist();
        Session.Add("url", "UpcommingPlatform.aspx");
    }

    protected void Add_To_Wishlist(object sender, EventArgs e)
    {

        Response.Redirect("~/Home.aspx");
    }

    protected void GetPlatform(object sender, EventArgs e)
    {
        // price_label.Text = "";
      //  String s = platform.DataValueField;
    }

    protected void Add_To_Cart(object sender, EventArgs e)
    {
        Label edit = (Label)all_games.Items[0].FindControl("game_id");
        edit.Visible = true;

    }

    protected void loadData_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbl = (Label)all_games.FindControl("price_label");

    }

    protected void all_games_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "detail")
        {
            Response.Redirect("~/Details.aspx?gid=" + (string)e.CommandArgument);
        }
        if (e.CommandName == "wish")
        {
            if (Session["userid"] != null)
                wish.Add_To_Wishlist(Convert.ToInt16(Session["userid"]), Convert.ToInt16((string)e.CommandArgument));
            else
                Response.Redirect("~/Login.aspx");
        }


    }
}