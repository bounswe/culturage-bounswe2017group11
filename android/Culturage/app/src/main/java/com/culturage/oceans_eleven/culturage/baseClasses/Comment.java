package com.culturage.oceans_eleven.culturage.baseClasses;

/**
 * Represents one comment of an item
 */
public class Comment {
    private String content, username, imageUri;
    private int commentId;

    /**
     * @param content   the content of the comment
     * @param username  the user name of the user who posted this comment
     * @param imageUri  the uri opf the user who posted this comment
     * @param commentId the id of this comment
     */
    public Comment(String content, String username, String imageUri, int commentId) {
        this.content = content;
        this.imageUri = imageUri;
        this.username = username;
        this.commentId = commentId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImageUri() {
        return imageUri;
    }

    public void setImageUri(String imageUri) {
        this.imageUri = imageUri;
    }

    public String getContent() {

        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
