package com.culturage.oceans_eleven.culturage.adapters;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.culturage.oceans_eleven.culturage.newsFeed.HeritageItemViewActivity;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

/**
 * extends RecyclerView.Adapter<RecommendationRecyclerViewAdapter.ViewHolder> for filling the
 * RecyclerView of item based recommendation in item view page
 */
public class RecommendationRecyclerViewAdapter extends RecyclerView.Adapter<RecommendationRecyclerViewAdapter.ViewHolder> {
    private static ArrayList<HeritageItem> recommendations;
    private Activity context;

    /**
     * inner class extends RecyclerView.ViewHolder
     * used as building block for the RecyclerView
     */
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

    /**
     * @param context          the context currently being used
     * @param _recommendations the list of heritage items tib e recommended similar to this item
     */
    public RecommendationRecyclerViewAdapter(Activity context, ArrayList<HeritageItem> _recommendations) {
        recommendations = _recommendations;
        this.context = context;
    }

    @Override
    public RecommendationRecyclerViewAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View v = inflater.inflate(R.layout.recommendation_horizontal_list_item, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        final HeritageItem item = recommendations.get(position);
        Picasso.with(context).load(item.getmImageUrl()).resize(144, 0).into(holder.mImage);
        holder.mTitle.setText(item.getmTitle());
        View.OnClickListener listener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(context, HeritageItemViewActivity.class);
                i.putExtra("postId", item.getmPostId());
                i.putExtra("title", item.getmTitle());
                i.putExtra("description", item.getmDescription());
                i.putExtra("imageUrl", item.getmImageUrl());
                context.startActivity(i);
            }
        };
        holder.mTitle.setOnClickListener(listener);
        holder.mImage.setOnClickListener(listener);
    }

    @Override
    public int getItemCount() {
        return recommendations.size();
    }

    /**
     * neat short hand for adding a list of items to the recommendations
     *
     * @param items list of heritage items tro be added to the recommendations
     */
    public void addAll(ArrayList<HeritageItem> items) {
        recommendations.addAll(items);
    }

    /**
     * short hand for clearing (removing all) the recommendations
     */
    public void clear() {
        recommendations.clear();
    }

}
