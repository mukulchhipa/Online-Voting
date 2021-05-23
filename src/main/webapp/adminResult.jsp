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
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Collections" %>


<%
    String s1 = (String) session.getAttribute("adminName");

    HashMap<String, String> count = new HashMap<String, String>();
    HashMap<String, Integer> countInt = new HashMap<String, Integer>();

    Connection con=null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "");
    String sql="select * from partytable";

    PreparedStatement statement=con.prepareStatement(sql);
    ResultSet rs=statement.executeQuery();

    Statement stmt = con.createStatement();
    ResultSet resultSet = stmt.executeQuery("select voter,count(voter) as c from voter group by voter");
    int i = 0;

    while (resultSet.next()) {
        count.put(resultSet.getString("voter"), resultSet.getString("c"));
        countInt.put(resultSet.getString("voter"), Integer.parseInt(resultSet.getString("c")));
    }
%>
<div class="limiter">
    <br><br><br><br>

    <div class="container-login100">
        <div class="wrap-login100">

            <form action="#" method="post" style="max-width:350px;margin:auto" >

                    <div class="container" style="width: 700px">
                            <ul style="align-content: center">
                                <li style="text-align: center" class="active"><h1>Results</h1></li>
                            </ul>

                        <hr>
                        <div class="container-table">
                        <table class="table-all" >
                            <tr  style="text-align: center">
                                <th  style="text-align: center">Party Code</th>
                                <th  style="text-align: center">Party Name</th>
                                <th  style="text-align: center">No. of Votes</th>
                                <th > </th>
                            </tr>
                            <% while (rs.next()){
                                String  partyCode=rs.getString(2);
                                String  partyName=rs.getString(3);
                                String votes = count.get(partyCode);

                                Integer winner = Collections.max(countInt.values());
                            %>
                            <tr >
                                <td  style="text-align: center"><%=partyCode%></td>
                                <td  style="text-align: center"><%=partyName%></td>
                                <td  style="text-align: center"><%=votes%></td>
                                <td  style="text-align: center">
                                    <% if(winner.equals(Integer.parseInt(votes))){%>
                                    <%="Winner"%></td>
                                <%}%>
                            </tr>
                            <%}%>
                        </table>
                        </div>
                    </div>


            </form>

        </div>
        <jsp:include page="adminFooter.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
