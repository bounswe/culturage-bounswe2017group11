package com.culturage.oceans_eleven.culturage.adapters;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageButton;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.Comment;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class CommentAdapter extends ArrayAdapter {

    private final static String LOG_TAG = "commentAdapter";

    public CommentAdapter(Activity context, ArrayList<Comment> comments) {
        super(context, 0, comments);
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        // Check if the existing view is being reused, otherwise inflate the view
        Log.v("adapter", "view rendering");
        View listItemView = convertView;
        if (listItemView == null) {
            listItemView = LayoutInflater.from(getContext()).inflate(
                    R.layout.comment_item, parent, false);
        }
        Comment currentComment = (Comment) getItem(position);

        TextView usernameView = (TextView) listItemView.findViewById(R.id.commentOwner);
        Log.v(LOG_TAG, usernameView.toString());
        usernameView.setText(currentComment.getUsername());

        final TextView contentView = (TextView) listItemView.findViewById(R.id.commentContent);
        contentView.setText(currentComment.getContent());

        ImageButton userImage = (ImageButton) listItemView.findViewById(R.id.user_image);

        contentView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (contentView.getMaxLines() == 3) {
                    contentView.setMaxLines(Integer.MAX_VALUE);
                } else {
                    contentView.setMaxLines(3);
                }
            }
        });

//        imageView.setImageResource(R.drawable.sample_0);
        String imageUri = currentComment.getImageUri();
        // 400 looks cool
        Picasso.with(this.getContext()).load(imageUri).resize(40, 0).into(userImage);
        Log.v("adapter", "view rendering done");
        return listItemView;
    }


}
