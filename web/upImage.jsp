<%--
  Created by IntelliJ IDEA.
  User: zhangyan
  Date: 2017/10/7
  Time: 下午8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>上传图片</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/servlet/UploadHandleServlet" enctype="multipart/form-data" method="post">
        <input type="file" name="file">

        <input type="submit" value="提交">
    </form>


</body>
</html>
