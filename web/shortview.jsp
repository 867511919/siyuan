<%@ page import="entity.ChoiceQuestion" %><%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/9/4
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>单条信息</title>
</head>
<body>
<h1>单条信息</h1>
<%
    ChoiceQuestion cq= (ChoiceQuestion) request.getAttribute("question");
%>
<%=cq.toString()%>

</body>
</html>
