package com.culturage.oceans_eleven.culturage.newsFeed;

/**
 * Created by BARIN on 23.10.2017.
 */

public class ProfilePage {

    private String fullName;
    private String username;
    private String location;
    private String email;
    private String about;
    private String photo;
    private int birthday, birthmonth, birthyear;

    public ProfilePage(String username, String email, String fullName, String location, String photo) {
        this.username = username;
        this.email = email;
        this.fullName = fullName;
        this.location = location;
        this.photo = photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhoto() {
        return photo;
    }

    public void setfullName(String fullName) {
        this.fullName = fullName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocation() {
        return location;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getAbout() {
        return about;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }


}
