package com.culturage.oceans_eleven.culturage.baseClasses;

/**
 * Represents a heritage item
 */
public class HeritageItem {


    private String mStartDate;

    public String getmEndDate() {
        return mEndDate;
    }

    private String mEndDate;
    private int mPostId, mLikeCount, mCommentCount, mResourceId, creatorId, mReportCount;
    private String mTitle, mDescription, mLocationName, mImageBase64String, rate, createdAt, mTags, creatorUsername, mImageUrl;
    private double mLongitude, mLatitude;
    private boolean isRated, isReported;

    /**
     * @param title         title of the Heritage Item
     * @param description   of the Heritage Item
     * @param imageString   the string representation of the Heritage Item
     * @param rate          of the Heritage Item
     * @param createdAt     the string representing the date which the Heritage Item is added to the system
     * @param mStartDate    date of the |heritageItem and if an interval is given corresponds to the start date
     * @param mEndDate      this date only used if a time interval is given for the Heritage Item
     * @param mLocationName the name of the location of the Heritage Item
     * @param longitude     of the Heritage Item
     * @param latitude      of the Heritage Item
     * @param tags          of the Heritage Item
     */
    public HeritageItem(String title, String description, String imageString, String rate, String createdAt, String mStartDate, String mEndDate, String mLocationName, double longitude, double latitude, String tags) {
        this.mTitle = title;
        this.createdAt = createdAt;
        this.mDescription = description;
        this.mImageBase64String = imageString;
        this.rate = rate;
        this.mStartDate = mStartDate;
        this.mLocationName = mLocationName;
        this.mLongitude = longitude;
        this.mLatitude = latitude;
        this.mTags = tags;
        this.mEndDate = mEndDate;

    }

    /**
     *
     * @param mPostId the post id of this item
     * @param mTitle title of the Heritage Item
     * @param mDescription description of the Heritage Item
     * @param mResourceId the id of this items resource
     * @param mLikeCount number of likes this item has
     * @param mCommentCount number of comments this item has
     */
    public HeritageItem(int mPostId, String mTitle, String mDescription, int mResourceId, int mLikeCount, int mCommentCount) {
        this.mPostId = mPostId;
        this.mTitle = mTitle;
        this.mDescription = mDescription;
        this.mResourceId = mResourceId;
        this.mLikeCount = mLikeCount;
        this.mCommentCount = mCommentCount;
    }

    /**
     *
     * @param postID the post id of this item
     * @param title title of the Heritage Item
     * @param description description of the Heritage Item
     * @param imageURL the url of this items image in the server
     * @param isRated ture if this item is rated by this user
     * @param mLikeCount number of likes this item has
     * @param mCommentCount number of comments this item has
     * @param isReported true if this item is reported by this user
     * @param mReportCount total number of reports this item has
     */
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


    /**
     *
     * @param postID the post id of this item
     * @param title title of the Heritage Item
     * @param mDescription description of the Heritage Item
     * @param imageURL the url of this items image in the server
     */
    // Used by recommendation slider
    public HeritageItem(int postID, String title, String mDescription, String imageURL) {
        this.mPostId = postID;
        this.mTitle = title;
        this.mDescription = mDescription;
        this.mImageUrl = imageURL;
    }

    /**
     *
     * @param creatorId id of the registered user who added this item to the system
     * @param creatorUsername userName of the registered user who added this item to the system
     */
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

    public String getmStartDate() {
        return mStartDate;
    }


    public String getmLocationName() {
        return mLocationName;
    }

    public double getmLongitude() {
        return mLongitude;
    }

    public double getmLatitude() {
        return mLatitude;
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

    public void setmReportCount(int reportCount) {
        this.mReportCount = reportCount;
    }

    public int getmReportCount() {
        return mReportCount;
    }
}
