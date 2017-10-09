<%--
  Created by IntelliJ IDEA.
  User: zhangyan
  Date: 2017/10/9
  Time: 下午3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>新增断点</title>

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
    <link id="ie-style" href="css/ie.css" rel="stylesheet">
    <![endif]-->

    <!--[if IE 9]>
    <link id="ie9style" href="css/ie9.css" rel="stylesheet">
    <![endif]-->

    <!-- start: Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- end: Favicon -->
    <style type="text/css">

        .black_content{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);
        }
        .white_content {
            position: absolute;
            top: 10%;
            left: 20%;
            height:auto;
            border: 0px solid #0099FF;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }


    </style>




</head>
<body>

    <div id="MyDiv" class="white_content">
        <div style="text-align: right; cursor: default; width: 800px;
">
            <!--  <span style="font-size: 16px;" onclick="CloseDiv('MyDiv','fade')">关闭</span>-->
        </div>

        <div class="container-fluid-full">
            <div class="row-fluid">
                <div class="container-fluid-full">

                    <div class="row-fluid sortable">
                        <div class="box span12" style="border: 0px">
                            <div  class="box-header" data-original-title>
                                <h2 >设置断点</h2>
                                <div  class="box-icon">
                                </div>
                            </div>

                                <div class="box-content">
                                    <form id="inform1" class="form-horizontal" action="${pageContext.request.contextPath}/servlet/upBreakPointServlet" method="post">
                                        <fieldset>
                                            <div class="control-group" >

                                                <label  class="control-label" for="typeahead">movid</label>
                                                <div class="controls">
                                                    <input type="text" name="movid" class="span6 typeahead" id="typeahead"  data-provide="typeahead" value=<%=request.getAttribute("movid")%> data-items="4" onfocus="javascript:if(this.value=='请输入内容')this.value='';">
                                                </div>
                                            </div>


                                            <div class="control-group" >

                                                <label  class="control-label" for="typeahead">断点时间</label>
                                                <div class="controls">
                                                    <input type="text" name="time" class="span6 typeahead" id="typeahead"  data-provide="typeahead" value="请输入内容" data-items="4" onfocus="javascript:if(this.value=='请输入内容')this.value='';">
                                                </div>
                                            </div>

                                            <hr/>
                                            <h2>题目1：<h2>
                                                <hr/>


                                                <div class="control-group" >

                                                    <label  class="control-label" for="typeahead">标题 </label>
                                                    <div class="controls">
                                                        <input type="text" name="title1" class="span6 typeahead" id="typeahead"  data-provide="typeahead" value="请输入内容" data-items="4" onfocus="javascript:if(this.value=='请输入内容')this.value='';">
                                                    </div>
                                                </div>


                                                <div class="control-group">
                                                    <label class="control-label" for="fileInput">题干</label>
                                                    <div class="controls">
                                                        <input  class="input-file uniform_on" name="body1" id="fileInput" type="text">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="fileInput">A</label>
                                                    <div class="controls">
                                                        <input  class="input-file uniform_on" name="A1" id="fileInput" type="text">

                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="fileInput">B</label>
                                                    <div class="controls">
                                                        <input  class="input-file uniform_on" name="B1" id="fileInput" type="text">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label"  for="fileInput">C</label>
                                                    <div class="controls">
                                                        <input  class="input-file uniform_on" name="C1" id="fileInput" type="text">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="fileInput">D</label>
                                                    <div class="controls">
                                                        <input  class="input-file uniform_on" name="D1" id="fileInput" type="text">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label" for="fileInput">解析</label>
                                                    <div class="controls">
                                                        <input  class="input-file uniform_on" name="desc1" id="fileInput" type="text">
                                                    </div>
                                                </div>


                                                <hr/>
                                                <h2>题目2：<h2>
                                                    <hr/>


                                                    <div class="control-group" >

                                                        <label  class="control-label" for="typeahead">标题 </label>
                                                        <div class="controls">
                                                            <input type="text" name="title2" class="span6 typeahead" id="typeahead"  data-provide="typeahead" value="请输入内容" data-items="4" onfocus="javascript:if(this.value=='请输入内容')this.value='';">
                                                        </div>
                                                    </div>


                                                    <div class="control-group">
                                                        <label class="control-label" for="fileInput">题干</label>
                                                        <div class="controls">
                                                            <input  class="input-file uniform_on" name="body2" id="fileInput" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label" for="fileInput">A</label>
                                                        <div class="controls">
                                                            <input  class="input-file uniform_on" name="A2" id="fileInput" type="text">

                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label" for="fileInput">B</label>
                                                        <div class="controls">
                                                            <input  class="input-file uniform_on" name="B2" id="fileInput" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label"  for="fileInput">C</label>
                                                        <div class="controls">
                                                            <input  class="input-file uniform_on" name="C2" id="fileInput" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label" for="fileInput">D</label>
                                                        <div class="controls">
                                                            <input  class="input-file uniform_on" name="D2" id="fileInput" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label" for="fileInput">解析</label>
                                                        <div class="controls">
                                                            <input  class="input-file uniform_on" name="desc2" id="fileInput" type="text">
                                                        </div>
                                                    </div>




                                                    <div class="form-actions">
                                                        <button type="submit" class="btn btn-primary">确定</button>
                                                        <!--
                                                          <input id="quxiao" class="btn" type=button value="取消" >
                                                          -->
                                                        <input class="btn" value="取消" type="reset" name="reset"  onclick="CloseDiv('MyDiv','fade')">
                                                    </div>

                                        </fieldset>
                                    </form>

                                </div>

                        </div><!--/span-->

                    </div>

                </div>
            </div>
        </div>

    </div>




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
<!--end: JavaScript-->
</body>
</html>
