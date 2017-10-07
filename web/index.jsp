<%@ page import="dao.ChoiceDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.ChoiceQuestion" %>
<%@ page import="entity.course" %>
<%@ page import="dao.CourseDao" %>



<%--
  Created by IntelliJ IDEA.
  User: null
  Date: 2017/8/28
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
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




</head>

<body>
<!-- start: Header -->
<div class="navbar">
  <div class="navbar-inner">
    <div class="container-fluid">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="index.html"><span>管理系统</span></a>

      <!-- start: Header Menu -->
      <div class="nav-no-collapse header-nav">
        <ul class="nav pull-right">
          <li class="dropdown">
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
              <i class="halflings-icon white user"></i> <%=request.getAttribute("username")%>
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li class="dropdown-menu-title">
                <span>账户设置</span>
              </li>
              <li><a href="#"><i class="halflings-icon user"></i>账户详情</a></li>
              <li><a href="login.html"><i class="halflings-icon off"></i>注销</a></li>
            </ul>
          </li>
          <!-- end: User Dropdown -->
        </ul>
      </div>
      <!-- end: Header Menu -->

    </div>
  </div>
</div>
<!-- start: Header -->

<div class="container-fluid-full">
  <div class="row-fluid">

    <!-- start: Main Menu -->
    <div id="sidebar-left" class="span2">
      <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
          <li><a href="index.html"><i class="icon-bar-chart"></i><span class="hidden-tablet">管理首页</span></a></li>
          <!--
                                  <li><a href="messages.html"><i class="icon-envelope"></i><span class="hidden-tablet"> Messages</span></a></li>
                                  <li><a href="tasks.html"><i class="icon-tasks"></i><span class="hidden-tablet"> Tasks</span></a></li>
                                  <li><a href="ui.html"><i class="icon-eye-open"></i><span class="hidden-tablet"> UI Features</span></a></li>
                                  <li><a href="widgets.html"><i class="icon-dashboard"></i><span class="hidden-tablet"> Widgets</span></a></li>
          -->
          <li>
            <a class="dropmenu" href="#"><i class="icon-folder-close-alt"></i><span class="hidden-tablet">试题上传</span></a>
            <ul>
              <li><a class="submenu" href="submenu.html"><i class="icon-file-alt"></i><span class="hidden-tablet">选择题</span></a></li>
              <li><a class="submenu" href="submenu2.html"><i class="icon-file-alt"></i><span class="hidden-tablet">填空题</span></a></li>
              <li><a class="submenu" href="submenu3.html"><i class="icon-file-alt"></i><span class="hidden-tablet">判断题</span></a></li>
              <li><a class="submenu" href="submenu4.html"><i class="icon-file-alt"></i><span class="hidden-tablet">应用题</span></a></li>
              <li><a class="submenu" href="submenu5.html"><i class="icon-file-alt"></i><span class="hidden-tablet">真题题</span></a></li>
              <li><a class="submenu" href="submenu6.html"><i class="icon-file-alt"></i><span class="hidden-tablet">模拟题</span></a></li>
              <li><a class="submenu" href="submenu7.html"><i class="icon-file-alt"></i><span class="hidden-tablet">冲刺题</span></a></li>
            </ul>
          </li>
          <!--
                                  <li><a href="form.html"><i class="icon-edit"></i><span class="hidden-tablet"> Forms</span></a></li>
                                  <li><a href="chart.html"><i class="icon-list-alt"></i><span class="hidden-tablet"> Charts</span></a></li>
                                  <li><a href="typography.html"><i class="icon-font"></i><span class="hidden-tablet"> Typography</span></a></li>
          -->
          <li><a href="gallery.html"><i class="icon-picture"></i><span class="hidden-tablet">录播转播</span></a></li>
          <!--
                                  <li><a href="table.html"><i class="icon-align-justify"></i><span class="hidden-tablet"> Tables</span></a></li>
                                  <li><a href="calendar.html"><i class="icon-calendar"></i><span class="hidden-tablet"> Calendar</span></a></li>
                                  <li><a href="file-manager.html"><i class="icon-folder-open"></i><span class="hidden-tablet"> File Manager</span></a></li>
                                  <li><a href="icon.html"><i class="icon-star"></i><span class="hidden-tablet"> Icons</span></a></li>
                                  <li><a href="login.html"><i class="icon-lock"></i><span class="hidden-tablet"> Login Page</span></a></li>
          -->
        </ul>
      </div>
    </div>
    <!-- end: Main Menu -->

    <noscript>
      <div class="alert alert-block span10">
        <h4 class="alert-heading">Warning!</h4>
        <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
      </div>
    </noscript>

    <!-- start: Content -->
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
                <th>用户</th>
                <th>创建时间</th>
                <th>标题</th>
                <th>难度</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>

              <%

                CourseDao courseDao=new CourseDao();
                ArrayList<course> list1=courseDao.GetAllCourse();
                if(list1!=null&&list1.size()>0) {
                  for (int i = 0; i < list1.size(); i++) {
                    course cr = list1.get(i);
                    System.out.println(cr.getTitle());


                  }
                }



                ChoiceDAO choiceDAO=new ChoiceDAO();
                ArrayList<ChoiceQuestion> list=choiceDAO.getAllQuestion();
                if(list!=null&&list.size()>0){
                    for(int i=0;i<list.size();i++){
                        ChoiceQuestion cq=list.get(i);
              %>
              <tr>
                <td>Admin</td>
                <td class="center">2017/08/01</td>
                <td class="center"><%=cq.getTitle()%></td>
                <td class="center">
                  <span class="label label-success"><%=cq.getRank()%></span>
                </td>
                <td class="center">
                  <a class="btn btn-success" href="servlet/ChoiceQuestionServlet?scanid=<%=cq.getId()%>" >
                    <i class="halflings-icon white zoom-in"></i>
                  </a>
                  <a class="btn btn-info" href="servlet/ChoiceQuestionServlet?updateid=<%=cq.getId()%>">
                    <i class="halflings-icon white edit"></i>
                  </a>
                  <a class="btn btn-danger" href="servlet/ChoiceQuestionServlet?qid=<%=cq.getId()%>">
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

    <!-- end: Content -->
  </div><!--/#content.span10-->
</div><!--/fluid-row-->

<div class="modal hide fade" id="myModal">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">×</button>
    <h3>上传题目</h3>
  </div>
  <div class="modal-body">
    <!--
                <p>Here settings can be configured...</p>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn" data-dismiss="modal">Close</a>
                <a href="#" class="btn btn-primary">Save changes</a>
    -->
    <div class="row-fluid sortable">
      <div class="box span12">
        <div class="box-header" data-original-title>
          <h2><i class="halflings-icon white edit"></i><span class="break"></span>Form Elements</h2>
          <div class="box-icon">
            <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
            <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
            <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
          </div>
        </div>
        <div class="box-content">
          <form class="form-horizontal">
            <fieldset>
              <div class="control-group">
                <label class="control-label" for="typeahead">Auto complete </label>
                <div class="controls">
                  <input type="text" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
                  <p class="help-block">Start typing to activate auto complete!</p>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label" for="date01">Date input</label>
                <div class="controls">
                  <input type="text" class="input-xlarge datepicker" id="date01" value="02/16/12">
                </div>
              </div>

              <div class="control-group">
                <label class="control-label" for="fileInput">File input</label>
                <div class="controls">
                  <input class="input-file uniform_on" id="fileInput" type="file">
                </div>
              </div>
              <div class="control-group hidden-phone">
                <label class="control-label" for="textarea2">Textarea WYSIWYG</label>
                <div class="controls">
                  <textarea class="cleditor" id="textarea2" rows="3"></textarea>
                </div>
              </div>
              <div class="form-actions">
                <button type="submit" class="btn btn-primary">Save changes</button>
                <button type="reset" class="btn">Cancel</button>
              </div>
            </fieldset>
          </form>

        </div>
      </div><!--/span-->

    </div>
  </div>
</div>

<div class="clearfix"></div>

<footer>

  <p>
    <span style="text-align:left;float:left">&copy; 2018 <a href="downloads/janux-free-responsive-admin-dashboard-template/" alt="Bootstrap_Metro_Dashboard"> 管理后台</a></span>

  </p>

</footer>

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
<!-- end: JavaScript-->wq2

</body>
</html>
