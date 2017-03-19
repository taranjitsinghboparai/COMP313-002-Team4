using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewGames : System.Web.UI.Page
{
    protected int id;
    protected AddCart cart;
    protected AddWishlist wish;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("Search");

        if (Session["Platform"] != null)
        {
            if (Session["Platform"] != "All")
                Response.Redirect("NewGamesPlatform.aspx?pid=" + (String)Session["Platform"]);
        }
        Session.Add("page", "NewGames");
        // iterator = 0;
        cart = new AddCart();
        wish = new AddWishlist();
        Session.Add("url", "NewGamesPlatform.aspx");

    }

    protected void Add_To_Wishlist(object sender, EventArgs e)
    {

        Response.Redirect("~/Home.aspx");
    }

    protected void GetPlatform(object sender, EventArgs e)
    {
        // price_label.Text = "";
       // String s = platform.DataValueField;
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
            //  Response.Redirect("~/Wishlist.aspx?gid=" + (string)e.CommandArgument);
            if (Session["userid"] != null)
                wish.Add_To_Wishlist(Convert.ToInt16(Session["userid"]), Convert.ToInt16((string)e.CommandArgument));
            else
                Response.Redirect("~/Login.aspx");

        }

    }
    protected void price_list_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "cart")
        {

            if (Session["userid"] != null)
                cart.Add_To_Cart(Convert.ToInt16(Session["userid"]), Convert.ToInt16((string)e.CommandArgument));
            else
                Response.Redirect("~/Login.aspx");


            Response.Redirect("~/Cart.aspx");
        }
    }
}