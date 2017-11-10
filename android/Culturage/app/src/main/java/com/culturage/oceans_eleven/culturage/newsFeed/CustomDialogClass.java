package com.culturage.oceans_eleven.culturage.newsFeed;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;

import java.util.ArrayList;

public class CustomDialogClass extends Dialog implements
        android.view.View.OnClickListener {

    //    private final String LOG_TAG = "dialog_tag";
    private Activity activity;

    CustomDialogClass(Activity activity) {
        super(activity);
        this.activity = activity;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.custom_dialog);

        Rect displayRectangle = new Rect();
        Window window = activity.getWindow();
        window.getDecorView().getWindowVisibleDisplayFrame(displayRectangle);
    /* Set the size of the dialog */
        ScrollView container = (ScrollView) findViewById(R.id.comment_container);
//        container.getLayoutParams().height = (int)(displayRectangle.height() * 0.9f);
        container.getLayoutParams().width = (int) (displayRectangle.width() * 0.98f);
        container.getLayoutParams().height = (int) (displayRectangle.height() * 0.98f);
        container.requestLayout();
        /* Set the size of the list view */
        final ListView commentLV = (ListView) findViewById(R.id.comment_list);
        commentLV.getLayoutParams().height = displayRectangle.width();
        commentLV.requestLayout();
        /* These lines are to handle scrolling of list view inside the scroll view */
        commentLV.setScrollingCacheEnabled(false);

        commentLV.setOnTouchListener(new View.OnTouchListener() {
            // Setting on Touch Listener for handling the touch inside ScrollView
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                // Disallow the touch request for parent scroll on touch of child view
                v.getParent().requestDisallowInterceptTouchEvent(true);
                return false;
            }

        });

        ImageButton uploadCommentBtn = (ImageButton) findViewById(R.id.upload_comment);
        ImageButton cancelCommentBtn = (ImageButton) findViewById(R.id.cancel_comment);
        ImageButton backBtn = (ImageButton) findViewById(R.id.comment_back);


        uploadCommentBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(activity, "Will comment soon", Toast.LENGTH_SHORT).show();
                dismiss();
            }
        });
        cancelCommentBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dismiss();
            }
        });

        backBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dismiss();
            }
        });

        ArrayList<Comment> comments = new ArrayList<>();
        CommentAdapter commentAdapter = new CommentAdapter(activity, comments);
        comments.add(new Comment("Wow amazing asdasdsadasdsadsadsadadsadad asdsadasd asdasdasd adasdsadsa asdasd sa dasdasd sa ad sadas aasadsasd sdjasdnasd ddjfafad fdg dsfg sdfg nsdf sd fdg dsfg sdf gsdf sdg sfg ", "rza", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
        comments.add(new Comment("Great pic", "someone", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
//        comments.add(new Comment("not that cool", "some other", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
//        comments.add(new Comment("not that cool", "some other", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
        comments.add(new Comment("not that cool", "some other", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
        comments.add(new Comment("not that cool", "some other", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
        comments.add(new Comment("not that cool", "some other", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
        comments.add(new Comment("not that cool", "some other", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
        comments.add(new Comment("not that cool", "some other", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
        comments.add(new Comment("not that cool", "some other", "http://www.warmanchamber.com/wp-content/uploads/2016/10/person-placeholder-image-3.jpg"));
//        listView = (ListView) findViewById(R.id.comment_list);
        commentLV.setAdapter(commentAdapter);
    }

    @Override
    public void onClick(View v) {
    }
}