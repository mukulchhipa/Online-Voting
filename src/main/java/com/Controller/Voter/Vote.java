package com.Controller.Voter;

import com.Dao.Dao;
import com.Model.Model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Vote", value = "/Vote")
public class Vote extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String voterId = request.getParameter("voter_card_number");
        String vote = request.getParameter("voter");
        Model m = new Model();
        m.setVoterId(voterId);
        m.setVote(vote);
        try {
            int i = Dao.votePublish(m);
            if (i != 0) {
                response.sendRedirect("successVoter.jsp");
            } else {
                response.sendRedirect("voter.jsp?msg=invalid");
                //response.sendRedirect("failVoter.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
