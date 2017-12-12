package com.culturage.oceans_eleven.culturage.baseClasses;

public class Comment {
    private String content, username, imageUri;
    private int commentId;

    Comment(String content, String username, String imageUri, int commentId) {
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
