<%@ page import="dao.CourseDao" %>
<%@ page import="entity.ChoiceQuestion" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.course" %>

<%--import db.DBUtil;--%>
<%--import entity.ChoiceQuestion;--%>
<%--import entity.course;--%>
<%--import server.APIUtil;--%>
<%--import server.AliBaBa;--%>

<%--import java.io.IOException;--%>
<%--import java.security.InvalidKeyException;--%>
<%--import java.security.NoSuchAlgorithmException;--%>
<%--import java.sql.*;--%>
<%--import java.util.ArrayList;--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>

    <!-- start: Meta -->
    <meta charset="utf-8">
    <title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
    <meta name="description" content="Bootstrap Metro Dashboard">
    <meta name="author" content="Dennis Ji">
    <meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <!-- end: Meta -->

    <!-- start: Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- end: Mobile Specific -->

    <!-- start: CSS -->
    <link id="bootstrap-style" href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link id="base-style" href="<%=basePath%>/css/style.css" rel="stylesheet">
    <link id="base-style-responsive" href="<%=basePath%>/css/style-responsive.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
    <!-- end: CSS -->


    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link id="ie-style" href="<%=basePath%>/css/ie.css" rel="stylesheet">
    <![endif]-->

    <!--[if IE 9]>
    <link id="ie9style" href="<%=basePath%>/css/ie9.css" rel="stylesheet">
    <![endif]-->

    <!-- start: Favicon -->
    <link rel="shortcut icon" href="<%=basePath%>/img/favicon.ico">
    <!-- end: Favicon -->




    <title>视频管理</title>
</head>
<body>
<div id="content" class="span10">


    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">首页</a>
            <i class="icon-angle-right"></i>
        </li>
        <li><a href="#">选择题</a></li>
    </ul>
    <div class="row-fluid sortable">
        <div class="box span12">
            <div class="box-header" data-original-title>
                <h2><em class="halflings-icon white user"></em><span class="break"></span>选择题</h2>
                <div class="box-icon">
                    <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                    <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                    <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
                </div>
            </div>
            <div class="box-content">
                <table class="table table-striped table-bordered bootstrap-datatable datatable">
                    <thead>
                    <tr>
                        <th>标题</th>
                        <th>视频ID</th>
                        <th>创建时间</th>
                        <th>修改时间</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%

                    %>

                    <%
                        CourseDao courseDao=new CourseDao();
                        ArrayList<course> list=courseDao.GetAllCourse();
                        if(list!=null&&list.size()>0) {
                            for (int i = 0; i < list.size(); i++) {
                                course cr = list.get(i);

                    %>
                    <tr>

                        <td>Admin</td>
                        <td class="center">2017/08/01</td>
                        <td class="center"><%=cr.getTitle()%></td>
                        <td class="center">
                            <span class="label label-success"></span>
                        </td>
                        <td class="center">
                            <a class="btn btn-success" href="servlet/ChoiceQuestionServlet?scanid=" >
                                <i class="halflings-icon white zoom-in"></i>
                            </a>
                            <a class="btn btn-info" href="servlet/ChoiceQuestionServlet?updateid=">
                                <i class="halflings-icon white edit"></i>
                            </a>
                            <a class="btn btn-danger" href="servlet/ChoiceQuestionServlet?qid=">
                                <i class="halflings-icon white trash"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>







                    </tbody>
                </table>
            </div>
        </div><!--/span-->

    </div><!--/row-->


</div><!--/.fluid-container-->
<!-- start: JavaScript-->

<script src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/jquery-migrate-1.0.0.min.js"></script>

<script src="<%=basePath%>/js/jquery-ui-1.10.0.custom.min.js"></script>

<script src="<%=basePath%>/js/jquery.ui.touch-punch.js"></script>

<script src="<%=basePath%>/js/modernizr.js"></script>

<script src="<%=basePath%>/js/bootstrap.min.js"></script>

<script src="<%=basePath%>/js/jquery.cookie.js"></script>

<script src="<%=basePath%>/js/fullcalendar.min.js"></script>

<script src="<%=basePath%>/js/jquery.dataTables.min.js"></script>

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
</body>
</html>
