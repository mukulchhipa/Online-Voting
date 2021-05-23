package com.Controller.Admin.Party;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(name = "AddParty",value = "/AddParty")
@MultipartConfig(maxFileSize = 16177215)
public class AddParty extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String partyCode=request.getParameter("party_code");
        String partyName=request.getParameter("pName");

        InputStream inputStream=null;
        Part filePart=request.getPart("image");
        if(filePart!=null){
            inputStream=filePart.getInputStream();
        }

        try {
            Connection con=null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            //database_name --> evoting
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "");

            String sql="INSERT INTO partyTable (partyCode, partyName, photo) values (?, ?, ?)";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,partyCode);
            ps.setString(2,partyName);
            if(inputStream!=null){
                ps.setBlob(3,inputStream);
            }
            int result=ps.executeUpdate();
            if(result!=0){
                response.sendRedirect("addParty.jsp?msg=success");
            }else {
                response.sendRedirect("addParty.jsp?msg=failed");
                //response.sendRedirect("failAddParty.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }


    }
}
