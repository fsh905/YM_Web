
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
                            <form  enctype="multipart/form-data" method="post" action="/user/update/photo">
                                <input id="update-photo" name="photo"  type="file" value="点击更换头像"/>
                                <button class="btn" >确定</button>
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

<div class="palette">
    <div class="toggle">
        <a href="#">Toggle</a>
    </div><!-- /.toggle -->

    <div class="inner">
        <div class="headers">
            <h2>Header styles</h2>
            <ul>
                <li><a class="header-light">Light</a></li>
                <li><a class="header-normal">Normal</a></li>
                <li><a class="header-dark">Dark</a></li>
            </ul>
        </div><!-- /.headers -->

        <div class="patterns">
            <h2>Background patterns</h2>
            <ul>
                <li><a class="pattern-cloth-alike">cloth-alike</a></li>
                <li><a class="pattern-corrugation">corrugation</a></li>
                <li><a class="pattern-diagonal-noise">diagonal-noise</a></li>
                <li><a class="pattern-dust">dust</a></li>
                <li><a class="pattern-fabric-plaid">fabric-plaid</a></li>
                <li><a class="pattern-farmer">farmer</a></li>
                <li><a class="pattern-grid-noise">grid-noise</a></li>
                <li><a class="pattern-lghtmesh">lghtmesh</a></li>
                <li><a class="pattern-pw-maze-white">pw-maze-white</a></li>
                <li><a class="pattern-none">none</a></li>
            </ul>
        </div>

        <div class="colors">
            <h2>Color variants</h2>
            <ul>
                <li><a href="/assets/css/realia-red.css" class="red">Red</a></li>
                <li><a href="/assets/css/realia-magenta.css" class="magenta">Magenta</a></li>
                <li><a href="/assets/css/realia-brown.css" class="brown">Brown</a></li>
                <li><a href="/assets/css/realia-orange.css" class="orange">Orange</a></li>
                <li><a href="/assets/css/realia-brown-dark.css" class="brown-dark">Brown dark</a></li>

                <li><a href="/assets/css/realia-gray-red.css" class="gray-red">Gray Red</a></li>
                <li><a href="/assets/css/realia-gray-magenta.css" class="gray-magenta">Gray Magenta</a></li>
                <li><a href="/assets/css/realia-gray-brown.css" class="gray-brown">Gray Brown</a></li>
                <li><a href="/assets/css/realia-gray-orange.css" class="gray-orange">Gray Orange</a></li>
                <li><a href="/assets/css/realia-gray-brown-dark.css" class="gray-brown-dark">Gray Brown dark</a></li>

                <li><a href="/assets/css/realia-green-light.css" class="green-light">Green light</a></li>
                <li><a href="/assets/css/realia-green.css" class="green">Green</a></li>
                <li><a href="/assets/css/realia-turquiose.css" class="turquiose">Turquiose</a></li>
                <li><a href="/assets/css/realia-blue.css" class="blue">Blue</a></li>
                <li><a href="/assets/css/realia-violet.css" class="violet">Violet</a></li>

                <li><a href="/assets/css/realia-gray-green-light.css" class="gray-green-light">Gray Green light</a></li>
                <li><a href="/assets/css/realia-gray-green.css" class="gray-green">Gray Green</a></li>
                <li><a href="/assets/css/realia-gray-turquiose.css" class="gray-turquiose">Gray Turquiose</a></li>
                <li><a href="/assets/css/realia-gray-blue.css" class="gray-blue">Gray Blue</a></li>
                <li><a href="/assets/css/realia-gray-violet.css" class="gray-violet">Gray Violet</a></li>
            </ul>
        </div><!-- /.colors -->

        <a href="#" class="btn btn-primary reset">Reset default</a>
    </div><!-- /.inner -->
</div><!-- /.palette -->


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
    $('#update-photo').on('change', function() {
        var file = this.files[0];
        var freader = new FileReader();
        freader.readAsDataURL(file);
        freader.onload = function (e) {
            var src = e.target.result;
            $('#show-img')[0].src = src;
        }
    })
</script>
</body>
</html>
