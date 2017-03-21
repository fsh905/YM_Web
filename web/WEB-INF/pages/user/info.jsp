
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/10/2017
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Aviators - byaviators.com">


    <link rel="shortcut icon" href="/assets/img/favicon.png" type="image/png">
    <link rel="stylesheet" href="/assets/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/bootstrap-responsive.css" type="text/css">
    <link rel="stylesheet" href="/assets/libraries/chosen/chosen.css" type="text/css">
    <link rel="stylesheet" href="/assets/libraries/bootstrap-fileupload/bootstrap-fileupload.css" type="text/css">
    <link rel="stylesheet" href="/assets/libraries/jquery-ui-1.10.2.custom/css/ui-lightness/jquery-ui-1.10.2.custom.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/realia-blue.css" type="text/css" id="color-variant-default">
    <link rel="stylesheet" href="#" type="text/css" id="color-variant">

    <title>个人信息</title>
</head>
<body>
<div id="wrapper-outer" >
    <div id="wrapper">
        <div id="wrapper-inner">
            <!-- BREADCRUMB -->
            <%@include file="../header.jsp"%>
            <c:set var="user" value="${sessionScope.get('LOGINUSER')}"/>

            <!-- CONTENT -->
            <div id="content"><div class="container">
                <div id="main">
                    <h1 class="page-header">个人信息</h1>
                    <div class="row">
                        <div class="span3">
                            <div class="header">
                                <!-- 这里不显示头像 -->
                                <!-- <img src="/assets/img/tmp/property-small-1.png"> -->
                                <h2>${user.name}</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="active"><a href="/user/info">信息</a></li>
                                    <li><a href="/user/messages">消息</a></li>
                                    <li><a href="/user/index">闲置</a></li>
                                    <li><a href="/user/favor">点赞</a></li>
                                    <li><a href="/logout">退出</a></li>

                                </ul>
                            </div>
                        </div>
                        <div class="span6">
                            <br>
                            ${userModel}
                            <form class="form" method="post" action="/user/update">
                                <legend>个人信息</legend>
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">姓名</label>
                                    <div class="controls">
                                        <input type="text" class="span6" name="name"  value="${user.name}">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">生日</label>
                                    <div class="controls">
                                        <c:set var="simpleDateFormat" value='<%= new java.text.SimpleDateFormat("yyyy-MM-dd") %>'/>


                                        <input type="text" class="span6 uneditable-input" value="${simpleDateFormat.format(user.birthday)}">
                                        <c:set value="new java.util.Date()" var="date"/>

                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">性别</label>
                                    <div class="controls">
                                        <select name="sex">
                                            <c:if test="${user.sex == 1}">
                                                <option value="1">男</option>
                                                <option value="2">女</option>
                                            </c:if>
                                            <c:if test="${user.sex == 2}">
                                                <option value="2">女</option>
                                                <option value="1">男</option>
                                            </c:if>

                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">手机号码</label>
                                    <div class="controls">
                                        <input type="text" class="span6"  value="${user.phone}" name="phone">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">QQ</label>
                                    <div class="controls">
                                        <input type="text" class="span6" value="${user.qq}" name="qq">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">微信</label>
                                    <div class="controls">
                                        <input type="text" class="span6" name="wechat"  value="${user.wechat}">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">学校</label>
                                    <div class="controls">
                                        <input type="text" class="span6 uneditable-input"  value="${sessionScope.get('SCHOOLKEY').schoolName}">
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-large btn-primary">保存修改</button>
                            </form>
                        </div>
                        <div class="span3">
                            修改头像
                            <img id="show-img" src="${user.photo}">
                            <form  enctype="multipart/form-data" id="update-photo-form" method="post" action="/user/update/photo">
                                <button id="select-img" type="button" class="btn btn-primary">选择图片</button>
                                <input id="update-photo" style="display: none;" name="photo"  type="file" value="点击更换头像"/>
                                <button class="btn" type="submit">确定</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            </div><!-- /#content -->
        </div><!-- /#wrapper-inner -->

        <%@ include file="../footer.html"%>
    </div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->


<script type="text/javascript" src="/assets/js/jquery.js"></script>
<script type="text/javascript" src="/assets/js/jquery.ezmark.js"></script>
<script type="text/javascript" src="/assets/js/jquery.currency.js"></script>
<script type="text/javascript" src="/assets/js/jquery.cookie.js"></script>
<!-- <script type="text/javascript" src="/assets/js/retina.js"></script> -->
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/assets/js/carousel.js"></script>


<script type="text/javascript" src="/assets/libraries/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/assets/libraries/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/assets/libraries/iosslider/_src/jquery.iosslider.min.js"></script>
<script type="text/javascript" src="/assets/libraries/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="/assets/js/realia.js"></script>
<script type="text/javascript">
    $('#select-img').on('click', function () {
      $('#update-photo').click();
    })
    $('#update-photo').on('change', function() {
        var file = this.files[0];
        var freader = new FileReader();
        freader.readAsDataURL(file);
        freader.onload = function (e) {
            var src = e.target.result;
            $('#show-img')[0].src = src;
        }
    })
    $('#update-photo-form').submit(function (ev) {
      let self = $(this),
        formData = new FormData(this);
      $.ajax({
        url: "/user/update/photo",
        type: "POST",
        data: formData,
        processData: false,  // tell jQuery not to process the data
        contentType: false,   // tell jQuery not to set contentType
        success: function (res) {
          console.log(res);
          alert(res.msg);
        },
        error: function (err) {
          console.log(err);
        }
      })
      ev.preventDefault();
      return false;
    });
</script>
</body>
</html>
