<%@ page import="java.util.HashMap" %>
<%@ page import="server.UPloadUtil" %><%--
  Created by IntelliJ IDEA.
  User: zhangyan
  Date: 2017/10/6
  Time: 下午7:43
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
    <title>课程创建第一步</title>
    <script src="<%=basePath%>/js/aliyun-sdk.min.js"></script>
    <script src="<%=basePath%>/js/vod-sdk-upload-1.0.6.min.js"></script>
</head>
<body>
<h1>课程创建</h1>

<hr />
<form method="get" action="${pageContext.request.contextPath}/servlet/upCourseServlet">
    <table frame="void" width="400px">

        <tr>
            <td>标题：</td>
            <td><input type="text" name="title" id="tit" value="<%=request.getAttribute("tit")%>"/></td>
        </tr>

        <tr>
            <td>描述：</td>
            <td><input type="text" name="Desc" id="desc" value="<%=request.getAttribute("des")%>"/></td>
        </tr>

        <tr>
            <td>图片链接为:</td>
            <td><input type="text" name="imag" value="<%=request.getAttribute("img")%>"></td>
        </tr>

        <tr>
            <td colspan="2"><input type="submit" value="获取上传通道"/></td>
        </tr>
    </table>
</form>


    <%
        HashMap<String,String> map=new HashMap<String, String>();
        map= (HashMap<String, String>) request.getAttribute("remap");
    %>



<table frame=void width="400px" >
    <tr>
        <td>uploadAuth:</td>
        <td><input type="text" id="uploadAuth" size="20" value="<%=map.get("UploadAuth")%>"></td>
        <td>uploadAddress:</td>
        <td><input type="text" id="uploadAddress" size="20" value="<%=map.get("UploadAddress")%>"></td>
    </tr>
</table>

<table frame=void width="400px" style="display:none ">
    <tr>
        <td>accessKeyId:</td>
        <td><input type="text" id="accessKeyId" size="20" value=""></td>
        <td>accessKeySecret:</td>
        <td><input type="text" id="accessKeySecret" size="40" value=""></td>
    </tr>
    <tr>
        <td>secretToken:</td>
        <td><input type="text" id="secretToken" size="40" value=""></td>
        <td>expireTime:</td>
        <td><input type="text" id="expireTime" size="20" value=""></td>
    </tr>
    <tr>
        <td>endpoint:</td>
        <td><input type="text" id="endpoint" size="40" value="http://oss-cn-hangzhou.aliyuncs.com"></td>
        <td>bucket:</td>
        <td><input type="text" id="bucket" size="20" value="testbucket"></td>
    </tr>
    <tr>
        <td>object路径:</td>
        <td><input type="text" id="objectPre" size="20" value="uploadtest/"></td>
    </tr>
</table>
<hr />

文件管理
<hr />
<input type="file" name="file" id="files" multiple/>
<button type="button" onclick="deleteFile()">删除文件</button>
<input type="text" id="deleteIndex" size="3" value="0">
<button type="button" onclick="cancelFile()">取消文件</button>
<input type="text" id="cancelIndex" size="3" value="0">

<button type="button" onclick="resumeFile()">恢复文件</button>
<input type="text" id="resumeIndex" size="3" value="0">

<hr />
列表管理
<hr />
<button type="button" onclick="getList()">获取上传列表</button>
<button type="button" onclick="clearList()">清理上传列表</button>
<hr />
上传管理
<hr/>
<button type="button" onclick="start()">开始上传</button>
<button type="button" onclick="stop()">停止上传</button>
<button type="button" onclick="resumeWithToken()">Token恢复上传</button>
<hr />
<select multiple="multiple" id="textarea" style="position:relative; width:620px; height:450px; vertical-align:top; border:1px solid #cccccc;"></select>
<button type="button" onclick="clearLog()">清日志</button>
<hr />

<form action="${pageContext.request.contextPath}/servlet/upCourseServlet" method="post">

    <tr style="display: none">
        <td><input type="text" name="movId" id="mov" value="<%=map.get("VideoId")%>"/></td>
    </tr>
    <tr>
        <td colspan="2"><input type="submit" value="下一步"/></td>
    </tr>
</form>


<script>


    var uploader;
    window.onload = new function() {
        uploader = new VODUpload({
            // 文件上传失败
            'onUploadFailed': function (uploadInfo, code, message) {
                console.log("onUploadFailed: file:" + uploadInfo.file.name + ",code:" + code + ", message:" + message);
            },
            // 文件上传完成
            'onUploadSucceed': function (uploadInfo) {
                console.log("onUploadSucceed: " + uploadInfo.file.name + ", endpoint:" + uploadInfo.endpoint + ", bucket:" + uploadInfo.bucket + ", object:" + uploadInfo.object);
            },
            // 文件上传进度
            'onUploadProgress': function (uploadInfo, totalSize, uploadedSize) {
                console.log("onUploadProgress:file:" + uploadInfo.file.name + ", fileSize:" + totalSize + ", percent:" + Math.ceil(uploadedSize * 100 / totalSize) + "%");
                if(Math.ceil(uploadedSize * 100 / totalSize) ==100){
                    alert("上传成功");
                }

            },
            // STS临时账号会过期，过期时触发函数
            'onUploadTokenExpired': function () {
                console.log("onUploadTokenExpired");
                if (isVodMode()) {
                    // 实现时，从新获取UploadAuth
                    // uploader.resumeUploadWithAuth(uploadAuth);
                } else if (isSTSMode()) {
                    // 实现时，从新获取STS临时账号用于恢复上传
                    // uploader.resumeUploadWithToken(accessKeyId, accessKeySecret, secretToken, expireTime);
                }
            },
            // 开始上传
            'onUploadstarted': function (uploadInfo) {
                if (isVodMode()) {
                    var uploadAuth = document.getElementById("uploadAuth").value;
                    var uploadAddress = document.getElementById("uploadAddress").value;
                    uploader.setUploadAuthAndAddress(uploadInfo, uploadAuth, uploadAddress);
                }
                console.log("onUploadStarted:" + uploadInfo.file.name + ", endpoint:" + uploadInfo.endpoint + ", bucket:" + uploadInfo.bucket + ", object:" + uploadInfo.object);
            }
        });

        var accessKeyId = document.getElementById("accessKeyId").value;
        console.log(accessKeyId);
        var accessKeySecret = document.getElementById("accessKeySecret").value;
        var secretToken = document.getElementById("secretToken").value;
        var expireTime = document.getElementById("expireTime").value;

        if (isVodMode()) {
            // 点播上传。每次上传都是独立的鉴权，所以初始化时，不需要设置鉴权
            uploader.init();
        } else if (isSTSMode()) {
            // OSS直接上传:STS方式，安全但是较为复杂，建议生产环境下使用。
            // 临时账号过期时，在onUploadTokenExpired事件中，用resumeWithToken更新临时账号，上传会续传。
            uploader.init(accessKeyId, accessKeySecret, secretToken, expireTime);
        } else {
            // OSS直接上传:AK方式，简单但是不够安全，建议测试环境下使用。
            uploader.init(accessKeyId, accessKeySecret);
        }
    };

    document.getElementById("files")
        .addEventListener('change', function (event) {
            var endpoint = document.getElementById("endpoint").value;
            var bucket = document.getElementById("bucket").value;
            var objectPre = document.getElementById("objectPre").value;
            var userData;
            if (isVodMode()) {
                userData = '{"Vod":{"UserData":"{"IsShowWaterMark":"false","Priority":"7"}"}}';
            } else {
                userData = '{"Vod":{"Title":"this is title.我是标题","Description":"this is desc.我是描述","CateId":"19",\
                "Tags":"tag1,tag2,标签3","UserData":"user data"}}';
            }

            for(var i=0; i<event.target.files.length; i++) {
                log("add file: " + event.target.files[i].name);
                if (isVodMode()) {
                    // 点播上传。每次上传都是独立的OSS object，所以添加文件时，不需要设置OSS的属性
                    uploader.addFile(event.target.files[i], null, null, null, userData);
                } else {
                    uploader.addFile(event.target.files[i], endpoint, bucket, objectPre + event.target.files[i].name, userData);
                }
            }
        });

    var textarea=document.getElementById("textarea");

    function start() {
        log("start upload.");
        uploader.startUpload();
    }

    function stop() {
        log("stop upload.");
        uploader.stopUpload();
    }

    function resumeWithToken() {
        log("resume upload with token.");
        var uploadAuth = document.getElementById("uploadAuth").value;

        var accessKeyId = document.getElementById("accessKeyId").value;
        var accessKeySecret = document.getElementById("accessKeySecret").value;
        var secretToken = document.getElementById("secretToken").value;
        var expireTime = document.getElementById("expireTime").value;

        if (isVodMode()) {
            uploader.resumeUploadWithAuth(uploadAuth);
        } else if (isSTSMode()) {
            uploader.resumeUploadWithToken(accessKeyId, accessKeySecret, secretToken, expireTime);
        }
    }

    function clearList() {
        log("clean upload list.");
        uploader.cleanList();
    }

    function getList() {
        log("get upload list.");
        var list = uploader.listFiles();
        for (var i=0; i<list.length; i++) {
            log("file:" + list[i].file.name + ", status:" + list[i].state + ", endpoint:" + list[i].endpoint + ", bucket:" + list[i].bucket + ", object:" + list[i].object);
        }
    }

    function deleteFile() {
        if (document.getElementById("deleteIndex").value) {
            var index = document.getElementById("deleteIndex").value
            log("delete file index:" + index);
            uploader.deleteFile(index);
        }
    }

    function cancelFile() {
        if (document.getElementById("cancelIndex").value) {
            var index = document.getElementById("cancelIndex").value
            log("cancel file index:" + index);
            uploader.cancelFile(index);
        }
    }

    function resumeFile() {
        if (document.getElementById("resumeIndex").value) {
            var index = document.getElementById("resumeIndex").value
            log("resume file index:" + index);
            uploader.resumeFile(index);
        }
    }

    function clearLog() {
        textarea.options.length = 0;
    }

    function log(value) {
        if (!value) {
            return;
        }

        var len = textarea.options.length;
        if (len > 0 && textarea.options[len-1].value.substring(0, 40) == value.substring(0, 40)) {
            textarea.remove(len-1);
        } else if (len > 25) {
            textarea.remove(0);
        }

        var option=document.createElement("option");
        option.value=value,option.innerHTML=value;
        textarea.appendChild(option);
    }

    function isVodMode() {
        var uploadAuth = document.getElementById("uploadAuth").value;
        return (uploadAuth && uploadAuth.length > 0);
    }

    function isSTSMode() {
        var secretToken = document.getElementById("secretToken").value;
        var expireTime = document.getElementById("expireTime").value;
        if (!isVodMode()) {
            if (secretToken && secretToken.length > 0 && expireTime && expireTime.length > 0) {
                return true;
            }
        }
        return false;
    }
</script>

</body>
</html>
