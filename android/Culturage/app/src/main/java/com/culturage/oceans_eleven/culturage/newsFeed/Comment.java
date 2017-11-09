package com.culturage.oceans_eleven.culturage.newsFeed;

public class Comment {
    private String content, username, imageUri;

    public Comment(String content, String username, String imageUri) {
        this.content = content;
        this.imageUri = imageUri;
        this.username = username;
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
