package com.culturage.oceans_eleven.culturage.newsFeed;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;

import java.util.ArrayList;

public class CustomDialogClass extends Dialog implements
        android.view.View.OnClickListener {

    public Activity activity;
    public Dialog dialog;

    private final String LOG_TAG = "dialog_tag";
    Button showMore, showComments;
    private static CommentAdapter commentAdapter;
    ListView listView;
    TextView commentContent, commentOwner;

    public CustomDialogClass(Activity activity) {
        super(activity);
        // TODO Auto-generated constructor stub
        this.activity = activity;
    }

    @SuppressLint("ClickableViewAccessibility")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.custom_dialog);
        Rect displayRectangle = new Rect();
        Window window = activity.getWindow();
        window.getDecorView().getWindowVisibleDisplayFrame(displayRectangle);

        ScrollView container = (ScrollView) findViewById(R.id.comment_container);
//        container.getLayoutParams().height = (int)(displayRectangle.height() * 0.9f);
        container.getLayoutParams().width = (int) (displayRectangle.width() * 0.98f);
        container.getLayoutParams().height = (int) (displayRectangle.height() * 0.98f);
        container.requestLayout();

        final ListView lv = (ListView) findViewById(R.id.comment_list);
        lv.getLayoutParams().height = (int) (displayRectangle.width());
        lv.requestLayout();
        lv.setScrollingCacheEnabled(false);
        lv.setOnTouchListener(new View.OnTouchListener() {
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
        Log.v(LOG_TAG, "before adapter init");
        ArrayList<Comment> comments = new ArrayList<Comment>();
        commentAdapter = new CommentAdapter(activity, comments);
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
        lv.setAdapter(commentAdapter);
        for (Comment c : comments) {
            Log.v(LOG_TAG, c.getContent());
        }
//        commentAdapter.clear();
//        if (comments != null || comments.size() > 0) {
//        commentAdapter.addAll(comments);
//        }
//        if (comments.size() > 0) {

//        }
        Log.v(LOG_TAG, "after listener" + comments.size());
    }

    @Override
    public void onClick(View v) {
    }

    public static void setListViewHeightBasedOnChildren(ListView listView) {
        CommentAdapter listAdapter = (CommentAdapter) listView.getAdapter();
        if (listAdapter == null)
            return;

        int desiredWidth = View.MeasureSpec.makeMeasureSpec(listView.getWidth(), View.MeasureSpec.UNSPECIFIED);
        int totalHeight = 0;
        View view = null;
        for (int i = 0; i < listAdapter.getCount(); i++) {
            view = listAdapter.getView(i, view, listView);
            if (i == 0)
                view.setLayoutParams(new ViewGroup.LayoutParams(desiredWidth, ViewGroup.LayoutParams.WRAP_CONTENT));

            view.measure(desiredWidth, View.MeasureSpec.UNSPECIFIED);
            totalHeight += view.getMeasuredHeight();
        }
        ViewGroup.LayoutParams params = listView.getLayoutParams();
        params.height = totalHeight + (listView.getDividerHeight() * (listAdapter.getCount() - 1));
        listView.setLayoutParams(params);
    }
}