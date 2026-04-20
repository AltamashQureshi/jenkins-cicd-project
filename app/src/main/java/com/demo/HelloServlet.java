package com.demo;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HelloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        res.setContentType("text/html");
        res.getWriter().println("<h1>Hello from Jenkins CI/CD Pipeline!</h1>");
        res.getWriter().println("<p>Build successful. Pipeline is working.</p>");
    }

    public String getGreeting() {
        return "Hello from CI/CD!";
    }
}
