<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/9/1
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选择题上传</title>
</head>
<body>
<h1>选择题上传</h1>
<form action="servlet/upServlet" name="upForm" method="post">
    <table>
        <tr>
            <td>标题：</td>
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td>难度：</td>
            <td><input type="text" name="rank"/></td>
        </tr>

        <tr>
            <td>题干：</td>
            <td><input type="text" name="body"/></td>
        </tr>

        <tr>
          <td>A：</td>
        <td><input type="text" name="A"/></td>
        </tr>

        <tr>
            <td>B：</td>
            <td><input type="text" name="B"/></td>
        </tr>

        <tr>
            <td>C：</td>
            <td><input type="text" name="C"/></td>
        </tr>

        <tr>
            <td>D：</td>
            <td><input type="text" name="D"/></td>
        </tr>

        <tr>
            <td>题目解答：</td>
            <td><input type="text" name="explain"/></td>
        </tr>

        <tr>
            <td>答案：</td>
            <td><input type="text" name="std"/></td>
        </tr>



        <tr>
            <td colspan="2"><input type="submit" value="确定"/></td>
        </tr>

    </table>

</form>


</body>
</html>
