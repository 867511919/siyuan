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
        <table>

            <tr>
                <td>标题：</td>
                <td><input type="text" name="title" id="tit"/></td>
            </tr>

            <tr>
                <td>描述：</td>
                <td><input type="text" name="desc" id="desc"/></td>
            </tr>

            <tr>
                <td>选择封面：</td>
                <td><input type="file" name="file"></td>
            </tr>

            <tr>
                <td colspan="2"><input type="submit" value="获取上传通道"/></td>
            </tr>


        </table>

    </form>


</body>
</html>
