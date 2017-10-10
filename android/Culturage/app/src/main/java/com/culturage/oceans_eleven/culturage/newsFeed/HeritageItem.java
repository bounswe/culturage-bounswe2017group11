package com.culturage.oceans_eleven.culturage.newsFeed;


class HeritageItem {

    private String mTitle;
    private String mDescription;

    public HeritageItem(String mTitle, String mDescription) {
        this.mTitle = mTitle;
        this.mDescription = mDescription;
    }

    public String getmTitle() {
        return mTitle;
    }

    public String getmDescription() {
        return mDescription;
    }

    public void setmTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    public void setmDescription(String mDescription) {
        this.mDescription = mDescription;
    }
}
