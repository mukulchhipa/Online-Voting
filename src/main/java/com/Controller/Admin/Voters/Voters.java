package com.Controller.Admin.Voters;

import com.Dao.Dao;
import com.Model.Model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name ="Voters",value = "/Voters")
public class Voters extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String voterId = request.getParameter("voterId");
        System.out.println(voterId);
        // Connect to mysql and verify username password
        Model m=new Model();
        m.setVoterId(voterId);
        try {
            int rs= Dao.deleteVoter(voterId);
            if(rs!=0){
                response.sendRedirect("adminVoter.jsp?msg=success");
            }else{
                response.sendRedirect("adminVoter.jsp?msg=failed");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
