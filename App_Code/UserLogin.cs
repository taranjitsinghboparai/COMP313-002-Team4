using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Login
/// </summary>
public class UserLogin
{

    MyConnection conuser;
    SqlConnection c1;


	public UserLogin()
	{
		//
		// TODO: Add constructor logic here
		//
        conuser = new MyConnection();
	}

    public int GetUserID(String email, String password)
    {
        
        c1 = conuser.GetConnection();

        string userstr = "Select UserID from [User] where email = '"+ email +"' and password = '"+ password +"'";

        int result = 0;
        SqlCommand cmd = new SqlCommand(userstr, c1);
        c1.Open();
        SqlDataReader reader = cmd.ExecuteReader();
           while (reader.Read()) {
               result = reader.GetInt32(0);
             }
        
        c1.Close();
        System.Diagnostics.Debug.WriteLine(result);

        return result;
     }

  
}