package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class AssertionsTest {

    @Test
    public void testAssertions() {
        // Check if two values are equal
        assertEquals(5, 2 + 3);

        // Check if a condition is true
        assertTrue(5 > 3);

        // Check if a condition is false
        assertFalse(5 < 3);

        // Assert null
        assertNull(null);

        // Assert not null
        assertNotNull(new Object());
    }
}