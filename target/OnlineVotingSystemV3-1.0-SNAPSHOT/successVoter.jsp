<%--
  Created by IntelliJ IDEA.
  User: mukul
  Date: 19-05-2021
  Time: 19:18
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
<div class="limiter">
  <div class="container-login100">
    <div class="wrap-login100">
      <form action="#" method="post" style="max-width:350px;margin:auto">
        <center>
          <div class="container">
            <h1>Thank You!</h1>
            <img src="images/ok-16.png" alt="Computer Man" style="width:23px;height:23px;">  <font color="#1B9B3E">We have received your vote. </font>
          </div>
          <div>
            <img src="images/smiley.png" alt="Computer Man" style="width:100px;height:100px;">
          </div>
          <div class="container signin">
            <small><p>Create an account? <a href="register.jsp">Sign up</a>.</p></small>
          </div>
        </center>
      </form>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </div>
</div>


</body>
</html>
