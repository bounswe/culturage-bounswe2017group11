package com.culturage.oceans_eleven.culturage.adapters;

import android.app.Activity;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class HorizontalRecyclerViewAdapter extends RecyclerView.Adapter<HorizontalRecyclerViewAdapter.ViewHolder> {
    private static ArrayList<HeritageItem> recommendations;
    private Activity context;

    class ViewHolder extends RecyclerView.ViewHolder {
        private TextView mTitle;
        private ImageView mImage;
//        private View frame;

        private ViewHolder(View v) {
            super(v);
//            frame = v;
            mTitle = (TextView) v.findViewById(R.id.recommendation_title);
            mImage = (ImageView) v.findViewById(R.id.recommendation_image);
        }
    }

    public HorizontalRecyclerViewAdapter(Activity context, ArrayList<HeritageItem> _recommendations) {
        recommendations = _recommendations;
        this.context = context;
    }

    @Override
    public HorizontalRecyclerViewAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View v = inflater.inflate(R.layout.horizontal_list_item, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        HeritageItem item = recommendations.get(position);
        Picasso.with(context).load(item.getmImageUrl()).resize(144, 0).into(holder.mImage);
        holder.mTitle.setText(item.getmTitle());
    }

    @Override
    public int getItemCount() {
        return recommendations.size();
    }

    public void addAll(ArrayList<HeritageItem> item) {
        recommendations.addAll(item);
    }

    public void clear() {
        recommendations.clear();
    }

}
