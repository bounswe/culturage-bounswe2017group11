package com.culturage.oceans_eleven.culturage.adapters;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.provider.MediaStore;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;

import com.culturage.oceans_eleven.culturage.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class HeritageImageAdapter extends RecyclerView.Adapter<HeritageImageAdapter.ViewHolder> {
    private static ArrayList<String> imageUrls;
    private Activity mContext;
    private int REQUEST_CAMERA = 0, SELECT_FILE = 1;

    class ViewHolder extends RecyclerView.ViewHolder {
        private ImageView mImage;
        private ImageButton mTakePhoto, mChoosePhoto;


        private ViewHolder(View v) {
            super(v);
//            frame = v;
            mImage = (ImageView) v.findViewById(R.id.heritage_image);
            mTakePhoto = (ImageButton) v.findViewById(R.id.herItemTakePhoto);
            mChoosePhoto = (ImageButton) v.findViewById(R.id.herItemSelectPhoto);
        }
    }

    public HeritageImageAdapter(Activity context, ArrayList<String> _imageUrls) {
        imageUrls = _imageUrls;
        this.mContext = context;
    }

    @Override
    public HeritageImageAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View itemView;
        if (viewType == R.layout.heritage_image_horizontal_list_item) {
            itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.heritage_image_horizontal_list_item, parent, false);
        } else {
            itemView = LayoutInflater.from(parent.getContext()).inflate(R.layout.heritage_item_image_list_last_button, parent, false);
        }
        return new ViewHolder(itemView);
    }

    @Override
    public void onBindViewHolder(ViewHolder holder, int position) {
        if (position != imageUrls.size()) {
            final String url = imageUrls.get(position);
            Picasso.with(mContext).load(url).resize(0, 1500).into(holder.mImage);
            holder.mImage.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    final AlertDialog.Builder imageDialog = new AlertDialog.Builder(mContext, R.style.BlackDialogTheme);
//                imageDialog.create().getWindow().setLayout(600, 1200);
                    View view = LayoutInflater.from(mContext).inflate(R.layout.image_dialog, null);
                    ImageView image = (ImageView) view.findViewById(R.id.alertedImage);
                    Picasso.with(mContext).load(url).resize(0, 1500).into(image);
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
        } else {
            holder.mTakePhoto.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    startCameraIntent();
                }
            });
            holder.mChoosePhoto.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    startGalleryIntent();
                }
            });
        }
    }

    @Override
    public int getItemCount() {
        return imageUrls.size() + 1;
    }

    public void addAll(ArrayList<String> urls) {
        imageUrls.addAll(urls);
    }

    public void clear() {
        imageUrls.clear();
    }

    @Override
    public int getItemViewType(int position) {
        if (position == imageUrls.size()) {
            return R.layout.heritage_item_image_list_last_button;
        }
        return R.layout.heritage_image_horizontal_list_item;
    }

    private void startGalleryIntent() {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);//
        mContext.startActivityForResult(Intent.createChooser(intent, "Select File"), SELECT_FILE);
    }

    private void startCameraIntent() {
        Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        mContext.startActivityForResult(intent, REQUEST_CAMERA);
    }
}
