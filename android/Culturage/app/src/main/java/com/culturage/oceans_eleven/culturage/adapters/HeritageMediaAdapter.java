package com.culturage.oceans_eleven.culturage.adapters;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.provider.MediaStore;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;

import com.culturage.oceans_eleven.culturage.R;
import com.culturage.oceans_eleven.culturage.baseClasses.HeritageMedia;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

/**
 * extends RecyclerView.Adapter<HeritageMediaAdapter.ViewHolder>
 * used for filling the RecyclerView of the heritage items media
 */
public class HeritageMediaAdapter extends RecyclerView.Adapter<HeritageMediaAdapter.ViewHolder> {
    private static ArrayList<HeritageMedia> medias;
    private Activity mContext;
    public static final int REQUEST_CAMERA = 0, SELECT_FILE = 1;

    /**
     * inner class extends RecyclerView.ViewHolder
     * used as building block for the RecyclerView
     */
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

    /**
     *
     * @param context the context currently being used
     * @param _medias the list of media of this heritage item
     */
    public HeritageMediaAdapter(Activity context, ArrayList<HeritageMedia> _medias) {
        medias = _medias;
        this.mContext = context;
    }

    @Override
    public HeritageMediaAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
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
        if (position != medias.size()) {
            final String url = medias.get(position).getUrl();
            final String mediaType = medias.get(position).getMediaType();
            if (mediaType.equals("image")) {
                Picasso.with(mContext).load(url).resize(0, 1500).into(holder.mImage);
                holder.mImage.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        final AlertDialog.Builder imageDialog = new AlertDialog.Builder(mContext, R.style.BlackDialogTheme);
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
            } else if (mediaType.equals("youtube")) {
                holder.mImage.setImageResource(R.mipmap.ic_play_video);
                holder.mImage.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        mContext.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
//                        Log.i("Video", "Video Playing....");

                    }
                });
            }

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
        return medias.size() + 1;
    }

//    public void addAll(ArrayList<HeritageMedia> _medias) {
//        medias.addAll(_medias);
//    }

//    public void clear() {
//        imageUrls.clear();
//    }

    @Override
    public int getItemViewType(int position) {
        if (position == medias.size()) {
            return R.layout.heritage_item_image_list_last_button;
        }
        return R.layout.heritage_image_horizontal_list_item;
    }

    /**
     * starts android gallery for the user to pick a media from
     */
    private void startGalleryIntent() {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_PICK);
        mContext.startActivityForResult(Intent.createChooser(intent, "Select File"), SELECT_FILE);
    }

    /**
     * starts the devices camera intent for the user to take a media to upload
     */
    private void startCameraIntent() {
        Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        mContext.startActivityForResult(intent, REQUEST_CAMERA);
    }
}
