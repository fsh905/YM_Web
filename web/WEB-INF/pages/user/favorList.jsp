<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/9/2017
  Time: 6:06 PM
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
    <style rel="stylesheet">
        .list-img{
            width: 200px;
            height:200px;
        }
        .editArea{
            float: right;
        }
        .editArea>button{
            display: block;
        }
        .productProfile{
            position: relative;
        }
        .productPasted{
            position: absolute;
            color: red;
            font-size: xx-large;
            bottom: -30px;
            right: 0;
            font-weight: bold;
        }
        .productOnline{
            display: none;
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

                                        <a class="btn btn-primary btn-large list-your-property arrow-right" href="/product/publish">发布闲置</a>
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
            <c:if test="${result.data == null}">
                <h1>${result.msg}</h1>
            </c:if>
            <c:if test="${result.data != null}">
                <c:set var="user" value="${result.data}"/>
            </c:if>
            <!-- CONTENT -->
            <div id="content"><div class="container">
                <div id="main">
                    <h1 class="page-header">${user.name}的个人信息</h1>
                    <div class="row">
                        <div class="span3">
                            <div class="header">
                                <img src="${user.photo}">
                                <h2>${user.name}</h2>
                                <p>等级：${user.grade}</p>
                                <c:set var="simpleDateFormat" value='<%= new java.text.SimpleDateFormat("yyyy-MM-dd") %>'/>
                                <p>注册时间：${simpleDateFormat.format(user.registTime)}</p>
                                <ul class="nav nav-pills nav-stacked">
                                    <c:choose>
                                        <c:when test="${isSelf != 'NO'}">
                                            <%--登录--%>
                                            <li ><a href="/user/info">信息</a></li>
                                            <li><a href="/user/index">闲置</a></li>
                                            <li class="active"><a href="/user/favor">点赞</a></li>
                                            <li><a href="/user/comment">评论</a></li>
                                            <li><a href="/logout">退出</a> </li>
                                        </c:when>
                                        <c:otherwise>
                                            <%--没有登录--%>
                                            <li class="active"><a href="/user/index">闲置</a></li>
                                        </c:otherwise>
                                    </c:choose>

                                </ul>
                            </div>
                        </div>
                        <div class="span9">
                            <div class="rows">
                                <h1 class="page-header">${user.name}的闲置</h1>

                                <div class="properties-rows">
                                    所有点赞的商品
                                </div><!-- /.properties-rows -->
                                <div class="properties-rows">
                                    <div class="row" id="product-show-list">
                                        <%------------------------------------------------------%>
                                    </div><!-- /.row -->
                                </div><!-- /.properties-rows -->
                                <div class="pagination pagination-centered">
                                    <ul id="page-list">

                                    </ul>
                                </div><!-- /.pagination -->
                            </div>
                        </div>
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
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/assets/js/carousel.js"></script>


<script type="text/javascript" src="/assets/libraries/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/assets/libraries/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/assets/libraries/iosslider/_src/jquery.iosslider.min.js"></script>
<script type="text/javascript" src="/assets/libraries/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="/assets/js/realia.js"></script>

<script type="text/javascript">

    let requestData = function(data) {
      $.ajax({
        type: "post",
        url: '/product/list/favor',
        data: data,
        success: function(res) {
          console.log(res);
          let data = res.data;
          let array = data.list;
          showList(array);
          showPage(data);
        },
        error: function(err) {
          console.error(err);
        }
      })
    }

    let showPage = function(pageInfo) {
      let allCount = pageInfo.total,
        allPages = pageInfo.pages,
        nowPage = pageInfo.pageNum,
        pageListView = $('#page-list');
      pageListView.empty();
      if (allPages < 5) {
        apendPages(1,allPages, nowPage);
      } else {
        if (pageInfo.isLastPage) {
          apendPages(nowPage-5, nowPage, nowPage);
        } else if (pageInfo.isFirstPage) {
          apendPages(nowPage, nowPage+5, nowPage);
        } else {
          apendPages(nowPage-1, nowPage+1, nowPage);
        }
      }
      pageListView.append('<li><a href="void:javascript()" class="active">共'+allCount+'条</a></li>');
    }

    let apendPages = function(start,end,nowPage) {
      let pageListView = $('#page-list');
      for (let i=start; i <= end; i++) {
        if (i === nowPage)
          pageListView.append('<li><a href="void:javascript()" class="active">'+i+'</a></li>');
        else
          pageListView.append('<li><a href="void:javascript()" data-page='+i+' class="pageChange">'+i+'</a></li>');
      }
    }

    let showList = function(items) {
      let listView = $('#product-show-list');
      listView.empty();
      items.forEach(item => {
        listView.append(decorate(item));
      })
    }

    let decorate = function(item) {
      let pastClass = 'productOnline';
      if (item.status === 2) {
        pastClass = 'productPasted';
      }
      return '<div class="property span9" data-product-id='+item.productId+'>'+
        ' <div class="row ">'+
      ' <div class="image span3">'+
      ' <div class="content">'+
      ' <a href="/product/'+ item.productId +'"></a>'+
      ' <img src="'+ item.header +'" class="list-img" alt="">'+
      ' </div>'+
      ' </div>'+
      ' <div class="body span6 productProfile">'+
          '<div class="' +pastClass+ '">下架了</div>'+
      ' <div class="title-price row">'+
      ' <div class="title span4">'+
      ' <h2><a href="/product/'+ item.productId +'">'+ item.name +'</a></h2>'+
      '  </div>'+
      ' <div class="price">'+
      item.price +
      ' </div>'+
      ' </div>'+
      ' <div class="location">'+ new Date(item.upTime).toLocaleString() +'</div>'+
      ' <p>'+ item.description +'</p>'+
      ' <div class="area">'+
      ' <span class="key">查看次数:</span>'+
      '<span class="value">'+ item.watchTimes +'</span>'+
      ' </div>'+
      ' <div class="bedrooms"><div class="content">'+ item.favorTimes +'</div></div>'+
      ' <div class="bathrooms"><div class="content">评论次数</div></div>'+
        '<div class="editArea">'+
        '</div>'+
      ' </div>'+
      '</div>'+
        '</div>';
    }

    let requestDataBySort = function(page=1) {
      let orderBy = $('#orderBy').val(),
        orderMethod = $('#orderMethod').val();
      requestData({orderBy: orderBy, method: orderMethod, page});
    }

    $(function () {
      requestData();
      $('#orderBy').on('change', function() {
        requestDataBySort();
      })
      $(document).on('click', '.pageChange', function() {
        let page = $(this).attr('data-page');
        requestDataBySort(page);
      })

    })

</script>

</body>
</html>