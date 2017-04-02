using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for AddReview
/// </summary>
/// 

public class AddReview
{

    MyConnection con1, con2, con3, con4;
    protected bool Exist;
    SqlConnection c1, c2, c3, c4;

    public AddReview()
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

    public void AddToReview(int u_id, int g_id, int rating, string review){
        
        c2 = con2.GetConnection();
        string getCart = "Select reviewid from [review] where userid = " + u_id + " and gameid = " + g_id;

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

            string str = "insert into Review (UserID, GameID, review, rating, isActive) values (" + u_id + ",+" + g_id + ", '"+ review +"', " + rating + ", 1)";

            SqlCommand cmd = new SqlCommand(str, c1);
            c1.Open();
            cmd.ExecuteNonQuery();

            c1.Close();
        }
        else
        {

            c1 = con1.GetConnection();

            string str = "update review set review = '"+ review + "', rating = " + rating + " where userid = " + u_id + " and gameid = " + g_id;

            SqlCommand cmd = new SqlCommand(str, c1);
            c1.Open();
            cmd.ExecuteNonQuery();

            c1.Close();
            
        }


        UpdateGames(g_id);

    }

    public void DeleteReview(int u_id, int g_id)
    {

        c1 = con1.GetConnection();

        string str = "Delete From Review where userid = " + u_id + " and gameid = " + g_id;

        SqlCommand cmd = new SqlCommand(str, c1);
        c1.Open();
        cmd.ExecuteNonQuery();

        c1.Close();

        UpdateGames(g_id);
    }

    private void UpdateGames(int g_id)
    {
        c2 = con2.GetConnection();
        string getCart = "Select AVG(Rating), Count(Rating) from  [Review] where gameid = " + g_id;

        SqlCommand cmd1 = new SqlCommand(getCart, c2);
        c2.Open();
        SqlDataReader reader = cmd1.ExecuteReader();

        int avg_rating = 0;
        int comments = 0;


        if (reader.HasRows)
        {
            while (reader.Read())
            {
                comments = Convert.ToInt32(reader.GetInt32(1));
                if(comments > 0)
                    avg_rating = Convert.ToInt32(reader.GetInt32(0));

            }
        }
        c2.Close();

        c1 = con1.GetConnection();

        string str = "update Game set review = " + comments + ", rating = " + avg_rating + " where gameid = " + g_id;

        SqlCommand cmd = new SqlCommand(str, c1);
        c1.Open();
        cmd.ExecuteNonQuery();

        c1.Close();

    }

}