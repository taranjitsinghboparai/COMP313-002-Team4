using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class UserProfile : System.Web.UI.Page
{
    MyConnection con1;
    SqlConnection sql;
    string str;
    String province;
    DropDownList DDL_pro;
    UpdateUser upd_user;
    TextBox address, city, zipcode,
          phone,
          email,
          name,
          password,
          pass2;

    DropDownList d;

    protected void Page_Load(object sender, EventArgs e)
    {
        // disable unobtrusive validation

        if (Session["Userid"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }

        Session.Add("url", "UserProfile.aspx");

         address = new TextBox();
         city = new TextBox();
         zipcode = new TextBox();
         phone = new TextBox();
         email = new TextBox();
         name = new TextBox();
         password = new TextBox();
         pass2 = new TextBox();
         d = new DropDownList();


        UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        if (IsPostBack)
        {
            lbl_Message.Text = "";
            lbl_update.Text = "";

        }

        DDL_pro = new DropDownList();
        upd_user = new UpdateUser();

        con1 = new MyConnection();
        sql = con1.GetConnection();
        str = "Select province from UserDetails where UserID = " + Session["userid"];
        SqlCommand cmd2 = new SqlCommand(str, sql);
        sql.Open();
        //SqlDataReader reader = cmd2.ExecuteReader();

        province = Convert.ToString(cmd2.ExecuteScalar()).Trim();
        sql.Close();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {


    }


    protected void ddl1_ItemCommand(object source, DataListCommandEventArgs e)
    {




    }

    protected void ddl1_ItemCreated(object sender, DataListItemEventArgs e)
    {


        DDL_pro = (DropDownList)e.Item.FindControl("Table2").FindControl("DDL_Pro");

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

        province = DDL_pro.SelectedValue;
  
    }



    protected void btn_Update_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }


        for (int j = 0; j < ddl_personal.Controls.Count; j++)
        {
            password = (TextBox)ddl_personal.Items[j].FindControl("Table1").FindControl("txt_pass");
            email = (TextBox)ddl_personal.Items[j].FindControl("Table1").FindControl("txt_Email");

            pass2 = (TextBox)ddl_personal.Items[j].FindControl("Table1").FindControl("txt_repass");
            
            name = (TextBox)ddl_personal.Items[j].FindControl("Table1").FindControl("txt_firstName");
        }
        for (int j = 0; j < ddl1.Controls.Count; j++)
        {

            address = (TextBox)ddl1.Items[j].FindControl("Table2").FindControl("txt_address");
            city = (TextBox)ddl1.Items[j].FindControl("Table2").FindControl("txt_city");
            zipcode = (TextBox)ddl1.Items[j].FindControl("Table2").FindControl("txt_zip");
            phone = (TextBox)ddl1.Items[j].FindControl("Table2").FindControl("txt_phn");
            d = (DropDownList)ddl1.Items[j].FindControl("Table2").FindControl("DDL_Pro");

        }
     /*   System.Diagnostics.Debug.WriteLine(name.Text);
        System.Diagnostics.Debug.WriteLine(email.Text);
        System.Diagnostics.Debug.WriteLine(password.Text);
        System.Diagnostics.Debug.WriteLine(city.Text);
        System.Diagnostics.Debug.WriteLine(zipcode.Text);
        System.Diagnostics.Debug.WriteLine(phone.Text);
        System.Diagnostics.Debug.WriteLine(address.Text);
        */


        upd_user.UpdateUserProfile(Convert.ToInt16(Session["userid"]), address.Text, city.Text, d.SelectedValue, zipcode.Text, phone.Text, email.Text, name.Text);
        lbl_update.ForeColor = System.Drawing.Color.Green;
        lbl_update.Text = " User Details Updated";
        UpdatePassword();

    }

    protected void UpdatePassword()
    {
        String p1 = password.Text.Trim();
        String p2 = pass2.Text.Trim();


        if (p1 == "" && p2 == "") { 
        }
        else if (p1 == "" || p2 == "")
        {
            lbl_Message.ForeColor = System.Drawing.Color.Red;

            // Do Nothing
            lbl_Message.Text = "Password match field is required";
        }
        else
        {
           
            if (p1 == p2) {
                upd_user.UpdatePassword(Convert.ToInt16(Session["userid"]), password.Text.Trim());
                lbl_Message.ForeColor = System.Drawing.Color.Green;
               lbl_Message.Text = "Password Updated";
            }
            else
            {
                lbl_Message.ForeColor = System.Drawing.Color.Red;

                lbl_Message.Text = "Password Must Match";

            }

        }
    }

    protected void DDL_pro_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}