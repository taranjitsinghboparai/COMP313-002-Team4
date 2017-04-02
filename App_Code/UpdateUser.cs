using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UpdateUser
/// </summary>
public class UpdateUser
{
    MyConnection con1, con2, con3, con4;
    protected bool Exist;
    SqlConnection c1, c2, c3, c4;

	public UpdateUser()
	{
		//
		// TODO: Add constructor logic here
		//
        con1 = new MyConnection();
        con2 = new MyConnection();
        con3 = new MyConnection();
        con4 = new MyConnection();
	}


    public void UpdateUserProfile(int u_id, string address, string city, string state, string zipcode, string telephone, string email, string name){
        c1 = con1.GetConnection();

        string str = "update userdetails set address = '" + address + "', city = '" + city + "', province = '" + state + "', postalcode = '" + zipcode + "' , phone = '" + telephone + "' where userid = " + u_id;

        SqlCommand cmd = new SqlCommand(str, c1);
        c1.Open();
        cmd.ExecuteNonQuery();

        c1.Close();


        c2 = con1.GetConnection();

        string str1 = "update [user] set name = '" + name + "', email = '" + email + "' where userid = " + u_id;

        SqlCommand cmd1 = new SqlCommand(str1, c2);
        c2.Open();
        cmd1.ExecuteNonQuery();

        c2.Close();
    }


    public void UpdatePassword(int u_id, string password)
    {
        c2 = con1.GetConnection();

        string str1 = "update [user] set password = '" + password + "' where userid = " + u_id;
        
        SqlCommand cmd1 = new SqlCommand(str1, c2);
        c2.Open();
        cmd1.ExecuteNonQuery();

        c2.Close();
    }




}