package com.culturage.oceans_eleven.culturage.adapters;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.culturage.oceans_eleven.culturage.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class HeritageImageAdapter extends RecyclerView.Adapter<HeritageImageAdapter.ViewHolder> {
    private static ArrayList<String> imageUrls;
    private Activity context;

    class ViewHolder extends RecyclerView.ViewHolder {
        private ImageView mImage;

        private ViewHolder(View v) {
            super(v);
//            frame = v;
            mImage = (ImageView) v.findViewById(R.id.heritage_image);
        }
    }

    public HeritageImageAdapter(Activity context, ArrayList<String> _imageUrls) {
        imageUrls = _imageUrls;
        this.context = context;
    }

    @Override
    public HeritageImageAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View v = inflater.inflate(R.layout.heritage_image_horizontal_list_item, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        final String url = imageUrls.get(position);
        Picasso.with(context).load(url).resize(0, 1500).into(holder.mImage);
        holder.mImage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final AlertDialog.Builder imageDialog = new AlertDialog.Builder(context, R.style.BlackDialogTheme);
//                imageDialog.create().getWindow().setLayout(600, 1200);
                View view = LayoutInflater.from(context).inflate(R.layout.image_dialog, null);
                ImageView image = (ImageView) view.findViewById(R.id.alertedImage);
                Picasso.with(context).load(url).resize(0, 1500).into(image);
                imageDialog.setView(view);
                imageDialog.setNegativeButton("Close", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
                imageDialog.show();
            }
        });

    }

    @Override
    public int getItemCount() {
        return imageUrls.size();
    }

    public void addAll(ArrayList<String> urls) {
        imageUrls.addAll(urls);
    }

    public void clear() {
        imageUrls.clear();
    }

}
