<%--
  Created by IntelliJ IDEA.
  User: mukul
  Date: 19-05-2021
  Time: 23:11
  To change this template use File | Settings | File Templates.
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
<% if(session.getAttribute("adminName")!=null){
%>
<ul>
    <li><a class="active" href="#" aria-disabled="true">${sessionScope.adminName }</a></li>
    <li style="float:right"><a href="adminLogout.jsp">Logout</a></li>
    <li style="float:right"><a href="adminRegister.jsp">New Admin</a></li>
    <li style="float:right"><a href="addParty.jsp">Party</a></li>
    <li style="float:right"><a href="adminResult.jsp">Results</a></li>
    <li style="float:right"><a href="adminVoter.jsp">Voters</a></li>
    <li style="float:right"><a href="home.jsp">User's Login</a></li>
</ul>

<%
}else{
%>

<ul>
    <li><a class="active" href="adminPanel.jsp">Home</a></li>
    <li style="float:right"><a href="adminRegister.jsp">New Admin</a></li>
    <li style="float:right"><a href="home.jsp">User's Login</a></li>
</ul>
<%
    }%>
</body>
</html>
