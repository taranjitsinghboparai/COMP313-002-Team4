using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for AddWishlist
/// </summary>
public class AddWishlist
{
    MyConnection con1, con2, con3, con4;
    protected bool Exist;
    SqlConnection c1, c2, c3, c4;

    public AddWishlist()
    {
        //
        // TODO: Add constructor logic here
        //
        Exist = false;
        con1 = new MyConnection();
        con2 = new MyConnection();
        con3 = new MyConnection();
        con4 = new MyConnection();

    }
    public void Add_To_Wishlist(int u_id, int g_id)
    {



        c2 = con2.GetConnection();
        string getCart = "Select wishlistid from [wishlist] where userid = " + u_id + " and gameid = " + g_id;

        SqlCommand cmd1 = new SqlCommand(getCart, c2);
        c2.Open();
        SqlDataReader reader = cmd1.ExecuteReader();

        if (reader.HasRows)
        {
            /*while (reader.Read())
            {
                break;
            }*/

            Exist = true;

        }
        else
        {
            Exist = false;
        }



        c2.Close();

        if (!Exist) { 

            c1 = con1.GetConnection();

            string str = "  insert into Wishlist (UserID, GameID, listed, isActive) values (" + u_id + ",+" + g_id + ",1, 1)";

            SqlCommand cmd = new SqlCommand(str, c1);
            c1.Open();
            cmd.ExecuteNonQuery();

            c1.Close();
        }

    }
}