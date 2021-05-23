<%--
  Created by IntelliJ IDEA.
  User: mukul
  Date: 09-05-2021
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/body.css" rel='stylesheet' type='text/css' />
    <script type="text/javascript" src="js/formValidation.js"></script>
</head>
<body >
<script type="text/javascript">
    <% String message=request.getParameter("msg");
                            if(message!=null){
                            if(message.equals("date"))%>

    alert("Please enter valid date! You should be 18 to give vote");
    window.location.href="register.jsp";
    <%}%>
</script>
<jsp:include page="header.jsp"></jsp:include>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form action="Register" name="register" method="post" onsubmit="return regValid()" style="max-width:350px;margin:auto">
                <center>
                    <div class="container">
                        <h1>Register</h1>
                        <p>Please fill in this form to create an account.</p>
                        <hr>
                        <input type="text" id="voterid" placeholder="Enter Voter card number" name="voter_card_number" required >

                        <input type="text" id="name" placeholder="Enter Fullname" name="name" required>

                        <input type="text"  id="username" placeholder="Enter Username" name="username" required >

                        <select type="text" id="gender" name="gender" required>
                            <option disabled="disabled" selected="selected">Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>


                        <input type="date" id="dob" placeholder="Enter date of birth" name="dob" required>

                        <input type="email" id="email" placeholder="Enter Email" name="email" required >

                        <input type="password" id="password" placeholder="Enter Password" name="password" required >
                        <hr>
                        <small><p>By creating an account you agree to our<a href="termsNConditions.jsp">Terms & Privacy</a>.</p></small>
                        <button type="submit" class="btn">Register</button>
                    </div>
                    <div class="container signin">
                        <% if(message!=null){
                            if(message.equals("failed")){%>
                        <img src="images/alert-16.png" alt="Computer Man" style="width:23px;height:23px;" autofocus> <font color="#ff0000">Failed to Register</font>
                        <%}}%>
                        <small><p>Already have an account? <a href="home.jsp">Sign in</a>.</p></small>
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
