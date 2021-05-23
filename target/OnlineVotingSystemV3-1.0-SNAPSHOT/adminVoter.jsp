<%--
  Created IN IntelliJ IDEA.
  User: mukul
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/body.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
    String message=request.getParameter("msg");
String input =null;
    Connection con=null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "");


%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="container">
<hr>
    <hr>
<form action="adminVoter.jsp" method="post" style="max-width:350px;margin:auto">
    <input type="search" name="search" placeholder="Enter voterId" >
    <button type="submit" > Search</button>
</form>
<%
    input =request.getParameter("search");
    if(input !=null){
        String sql="select * from login where voter_card_number=?";

        PreparedStatement statement=con.prepareStatement(sql);
        statement.setString(1, input);
        ResultSet rs=statement.executeQuery();%>
    <form action="Voters" method="post" name="delete">
    <table class="table-all">
        <tr>
            <th>Name</th>
            <th>VoterId</th>
        </tr>
        <%
        while (rs.next()) {
            String voterId = rs.getString(1);
            String name = rs.getString(2);

%>

        <tr>
            <td> <%=name%></td>
            <td> <input name="voterId" value="<%=voterId%>" autocomplete="<%=voterId%>"></td>
            <td> <button type="submit">delete </button></td>

        </tr>
    </table>

    <%
            }
    }

    %><div class="container signin">
        <% if(message!=null){
            if(message.equals("success")){%>
        <img src="images/ok-16.png" alt="Computer Man" style="width:23px;height:23px;">  <font color="#1B9B3E">Voter Removed Successfully </font>
        <%}else if(message.equals("failed")){
        %>
        <img src="images/alert-16.png" alt="Computer Man" style="width:23px;height:23px;" autofocus> <font color="#ff0000">Voter not Found</font>

        <%}}%>

        </div>
    </form>
    <div style="width: 100%;height: 50vh">

    </div>
<div style="align-content: end">
    <jsp:include page="adminFooter.jsp"></jsp:include>
</div>
</div>

</body>
</html>
