<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/10/2017
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <style>
        .show-img{
            display: inline-block;
            position: relative;
        }
        .delete{
            position: absolute;
            top: 10px;
            right: 10px;
            background: beige;
            border-radius: 7px;
            border-style: hidden;
        }
        .thumb {
            height: 100px;
            border: 1px solid #000;
            margin: 10px 5px 0 0;
        }
        #uploadImgList{
            border: aqua;
            border-style: dotted;
            background: beige;
            min-height: 112px;
        }
        .upload-img{
            margin-left: 20px;
        }
    </style>

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
                                                    <img src="/assets/img/logo.png" alt="Home">
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
                                </li>
                            </ul>
                        </div><!-- /.navigation -->
                    </div><!-- /.navigation-wrapper -->
                </div><!-- /.container -->
            </div><!-- /.navigation -->

            <!-- CONTENT -->
            <div id="content">
                <div class="container">
                    <div>
                        <div id="main">
                            <div class="list-your-property-form">
                                <h2 class="page-header">发布闲置</h2>

                                <div class="content">
                                    <div class="row">
                                        <div class="span8">
                                            <p>
                                                相关介绍
                                            </p>
                                        </div><!-- /.span8 -->
                                    </div><!-- /.row -->

                                    <!-- <form method="post" action="/sample" enctype="multipart/form-data"> -->
                                    <div class="row">
                                        <div class="upload-img">
                                            <h2>上传图片</h2>
                                            <div id="uploadImgList">

                                            </div>
                                            <button id="addImgBtn">添加图片</button>
                                        </div>
                                        <input type="file" id="files" name="files[]" style="display: none;" />
                                        <!-- <button id="upload">上传</button> -->
                                        <form name="publish" action="http://localhost/upload" id="publish" method="post">
                                            <div class="span6">
                                                <h3><strong>1.</strong> <span>基本信息</span></h3>

                                                <div class="control-group">
                                                    <label class="control-label" >
                                                        标题
                                                        <span class="form-required" title="This field is required.">*</span>
                                                    </label>
                                                    <div class="controls">
                                                        <input type="text" id="productName" value="${product.name}" name="name">
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->

                                                <div class="property-type control-group">
                                                    <label class="control-label" >
                                                        类型
                                                        <span class="form-required" title="This field is required.">*</span>
                                                    </label>
                                                    <div class="controls">
                                                        <select>
                                                            <c:forEach items="${bigCategory}" var="ca">
                                                                <option value="${ca.id}">
                                                                        ${ca.name}
                                                                </option>
                                                            </c:forEach>
                                                            <%--<option value="1">科技数码</option>--%>
                                                        </select>
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->

                                                <div class="contract-type control-group">
                                                    <label class="control-label">
                                                        种类
                                                        <span class="form-required" title="This field is required.">*</span>
                                                    </label>
                                                    <div class="controls">
                                                        <select name="category" id="productCategory">
                                                            <c:forEach items="${category}" var="ca">
                                                                <option value="${ca.id}"
                                                                    <c:if test="${ca.id == product.category}">
                                                                    selected
                                                                    </c:if>>
                                                                        ${ca.name}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->

                                                <div class="bedrooms control-group">
                                                    <label class="control-label">
                                                        现价
                                                        <span class="form-required" title="This field is required.">*</span>
                                                    </label>
                                                    <div class="controls">
                                                        <input type="text" name="price" value="${product.price}" id="productPrice">
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->

                                                <div class="bathrooms control-group">
                                                    <label class="control-label">
                                                        原价
                                                        <span class="form-required" title="This field is required.">*</span>
                                                    </label>
                                                    <div class="controls">
                                                        <input type="text" name="originPrice" id="productOriginPrice" value="${product.originPrice}">
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->

                                                <div class="control-group">
                                                    <div class="controls">
                                                        <input type="text" name="contact1" placeholder="联系方式1" id="productContact1" value="${product.contact1}">
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->

                                                <div class="control-group">
                                                    <div class="controls">
                                                        <input type="text" placeholder="联系方式2" name="contact2" id="productContact2" value="${product.contact2}">
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->

                                            </div><!-- /.span4 -->




                                            <div class="span6">
                                                <h3><strong>2.</strong> <span>简单介绍</span></h3>

                                                <div class="control-group">
                                                    <label class="control-label" >
                                                        选择种类
                                                        <span class="form-required" title="This field is required."></span>
                                                    </label>
                                                    <div class="controls">
                                                        <select name="type" id="productType">
                                                            <c:choose>
                                                                <c:when test="${product.type == 3}">
                                                                    <option value="3" selected >闲置</option>
                                                                    <option value="4">求购</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="3">闲置</option>
                                                                    <option value="4" selected>求购</option>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </select>
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->

                                                <div class="control-group">
                                                    <label class="control-label" >
                                                        简介
                                                        <span class="form-required" title="This field is required.">*</span>
                                                    </label>
                                                    <div class="controls">
                                                        <textarea name ="description" id="productDescription">${product.description}</textarea>
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->
                                                <button class="btn btn-large btn-primary" id="upload">提交1</button>
                                            </div><!-- /.span4 -->
                                        </form>
                                    </div><!-- /.row -->
                                    <!-- </form> -->
                                </div><!-- /.content -->
                            </div><!-- /.list-your-property-form -->
                        </div>
                    </div>
                </div>

            </div><!-- /#content -->
        </div><!-- /#wrapper-inner -->

        <div id="footer-wrapper">
            <div id="footer-top">
                <div id="footer-top-inner" class="container">
                    <div class="row">
                        <div class="widget properties span3">
                            <div class="title">
                                <h2>Most Recent</h2>
                            </div><!-- /.title -->

                            <div class="content">
                                <div class="property">
                                    <div class="image">
                                        <a href="detail.html"></a>
                                        <img src="/assets/img/tmp/property-small-1.png" alt="">
                                    </div><!-- /.image -->
                                    <div class="wrapper">
                                        <div class="title">
                                            <h3>
                                                <a href="detail.html">27523 Pacific Coast</a>
                                            </h3>
                                        </div><!-- /.title -->
                                        <div class="location">Palo Alto CA</div><!-- /.location -->
                                        <div class="price">€2 300 000</div><!-- /.price -->
                                    </div><!-- /.wrapper -->
                                </div><!-- /.property -->

                                <div class="property">
                                    <div class="image">
                                        <a href="detail.html"></a>
                                        <img src="/assets/img/tmp/property-small-2.png" alt="">
                                    </div><!-- /.image -->
                                    <div class="wrapper">
                                        <div class="title">
                                            <h3>
                                                <a href="detail.html">27523 Pacific Coast</a>
                                            </h3>
                                        </div><!-- /.title -->
                                        <div class="location">Palo Alto CA</div><!-- /.location -->
                                        <div class="price">€2 300 000</div><!-- /.price -->
                                    </div><!-- /.wrapper -->
                                </div><!-- /.property -->

                                <div class="property">
                                    <div class="image">
                                        <a href="detail.html"></a>
                                        <img src="/assets/img/tmp/property-small-3.png" alt="">
                                    </div><!-- /.image -->
                                    <div class="wrapper">
                                        <div class="title">
                                            <h3>
                                                <a href="detail.html">27523 Pacific Coast</a>
                                            </h3>
                                        </div><!-- /.title -->
                                        <div class="location">Palo Alto CA</div><!-- /.location -->
                                        <div class="price">€2 300 000</div><!-- /.price -->
                                    </div><!-- /.wrapper -->
                                </div><!-- /.property -->
                            </div><!-- /.content -->
                        </div><!-- /.properties-small -->

                        <div class="widget span3">
                            <div class="title">
                                <h2>Contact us</h2>
                            </div><!-- /.title -->

                            <div class="content">
                                <table class="contact">
                                    <tbody>
                                    <tr>
                                        <th class="address">Address:</th>
                                        <td>1900 Pico Blvd<br>Santa Monica, CA 90405<br>United States<br></td>
                                    </tr>
                                    <tr>
                                        <th class="phone">Phone:</th>
                                        <td>+48 123 456 789</td>
                                    </tr>
                                    <tr>
                                        <th class="email">E-mail:</th>
                                        <td><a href="mailto:info@yourcompany.com">info@example.com</a></td>
                                    </tr>
                                    <tr>
                                        <th class="skype">Skype:</th>
                                        <td>your.company</td>
                                    </tr>
                                    <tr>
                                        <th class="gps">GPS:</th>
                                        <td>34.016811<br>-118.469009</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div><!-- /.content -->
                        </div><!-- /.widget -->

                        <div class="widget span3">
                            <div class="title">
                                <h2 class="block-title">Useful links</h2>
                            </div><!-- /.title -->

                            <div class="content">
                                <ul class="menu nav">
                                    <li class="first leaf"><a href="404.html">404 page</a></li>
                                    <li class="leaf"><a href="about-us.html">About us</a></li>
                                    <li class="leaf"><a href="contact-us.html">Contact us</a></li>
                                    <li class="leaf"><a href="faq.html">FAQ</a></li>
                                    <li class="leaf"><a href="grid-system.html">Grid system</a></li>
                                    <li class="leaf"><a href="our-agents.html">Our agents</a></li>
                                    <li class="last leaf"><a href="typography.html">Typography</a></li>
                                </ul>
                            </div><!-- /.content -->
                        </div><!-- /.widget -->

                        <div class="widget span3">
                            <div class="title">
                                <h2 class="block-title">Say hello!</h2>
                            </div><!-- /.title -->

                            <div class="content">
                                <form method="post">
                                    <div class="control-group">
                                        <label class="control-label" for="inputName">
                                            Name
                                            <span class="form-required" title="This field is required.">*</span>
                                        </label>
                                        <div class="controls">
                                            <input type="text" id="inputName">
                                        </div><!-- /.controls -->
                                    </div><!-- /.control-group -->

                                    <div class="control-group">
                                        <label class="control-label" for="inputEmail">
                                            Email
                                            <span class="form-required" title="This field is required.">*</span>
                                        </label>
                                        <div class="controls">
                                            <input type="text" id="inputEmail">
                                        </div><!-- /.controls -->
                                    </div><!-- /.control-group -->

                                    <div class="control-group">
                                        <label class="control-label" for="inputMessage">
                                            Message
                                            <span class="form-required" title="This field is required.">*</span>
                                        </label>

                                        <div class="controls">
                                            <textarea id="inputMessage"></textarea>
                                        </div><!-- /.controls -->
                                    </div><!-- /.control-group -->

                                    <div class="form-actions">
                                        <input type="submit" class="btn btn-primary arrow-right" value="Send">
                                    </div><!-- /.form-actions -->
                                </form>
                            </div><!-- /.content -->
                        </div><!-- /.widget -->
                    </div><!-- /.row -->
                </div><!-- /#footer-top-inner -->
            </div><!-- /#footer-top -->

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


<script type="text/javascript" src="/assets/js/jquery.js"></script>
<script type="text/javascript" src="/assets/js/jquery.ezmark.js"></script>
<script type="text/javascript" src="/assets/js/jquery.currency.js"></script>
<script type="text/javascript" src="/assets/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/assets/js/retina.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/assets/js/carousel.js"></script>


<script type="text/javascript" src="/assets/libraries/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/assets/libraries/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/assets/libraries/iosslider/_src/jquery.iosslider.min.js"></script>
<script type="text/javascript" src="/assets/libraries/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="/assets/js/realia.js"></script>

<script type="text/javascript">
    //显示图片的元素
    let showImgElement = $('#uploadImgList'),
    selectImgElement = $('#files'),
    uploadForm = $('#publish'),
    //初始化时显示的元素
    imgArray = [],
      <c:choose>
        <c:when test="${method == 'update'}">
      uploadUrl = '/product/${product.productId}/edit',
        </c:when>
        <c:otherwise>
      uploadUrl = '/product/publish',
        </c:otherwise>
      </c:choose>

//    var imgArray = [{index: 102, url: 'assets/img/photos/logo-sunsynk.png'}, {index: 108, url: 'assets/img/photos/logo-shuba.png'}];
    //上传文件
    uploadFiles = [],
    // 删除文件的 id
    deleteFiles = [],
    // 现在的索引,用于删除未上传的图片
    imgIndex = 0,
    // 目前的位置
    imgSize = 0,
    maxImgSize = 4;
    <c:forEach items="${productImages}" var="img">
    imgArray.push({index:${img.imageId}, url: '${img.url}'});
    </c:forEach>
    selectImgElement.on('change', function (evt) {
        var files = evt.target.files;
        for (var i = files.length - 1; i >= 0; i--) {
            var file = files[i];
            if (!file.type.match('image.*')) {
                continue;
            }
            if ((imgSize + 1) > maxImgSize) {
                alert("超出上传限制");
                break;
            }
            var reader = new FileReader();
            reader.onload = function (e) {
                let txt = '<div class="show-img" data-type="add" data-index='+imgIndex+'><img class="thumb" src="'+e.target.result+'"/><button class="delete">X</button></div>'
                showImgElement.append(txt);
                imgIndex += 1;
                imgSize += 1;
                uploadFiles.push(file);
            }
            reader.readAsDataURL(file);
        }
    })

    $(document).on('click', '.delete', function() {
        var parent = $(this).parent();
        var index = parent.attr('data-index');
        if (parent.attr('data-type') === 'add'){
            uploadFiles[index] = undefined;
        } else {
            // delete
            deleteFiles.push(index);
        }
        parent.remove();
        imgSize -= 1;
    })

    // 上传图片
    var upload = function(formData) {
        uploadFiles.filter(s => s != undefined).forEach(v => formData.append('addImages', v));
        deleteFiles.forEach(d => formData.append('deleteImages', d));
        // addFormDatasFunction(formData);
        $.ajax({
            type: 'POST',
            url: uploadUrl,
            cache: false,
            contentType: false,
            processData: false,
            data : formData,
            success: uploadSuccess,
            error: uploadError
        })
    }

    var initShow = function() {
        imgSize += imgArray.length;
        for (var i = imgArray.length - 1; i >= 0; i--) {
            var img = imgArray[i];
            var txt = '<div class="show-img" data-type="delete" data-index='+img.index+'><img class="thumb" src="'+img.url+'"/><button class="delete">X</button></div>'
            showImgElement.append(txt);
        }
    }

    var uploadSuccess = function(result) {
        console.log(result);
        if (result.status === 200) {
            console.log(result.msg);
            let addData = result.data;
//            window.location.href = '/product/' + addData.productId + '/info';
        }
    }
    var uploadError = function(error) {
        console.log(error);
    }
    uploadForm.on('submit', function(ev) {
        var formData = new FormData($('#publish'));
        formData.append("name",$("#productName").val());
        formData.append("category",$("#productCategory").val());
        formData.append("price",$("#productPrice").val());
        formData.append("originPrice",$("#productOriginPrice").val());
        formData.append("contact1",$("#productContact1").val());
        formData.append("contact2",$("#productContact2").val());
        formData.append("type",$("#productType").val());
        formData.append("description",$("#productDescription").val());
        upload(formData);
        ev.preventDefault();
        return false;
    })


    $('#addImgBtn').on('click', () => $('#files').trigger('click'));
    initShow();

    // var form = document.forms.namedItem("publish");
    // form.addEventListener('submit', function(ev) {

    //   var oData = new FormData(form);
    //   console.log(oData);

    //   // ev.preventDefault();
    // }, false);

</script>

</body>
</html>
