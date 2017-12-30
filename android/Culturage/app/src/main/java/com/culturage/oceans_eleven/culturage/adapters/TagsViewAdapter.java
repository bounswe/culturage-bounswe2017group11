package com.culturage.oceans_eleven.culturage.adapters;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.Tag;
import com.culturage.oceans_eleven.culturage.newsFeed.HeritageItemViewActivity;
import com.culturage.oceans_eleven.culturage.newsFeed.SearchActivity;

import java.util.ArrayList;

public class TagsViewAdapter extends RecyclerView.Adapter<TagsViewAdapter.ViewHolder> {

    /**
     * Tag for the log messages
     */
    private static final String LOG_TAG = TagsViewAdapter.class.getSimpleName();


    private static ArrayList<Tag> tags;
    private Activity context;


    /**
     * inner class extends RecyclerView.ViewHolder
     * used as building block for the RecyclerView
     */
    class ViewHolder extends RecyclerView.ViewHolder {
        private TextView tagText;
//        private View.OnClickListener listener;

        private ViewHolder(View v) {
            super(v);
            //FIXME what should go here instead of recommendation_title?
            tagText = (TextView) v.findViewById(R.id.tagsText);
        }
    }

    /**
     * @param context the context currently being used
     * @param _tags   the list of tags of this heritage item to be showed
     */
    public TagsViewAdapter(HeritageItemViewActivity context, ArrayList<Tag> _tags) {
        tags = _tags;
        this.context = context;
    }

    @Override
    public TagsViewAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View v = inflater.inflate(R.layout.horizontal_tag_item_fancy, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        final Tag tag = tags.get(position);
        holder.tagText.setText(tag.toString());
        View.OnClickListener listener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Log.v(LOG_TAG, "onClick: search for this tag");
                Intent i = new Intent(context, SearchActivity.class);
                String tagStr = tag.toString();
                if (tagStr.startsWith("#")) { //actually we are sure that this will happen
                    tagStr = tagStr.substring(1, tagStr.length());
                }
                i.putExtra("stringToSearch", tagStr);
                //TODO make the search with proper endpoint!
                i.putExtra("endPoint", context.getResources().getString(R.string.search_tag_EndPoint));
                context.startActivity(i);
            }
        };
        holder.tagText.setOnClickListener(listener);
    }

    @Override
    public int getItemCount() {
        return tags.size();
    }

    public void addAll(ArrayList<Tag> tag) {
        Log.v("dummy", "addAll: ");
        if (tag == tags) {
            Log.e("why", "addAll: ");
        }
        this.tags.addAll(tag);
    }

    public void clear() {
        this.tags.clear();
    }

}

