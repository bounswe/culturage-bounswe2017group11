package com.culturage.oceans_eleven.culturage.newsFeed;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;

import java.util.ArrayList;


public class HeritageItemAdapter extends ArrayAdapter {


    public HeritageItemAdapter(Activity context, ArrayList<HeritageItem> items) {
        super(context, 0, items);
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        // Check if the existing view is being reused, otherwise inflate the view
        View listItemView = convertView;
        if (listItemView == null) {
            listItemView = LayoutInflater.from(getContext()).inflate(
                    R.layout.list_item_news_feed, parent, false);
        }

        HeritageItem currentItem = (HeritageItem) getItem(position);

        TextView titleView = (TextView) listItemView.findViewById(R.id.title);
        titleView.setText(currentItem.getmTitle());

        TextView descriptionView = (TextView) listItemView.findViewById(R.id.description);
        descriptionView.setText(currentItem.getmDescription());

        ImageView imageView = (ImageView) listItemView.findViewById(R.id.image);
        imageView.setImageResource(currentItem.getmResourceId());

        Button commentBtn = (Button) listItemView.findViewById(R.id.comment_btn);
        commentBtn.setText(currentItem.getmCommentCount() + "");
        Button likeBtn = (Button) listItemView.findViewById(R.id.like_btn);
        likeBtn.setText(currentItem.getmLikeCount() + "");
        return listItemView;
    }


}
