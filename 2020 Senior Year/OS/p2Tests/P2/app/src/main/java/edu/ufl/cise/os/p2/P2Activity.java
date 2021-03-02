package edu.ufl.cise.os.p2;

import android.os.Bundle;
import android.text.method.ScrollingMovementMethod;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.app.Activity;

public class P2Activity extends Activity {

    // Used to load the 'native-lib' library on application startup.
    static {
        System.loadLibrary("native-lib");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_p2);

        // Example of a call to a native method
        TextView tv = (TextView) findViewById(R.id.displayBox);
        tv.setText(stringFromJNI());
        tv.setMovementMethod((new ScrollingMovementMethod()));
    }

    public void loadClicked(View view)
    {
        TextView tv = (TextView) findViewById(R.id.displayBox);
        EditText fileButton = (EditText) findViewById(R.id.filenameBox);
        String fileName = fileButton.getText().toString();
        tv.setText(displayfile(fileName));
    }

    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();
    public native String readFile(String filename);
    public native String displayfile(String filename);



}
