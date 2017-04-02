using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class Cart : System.Web.UI.Page
{
    protected float total_price;
    protected float price;
    protected bool isCartEmpty;
    protected DeleteCart cart;

    protected void Page_Load(object sender, EventArgs e)
    {
      //  g_id = Convert.ToInt16(Request.QueryString["pid"]);
      //  Session.Add("g_id",g_id);
        total_price = 0;
        price = 0;
        isCartEmpty = false;
        CartEmpty.Visible = false;

        if (Session["userid"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
      //  Session.Remove("Page");
        //Session.Remove("pageadder");
        Session.Remove("platform");

        CalculatePrice();
        cart = new DeleteCart();
        Session.Add("url", "Cart.aspx");

    }

    protected void CalculatePrice()
    {

        MyConnection con = new MyConnection();

        SqlConnection c1 = con.GetConnection();

        string userstr = "SELECT Cart.CartID, Cart.Quantity, Game.GameID, Game.Name, Game.Details, Game.Image, GamePlatform.DVDPrice, Platform.Name AS Expr1 FROM Cart INNER JOIN GamePlatform ON GamePlatform.GamePlatformID = Cart.GamePlatformID INNER JOIN Platform ON Platform.PlatformID = GamePlatform.PlatformID INNER JOIN Game ON GamePlatform.GameID = Game.GameID WHERE (Cart.UserID = "+ Convert.ToInt16(Session["userid"]) +")";

        int quantity = 0;
        int price = 0;

        SqlCommand cmd = new SqlCommand(userstr, c1);
        c1.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows) {

            isCartEmpty = false;

            while (reader.Read())
            {
                quantity = reader.GetInt32(1);
                price = reader.GetInt32(6);

                total_price = total_price + ( quantity * price );
            }

        }else{
            isCartEmpty = true;
        }
        



        c1.Close();


        div_totalPrice.InnerText = "Total: $"+total_price;

    }

    protected void btn_checkout_Click(object sender, EventArgs e)
    {
        Session.Add("cart","add");
        if (isCartEmpty)
        {
            //Response.Redirect("~/Cart.aspx");
            CartEmpty.Visible = true;
         }
        else
            Response.Redirect("~/Checkout.aspx");
    }
  

    protected void ddl1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "cartid")
        {
            cart.DeleteItem(Convert.ToInt16(Session["userid"]), Convert.ToInt16(e.CommandArgument));
            Response.Redirect("~/Cart.aspx");
        }
        
    }
    protected void btn_empty_Click(object sender, EventArgs e)
    {
        if (!isCartEmpty)
        {
            cart.DeleteAllItems(Convert.ToInt16(Session["userid"]));
            Response.Redirect("~/Cart.aspx");
        }
        else
        {
            CartEmpty.Visible = true;
        }
    }
    protected void btn_continue_Click(object sender, EventArgs e)
    {
        Response.Redirect((String)Session["url"]);
    }
}