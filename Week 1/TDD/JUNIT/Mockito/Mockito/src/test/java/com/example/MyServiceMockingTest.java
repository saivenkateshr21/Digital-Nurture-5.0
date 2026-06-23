package com.example;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

/**
 * Exercise 1: Mocking and Stubbing
 * - Create a mock of ExternalApi
 * - Stub its getData() method to return "Mock Data"
 * - Assert that MyService.fetchData() returns the mocked value
 */
public class MyServiceMockingTest {

    private ExternalApi mockApi;
    private MyService service;

    @Before
    public void setUp() {
        // Arrange: Create mock
        mockApi = mock(ExternalApi.class);
        service = new MyService(mockApi);
    }

    @Test
    public void testExternalApi() {
        // Arrange - stub getData() to return "Mock Data"
        when(mockApi.getData()).thenReturn("Mock Data");

        // Act
        String result = service.fetchData();

        // Assert
        assertEquals("Mock Data", result);
    }
}