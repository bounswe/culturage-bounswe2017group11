package com.culturage.oceans_eleven.culturage.baseClasses;

/**
 * Represents a media of an HeritageItem
 */
public class HeritageMedia {

    private String url, mediaType;

    /**
     * @param url       url string of the media, this url leads to the real media in the server
     * @param mediaType denotes the type of the media example:image or youtube
     */
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
