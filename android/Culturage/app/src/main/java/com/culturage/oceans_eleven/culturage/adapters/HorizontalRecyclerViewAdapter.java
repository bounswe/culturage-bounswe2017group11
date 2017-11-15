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

    // Provide a reference to the views for each data item
    // Complex data items may need more than one view per item, and
    // you provide access to all the views for a data item in a view holder
    public class ViewHolder extends RecyclerView.ViewHolder {
        // each data item is just a string in this case
        private TextView mTitle;
        private ImageView mImage;
        private View frame;

        private ViewHolder(View v) {
            super(v);
            frame = v;
            mTitle = (TextView) v.findViewById(R.id.recommendation_title);
            mImage = (ImageView) v.findViewById(R.id.recommendation_image);
        }


    }

    // Provide a suitable constructor (depends on the kind of dataset)
    public HorizontalRecyclerViewAdapter(Activity context, ArrayList<HeritageItem> _recommendations) {
        recommendations = _recommendations;
        this.context = context;
    }

    // Create new views (invoked by the layout manager)
    @Override
    public HorizontalRecyclerViewAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View v = inflater.inflate(R.layout.horizontal_list_item, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        HeritageItem item = recommendations.get(position);
        Picasso.with(context).load(item.getmImageUrl()).resize(144, 144).into(holder.mImage);
        holder.mTitle.setText(item.getmTitle());
    }

    // Return the size of your dataset (invoked by the layout manager)
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

    public void add(int position, HeritageItem item) {
        recommendations.add(position, item);
        notifyItemInserted(position);
    }

    public void remove(int position) {
        recommendations.remove(position);
        notifyItemRemoved(position);
    }
}
