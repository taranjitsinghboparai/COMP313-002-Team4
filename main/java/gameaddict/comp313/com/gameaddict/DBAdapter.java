package gameaddict.comp313.com.gameaddict;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;

public class DBAdapter
{
    public static final String KEY_USERNAME = "username";
    public static final String KEY_PASSWORD = "password";
    public static final String KEY_PHONE = "phone";
    public static final String KEY_ADDRESS = "address";

    SQLiteDatabase mDb;
    Context mCtx;
    DBHelper mDbHelper;

    public DBAdapter(Context context)
    {
        this.mCtx = context;
    }

    public DBAdapter open() throws SQLException
    {
        mDbHelper = new DBHelper(mCtx);
        mDb = mDbHelper.getWritableDatabase();
        return this;
    }

    public void close()
    {
        mDbHelper.close();
    }

    public long register(String user,String pw,String ph, String ad)
    {
        ContentValues initialValues = new ContentValues();
        initialValues.put(KEY_USERNAME, user);
        initialValues.put(KEY_PASSWORD, pw);
        initialValues.put(KEY_PHONE, ph);
        initialValues.put(KEY_ADDRESS, ad);

        return mDb.insert("user", null, initialValues);
    }

    public boolean Login(String username, String password) throws SQLException
    {
        Cursor mCursor = mDb.rawQuery("SELECT * FROM user WHERE username=? AND password=?", new String[]{username,password});
        if (mCursor != null) {
            if(mCursor.getCount() > 0)
            {
                return true;
            }
        }
        return false;
    }
}