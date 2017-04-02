using System;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Cart
/// </summary>

public class AddCart
{
    MyConnection con1, con2, con3, con4;
    SqlConnection c1, c2, c3, c4;

	public AddCart()
	{

        con1 = new MyConnection();
        con2 = new MyConnection();
        con3 = new MyConnection();
        con4 = new MyConnection();
        //
		// TODO: Add constructor logic here
		//

	}

  


    public void Add_To_Cart(int u_id, int g_id)
    {
        c2 = con2.GetConnection();
        string getCart = "Select cartid from [cart] where userid = "+u_id+" and gameplatformid = "+g_id;

        SqlCommand cmd1 = new SqlCommand(getCart, c2);
        c2.Open();
        SqlDataReader reader = cmd1.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                UpdateCartQuantity(Convert.ToInt16(reader.GetInt32(0)));
                break;
            }
        }
        else
        {
            InsertIntoCart(u_id, g_id);
        }
        
        

        c2.Close();
        
    }

    protected void UpdateCartQuantity(int c_id)
    {
        c3 = con3.GetConnection();
        string getQuantity = "Select quantity from [cart] where cartid = " + c_id;

        SqlCommand cmd2 = new SqlCommand(getQuantity, c3);
        c3.Open();
        //SqlDataReader reader = cmd2.ExecuteReader();

        int quantity = Convert.ToInt16(cmd2.ExecuteScalar());
        quantity++;

        c3.Close();

        c4 = con4.GetConnection();
        string updateQuantity = "Update [Cart] Set quantity =" + quantity + " where cartid = " + c_id;

        SqlCommand cmd4 = new SqlCommand(updateQuantity, c4);
        c4.Open();
        //SqlDataReader reader = cmd2.ExecuteReader();

        cmd4.ExecuteNonQuery();

        c4.Close();
    
    
    }

    protected void InsertIntoCart(int u_id, int g_id)
    {
        c1 = con1.GetConnection();

        string str = "  insert into cart (UserID, GamePlatformID, ISACTIVE, quantity) values (" + u_id + "," + g_id + ",1, 1)";


        SqlCommand cmd = new SqlCommand(str, c1);
        c1.Open();
        cmd.ExecuteNonQuery();

        c1.Close();
    }
}