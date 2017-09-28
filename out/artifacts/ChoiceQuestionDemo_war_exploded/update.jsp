<%@ page import="entity.ChoiceQuestion" %>
<%@ page import="dao.ChoiceDAO" %><%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/9/4
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    ChoiceQuestion cq= (ChoiceQuestion) request.getAttribute("question");
%>
<body>
<form action="updateServlet" method="post">
        <table>
            <tr>
                <td>Id：</td>
                <td><input type="text" name="id" value="<%=cq.getId()%>"/></td>
            </tr>

            <tr>
                <td>标题：</td>
                <td><input type="text" name="title" value="<%=cq.getTitle()%>"/></td>
            </tr>
            <tr>
                <td>难度：</td>
                <td><input type="text" name="rank" value="<%=cq.getRank()%>"/></td>
            </tr>

            <tr>
                <td>题干：</td>
                <td><input type="text" name="body" value="<%=cq.getBody()%>" /></td>
            </tr>

            <tr>
                <td>A：</td>
                <td><input type="text" name="A" value="<%=cq.getDetailA()%>"/></td>
            </tr>

            <tr>
                <td>B：</td>
                <td><input type="text" name="B" value="<%=cq.getDetailB()%>"/></td>
            </tr>

            <tr>
                <td>C：</td>
                <td><input type="text" name="C" value="<%=cq.getDetailC()%>"/></td>
            </tr>

            <tr>
                <td>D：</td>
                <td><input type="text" name="D" value="<%=cq.getDetailD()%>"/></td>
            </tr>

            <tr>
                <td>题目解答：</td>
                <td><input type="text" name="explain" value="<%=cq.getExplain()%>"/></td>
            </tr>

            <tr>
                <td>答案：</td>
                <td><input type="text" name="std" value="<%=cq.getStd()%>"/></td>
            </tr>



            <tr>
                <td colspan="2"><input type="submit" value="修改"/></td>
            </tr>

        </table>

</form>
</body>
</html>
