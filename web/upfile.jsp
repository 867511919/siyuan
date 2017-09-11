<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/9/7
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <title>资料上传</title>
</head>
<body>
<form action="/servlet/UploadHandleServlet" enctype="multipart/form-data" methon="post">


</form>


</body>
</html>
