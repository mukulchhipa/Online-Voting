
package com.Controller.Contact;

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

/**
 * Servlet implementation class LoginController
 */
@WebServlet(name="Contact",value="/Contact")
public class Contact extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName=request.getParameter("name");
        String company=request.getParameter("company");
        String email=request.getParameter("email");
        String message=request.getParameter("message");

        Model m=new Model();
        m.setEmail(email);
        m.setCompanyName(company);
        m.setFullName(fullName);
        m.setMessage(message);


        try {
            int i= Dao.contact(m);

            if(i == 1){
                response.sendRedirect("contact.jsp?msg=success");
                //response.sendRedirect("submit.jsp");
            }
            else{
                response.sendRedirect("contact.jsp?msg=failed");
                //response.sendRedirect("failContact.jsp");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}