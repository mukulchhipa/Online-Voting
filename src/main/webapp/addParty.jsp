<%--
  Created by IntelliJ IDEA.
  User: mukul
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/body.css" rel='stylesheet' type='text/css' />
</head>
<body >
<%
    String message=request.getParameter("msg");
%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="limiter">
    <br><br><br><br>

    <div class="container-login100">
        <div class="wrap-login100">

            <form action="AddParty" method="post" style="max-width:350px;margin:auto" enctype="multipart/form-data">
                <center>
                    <div class="container" style="width: 400px">
                        <div style="align-content: center">
                            <ul style="align-content: center">
                                <li style="text-align: center"><a class="active" href="addParty.jsp">Add Party</a></li>
                                <li style="text-align: center"><a href="viewParty.jsp">View</a></li>
                                <li style="text-align: center"><a href="deleteParty.jsp">Delete</a></li>
                                </ul>
                        </div>
                        <h1>Add Party</h1>
                        <p>Please fill in this form to create an Party.</p>
                        <hr>
                        <input type="text" placeholder="Party Code(in UpperCase upto 5 Letters)" name="party_code" required>

                        <input type="text" placeholder="Enter Party Name" name="pName" required>

                        <input type="file" placeholder="Upload File" name="image" size="50">

                        <hr>

                        <button type="submit" class="btn">Submit</button>
                    </div>
                    <div class="container signin">
                        <% if(message!=null){
                            if(message.equals("success")){%>
                        <img src="images/ok-16.png" alt="Computer Man" style="width:23px;height:23px;">
                        <span style="color: #1B9B3E; ">Party Added Successfully </span>
                        <%}else if(message.equals("failed")){
                        %>
                        <img src="images/alert-16.png" alt="Computer Man" style="width:23px;height:23px;" autofocus> <font color="#ff0000">Failed to Add Party</font>
                        <%}}%>
                    </div>

                </center>
            </form>

        </div>
        <jsp:include page="adminFooter.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
