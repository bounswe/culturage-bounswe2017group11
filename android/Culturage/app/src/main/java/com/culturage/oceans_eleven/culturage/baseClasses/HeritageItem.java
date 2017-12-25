package com.culturage.oceans_eleven.culturage.baseClasses;


public class HeritageItem {

    private int mPostId, mLikeCount, mCommentCount, mResourceId, creatorId, mReportCount;
    private String mTitle, mDescription, mDate, mLocation, mImageBase64String, rate, createdAt, mTags, creatorUsername, mImageUrl;
    private boolean isRated, isReported;

    //dummy item; this constructor is not to be used, temporary
    public HeritageItem(String title, String description, String imageString, String rate, String createdAt, String date, String location, String tags) {
        this.mTitle = title;
        this.createdAt = createdAt;
        this.mDescription = description;
        this.mImageBase64String = imageString;
        this.rate = rate;
        this.mDate = date;
        this.mLocation = location;
        this.mTags = tags;

    }


    public HeritageItem(int mPostId, String mTitle, String mDescription, int mResourceId, int mLikeCount, int mCommentCount) {
        this.mPostId = mPostId;
        this.mTitle = mTitle;
        this.mDescription = mDescription;
        this.mResourceId = mResourceId;
        this.mLikeCount = mLikeCount;
        this.mCommentCount = mCommentCount;
    }

    // Used in news feed
    public HeritageItem(int postID, String title, String description, String imageURL, boolean isRated, int mLikeCount, int mCommentCount,
                        boolean isReported, int mReportCount) {
        this.mPostId = postID;
        this.mTitle = title;
        this.mDescription = description;
        this.mImageUrl = imageURL;
        this.isRated = isRated;
        this.mLikeCount = mLikeCount;
        this.mCommentCount = mCommentCount;
        this.isReported = isReported;
        this.mReportCount = mReportCount;
    }

    // Used by recommendation slider
    public HeritageItem(int postID, String title, String mDescription, String imageURL) {
        this.mPostId = postID;
        this.mTitle = title;
        this.mDescription = mDescription;
        this.mImageUrl = imageURL;
    }

    // Used for guest profile
    public HeritageItem(int creatorId, String creatorUsername) {
        this.creatorId = creatorId;
        this.creatorUsername = creatorUsername;
    }

    public int getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(int creator_id) {
        this.creatorId = creator_id;
    }

    public String getCreatorUsername() {
        return creatorUsername;
    }

    public void setCreatorUsername(String creator_username) {
        this.creatorUsername = creator_username;
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


    public String getmImageBase64String() {
        return mImageBase64String;
    }

    public void setmImageBase64String(String mImageBase64String) {
        this.mImageBase64String = mImageBase64String;
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


    public int getmPostId() {
        return mPostId;
    }


    public String getmDescription() {
        return mDescription;
    }

    public int getmResourceId() {
        return mResourceId;
    }

    public int getmLikeCount() {
        return mLikeCount;
    }

    public int getmReportCount() {
        return mReportCount;
    }

    public int getmCommentCount() {
        return mCommentCount;
    }

    public String getMTags() {
        return mTags;
    }

    public void setmPostId(int mPostId) {
        this.mPostId = mPostId;
    }

    public void setmTitle(String mTitle) {
        this.mTitle = mTitle;
    }

    public void setmDescription(String mDescription) {
        this.mDescription = mDescription;
    }

    public void setmLikeCount(int likeCount) {
        this.mLikeCount = likeCount;
    }

    public void setmReportCount(int reportCount) {
        this.mReportCount = reportCount;
    }

    public void setmCommentCount(int commentCount) {
        this.mCommentCount = commentCount;
    }

    public String getmImageUrl() {
        return mImageUrl;
    }

    public void setmImageUrl(String mImageUrl) {
        this.mImageUrl = mImageUrl;
    }

    public boolean isRated() {
        return isRated;
    }

    public void setRated(boolean rated) {
        isRated = rated;
    }

    public boolean isReported() {
        return isReported;
    }

    public void setReported(boolean isReported) {
        this.isReported = isReported;
    }
}
