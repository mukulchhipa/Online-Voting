package com.Controller.Voter;

import com.Dao.Dao;
import com.Model.Model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "Register",value = "/Register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String voterId=request.getParameter("voter_card_number");
        String fullName=request.getParameter("name");
        String username=request.getParameter("username");
        String gender=request.getParameter("gender");
        String dob=request.getParameter("dob");
        String email=request.getParameter("email");
        String password=request.getParameter("password");

        String s = dob.substring(0,4);    //0-> starting index & 4-> character counting (yyyy format in dob so 4 character thts y 4)
        Date d = new Date();
        String s1=d.toString();    // converting object into string -> toString method is used
        String s2=s1.substring(24);
        int a =Integer.parseInt(s);	//user entered
        int b=Integer.parseInt(s2);	//system value

        if(a>1950 && (b-a) >=18) {
            Model m = new Model();
            m.setPass(password);
            m.setVoterId(voterId);
            m.setUserName(username);
            m.setDob(dob);
            m.setEmail(email);
            m.setGender(gender);
            m.setFullName(fullName);

            try {
                int i = Dao.register(m);
                if (i != 0) {
                    response.sendRedirect("home.jsp?msg=success");
                    //response.sendRedirect("successRegister.jsp");
                } else {
                    response.sendRedirect("register.jsp?msg=failed");
                    //response.sendRedirect("failRegister.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
                response.sendRedirect("register.jsp?msg=age");
        }
    }
}
