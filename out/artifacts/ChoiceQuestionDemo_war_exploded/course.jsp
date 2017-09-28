<%--
  Created by IntelliJ IDEA.
  User: zhangyan
  Date: 2017/9/25
  Time: 上午9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>课程创建</title>
</head>
<body>
<h1>
    课程创建
</h1>
<form action="${pageContext.request.contextPath}/servlet/CourseServlet" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>标题：</td>
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td>封面：</td>
            <td><input type="file" name="cover"/></td>
        </tr>

        <tr>
            <td>视频文件：</td>
            <td><input type="file" name="filepath"/></td>
        </tr>

        <tr>
            <td>价格：</td>
            <td><input type="text" name="price"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="确定"/></td>
        </tr>

    </table>

</form>

<form action="${pageContext.request.contextPath}/servlet/CourseServlet" method="post">

    <table>
        <tr>
            <td>标题：</td>
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td>封面：</td>
            <td><input type="text" name="cover"/></td>
        </tr>

        <tr>
            <td>视频文件：</td>
            <td><input type="text" name="filepath"/></td>
            <td>（请输入完整的文件路径）</td>>
        </tr>

        <tr>
            <td>断点设置</td>
            <td> <input type="text" class="input-xlarge datepicker" id="date01" value="00:00:00" name="startTime"></td>

        </tr>


        <tr>
            <td>描述：</td>
            <td><input type="text" name="description"/></td>
        </tr>


        <tr>
            <td>价格：</td>
            <td><input type="text" name="price"/></td>
        </tr>




        <tr>
            <td colspan="2"><input type="submit" value="确定"/></td>
        </tr>

    </table>


</form>



</form>
<!-- start: JavaScript-->

<script src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/jquery-migrate-1.0.0.min.js"></script>

<script src="<%=basePath%>/js/jquery-ui-1.10.0.custom.min.js"></script>

<script src="<%=basePath%>/js/jquery.ui.touch-punch.js"></script>

<script src="<%=basePath%>/js/modernizr.js"></script>

<script src="<%=basePath%>/js/bootstrap.min.js"></script>

<script src="<%=basePath%>/js/jquery.cookie.js"></script>

<script src='<%=basePath%>/js/fullcalendar.min.js'></script>

<script src='<%=basePath%>/js/jquery.dataTables.min.js'></script>

<script src="<%=basePath%>/js/excanvas.js"></script>
<script src="<%=basePath%>/js/jquery.flot.js"></script>
<script src="<%=basePath%>/js/jquery.flot.pie.js"></script>
<script src="<%=basePath%>/js/jquery.flot.stack.js"></script>
<script src="<%=basePath%>/js/jquery.flot.resize.min.js"></script>

<script src="<%=basePath%>/js/jquery.chosen.min.js"></script>

<script src="<%=basePath%>/js/jquery.uniform.min.js"></script>

<script src="<%=basePath%>/js/jquery.cleditor.min.js"></script>

<script src="<%=basePath%>/js/jquery.noty.js"></script>

<script src="<%=basePath%>/js/jquery.elfinder.min.js"></script>

<script src="<%=basePath%>/js/jquery.raty.min.js"></script>

<script src="<%=basePath%>/js/jquery.iphone.toggle.js"></script>

<script src="<%=basePath%>/js/jquery.uploadify-3.1.min.js"></script>

<script src="<%=basePath%>/js/jquery.gritter.min.js"></script>

<script src="<%=basePath%>/js/jquery.imagesloaded.js"></script>

<script src="<%=basePath%>/js/jquery.masonry.min.js"></script>

<script src="<%=basePath%>/js/jquery.knob.modified.js"></script>

<script src="<%=basePath%>/js/jquery.sparkline.min.js"></script>

<script src="<%=basePath%>/js/counter.js"></script>

<script src="<%=basePath%>/js/retina.js"></script>

<script src="<%=basePath%>/js/custom.js"></script>
<!-- end: JavaScript-->

</body>
</html>
