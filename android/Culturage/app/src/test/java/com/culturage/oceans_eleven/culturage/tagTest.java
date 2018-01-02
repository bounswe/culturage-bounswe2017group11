package com.culturage.oceans_eleven.culturage;

import com.culturage.oceans_eleven.culturage.baseClasses.Tag;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

public class tagTest {

    @Test
    public void testEquals() {

        Tag tag1 = new Tag("tag1");
        Tag tag2 = new Tag("tag2");
        Tag tag3 = new Tag("tag1");

        assertNotEquals(tag1.toString(), tag2.toString());
        assertEquals(tag1.toString(), tag3.toString());

        tag2 = tag1;

        assertEquals(tag2.toString(), tag1.toString());


    }
}
