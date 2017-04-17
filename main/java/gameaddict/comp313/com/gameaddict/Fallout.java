package gameaddict.comp313.com.gameaddict;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageSwitcher;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ViewSwitcher;

public class Fallout extends AppCompatActivity {
    private ImageSwitcher simpleImageSwitcher;
    Button btnNext;

    // Array of Image IDs to Show In ImageSwitcher
    int imageIds[] = {R.drawable.game1play1, R.drawable.game1play2, R.drawable.game1play3, R.drawable.game1play4, R.drawable.game1play5};
    int count = imageIds.length;
    // to keep current Index of ImageID array
    int currentIndex = 0;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fallout);
        // get The references of Button and ImageSwitcher
        btnNext = (Button) findViewById(R.id.buttonNext);
        simpleImageSwitcher = (ImageSwitcher) findViewById(R.id.simpleImageSwitcher);
        // Set the ViewFactory of the ImageSwitcher that will create ImageView object when asked
        simpleImageSwitcher.setFactory(new ViewSwitcher.ViewFactory() {

            public View makeView() {
                // TODO Auto-generated method stub

                // Create a new ImageView and set it's properties
                ImageView imageView = new ImageView(getApplicationContext());
                // set Scale type of ImageView to Fit Center
                imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
                // set the Height And Width of ImageView To FIll PARENT
                imageView.setLayoutParams(new ImageSwitcher.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT, LinearLayout.LayoutParams.FILL_PARENT));
                return imageView;

            }
        });

        // Declare in and out animations and load them using AnimationUtils class
        Animation in = AnimationUtils.loadAnimation(this, android.R.anim.slide_in_left);
        Animation out = AnimationUtils.loadAnimation(this, android.R.anim.slide_out_right);

        // set the animation type to ImageSwitcher
        simpleImageSwitcher.setInAnimation(in);
        simpleImageSwitcher.setOutAnimation(out);
        simpleImageSwitcher.setImageResource(imageIds[currentIndex]);


        // ClickListener for NEXT button
        // When clicked on Button ImageSwitcher will switch between Images
        // The current Image will go OUT and next Image  will come in with specified animation
        btnNext.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                // TODO Auto-generated method stub
                currentIndex++;
                //  Check If index reaches maximum then reset it
                if (currentIndex == count)
                    currentIndex = 0;
                simpleImageSwitcher.setImageResource(imageIds[currentIndex]); // set the image in ImageSwitcher
            }
        });

    }

}