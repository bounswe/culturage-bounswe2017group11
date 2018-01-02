package com.culturage.oceans_eleven.culturage;

import com.culturage.oceans_eleven.culturage.baseClasses.Comment;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;


public class CommentTest {

    @Test
    public void testEquals() {

        Comment comment1, comment2;

        comment1 = null;
        comment2 = null;

        assertEquals(comment1, comment2);

        comment1 = new Comment("nice work", "ozmenbrn", null, 200);
        comment2 = new Comment("nice work", "ozmenbrn", null, 300);

        assertNotEquals(comment1, comment2);
        assertEquals(comment1.getContent(), comment2.getContent());

        comment2.setContent("changed subject");

        assertNotEquals(comment1.getContent(), comment2.getContent());

    }
}
