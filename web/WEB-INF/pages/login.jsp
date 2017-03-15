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

    <title>Realia | HTML Template</title>
</head>
<body>
<div id="wrapper-outer" >
    <div id="wrapper">
        <div id="wrapper-inner">
            <!-- BREADCRUMB -->
            <div class="breadcrumb-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="span12">
                            <ul class="breadcrumb pull-left">
                                <li><a href="index.html">Home</a></li>
                            </ul><!-- /.breadcrumb -->

                            <div class="account pull-right">
                                <ul class="nav nav-pills">
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="registration.html">Registration</a></li>
                                </ul>
                            </div>
                        </div><!-- /.span12 -->
                    </div><!-- /.row -->
                </div><!-- /.container -->
            </div><!-- /.breadcrumb-wrapper -->

            <!-- HEADER -->
            <div id="header-wrapper">
                <div id="header">
                    <div id="header-inner">
                        <div class="container">
                            <div class="navbar">
                                <div class="navbar-inner">
                                    <div class="row">
                                        <div class="logo-wrapper span4">
                                            <a href="#nav" class="hidden-desktop" id="btn-nav">Toggle navigation</a>

                                            <div class="logo">
                                                <a href="index.html" title="Home">
                                                    <img src="assets/img/logo.png" alt="Home">
                                                </a>
                                            </div><!-- /.logo -->

                                            <div class="site-name">
                                                <a href="/" title="Home" class="brand">Realia</a>
                                            </div><!-- /.site-name -->

                                            <div class="site-slogan">
                                                <span>Real estate &amp; Rental<br>made easy</span>
                                            </div><!-- /.site-slogan -->
                                        </div><!-- /.logo-wrapper -->

                                        <div class="info">
                                            <div class="site-email">
                                                <a href="mailto:info@byaviators.com">info@byaviators.com</a>
                                            </div><!-- /.site-email -->

                                            <div class="site-phone">
                                                <span>333-666-777</span>
                                            </div><!-- /.site-phone -->
                                        </div><!-- /.info -->

                                        <a class="btn btn-primary btn-large list-your-property arrow-right" href="list-your-property.html">List your property</a>
                                    </div><!-- /.row -->
                                </div><!-- /.navbar-inner -->
                            </div><!-- /.navbar -->
                        </div><!-- /.container -->
                    </div><!-- /#header-inner -->
                </div><!-- /#header -->
            </div><!-- /#header-wrapper -->

            <!-- NAVIGATION -->
            <div id="navigation">
                <div class="container">
                    <div class="navigation-wrapper">
                        <div class="navigation clearfix-normal">

                            <ul class="nav">
                                <li class="menuparent">
                                    <span class="menuparent nolink">Homepage</span>
                                    <ul>
                                        <li><a href="index-slider.html">Homepage with slider</a></li>
                                        <li><a href="index.html">Homepage with map</a></li>
                                        <li><a href="index-simple.html">Simple homepage</a></li>
                                        <li><a href="index-carousel.html">Homepage with carousel</a></li>
                                    </ul>
                                </li>
                                <li class="menuparent">
                                    <span class="menuparent nolink">Listing</span>
                                    <ul>
                                        <li><a href="listing-grid.html">Listing grid</a></li>
                                        <li><a href="listing-grid-filter.html">Listing grid with filter</a></li>
                                        <li><a href="listing-rows.html">Listing rows</a></li>
                                        <li><a href="listing-rows-filter.html" >Listing rows with filter</a></li>
                                    </ul>
                                </li>
                                <li class="menuparent">
                                    <span class="menuparent nolink">Pages</span>
                                    <ul>
                                        <li><a href="about-us.html">About us</a></li>
                                        <li><a href="our-agents.html">Our agents</a></li>
                                        <li><a href="faq.html">FAQ</a></li>
                                        <li><a href="shortcodes.html">Shortcodes</a></li>
                                        <li class="menuparent">
                                            <span class="menuparent nolink">Another level</span>
                                            <ul>
                                                <li><a href="contact-us.html">Contact Us</a></li><li><a href="http://www.cssmoban.com">More theme</a></li>
                                                <li><a href="grid-system.html">Grid system</a></li>
                                                <li><a href="typography.html">Typography</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="404.html">404 page</a></li>
                                    </ul>
                                </li>
                                <li class="menuparent">
                                    <span class="menuparent nolink">Pricing</span>
                                    <ul>
                                        <li><a href="pricing-boxed.html">Boxed pricing</a></li>
                                        <li><a href="pricing-multiple.html">Multiple pricing</a></li>
                                        <li><a href="pricing-simple.html">Simple Pricing</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact-us.html">Contact Us</a></li><li><a href="http://www.cssmoban.com">More theme</a></li>
                            </ul><!-- /.nav -->

                            <div class="language-switcher">
                                <div class="current en"><a href="/" lang="en">English</a></div><!-- /.current -->
                                <div class="options">
                                    <ul>
                                        <li class="fr"><a href="#">Français</a></li>
                                        <li class="de"><a href="#">Deutsch</a></li>
                                    </ul>
                                </div><!-- /.options -->
                            </div><!-- /.language-switcher -->

                            <form method="get" class="site-search" action="?">
                                <div class="input-append">
                                    <input title="Enter the terms you wish to search for." class="search-query span2 form-text" placeholder="Search" type="text" name="">
                                    <button type="submit" class="btn"><i class="icon-search"></i></button>
                                </div><!-- /.input-append -->
                            </form><!-- /.site-search -->
                        </div><!-- /.navigation -->
                    </div><!-- /.navigation-wrapper -->
                </div><!-- /.container -->
            </div><!-- /.navigation -->

            <!-- CONTENT -->
            <div id="content">
                <div class="container">
                    <div>
                        <div id="main">
                            <h1 class="page-header">Login</h1>
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
                                                <form method="post" action="/login">
                                                    <div class="control-group">
                                                        <label class="control-label" for="">
                                                            用户名
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="text" id="username" name="username">
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
                                                            <input type="password"  name="password">
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="form-actions">
                                                        <input type="submit" value="登录" class="btn btn-primary arrow-right">
                                                    </div>
                                                    <!-- /.form-actions -->
                                                </form>
                                            </div>
                                            <!-- /.tab-pane -->

                                            <div class="tab-pane" id="register">
                                                <form method="post" action="/signin">
                                                    <div class="control-group">
                                                        <label class="control-label" for="">
                                                            用户名
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="text" id="name" name="name">
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="control-group">
                                                        <label class="control-label" for="">
                                                            生日
                                                            <span class="form-required" title="This field is required.">*不可修改</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="text" id="birthday" name="birthday">
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="control-group">
                                                        <label class="control-label" for="inputRegisterEmail">
                                                            手机号
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="text" id="phone" class="span4" name="phone">
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->
                                                    <div class="control-group">
                                                        <label class="control-label" for="inputRegisterEmail">
                                                            学校
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <select name="schoolId" class="span4" id="school-list">
                                                                <c:forEach items="${schools}" var="school">
                                                                    <option value="${school.schoolId}">${school.schoolName}</option>
                                                                </c:forEach>

                                                            </select>
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="control-group">
                                                        <label class="control-label" for="inputRegisterPassword">
                                                            密码
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="text" id="password" name="password">
                                                        </div>
                                                        <!-- /.controls -->
                                                    </div>
                                                    <!-- /.control-group -->

                                                    <div class="control-group">
                                                        <label class="control-label" for="inputRegisterRetype">
                                                            再输一次
                                                            <span class="form-required" title="This field is required.">*</span>
                                                        </label>

                                                        <div class="controls">
                                                            <input type="text" id="repeat password">
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

        <div id="footer-wrapper">

            <div id="footer" class="footer container">
                <div id="footer-inner">
                    <div class="row">
                        <div class="span6 copyright">
                            <p>© Copyright 2013 by More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> All rights reserved.</p>
                        </div><!-- /.copyright -->

                        <div class="span6 share">
                            <div class="content">
                                <ul class="menu nav">
                                    <li class="first leaf"><a href="http://www.facebook.com" class="facebook">Facebook</a></li>
                                    <li class="leaf"><a href="http://flickr.net" class="flickr">Flickr</a></li>
                                    <li class="leaf"><a href="http://plus.google.com" class="google">Google+</a></li>
                                    <li class="leaf"><a href="http://www.linkedin.com" class="linkedin">LinkedIn</a></li>
                                    <li class="leaf"><a href="http://www.twitter.com" class="twitter">Twitter</a></li>
                                    <li class="last leaf"><a href="http://www.vimeo.com" class="vimeo">Vimeo</a></li>
                                </ul>
                            </div><!-- /.content -->
                        </div><!-- /.span6 -->
                    </div><!-- /.row -->
                </div><!-- /#footer-inner -->
            </div><!-- /#footer -->
        </div><!-- /#footer-wrapper -->
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
<script>
    $( function() {
        $( "#birthday" ).datepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd',
            date: new Date(1995, 1, 1)
        });
    } );

</script>
</body>
</html>