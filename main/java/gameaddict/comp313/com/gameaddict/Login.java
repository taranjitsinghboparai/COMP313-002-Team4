package gameaddict.comp313.com.gameaddict;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;


public class Login extends AppCompatActivity implements View.OnClickListener {
    EditText userName,Password;
    ImageButton bLogin;
    DBAdapter dbAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        userName=(EditText)findViewById(R.id.editUsernameLogin);
        Password=(EditText)findViewById(R.id.editPasswordLogin);
        bLogin=(ImageButton)findViewById(R.id.btnLogin1);
        bLogin.setOnClickListener(this);
        userName.requestFocus();
        dbAdapter = new DBAdapter(this);
        dbAdapter.open();

    }
    public void onClick(View view) {
        InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
        imm.hideSoftInputFromWindow(userName.getWindowToken(), 0);
        imm.hideSoftInputFromWindow(Password.getWindowToken(), 0);
        String username = userName.getText().toString();
        String password = Password.getText().toString();
        if (username.length() > 0 && password.length() > 0) {
            try {

                if (dbAdapter.Login(username, password)) {
                    Toast.makeText(Login.this,
                            "Successfully Logged In", Toast.LENGTH_LONG).show();
                    Intent intent = new Intent(this, OrderList.class);
                    startActivity(intent);

                } else {
                    Toast.makeText(Login.this,
                            "Invalid username or password",
                            Toast.LENGTH_LONG).show();
                }

            } catch (Exception e) {
                Toast.makeText(Login.this, "Some problem occurred",
                        Toast.LENGTH_LONG).show();

            }
        } else {
            Toast.makeText(Login.this,
                    "Username or Password is empty", Toast.LENGTH_LONG).show();
        }


        }
    public void Clear(View view) {
        Password.setText("");
        userName.setText("");
        Password.clearFocus();
        userName.setFocusable(true);


    }
    }



