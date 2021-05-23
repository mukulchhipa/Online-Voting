<%--
  Created by IntelliJ IDEA.
  User: mukul
  Date: 19-05-2021
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/body.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%@page import="java.sql.*" %>


<%
    String message= request.getParameter("msg");
    Connection con=null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "");
    String sql="select * from partytable";

    PreparedStatement statement=con.prepareStatement(sql);
    ResultSet rs=statement.executeQuery();

%>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form action="Vote" method="post" style="max-width:350px;margin:auto">
                <center>
                    <div class="container">
                        <h1>Voting</h1>
                        <p>Please fill in this form to vote.</p>
                        <hr>
                        <input type="text" placeholder="Enter Voter card number" name="voter_card_number" required pattern="[A-Za-z0-9]{1,20}">
                        <select type="text" name="voter" required>
                            <option disabled="disabled" selected="selected">Select Your Party</option>
                            <% while (rs.next()){
                                String  partyCode=rs.getString(2);
                                String  partyName=rs.getString(3);

                            %>
                            <option value="<%=partyCode%>>"><%=partyName%>(<%=partyCode%>)</option>
                            <%
                                }%>
                        </select>
                        <hr>
                        <small><p> You agree to our <a href="termsNConditions.jsp">Terms & Privacy</a>.</p></small>
                        <button type="submit" class="btn">Vote</button>
                    </div>
                    <div class="container signin">
                        <%if(message!=null){
                        if(message.equals("invalid"))%>
                        <img src="images/alert-16.png" alt="Computer Man" style="width:23px;height:23px;"> <font color="#ff0000">Invalid voter card number</font>
                        <%}%>
                        <small><p>New user register <a href="register.jsp">Sign up</a>.</p></small>
                    </div>
                </center>
            </form>
            <div class="login100-more" style="background-image: url('images/yy.jpg');">
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</div>


</body>
</html>
