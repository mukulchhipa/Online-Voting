<%--
  Created IN IntelliJ IDEA.
  User: mukul
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/body.css" rel='stylesheet' type='text/css' />
</head>
<body >
<%
    String message= request.getParameter("msg");
%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form action="AdminRegister" method="post" style="max-width:350px;margin:auto">
                <center>
                    <div class="container">
                        <h1>Register</h1>
                        <p>Please fill in this form to create an account.</p>
                        <hr>

                        <input type="text" placeholder="Enter Fullname" name="name" required>


                        <input type="password" placeholder="Enter Password" name="password" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 3}$">
                        <hr>
                        <small><p>By creating an account you agree to our<a href="termsNConditions.jsp">Terms & Privacy</a>.</p></small>
                        <button type="submit" class="btn">Register</button>
                    </div>
                    <div class="container signin">
                        <% if(message!=null){
                            if(message.equals("failed")){%>
                        <img src="images/alert-16.png" alt="Computer Man" style="width:23px;height:23px;" autofocus> <font color="#ff0000">Failed to Register</font>
                        <%}}%>
                        <small><p>Already have an account? <a href="adminPanel.jsp">Sign in</a>.</p></small>
                    </div>
                </center>
            </form>
            <div class="login100-more" style="background-image: url('images/vote.png');">
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
