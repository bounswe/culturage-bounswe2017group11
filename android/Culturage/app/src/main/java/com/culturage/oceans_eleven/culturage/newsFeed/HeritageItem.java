package com.culturage.oceans_eleven.culturage.newsFeed;


public class HeritageItem {

    private String mTitle;
    private String mDescription;
    private int mResourceId;

    public HeritageItem(String mTitle, String mDescription, int mResourceId) {
        this.mTitle = mTitle;
        this.mDescription = mDescription;
        this.mResourceId = mResourceId;
    }

    public String getmTitle() {
        return mTitle;
    }

    public String getmDescription() {
        return mDescription;
    }

    public int getmResourceId() {
        return mResourceId;
    }

    public void setmTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    public void setmDescription(String mDescription) {
        this.mDescription = mDescription;
    }

    public void setmResourceId(int mResourceId) {
        this.mResourceId = mResourceId;
    }

}
