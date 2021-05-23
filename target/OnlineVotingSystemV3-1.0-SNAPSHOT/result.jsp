<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="css/body.css" rel='stylesheet' type='text/css'/>
</head>
<body>

<%
    String s1 = (String) session.getAttribute("adminname");

    HashMap<String, String> count = new HashMap<String, String>();

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select voter,count(voter) as c from voter group by voter");
    int i = 0;

    while (rs.next()) {
        count.put(rs.getString("voter"), rs.getString("c"));
    }

%>

<jsp:include page="header.jsp"></jsp:include>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form action="" method="post" style="max-width:1000px;margin:auto">
                <center>
                    <div class="container">
                        <h1>Result</h1>
                        <hr>
                        <div>
                            <div class="reg" style="padding-top: 35px;">

                                <center>
                                    <img src="images/bbjp.png" height="90x"
                                         width="90x"/> <%=count.get("BJP")%>
                                    <img src="images/inc.png" height="90x"
                                         width="90x"/> <%=count.get("INC")%>
                                    <img src="images/aap.png" height="90x"
                                         width="90x"/> <%=count.get("AAP")%>
                                    <img src="images/bsp.jpg" height="90x"
                                         width="90x"/> <%=count.get("BSP")%>
                                    <img src="images/cpi.png" height="90x"
                                         width="90x"/> <%=count.get("CPI")%>
                                </center>

                            </div>
                            <hr>
                        </div>
                    </div>
                    <div class="container signin">
                    </div>
                </center>
            </form>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
