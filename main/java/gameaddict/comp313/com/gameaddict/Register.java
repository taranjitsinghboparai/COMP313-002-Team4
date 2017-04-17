package gameaddict.comp313.com.gameaddict;

import android.content.Context;
import android.content.Intent;
import android.database.SQLException;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;

public class Register extends AppCompatActivity implements View.OnClickListener {
    EditText ReguserName,RegPassword,Phone,Address;
    ImageButton btnRegister;
    DBAdapter dbAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        ReguserName=(EditText)findViewById(R.id.editUsername);
        RegPassword=(EditText)findViewById(R.id.editPassword);
        Phone=(EditText)findViewById(R.id.editPhone);
        Address=(EditText)findViewById(R.id.editAddress);
        btnRegister=(ImageButton)findViewById(R.id.btnRegister);
        btnRegister.setOnClickListener(this);
        ReguserName.requestFocus();
        dbAdapter = new DBAdapter(this);
        dbAdapter.open();

    }
    public void onClick(View view) {
        InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
        imm.hideSoftInputFromWindow(ReguserName.getWindowToken(), 0);
        imm.hideSoftInputFromWindow(RegPassword.getWindowToken(), 0);
        imm.hideSoftInputFromWindow(Phone.getWindowToken(), 0);
        imm.hideSoftInputFromWindow(Address.getWindowToken(), 0);
        try {

            String username = ReguserName.getText().toString();
            String password = RegPassword.getText().toString();
            String phone = Phone.getText().toString();
            String address = Address.getText().toString();
            long i = dbAdapter.register(username, password,phone,address);
            if(i != -1)
                Toast.makeText(Register.this, "User Register. Please Login",Toast.LENGTH_LONG).show();
            Intent intent = new Intent(this, Login.class);
            startActivity(intent);

        } catch (SQLException e) {
            Toast.makeText(Register.this, "Not Registered.",
                    Toast.LENGTH_LONG).show();


        }

    }
    public void RegClear(View view){
        ReguserName.setText("");
        RegPassword.setText("");
        Phone.setText("");
        Address.setText("");
        RegPassword.clearFocus();
        Phone.clearFocus();
        Address.clearFocus();
        ReguserName.setFocusable(true);

    }

}
