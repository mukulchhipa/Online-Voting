package com.Controller.Admin;

import com.Dao.Dao;
import com.Model.Model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.TimeUnit;

@WebServlet(name = "AdminRegister",value = "/AdminRegister")
public class AdminRegister extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fullName=request.getParameter("name");
        String password=request.getParameter("password");

        Model m=new Model();
        m.setPass(password);
        m.setFullName(fullName);
        String sql="insert into admin(username,password) values('"+fullName+"','"+password+"')";

        String message=null;
        try {
            int i= Dao.registerAdmin(m);
            if(i!=0){
                response.sendRedirect("adminPanel.jsp?msg=success");

                //out.println("success");
                //response.flushBuffer();
                //TimeUnit.SECONDS.sleep(2);
                //response.sendRedirect("successAdminRegister.jsp");

            }else {
                response.sendRedirect("adminRegister.jsp?msg=failed");
                //out.println("fail");
                //response.flushBuffer();
                //TimeUnit.SECONDS.sleep(20);
                //response.sendRedirect("failAdminRegister.jsp");

            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
