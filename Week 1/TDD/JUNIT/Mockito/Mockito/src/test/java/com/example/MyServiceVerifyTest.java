package com.example;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

/**
 * Exercise 2: Verifying Interactions
 * - Create a mock of ExternalApi
 * - Inject it into MyService
 * - Call fetchData()
 * - Verify that getData() was called on the mock
 */
public class MyServiceVerifyTest {

    private ExternalApi apiMock;
    private MyService myService;

    @Before
    public void setUp() {
        // Arrange: Create mock object
        apiMock = mock(ExternalApi.class);
        myService = new MyService(apiMock);
    }

    @Test
    public void testVerifyInteraction() {
        // Act
        myService.fetchData();

        // Assert - verify that getData() was called
        verify(apiMock).getData();
    }
}