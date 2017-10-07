<%@ page import="entity.course" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.BreakPoint" %><%--
  Created by IntelliJ IDEA.
  User: zhangyan
  Date: 2017/10/5
  Time: 下午2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>课程修改</title>
    <meta charset="UTF-8">
    <title>新增录播课程1</title>

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
            display: none;
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

    <script type="text/javascript">
        function getFileUrl(sourceId) {
            var url;
            if (navigator.userAgent.indexOf("MSIE")>=1) { // IE
                url = document.getElementById(sourceId).value;
            } else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
            } else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome
                url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
            }
            return url;
        }
        function preImg(sourceId, targetId) {
            var url = getFileUrl(sourceId);
            var imgPre = document.getElementById(targetId);
            imgPre.src = url;
        }


        var i = 1;
        $(".td").each(function(){
            $(this).html(i++);
        })


        function fun(){
            var $td = $("#a").clone();       //增加一行,克隆第一个对象
            $(".table").append($td);
            var i = 1;
            $(".td").each(function(){       //增加一行后重新更新序号1,2,3......
                $(this).html(i++);
            })
            //  $("table tr:last").find(":input").val('');   //将尾行元素克隆来的保存的值清空
        }

        function del(){
            $("table tr:not(:first):not(:first):last").remove();      //移除最后一行,并且保留前两行
        }

        //弹出隐藏层
        function ShowDiv(show_div,bg_div){
            document.getElementById(show_div).style.display='block';
            document.getElementById(bg_div).style.display='block' ;
            var bgdiv = document.getElementById(bg_div);
            bgdiv.style.width = document.body.scrollWidth;
// bgdiv.style.height = $(document).height();
            $("#"+bg_div).height($(document).height());
        }
        //关闭弹出层
        function CloseDiv(show_div,bg_div)
        {
            document.getElementById(show_div).style.display='none';
            document.getElementById(bg_div).style.display='none';
        }

        //form表单重新加载
        function qingkong() {
            $("input[type=reset]").trigger("click");

        }



    </script>

</head>
<body>

<div class="container-fluid-full">
    <div class="row-fluid">
        <div class="container-fluid-full">

            <div class="row-fluid sortable">
                <div class="box span12">
                    <div class="box-header" data-original-title>
                        <h2><i class="halflings-icon white edit"></i><span class="break"></span>新增录播课程</h2>
                        <div class="box-icon">
                            <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
                            <a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
                            <a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
                        </div>
                    </div>
                    <div class="box-content">
                        <%
                            course cs= (course) request.getAttribute("course");
                            request.setAttribute("movid",cs.getMovid());
                        %>
                        <form class="form-horizontal" action="${pageContext.request.contextPath}/servlet/MaCourseServlet?movid=<%=cs.getMovid()%>" method="post">


                            <fieldset>
                                <div class="control-group">

                                    <label class="control-label" for="typeahead">标题 </label>
                                    <div class="controls">
                                        <input type="text" name="title" class="span6 typeahead" id="typeahead"  data-provide="typeahead" value=<%=cs.getTitle()%> data-items="4" onfocus="javascript:if(this.value=='请输入内容')this.value='';">
                                    </div>
                                </div>

                                <div class="control-group">

                                    <label class="control-label" for="typeahead">描述 </label>
                                    <div class="controls">
                                        <input type="text" name="desc" class="span6 typeahead" id="typeahead"  data-provide="typeahead" value="<%=cs.getDescription()%>" data-items="4" onfocus="javascript:if(this.value=='请输入内容')this.value='';">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="fileInput">文件</label>
                                    <div class="controls">
                                        <input  class="input-file uniform_on" id="fileInput" type="file">
                                    </div>
                                </div>

                                <!--
                                <div class="control-group hidden-phone">
                                    <label class="control-label" for="textarea2">断点</label>
                                    <div class="controls">
                                        <input  id="bptext1" type="text" value="1" >
                                        <input id="bptext2" type="text" value="2">
                                        <input id="bptext3" type="text" value="3">
                                        <i class="glyphicons-icon circle_plus"></i>
                                        <button type="submit" class="btn btn-primary"> 确定</button>
                                    </div>cellpadding="5%" cellspacing="25%" border="1"
                                    </div>
                                -->
                                <div class="control-group">
                                    <label class="control-label" >断点</label>
                                    <div class="controls">

                                        <table   class="table table-striped table-bordered ">
                                                <thead>
                                            <tr  >
                                                    <th>数量</th>
                                                    <th>断点</th>
                                                    <th>题目一</th>
                                                    <th>题目二</th>
                                            <th>添加</th>
                                                </tr>
                                            </thead>
                                            <%
                                                ArrayList<BreakPoint> list=new ArrayList<BreakPoint>();
                                                list= (ArrayList<BreakPoint>) request.getAttribute("bplist");
                                                if(list!=null&&list.size()>0) {
                                                    for (int i = 0; i < list.size(); i++) {
                                                        BreakPoint bp = list.get(i);
                                            %>



                                                <tbody>
                                            <tr id="a">
                                                     
                                                    <td class="td">1</td>
                                                    <td><input  type="text" name="" value="<%=bp.getStartTime()%>"></td>
                                                    <td><input  type="text" name=""></td>
                                                    <td><input  type="text" name=""></td>
                                                    <td><input id="Button" type="button"  value="添加" onclick="ShowDiv('MyDiv','fade')"></td>
                                             </tr>

                                        <%
                                                }
                                            }
                                        %>
                                        </tbody>




                                               
                                                
                                                     
                                                

                                                 
                                        </table>

                                        <i class="glyphicons-icon circle_plus" onclick="fun()"></i>
                                        <i class="glyphicons-icon circle_minus" onclick="del()"></i>
                                        <button type="submit" class="btn btn-primary"> 确定</button>
                                    </div>

                                </div>





                                <div class="control-group">
                                    <label class="control-label" for="fileInput">微缩图</label>
                                    <div class="controls">
                                        <input class="input-file uniform_on" type="file" name="imgOne" id="imgOne" onchange="preImg(this.id,'photo');" >
                                        <img id="photo" src="" width="300px" height="300px" style="display: block;" >
                                        <!-- <input  class="input-file uniform_on" id="fileInput" type="file">-->

                                    </div>
                                </div>




                                <div class="control-group">
                                    <label class="control-label" for="selectError2">知识点选择</label>
                                    <div class="controls">
                                        <select data-placeholder="科目" id="selectError2" data-rel="chosen">
                                            <option value=""></option>

                                            <option>数学</option>
                                            <option>语文</option>
                                            <option>英语</option>

                                        </select>





                                        <select data-placeholder="知识点" id="selectError3" data-rel="chosen">
                                            <option value=""></option>

                                            <option>不定式</option>
                                            <option>等式</option>
                                            <option>函数</option>

                                        </select>

                                        <select data-placeholder="程度" id="selectError4" data-rel="chosen">
                                            <option value=""></option>

                                            <option>简单</option>
                                            <option>一般</option>
                                            <option>困难</option>

                                        </select>




                                    </div>
                                </div>



                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary">确定</button>

                                    <input class="btn" type=button value="取消" onclick="location.reload()">
                                </div>

                            </fieldset>
                        </form>

                    </div>
                </div><!--/span-->

            </div>

        </div>
    </div>
</div>

<!--弹出层时背景层DIV-->
<div id="fade" class="black_content">
</div>
<div id="MyDiv" class="white_content">
    <div style="text-align: right; cursor: default;
">
        <!--  <span style="font-size: 16px;" onclick="CloseDiv('MyDiv','fade')">关闭</span>-->
    </div>

    <div class="container-fluid-full">
        <div class="row-fluid">
            <div class="container-fluid-full">

                <div class="row-fluid sortable">
                    <div class="box span12" style="border: 0px">
                        <div  class="box-header" data-original-title>
                            <h2 >专项练习题上传</h2>
                            <div  class="box-icon">
                            </div>
                        </div>
                        <div class="box-content">
                            <form id="inform1" class="form-horizontal">
                                <fieldset>
                                    <div class="control-group" >

                                        <label  class="control-label" for="typeahead">标题 </label>
                                        <div class="controls">
                                            <input type="text" class="span6 typeahead" id="typeahead"  data-provide="typeahead" value="请输入内容" data-items="4" onfocus="javascript:if(this.value=='请输入内容')this.value='';">
                                        </div>
                                    </div>


                                    <div class="control-group">
                                        <label class="control-label" for="fileInput">题干</label>
                                        <div class="controls">
                                            <input  class="input-file uniform_on" id="fileInput" type="file">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="fileInput">A</label>
                                        <div class="controls">
                                            <input  class="input-file uniform_on" id="fileInput" type="file">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="fileInput">B</label>
                                        <div class="controls">
                                            <input  class="input-file uniform_on" id="fileInput" type="file">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="fileInput">C</label>
                                        <div class="controls">
                                            <input  class="input-file uniform_on" id="fileInput" type="file">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="fileInput">D</label>
                                        <div class="controls">
                                            <input  class="input-file uniform_on" id="fileInput" type="file">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="fileInput">解析</label>
                                        <div class="controls">
                                            <input  class="input-file uniform_on" id="fileInput" type="file">
                                        </div>
                                    </div>



                                    <div class="control-group">
                                        <label class="control-label" for="selectError2">知识点选择</label>
                                        <div class="controls">
                                            <select data-placeholder="科目" id="selectError5" data-rel="chosen">
                                                <option value=""></option>

                                                <option>数学</option>
                                                <option>语文</option>
                                                <option>英语</option>

                                            </select>





                                            <select data-placeholder="知识点" id="selectError6" data-rel="chosen">
                                                <option value=""></option>

                                                <option>不定式</option>
                                                <option>等式</option>
                                                <option>函数</option>

                                            </select>

                                            <select data-placeholder="程度" id="selectError7" data-rel="chosen">
                                                <option value=""></option>

                                                <option>简单</option>
                                                <option>一般</option>
                                                <option>困难</option>

                                            </select>




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
