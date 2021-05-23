package com.Controller.Admin;

import com.Dao.Dao;
import com.Model.Model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminLogin", value="/AdminLogin")
public class AdminLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AdminLogin() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sessionAdmin = request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
        } else {
            if (action.equalsIgnoreCase("logout")) {
                sessionAdmin.removeAttribute("adminId");
                sessionAdmin.removeAttribute("adminNname");
                response.sendRedirect("adminPanel.jsp");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession sessionAdmin=request.getSession();
        String action=request.getParameter("action");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Model m=new Model();
        m.setUserName(username);
        m.setPass(password);

        String sql="select adminId,username,password from admin where username='"+username+"' and password='"+password+"'";

        try {
            ResultSet rs=Dao.loginValidation(sql);
            //ResultSet rs= Dao.adminValid(m);
            if(rs.next()){
                String uname= "Welcome "+rs.getString(2);
                String adminId=String.valueOf(rs.getInt(1));
                sessionAdmin.setAttribute("adminId",adminId);
                sessionAdmin.setAttribute("adminName",uname);
                request.getRequestDispatcher("adminResult.jsp").forward(request,response);
                //response.sendRedirect("adminResult.jsp");
            }else{
                request.setAttribute("error", "Invalid Account");
                response.sendRedirect("adminPanel.jsp?msg=invalid");
                //request.getRequestDispatcher("adminPanel.jsp").forward(request, response);

                //response.sendRedirect("failAdmin.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }


    }

}
