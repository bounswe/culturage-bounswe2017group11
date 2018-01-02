package com.culturage.oceans_eleven.culturage.baseClasses;

/**
 * Created by me on 18.11.2017.
 * A simple holder for a tag
 */

public class Tag {

    private String tag;

    /**
     * @param tag a tag (string) of an item
     */
    public Tag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return this.tag;
    }
}
