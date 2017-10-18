package com.culturage.oceans_eleven.culturage.newsFeed;


public class HeritageItem {

    private long mPostId;
    private String mTitle;
    private String mDescription;
    private int mResourceId;
    private long mLikeCount;
    private long mCommentCount;

    public HeritageItem(long mPostId, String mTitle, String mDescription, int mResourceId, long mLikeCount, long mCommentCount) {
        this.mPostId = mPostId;
        this.mTitle = mTitle;
        this.mDescription = mDescription;
        this.mResourceId = mResourceId;
        this.mLikeCount = mLikeCount;
        this.mCommentCount = mCommentCount;
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
