
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
    <style>
        form[name="checkCodeForm"],form[name="updatePasswordForm"] {
            display: none;
        }
    </style>
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
                                    <li><a href="/user/info">信息</a></li>
                                    <li class="active"><a href="/user/update/password">修改密码</a></li>
                                    <li><a href="/user/messages">消息</a></li>
                                    <li><a href="/user/index">闲置</a></li>
                                    <li><a href="/user/favor">点赞</a></li>
                                    <li><a href="/logout">退出</a></li>

                                </ul>
                            </div>
                        </div>
                        <div class="span6">
                            <br>
                            <form class="form" name="sendCheckCodeForm" method="post" action="">

                                <legend>发送验证码:</legend>
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">邮箱</label>
                                    <div class="controls">
                                        <input type="text"  class="span6 uneditable-input" name="name"  value="${user.email}">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-large btn-primary">发送</button>
                            </form>
                            <form class="form" name="checkCodeForm" method="post">
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">输入验证码
                                        <span class="form-required" style="display: none" id="checkCodeError">验证码输入错误</span>
                                    </label>
                                    <div class="controls">
                                        <input type="text" class="span6" name="code">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-large btn-primary">验证</button>
                            </form>
                            <form class="form" name="updatePasswordForm" method="post" action="/user/update/password">
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">新密码</label>
                                    <div class="controls">
                                        <input type="text" class="span6"   name="password">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputEmail">重复密码</label>
                                    <div class="controls">
                                        <input type="text" class="span6" name="duplicatePassword">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-large btn-primary">确认修改</button>
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
    $('input[name="code"]').on('change',function () {
      $('#checkCodeError').css('display','none');
    })
    $('form[name="sendCheckCodeForm"]').submit(function (ev) {
      let self = $(this);
      sendForm('/user/sendCheckEmail', {}, function (res) {
        console.log(res);
        if (res.status == 200) {
          self.css("display", "none");
          $('form[name="checkCodeForm"]').css('display', 'block');
        } else {
          alert('邮件发送失败，请刷新重试');
        }
      }, function (err) {
        console.log(err);
      });
      ev.preventDefault();
      return false;
    });
    $('form[name="checkCodeForm"]').submit(function (ev) {
      let data = new FormData(this),
      self = $(this);
      sendForm('/user/check', data, function (res) {
        console.log(res);
        if (res.status == 200) {
          self.css("display", "none");
          $('form[name="updatePasswordForm"]').css('display', 'block');
        } else {
          $('#checkCodeError').css('display','inline');
        }

      }, function (err) {
        console.log(err);
      });
      ev.preventDefault();
      return false;
    });
    let sendForm = function (url, data, success, failed) {
      $.ajax({
        url: url,
        type: "POST",
        data: data,
        processData: false,  // tell jQuery not to process the data
        contentType: false,   // tell jQuery not to set contentType
        success: function (res) {
          success(res);
        },
        error: function (err) {
          failed(err);
        }
      })
    }
</script>
</body>
</html>
