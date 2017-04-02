using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Diagnostics;

public partial class Checkout : System.Web.UI.Page
{
    MyConnection con1;
    SqlConnection sql;
    string str;
    DropDownList DDL_pro;
    String province_text;
    TextBox address, city, zip, phone;
    String province;

    AddOrders order;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // disable unobtrusive validation

        if (Session["Userid"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }

        if (Session["cart"] == null)
        {
            Response.Redirect("~/Cart.aspx");

        }

        order = new AddOrders();

        UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        if (!IsPostBack)
        {

        }
        else
        {

        }

        con1 = new MyConnection();
        sql = con1.GetConnection();
        str = "Select province from UserDetails where UserID = "+ Session["userid"];
        SqlCommand cmd2 = new SqlCommand(str, sql);
        sql.Open();
        //SqlDataReader reader = cmd2.ExecuteReader();

         province = Convert.ToString(cmd2.ExecuteScalar()).Trim();
         sql.Close();

         Session.Add("url", "Checkout.aspx");

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
 
       
    }

   
    protected void ddl1_ItemCommand(object source, DataListCommandEventArgs e)
    {



   
    }

    protected void ddl1_ItemCreated(object sender, DataListItemEventArgs e)
    {

        
            DDL_pro = (DropDownList)e.Item.FindControl("Table1").FindControl("DDL_Pro");

//            TextBox province =  e.Item.FindControl("Table1").FindControl("tbx_Province") as TextBox;
               
            ListItem[] li = new ListItem[10];

            for (int i = 0; i < li.Length; i++)
                li[i] = new ListItem();

            li[0].Text = "Quebec";
            li[1].Text = "Ontario";
            li[2].Text = "Nova Scotia";
            li[3].Text = "Manitoba";
            li[4].Text = "British Columbia";
            li[5].Text = "Prince Edward Island";
            li[6].Text = "Saskatchewan";
            li[7].Text = "Alberta";
            li[8].Text = "Newfoundland and Labrador";
            li[9].Text = "Nova Scotia";

            for (int i = 0; i < li.Length; i++)
            {
                DDL_pro.Items.Add(li[i]);

                if (province == li[i].Text)
                {
                    DDL_pro.SelectedValue = province;
                }
            }

            province_text = DDL_pro.SelectedValue;

            address = (TextBox)e.Item.FindControl("Table1").FindControl("txt_address");
            city = (TextBox)e.Item.FindControl("Table1").FindControl("txt_city");
            zip = (TextBox)e.Item.FindControl("Table1").FindControl("txt_zip");
            phone = (TextBox)e.Item.FindControl("Table1").FindControl("txt_phone");


          //  Debug.WriteLine(address.Text);
           // Debug.WriteLine(city.Text);

            //Debug.WriteLine(zip.Text);

            //Debug.WriteLine(phone.Text);
           // Debug.WriteLine(province_text);

                }
    protected void DDL_pro_SelectedIndexChanged(object sender, EventArgs e)
    {
        province_text = DDL_pro.SelectedValue;

    }
    protected void btn_continue_Click(object sender, EventArgs e)
    {
        order.AddInOrders(address.Text, city.Text, province_text, zip.Text, phone.Text);
        //Debug.WriteLine(phone.Text);
        Response.Redirect("~/PlaceOrder.aspx");
    }
}