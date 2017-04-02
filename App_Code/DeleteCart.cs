using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DeleteCart
/// </summary>
public class DeleteCart
{
    MyConnection con1, con2, con3, con4;
    SqlConnection c1, c2, c3, c4;

	public DeleteCart()
	{
		//
		// TODO: Add constructor logic here
		//
        con1 = new MyConnection();
        con2 = new MyConnection();
        con3 = new MyConnection();
        con4 = new MyConnection();
	}

    public void DeleteItem(int u_id, int c_id)
    {
        c1 = con1.GetConnection();

        string str = "Delete from cart where userid = "+ u_id +" and cartid = " + c_id;

        SqlCommand cmd = new SqlCommand(str, c1);
        c1.Open();
        cmd.ExecuteNonQuery();

        c1.Close();
    }

    public void DeleteAllItems(int u_id)
    {
        c1 = con1.GetConnection();

        string str = "Delete from cart where userid = " + u_id;

        SqlCommand cmd = new SqlCommand(str, c1);
        c1.Open();
        cmd.ExecuteNonQuery();

        c1.Close();
    }
}