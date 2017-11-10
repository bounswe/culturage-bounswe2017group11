package com.culturage.oceans_eleven.culturage.adapters;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.CustomDialogClass;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;


public class HeritageItemAdapter extends ArrayAdapter {

    private Activity context;
    public HeritageItemAdapter(Activity context, ArrayList<HeritageItem> items) {
        super(context, 0, items);
        this.context = context;
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

//        imageView.setImageResource(R.drawable.sample_0);

        String imageUri = currentItem.getmImageString();
        // 400 looks cool
        Picasso.with(this.getContext()).load(imageUri).resize(400, 0).into(imageView);

        LinearLayout frame = (LinearLayout) listItemView.findViewById(R.id.nf_like_comment_buttons_container);
        LinearLayout commentContainer = (LinearLayout) frame.findViewById(R.id.comment_container);
        commentContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                CustomDialogClass cdd = new CustomDialogClass(context);
                cdd.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                cdd.show();
            }
        });

        LinearLayout likeContainer = (LinearLayout) frame.findViewById(R.id.like_container);
        likeContainer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(context, "Will like soon", Toast.LENGTH_SHORT).show();
            }
        });

        TextView commentCount = (TextView) listItemView.findViewById(R.id.comment_count);
        commentCount.setText(0 + "");
        TextView likeCount = (TextView) listItemView.findViewById(R.id.like_count);
        likeCount.setText(0 + "");

        return listItemView;
    }


}
