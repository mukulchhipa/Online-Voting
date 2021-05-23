package com.Controller.Voter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "Logout",value = "/Logout")
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Logout() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        HttpSession session = request.getSession(true);
        session.invalidate();

        // to expire a cookie
        Cookie c = new Cookie("uname", "");
        response.addCookie(c);
        Cookie[] c1 = request.getCookies();
        c1[0].setMaxAge(0);

        response.sendRedirect("home.jsp");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
