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
    private String mImageString;
    private String rate;
    private String createdAt;
    private String mTags;
    private String creator_id;
    private String creator_username;

    //dummy item; this constructor is not to be used, temporary
    public HeritageItem(String title, String description, String imageString, String rate, String createdAt, String date, String location, String tags) {
        this.mTitle = title;
        this.createdAt = createdAt;
        this.mDescription = description;
        this.mImageString = imageString;
        this.rate = rate;
        this.mDate = date;
        this.mLocation = location;
        this.mTags = tags;

    }


    public HeritageItem(long mPostId, String mTitle, String mDescription, int mResourceId, long mLikeCount, long mCommentCount) {
        this.mPostId = mPostId;
        this.mTitle = mTitle;
        this.mDescription = mDescription;
        this.mResourceId = mResourceId;
        this.mLikeCount = mLikeCount;
        this.mCommentCount = mCommentCount;
    }

    public String getCreatorId() {
        return creator_id;
    }

    public void setCreatorId(String creator_id) {
        this.creator_id = creator_id;
    }

    public String getCreatorUsername() {
        return creator_username;
    }

    public void setCreatorUsername(String creator_username) {
        this.creator_username = creator_username;
    }

    public String getmDate() {
        return mDate;
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


    public String getmImageString() {
        return mImageString;
    }

    public void setmImageString(String mImageString) {
        this.mImageString = mImageString;
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

    public String getmTitle() {
        return mTitle;
    }


    public long getmPostId() {
        return mPostId;
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

    public String getMTags() {
        return mTags;
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
