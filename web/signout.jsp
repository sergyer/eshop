<%--
  Created by IntelliJ IDEA.
  User: Serg
  Date: 15-Nov-15
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<% session.invalidate();
  response.sendRedirect("home.jsp");
%>

</body>
</html>
