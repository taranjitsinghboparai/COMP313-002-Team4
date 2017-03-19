using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class GameDetails : System.Web.UI.Page
{
    MyConnection con2;
    SqlConnection c2;
    protected bool Exist;
    int g_id, u_id;
    AddReview rev;
    protected int rating;
    protected int game_rating, game_review;
    protected string g_name, g_details;
    protected string image;
    protected AddCart cart;
    protected AddWishlist wish;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
      
            if (Session["User"] == null)
            {
               
                   
                
            }
            else
            {
               
              
                
            }
            cart = new AddCart();
            wish = new AddWishlist();
            
    }

        game_rating = 0;
        game_review = 0;


        con2 = new MyConnection();
        u_id = Convert.ToInt16(Session["userid"]);
        g_id = Convert.ToInt16(Request.QueryString["gid"]);

        GetReview();
        GetGameReview();
        rev = new AddReview();

        if (Exist)
        {
           
        }
        else
        {
            
        }
        Session.Add("url", "Details.aspx?gid="+g_id);

    }

    protected void GetGameReview()
    {

        c2 = con2.GetConnection();
        string getCart = "Select  rating, review, name, details, image from [Game] where gameid = " + g_id;

        SqlCommand cmd1 = new SqlCommand(getCart, c2);
        c2.Open();
        SqlDataReader reader = cmd1.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                game_rating = Convert.ToInt16(reader.GetInt32(0));
                game_review = Convert.ToInt16(reader.GetInt32(1));
                g_name = reader.GetString(2).ToString();
                g_details = reader.GetString(3).ToString();
                image = reader.GetString(4).ToString();
            }
        }
        c2.Close();
    }

    protected void GetReview()
    {

        c2 = con2.GetConnection();
        string getCart = "Select reviewid, rating, review from [review] where userid = " + u_id + " and gameid = " + g_id;

        SqlCommand cmd1 = new SqlCommand(getCart, c2);
        c2.Open();
        SqlDataReader reader = cmd1.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
               rating = Convert.ToInt16(reader.GetInt32(1));
               
            }

            Exist = true;


        }
        else
        {
            Exist = false;
        }

        c2.Close();

    }

    protected void btn_update_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
            add_update_review();
            Response.Redirect("~/Details.aspx?gid="+g_id);
    }


    protected void add_update_review()
    {
        System.Diagnostics.Debug.WriteLine(rating);
    
    }

    protected void delete_review()
    {
        rev.DeleteReview(u_id, g_id);
    }


    protected void btn_delete_Click(object sender, EventArgs e)
    {

        if (Session["userid"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (Exist)
        {
            delete_review();
            Response.Redirect("~/Details.aspx?gid=" + g_id);

        }
        else
        {
        }


    }
    protected void ddl_rating_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        //rating = Convert.ToInt16(ddl_rating.SelectedValue);
    }
 

    protected void btn_wish_Click(object sender, EventArgs e)
    {
        
            //  Response.Redirect("~/Wishlist.aspx?gid=" + (string)e.CommandArgument);
            if (Session["userid"] != null)
                wish.Add_To_Wishlist(Convert.ToInt16(Session["userid"]), g_id);
            else
                Response.Redirect("~/Login.aspx");

        
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