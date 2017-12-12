package com.culturage.oceans_eleven.culturage.baseClasses;


public class HeritageMedia {
    private String url, mediaType;

    public HeritageMedia(String url, String mediaType) {
        this.url = url;
        this.mediaType = mediaType;
    }

    public String getUrl() {
        return url;
    }

    public String getMediaType() {
        return mediaType;
    }
}
