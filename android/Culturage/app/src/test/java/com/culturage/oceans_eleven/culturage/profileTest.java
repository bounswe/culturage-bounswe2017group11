package com.culturage.oceans_eleven.culturage;

import com.culturage.oceans_eleven.culturage.baseClasses.ProfilePage;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;


public class profileTest {

    @Test
    public void testEquals() {

        ProfilePage profile1 = new ProfilePage("username", "email", "fullName", "location", "photo", "birthday");
        ProfilePage profile2 = null;

        assertNotEquals(profile1, profile2);

        profile2 = new ProfilePage("username", "email", "fullName", "location", "photo", "birthday");

        assertEquals(profile1.getUsername(), profile2.getUsername());

        profile2.setUsername("Ali");

        assertNotEquals(profile1.getUsername(), profile2.getUsername());

    }
}
