using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TopGamesPlatform : System.Web.UI.Page
{
    protected String platform;
    protected AddCart cart;
    protected AddWishlist wish;

    protected void Page_Load(object sender, EventArgs e)
    {
        platform = Request.QueryString["pid"];

        
       /* if (platform == "ALL")
        {
            Session.Remove("platform");
            if(Session["page"] != null)
                    Response.Redirect(Session["Page"]+".aspx");
            else
                Response.Redirect("AllGames.aspx");
            
        }
        else
        {
            Session.Add("platform", platform);
        }*/
        if (platform == "ALL")
            Response.Redirect("TopGames.aspx");

        Session.Remove("Page");
            Session.Add("pageadder","TopGames");

            Session.Add("url", "TopGamesPlatform.aspx" + Request.QueryString["pid"]);
        cart = new AddCart();
        wish = new AddWishlist();
    }

    protected void GamesPlatform_ItemCommand(object source, RepeaterCommandEventArgs e)
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