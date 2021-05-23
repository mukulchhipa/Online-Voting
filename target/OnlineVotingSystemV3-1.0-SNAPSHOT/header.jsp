<%--
  Created by IntelliJ IDEA.
  User: mukul
  Date: 09-05-2021
  Time: 18:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Election</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta charset="UTF-8">
    <link href="css/body.css" rel='stylesheet' type='text/css' />

</head>
<body>

<% if(session.getAttribute("uname")!=null){
    %>
<ul>
    <li><a class="active" aria-disabled="true">${sessionScope.uname }</a></li>
    <li style="float:right"><a href="logout.jsp">Logout</a></li>
    <li style="float:right"><a href="about.jsp">About</a></li>
    <li style="float:right"><a href="contact.jsp">Contact us</a></li>
</ul>
<%
}else{
%>
<ul>
    <li><a class="active" href="home.jsp">Home</a></li>
    <li style="float:right"><a href="adminPanel.jsp">Admin</a></li>
    <li style="float:right"><a href="register.jsp">Signup</a></li>
    <li style="float:right"><a href="about.jsp">About</a></li>
    <li style="float:right"><a href="contact.jsp">Contact us</a></li>
</ul>
<%
    }%>
</body>
</html>