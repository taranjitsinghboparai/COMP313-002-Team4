using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


/// <summary>
/// Summary description for AddOrders
/// </summary>
public class AddOrders
{

    MyConnection con1, con2, con3, con4;
    SqlConnection c1, c2, c3, c4;
    List<int> c_id, gp_id, quantity, price;
    int q, p;

	public AddOrders()
	{
        con1 = new MyConnection();
        con2 = new MyConnection();
        con3 = new MyConnection();
        con4 = new MyConnection();

        q = 0;
        p = 0;

        c_id = new List<int>();
        gp_id = new List<int>();
        quantity = new List<int>();
        price = new List<int>();

    }

    public bool AddInOrders(string address, string city, string state, string zipcode, string phone){

        int u_id = Convert.ToInt16(HttpContext.Current.Session["userid"].ToString());

        c2 = con2.GetConnection();
        string getCart = "Select [Cart].cartid, [Cart].gameplatformid, [Cart].quantity, [GamePlatform].DVDPrice from [cart] JOIN [GamePlatform] ON [GamePlatform].GamePlatformID = [Cart].GamePlatformID where userid = " + u_id;

//        System.Diagnostics.Debug.WriteLine(u_id);

     //   int cart_id;
      //  string str = "  insert into cart (UserID, GamePlatformID, ISACTIVE, quantity) values (" + u_id + ",+" + g_id + ",1, 1)";

        SqlCommand cmd1 = new SqlCommand(getCart, c2);
        c2.Open();
        SqlDataReader reader = cmd1.ExecuteReader();
        int length = 0;
            
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                //UpdateCartQuantity(Convert.ToInt16(reader.GetInt32(0)));
                c_id.Add(Convert.ToInt16(reader.GetInt32(0)));
                gp_id.Add(Convert.ToInt16(reader.GetInt32(1)));
                //System.Diagnostics.Debug.WriteLine();
                q = Convert.ToInt16(reader.GetInt32(2));
                quantity.Add(q);
                p = Convert.ToInt16(reader.GetInt32(3));
                p = p * q;
                price.Add(p);
                length ++;
               // System.Diagnostics.Debug.WriteLine(p);
            }

            c2.Close();

        
            for ( int i=0; i < length; i++)
            {

                c1 = con1.GetConnection();

                string str1 = "  insert into orders (UserID, GamePlatformID, address, city, state, zipcode, telephone, quantity, price) values (" + u_id +", " + gp_id[i] + ", '"+ address +"', '"+city +"', '"+ state +"', '"+zipcode +"', '"+ phone +"', "+ quantity[i] +"," + price[i] +")";


                SqlCommand cmd = new SqlCommand(str1, c1);
                c1.Open();
                cmd.ExecuteNonQuery();

                c1.Close();

            }

            for (int i = 0; i < length; i++)
            {

                c3 = con1.GetConnection();

                string str2 = " Delete from Cart where cartid =  "+ c_id[i];

                SqlCommand cmd3 = new SqlCommand(str2, c3);
                c3.Open();
                cmd3.ExecuteNonQuery();

                c3.Close();

            }
          


        }
        else
        {
            return false; 
            //InsertIntoCart(u_id, g_id);
        }





        return true;
    }
}