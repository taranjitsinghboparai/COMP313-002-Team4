using System;
using System.Data.SqlClient;
/// <summary>
/// Summary description for Connection
/// </summary>
/// 
    public class MyConnection
    {
        protected SqlConnection conn;
	    public MyConnection()
	    {       
        }
	 
        public SqlConnection GetConnection()
        { 
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["GameAddictConnectionString"].ToString());
            return con;
        }

    }
