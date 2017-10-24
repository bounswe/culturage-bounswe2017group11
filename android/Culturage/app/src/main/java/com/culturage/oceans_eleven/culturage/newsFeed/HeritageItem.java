package com.culturage.oceans_eleven.culturage.newsFeed;


public class HeritageItem {

    private long mPostId;
    private String mTitle;
    private String mDescription;
    private int mResourceId;
    private long mLikeCount;
    private long mCommentCount;
    private String mDate;
    private String mLocation;
    private String mName;
    private String description;
    private String imageURL;
    private String rate;
    private String createdAt;

    public String getmDate() {
        return mDate;
    }


    //dummy item; this constructor is not to be used, temporary
    public HeritageItem(String name, String description, String imageURL, String rate, String createdAt, String date, String location) {
        this.mName = name;
        this.createdAt = createdAt;
        this.description = description;
        this.imageURL = imageURL;
        this.rate = rate;
        this.mDate = date;
        this.mLocation = location;
    }

    public HeritageItem(long mPostId, String mTitle, String mDescription, int mResourceId, long mLikeCount, long mCommentCount) {
        this.mPostId = mPostId;
        this.mTitle = mTitle;
        this.mDescription = mDescription;
        this.mResourceId = mResourceId;
        this.mLikeCount = mLikeCount;
        this.mCommentCount = mCommentCount;
    }

    public String getmLocation() {
        return mLocation;
    }

    public void setmLocation(String mLocation) {
        this.mLocation = mLocation;
    }


    public void setmResourceId(int mResourceId) {
        this.mResourceId = mResourceId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getmName() {
        return mName;
    }


    public void setmName(String mName) {
        this.mName = mName;
    }

    public long getmPostId() {
        return mPostId;
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

    public long getmLikeCount() {
        return mLikeCount;
    }

    public long getmCommentCount() {
        return mCommentCount;
    }

    public void setmPostId(long mPostId) {
        this.mPostId = mPostId;
    }

    public void setmTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    public void setmDescription(String mDescription) {
        this.mDescription = mDescription;
    }

    public void setmLikeCount(long likeCount) {
        this.mLikeCount = likeCount;
    }

    public void setmCommentCount(long commentCount) {
        this.mCommentCount = commentCount;
    }

}
