using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for RegisterUser
/// </summary>
public class RegisterUser
{

    MyConnection con1, con2, con3, con4;
    protected bool Exist;
    SqlConnection c1, c2, c3, c4;
    private int id;

	public RegisterUser()
	{
		//
		// TODO: Add constructor logic here
		//
        //
        con1 = new MyConnection();
        con2 = new MyConnection();
        con3 = new MyConnection();
        id = 0;
        con4 = new MyConnection();
	}

    public bool AddUser(string name, string email, string password)
    {


        try { 


        c1 = con1.GetConnection();

        string str = "insert into [User] (name, email, password, isactive, isadmin) values ('" + name + "', '" + email + "', '" + password + "', 1, 0); SELECT NEWID = SCOPE_IDENTITY()";


        SqlCommand cmd = new SqlCommand(str, c1);
        c1.Open();
        var id =  cmd.ExecuteScalar();
        SetID(Convert.ToInt32(id));
        System.Diagnostics.Debug.WriteLine(id);
        c1.Close();


        c2 = con1.GetConnection();

        string str1 = "insert into [UserDetails] (userid) values ( "+ GetID() +" )";


        SqlCommand cmd1 = new SqlCommand(str1, c2);
        c2.Open();
        cmd1.ExecuteNonQuery();
        c2.Close();
        }
        catch (SqlException e)
        {
            return false;
        }

        return true;

    }

    public int GetID()
    {
        return id;
    }

    private void SetID(int id)
    {
        this.id = id;
    }



}