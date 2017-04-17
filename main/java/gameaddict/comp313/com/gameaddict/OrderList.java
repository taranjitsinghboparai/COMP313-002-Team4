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

public class OrderList extends Activity implements OnClickListener {

    ImageButton game1,game2,game3,game4,game5,game6,game7,game8,game9,game10,btnCheck;
    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order_list);

        game1 = (ImageButton)findViewById(R.id.game1);
        game2 = (ImageButton)findViewById(R.id.game2);
        game3 = (ImageButton)findViewById(R.id.game3);
        game4 = (ImageButton)findViewById(R.id.game4);
        game5 = (ImageButton)findViewById(R.id.game5);
        game6 = (ImageButton)findViewById(R.id.game6);
        game7 = (ImageButton)findViewById(R.id.game7);
        game8 = (ImageButton)findViewById(R.id.game8);
        game9 = (ImageButton)findViewById(R.id.game9);
        game10 = (ImageButton)findViewById(R.id.game10);
        btnCheck = (ImageButton)findViewById(R.id.btnCheck);

        game1.setOnClickListener(this);
        game2.setOnClickListener(this);
        game3.setOnClickListener(this);
        game4.setOnClickListener(this);
        game5.setOnClickListener(this);
        game6.setOnClickListener(this);
        game7.setOnClickListener(this);
        game8.setOnClickListener(this);
        game9.setOnClickListener(this);
        game10.setOnClickListener(this);
        btnCheck.setOnClickListener(this);
        db=openOrCreateDatabase("customerDB", Context.MODE_PRIVATE, null);
        db.execSQL("CREATE TABLE IF NOT EXISTS customer(cusID VARCHAR,cusOrder VARCHAR);");
    }

    @Override
    public void onClick(View view) {
        if(view==game1)
        {
            db.execSQL("INSERT INTO customer VALUES('1','Fallout 3 (PC) - $90');");
            showMessage("Success", "Fallout 3 (PC) is Added to Cart");
        }
        if(view==game2)
        {
            db.execSQL("INSERT INTO customer VALUES('2','Fifa 16 (PS4) - $45');");
            showMessage("Success", "Fifa 16 (PS4) is Added to Cart");
        }
        if(view==game3)
        {
            db.execSQL("INSERT INTO customer VALUES('3','WWE 2K16 (PS4) - $35');");
            showMessage("Success", "WWE 2K16 (PS4) is Added to Cart");
        }
        if(view==game4)
        {
            db.execSQL("INSERT INTO customer VALUES('4','NHL 16 (xBox) - $50');");
            showMessage("Success", "NHL 16 (xBox) is Added to Cart");
        }
        if(view==game5)
        {
            db.execSQL("INSERT INTO customer VALUES('5','NBA 2K16 (PS4) - $65');");
            showMessage("Success", "NBA 2K16 (PS4) is Added to Cart");
        }
        if(view==game6)
        {
            db.execSQL("INSERT INTO customer VALUES('6','Call of Duty: Black Ops (PS4) - $75');");
            showMessage("Success", "Call of Duty: Black Ops (PS4) is Added to Cart");
        }
        if(view==game7)
        {
            db.execSQL("INSERT INTO customer VALUES('7','PES 2017 (PS3) - $50');");
            showMessage("Success", "PES 2017 (PS3) is Added to Cart");
        }
        if(view==game8)
        {
            db.execSQL("INSERT INTO customer VALUES('8','NFS: Rivals (PS3) - $45');");
            showMessage("Success", "NFS: Rivals (PS3) is Added to Cart");
        }
        if(view==game9)
        {
            db.execSQL("INSERT INTO customer VALUES('9','Mortal Kombat X (PC) - $35');");
            showMessage("Success", "Mortal Kombat X (PC) is added");
        }
        if(view==game10)
        {
            db.execSQL("INSERT INTO customer VALUES('10','Dragon Age 3 (PS3) - $40');");
            showMessage("Success", "Dragon Age 3 (PS3) is Added to Cart");
        }
        switch (view.getId())
        {
            case R.id.btnCheck:
                startActivity(new Intent(this, Order.class));
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
    public void Fallout(View view) {
        Intent FalloutDetails = new Intent(this, Fallout.class);
        startActivity(FalloutDetails);
    }
}
