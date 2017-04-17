package gameaddict.comp313.com.gameaddict;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;

public class Order extends Activity implements OnClickListener
{
    EditText custID;
    ImageButton btnDelete,btnView,btnViewAll,btnLogout;
    SQLiteDatabase db;

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_third_screen);
        custID=(EditText)findViewById(R.id.editID);
        btnDelete=(ImageButton)findViewById(R.id.btnDelete);
        btnView=(ImageButton)findViewById(R.id.btnView);
        btnViewAll=(ImageButton)findViewById(R.id.btnViewAll);
        btnLogout=(ImageButton)findViewById(R.id.btnLogout);
        btnDelete.setOnClickListener(this);
        btnView.setOnClickListener(this);
        btnViewAll.setOnClickListener(this);
        btnLogout.setOnClickListener(this);
        db=openOrCreateDatabase("customerDB", Context.MODE_PRIVATE, null);
        db.execSQL("CREATE TABLE IF NOT EXISTS customer(cusID VARCHAR,cusOrder VARCHAR);");
    }
    public void onClick(View view)
    {
        if(view==btnDelete)
        {
            if(custID.getText().toString().trim().length()==0)
            {
                showMessage("Error", "Please enter Order ID");
                return;
            }
            Cursor c=db.rawQuery("SELECT * FROM customer WHERE cusID='"+custID.getText()+"'", null);
            if(c.moveToFirst())
            {
                db.execSQL("DELETE FROM customer WHERE cusID='"+custID.getText()+"'");
                showMessage("Success", "Order Deleted");
            }
            else
            {
                showMessage("Error", "Invalid Order ID");
            }
            clearText();
        }
        if(view==btnView)
        {
            if(custID.getText().toString().trim().length()==0)
            {
                showMessage("Error", "Please enter Order ID");
                return;
            }
            Cursor c=db.rawQuery("SELECT * FROM customer WHERE cusID='"+custID.getText()+"'", null);
            if(c.moveToFirst())
            {
                StringBuffer buffer=new StringBuffer();
                buffer.append("ID: "+c.getString(0)+"\n");
                buffer.append("Order: "+c.getString(1)+"\n\n");

                showMessage("Order Details", buffer.toString());
            }
            else
            {
                showMessage("Error", "Invalid Order ID");
                clearText();
            }
        }
        if(view==btnViewAll)
        {
            Cursor c=db.rawQuery("SELECT * FROM customer", null);
            if(c.getCount()==0)
            {
                showMessage("Error", "No Orders found");
                return;
            }
            StringBuffer buffer=new StringBuffer();
            while(c.moveToNext())
            {
                buffer.append("ID: "+c.getString(0)+"\n");
                buffer.append("Order: "+c.getString(1)+"\n\n");
            }
            showMessage("Orders", buffer.toString());
        }
        if(view==btnLogout){
            Intent intent = new Intent(this, FirstScreen.class);
            startActivity(intent);
        }
    }
    public void showMessage(String title,String message)
    {
        Builder builder=new Builder(this);
        builder.setCancelable(true);
        builder.setTitle(title);
        builder.setMessage(message);
        builder.show();
    }
    public void clearText()
    {
        custID.setText("");
        custID.requestFocus();
    }
}
