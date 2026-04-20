package com.demo;

import org.junit.Test;
import static org.junit.Assert.*;

public class HelloServletTest {

    @Test
    public void testGreetingNotNull() {
        HelloServlet servlet = new HelloServlet();
        assertNotNull("Greeting should not be null", servlet.getGreeting());
    }

    @Test
    public void testGreetingContent() {
        HelloServlet servlet = new HelloServlet();
        assertTrue("Greeting should contain CI/CD",
                servlet.getGreeting().contains("CI/CD"));
    }
}
