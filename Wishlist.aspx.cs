using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Wishlist : System.Web.UI.Page
{
    DeleteWishlist dw;
    bool isWishlistEmpty;
    SqlConnection c1;
    MyConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
            Response.Redirect("~/Login.aspx");

        Session.Add("url","Wishlist.aspx");
        dw = new DeleteWishlist();

        string userstr = "SELECT * from wishlist where userid = "+ Convert.ToInt16(Session["userid"]);

        con = new MyConnection();
        c1 = con.GetConnection();
        SqlCommand cmd = new SqlCommand(userstr, c1);
        c1.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {

            isWishlistEmpty = false;

       

        }
        else
        {
            isWishlistEmpty = true;
        }




        c1.Close();


    }


    protected void btn_empty_Click(object sender, EventArgs e)
    {
        if (!isWishlistEmpty)
        {
            dw.DeleteAllItems(Convert.ToInt16(Session["userid"]));
            Response.Redirect("~/Wishlist.aspx");
        }
        else
        {
            WishListEmpty.Visible = true;
        }
    }
    protected void ddl_list_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "wid")
        {
            dw.DeleteItem(Convert.ToInt16(Session["userid"]), Convert.ToInt16(e.CommandArgument));
            Response.Redirect("~/Wishlist.aspx");
        }
    }
    protected void btn_continue_Click(object sender, EventArgs e)
    {
        Response.Redirect((String)Session["url"]);

    }
}