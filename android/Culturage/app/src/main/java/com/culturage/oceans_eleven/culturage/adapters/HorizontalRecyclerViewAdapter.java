package com.culturage.oceans_eleven.culturage.adapters;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;

import java.util.ArrayList;

public class HorizontalRecyclerViewAdapter extends RecyclerView.Adapter<HorizontalRecyclerViewAdapter.ViewHolder> {
    public static ArrayList<HeritageItem> recommendations;

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

        public void add(int position, HeritageItem item) {
            recommendations.add(position, item);
            notifyItemInserted(position);
        }

        public void remove(int position) {
            recommendations.remove(position);
            notifyItemRemoved(position);
        }
    }

    // Provide a suitable constructor (depends on the kind of dataset)
    public HorizontalRecyclerViewAdapter(ArrayList<HeritageItem> recommendations) {
        this.recommendations = recommendations;
    }

    // Create new views (invoked by the layout manager)
    @Override
    public HorizontalRecyclerViewAdapter.ViewHolder onCreateViewHolder(ViewGroup parent,
                                                                       int viewType) {
        LayoutInflater inflater = LayoutInflater.from(
                parent.getContext());
        View v =
                inflater.inflate(R.layout.horizontal_list_item, parent, false);
        // set the view's size, margins, paddings and layout parameters
        ViewHolder vh = new ViewHolder(v);
        return vh;
    }

    // Replace the contents of a view (invoked by the layout manager)
    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        // - get element from your dataset at this position
        // - replace the contents of the view with that element
        holder.mTitle.setText("Title will go here");
        holder.mImage.setImageResource(R.drawable.sample_3);

    }

    // Return the size of your dataset (invoked by the layout manager)
    @Override
    public int getItemCount() {
        return recommendations.size();
    }
}
