package com.culturage.oceans_eleven.culturage;


import com.culturage.oceans_eleven.culturage.baseClasses.HeritageItem;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;


public class heritageItemTest {

    @Test
    public void testEquals() {

        boolean isClickLikeButton = true;

        HeritageItem item1 = new HeritageItem(10, "title1", "desc1", "image1", false, 2, 2, false, 0);
        HeritageItem item2 = new HeritageItem(11, "title2", "desc2", "image1", false, 2, 2, false, 0);

        assertNotEquals(item1, item2);
        assertEquals(item1.getmImageUrl(), item2.getmImageUrl());
        assertEquals(item1.getmLikeCount(), item2.getmLikeCount());

        boolean isLiked = item1.isRated();
        int likeCount = item1.getmLikeCount();
        //when someone like item
        if (isClickLikeButton && !isLiked) {
            item1.setmLikeCount(item1.getmLikeCount() + 1);
            likeCount++;
        }
        assertEquals(likeCount, item1.getmLikeCount());
        assertNotEquals(item1.getmLikeCount(), item2.getmLikeCount());


    }

}
