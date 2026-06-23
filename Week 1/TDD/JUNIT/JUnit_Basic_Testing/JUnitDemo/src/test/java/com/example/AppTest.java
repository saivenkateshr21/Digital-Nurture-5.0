package com.example;

import org.junit.Test;
import static org.junit.Assert.*;

public class AppTest {

    @Test
    public void testAdd() {
        App app = new App();
        int result = app.add(14, 22);
        assertEquals(36, result); // 14 + 22 = 36
    }
}