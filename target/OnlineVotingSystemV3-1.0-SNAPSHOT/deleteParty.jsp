<%--
  Created IN IntelliJ IDEA.
  User: mukul
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/body.css" rel='stylesheet' type='text/css' />
</head>
<body >
<jsp:include page="adminHeader.jsp"></jsp:include>

<%@ page import="java.sql.*" %>
<%@ page import="com.Dao.Dao" %>
<%
String input=null;
String message= request.getParameter("msg");
%>


<div class="limiter">
    <br><br><br><br>

    <div class="container-login100">
        <div class="wrap-login100">

            <form action="deleteParty.jsp" method="post" style="max-width:350px;margin:auto" >
                <center>
                    <div class="container" style="width: 400px">
                        <div style="align-content: center">
                            <ul style="align-content: center">
                                <li style="text-align: center"><a href="addParty.jsp">Add Party</a></li>
                                <li style="text-align: center"><a  href="viewParty.jsp">View</a></li>
                                <li style="text-align: center"><a class="active" href="deleteParty.jsp">Delete</a></li>

                            </ul>
                        </div>
                        <h1>Remove Party</h1>
                        <p>To remove party enter Party Code</p>
                        <hr>
                        <input type="text" placeholder="Party Code" name="party_code" required>

                        <hr>
                        <button type="submit" class="btn">Submit</button>

                        <%
                            input=request.getParameter("party_code");
                        if(input!=null) {

                            int pid = Dao.getId(input);

                            Connection con = null;
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "");
                            String sql = "delete from partytable where pid=?";

                            PreparedStatement statement = con.prepareStatement(sql);
                            statement.setInt(1, pid);
                            int rs = statement.executeUpdate();

                            if (rs != 0) {
                                response.sendRedirect("deleteParty.jsp?msg=success");
                            } else {


                                response.sendRedirect("deleteParty.jsp?msg=failed");

                            }
                        }
                            %>


                    </div>
                    <div class="container signin">
                        <% if(message!=null){
                            if(message.equals("success")){%>
                        <img src="images/ok-16.png" alt="Computer Man" style="width:23px;height:23px;">  <font color="#1B9B3E">Deleted successfully </font>
                        <%}else if(message.equals("failed")){
                        %>
                        <img src="images/alert-16.png" alt="Computer Man" style="width:23px;height:23px;" autofocus> <font color="#ff0000">Failed to Delete</font>

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
