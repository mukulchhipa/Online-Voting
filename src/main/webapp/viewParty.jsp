
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


<%

    Connection con=null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "");
    String sql="select * from partytable";

    PreparedStatement statement=con.prepareStatement(sql);
    ResultSet rs=statement.executeQuery();

%>
<div class="limiter">
    <br><br><br><br>

    <div class="container-login100">
        <div class="wrap-login100">

            <form action="#" method="post" style="max-width:350px;margin:auto" >
                <center>
                    <div class="container" style="width: 400px">
                        <div style="align-content: center">
                            <ul style="align-content: center">
                                <li style="text-align: center"><a href="addParty.jsp">Add Party</a></li>
                                <li style="text-align: center"><a class="active" href="viewParty.jsp">View</a></li>
                                <li style="text-align: center"><a href="deleteParty.jsp">Delete</a></li>
                                </ul>
                        </div>
                        <h1>List of Parties</h1>

                        <hr>
                        <table id="party">
                            <tr><th>Party Code</th>
                            <th>Party Name</th>
                            </tr>
                            <% while (rs.next()){
                                String  partyCode=rs.getString(2);
                                String  partyName=rs.getString(3);

                            %>
                                <tr>
                                    <td><%=partyCode%></td>
                                    <td><%=partyName%></td>
                                </tr>
                            <%}%>
                        </table>
                    </div>

                </center>
            </form>

        </div>
        <jsp:include page="adminFooter.jsp"></jsp:include>
    </div>
</div>
</body>
</html>