<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Aviators - byaviators.com">


    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/png">
    <link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="assets/css/bootstrap-responsive.css" type="text/css">
    <link rel="stylesheet" href="assets/libraries/chosen/chosen.css" type="text/css">
    <link rel="stylesheet" href="assets/libraries/bootstrap-fileupload/bootstrap-fileupload.css" type="text/css">
    <link rel="stylesheet" href="assets/libraries/jquery-ui-1.10.2.custom/css/ui-lightness/jquery-ui-1.10.2.custom.min.css" type="text/css">
    <link rel="stylesheet" href="assets/libraries/datepicker-master/dist/datepicker.min.css" type="text/css" id="color-variant-default">
    <link rel="stylesheet" href="assets/css/realia-blue.css" type="text/css" id="color-variant-default">
    <link rel="stylesheet" href="#" type="text/css" id="color-variant">

    <title>登录注册</title>
</head>
<body>
<div id="wrapper-outer" >
    <div id="wrapper">
        <div id="wrapper-inner">
            <!-- BREADCRUMB -->
            <%@ include file="header.jsp"%>

            <!-- CONTENT -->
            <div id="content">
                <div class="container">
                    <div>
                        <div id="main">
                            <h1 class="page-header">登录</h1>
                            <div class="login-register">
                                <div class="row">
                                    <div class="span6 offset3">
                                        <ul class="tabs nav nav-tabs">
                                            <li class="active"><a href="#login">登录</a></li>
                                            <li><a href="#register">注册</a></li>
                                        </ul>
                                        <!-- /.nav -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="login">
                                                <form method="post" action="/login" id="login-form">
                                                    <div class="control-group">
                                                        <label class="control-label" for="">
                                                            用户名
                                                            <span class="form-required" title="This field is required.">*</span>
                                                            <span class="form-required" title="This field is required.">${msg}</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="text" id="username" name="username" required>
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="control-group">
                                                        <label class="control-label" for="">
                                                            密码
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="password"  name="password" required>
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="form-actions">
                                                        <input type="submit" value="登录" class="btn btn-primary arrow-right">
                                                        <a href="/findPassword" style="float:right;" class="btn btn-primary arrow-left">找回密码</a>
                                                    </div>
                                                    <!-- /.form-actions -->
                                                </form>
                                            </div>
                                            <!-- /.tab-pane -->

                                            <div class="tab-pane" id="register">
                                                <form method="post" action="/signin" id="register-form">
                                                    <div class="control-group">
                                                        <label class="control-label" for="name">
                                                            用户名
                                                            <span class="form-required" title="This field is required.">*</span>
                                                            <span class="form-required" style="display: none" id="duplicate-name-warring">此用户名已被注册</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="text" id="name" name="name" required minlength="4" maxlength="30">
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="control-group">
                                                        <label class="control-label" for="birthday">
                                                            生日
                                                            <span class="form-required" title="This field is required.">*不可修改</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="text" id="birthday" name="birthday" required>
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="control-group">
                                                        <label class="control-label" for="email">
                                                            Email

                                                            <span class="form-required" title="This field is required.">*</span>
                                                            <span class="form-required" id="duplicate-email-warring" style="display: none" title="This field is required.">此邮箱已经被注册</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input style="box-sizing: border-box;height: 40px;width: 100%;" type="email" id="email" class="span4" name="email" required>
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->
                                                    <div class="control-group">
                                                        <label class="control-label" for="school-list">
                                                            学校
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <select name="schoolId" style="width: 100%" class="span4" id="school-list">
                                                                <c:forEach items="${schools}" var="school">
                                                                    <option value="${school.schoolId}">${school.schoolName}</option>
                                                                </c:forEach>

                                                            </select>
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="control-group">
                                                        <label class="control-label" for="password">
                                                            密码
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="password" id="password" name="password" required minlength="6" maxlength="30">
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="control-group">
                                                        <label class="control-label" for="repeat_password">
                                                            再输一次
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="password" equalTo="#password" id="repeat_password" required minlength="6" maxlength="30">
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="form-actions">
                                                        <input type="submit" value="注册" class="btn btn-primary arrow-right">
                                                    </div>
                                                    <!-- /.form-actions -->
                                                </form>
                                            </div>
                                            <!-- /.tab-pane -->
                                        </div>
                                        <!-- /.tab-content -->
                                    </div>
                                    <!-- /.span4-->

                                </div>
                                <!-- /.row -->
                            </div><!-- /.login-register -->        </div>
                    </div>
                </div>

            </div><!-- /#content -->
        </div><!-- /#wrapper-inner -->

        <%@ include file="footer.html"%>
    </div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->

<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/jquery.ezmark.js"></script>
<script type="text/javascript" src="assets/js/jquery.currency.js"></script>
<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
<script type="text/javascript" src="assets/js/retina.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/carousel.js"></script>


<script type="text/javascript" src="assets/libraries/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="assets/libraries/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="assets/libraries/iosslider/_src/jquery.iosslider.min.js"></script>
<script type="text/javascript" src="assets/libraries/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="assets/js/realia.js"></script>
<script type="text/javascript" src="assets/libraries/datepicker-master/dist/datepicker.min.js"></script>
<script type="text/javascript" src="assets/libraries/datepicker-master/i18n/datepicker.zh-CN.js"></script>
<script type="text/javascript" src="assets/libraries/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/libraries/jquery-validation/dist/localization/messages_zh.min.js"></script>
<script>
    $( function() {
      $('#login-form').validate({});
      $('#register-form').validate({
        rules: {
          name: {
            required: true,
            remote: {
              url: "/user/name/check",
              type: "post",
              data: {
                name: function () {
                  return $("#name").val();
                }
              },
              dataFilter: function (response) {
                return JSON.parse(response).status === 200;
              }
            }
          },
          email: {
            required: true,
            email: true,
            remote: {
              url: "/user/email/check",
              type: "post",
              data: {
                name: function () {
                  return $("#email").val();
                }
              },
              dataFilter: function (response) {
                return JSON.parse(response).status === 200;
              }
            }
          }
        },
        messages: {
          name: "此用户名已被注册!",
          email: "此邮箱已被注册!"
        }
      });
      $("#birthday").datepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        date: new Date(1995, 1, 1)
      })
    })
</script>
</body>
</html>