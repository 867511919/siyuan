<%--
  Created by IntelliJ IDEA.
  User: zhangyan
  Date: 2017/10/7
  Time: 下午1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/servlet/upCourseServlet" name="upForm" method="post">
    <table>

        <tr>
            <td>标题</td>
            <td><input type="text" name="title"/><%=request.getParameter("title")%></td>
        </tr>

        <tr>
            <td>详细描述</td>
            <td><input type="text" name="desc"/></td>
        </tr>


        <tr>
            <td colspan="2"><input type="submit" value="下一步"/></td>
        </tr>

    </table>


</form>

</body>
</html>
