package com.culturage.oceans_eleven.culturage.newsFeed;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.FloatingActionButton;
import android.support.v4.app.Fragment;
import android.support.v4.app.LoaderManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.adapters.HeritageItemAdapter;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;
import com.culturage.oceans_eleven.culturage.network.NewsFeedLoader;

import java.util.ArrayList;


/**
 * Created by me on 10.11.2017.
 */

public class RecommendedHeritageItemsFragment extends Fragment implements LoaderManager.LoaderCallbacks<ArrayList<HeritageItem>>{

    private static final String apiURL = "http://18.220.108.135/api/items";

    private static HeritageItemAdapter itemAdapter;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.activity_news_feed, container, false);

        FloatingActionButton fab = (FloatingActionButton) rootView.findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                startActivity(new Intent(getContext(), UploadActivity.class));
            }
        });

        


        ArrayList<HeritageItem> items = new ArrayList<HeritageItem>();


        itemAdapter = new HeritageItemAdapter(getActivity(), items);
        final ListView listView = (ListView) rootView.findViewById(R.id.news_feed_list);
        listView.setAdapter(itemAdapter);
        updateUi(items);
        getLoaderManager().initLoader(1, null, RecommendedHeritageItemsFragment.this);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                HeritageItem item = ((HeritageItem) listView.getItemAtPosition(position));
                Intent intent = new Intent(getContext(), HeritageItemViewActivity.class);
                intent.putExtra("postId", item.getmPostId());
                intent.putExtra("title", item.getmTitle());
                intent.putExtra("description", item.getmDescription());
                intent.putExtra("imageUrl", item.getmImageString());
                intent.putExtra("date", item.getmDate());
                intent.putExtra("location", item.getmLocation());
                intent.putExtra("tags", item.getMTags());
                intent.putExtra("creator_id", item.getCreatorId()); //New
                intent.putExtra("creator_username", item.getCreatorUsername()); //New
                startActivity(intent);
            }
        });

        return rootView;
    }


    public void updateUi(ArrayList<HeritageItem> heritageItems) {
        itemAdapter.clear();
        if (heritageItems != null || heritageItems.size() > 0) {
            itemAdapter.addAll(heritageItems);
        }
    }


    @Override
    public android.support.v4.content.Loader<ArrayList<HeritageItem>> onCreateLoader(int id, Bundle args) {
        return new NewsFeedLoader(getContext(), apiURL);
    }

    @Override
    public void onLoadFinished(android.support.v4.content.Loader<ArrayList<HeritageItem>> loader, ArrayList<HeritageItem> heritageItems) {
        if (heritageItems == null) return;
        updateUi(heritageItems);
    }

    @Override
    public void onLoaderReset(android.support.v4.content.Loader<ArrayList<HeritageItem>> loader) {
        itemAdapter.clear();
    }


}
