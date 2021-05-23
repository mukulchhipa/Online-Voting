<%--
  Created by IntelliJ IDEA.
  User: mukul
  Date: 09-05-2021
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/body.css" rel='stylesheet' type='text/css' />

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form action="admin" method="post" style="max-width:1000px;margin:auto">
                <center>
                    <div class="container">
                        <h1>About us</h1>
                        <hr>
                        <p align="left">We provide platform for online fair voting.</p>
                        <address>
                            <small><p><img src="images/gmail.png"  style="width:23px;height:23px;"> You can contact us? <a href="mailto:chhipa.mukul@gmail.com">Gmail</a>.</p></small>

                            <small><p><img src="images/github-logo.png"  style="width:23px;height:23px;"> You can contact us? <a href="https://github.com/mukulchhipa/Online-Voting">Github</a>.</p></small>

                            <small><p><img src="images/linkedin.png"  style="width:23px;height:23px;"> You can contact us? <a href="https://www.linkedin.com/in/chhipa-mukul">Linkedin</a>.</p></small>
                        </address>
                        <hr>
                    </div>
                    <div class="container signin">
                        <small><p>You have any advice? <a href="contact.jsp">Contact us</a>.</p></small>
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
