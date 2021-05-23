package com.Controller.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LogoutAdmin",value = "/LogoutAdmin")
public class LogoutAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LogoutAdmin() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sessionAdmin = request.getSession(true);
        sessionAdmin.invalidate();

        // to expire a cookie
        Cookie c = new Cookie("adminName", "");
        response.addCookie(c);
        Cookie[] c1 = request.getCookies();
        c1[0].setMaxAge(0);

        response.sendRedirect("adminPanel.jsp");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
