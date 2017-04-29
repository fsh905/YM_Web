<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/8/2017
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
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
  <link rel="stylesheet"
        href="assets/libraries/jquery-ui-1.10.2.custom/css/ui-lightness/jquery-ui-1.10.2.custom.min.css"
        type="text/css">
  <link rel="stylesheet" href="assets/css/realia-blue.css" type="text/css" id="color-variant-default">
  <link rel="stylesheet" href="#" type="text/css" id="color-variant">
  <style rel="stylesheet">
    input.price {
      width: 90%;
    }
    div#setSchool {
      width: 100%;
      height: 100%;
      position: fixed;
      z-index: 999;
      background: black;
      opacity: 0.8;
      text-align: center;
    }
    div#school_chzn {
      top: 200px;
      font-size: x-large;
      background: black;
    }
    h3#setSchool-header {
      position: relative;
      top: 199px;
      color: white;
    }
    button#checkSchool-btn {
      display: inline-block;
      position: relative;
      top: 255px;
      left: -126px;
    }
    .img-slide{
      max-height: 330px;
    }
  </style>
  <title>主页</title>
</head>
<body>
<c:if test="${setSchool != null}">
<div id="setSchool">
  <div id="school-list">
    <h3 id="setSchool-header">请选择你的学校：</h3>
    <select id="school">
      <c:forEach items="${schools}" var="school">
        <option value="${school.schoolId}">${school.schoolName}</option>
      </c:forEach>
    </select>
    <button id="checkSchool-btn" class="btn btn-primary">确定</button>
  </div>
</div>
</c:if>
<div id="wrapper-outer">
  <div id="wrapper">
    <div id="wrapper-inner">
      <!-- BREADCRUMB -->
      <%@ include file="header.jsp"%>

      <!-- CONTENT -->
      <div id="content">
        <div class="container">
          <div id="main">
            <div class="slider-wrapper">
              <div class="slider">
                <div class="slider-inner">
                  <div class="row">
                    <div class="images span9">
                      <div class='iosSlider'>
                        <div class='slider-content'>
                          <c:forEach items="${watchProducts}" var="wa">
                            <div class="slide">
                              <img class="img-slide" src="${wa.header}" alt="">

                              <div class="slider-info">
                                <div class="price">
                                  <h2>￥${wa.price}</h2>
                                  <a href="/product/${wa.productId}">详情</a>
                                </div><!-- /.price -->
                                <h2><a href="/product/${wa.productId}">${wa.name}</a></h2>
                                <div class="bathrooms">${wa.watchTimes}</div><!-- /.bathrooms -->
                                <div class="bedrooms">${wa.favorTimes}</div><!-- /.bedrooms -->
                              </div><!-- /.slider-info -->
                            </div>
                            <!-- /.slide -->
                          </c:forEach>

                        </div><!-- /.slider-content -->
                      </div><!-- .iosSlider -->

                      <ul class="navigation">
                        <li class="active"><a>1</a></li>
                        <li><a>2</a></li>
                        <li><a>3</a></li>
                      </ul><!-- /.navigation-->
                    </div><!-- /.images -->
                    <div class="span3">
                      <div class="property-filter">
                        <div class="content">
                          <form method="get" action="/products/search/">
                            <div class="location control-group">
                              <label class="control-label" for="bigCategory">
                                种类
                              </label>
                              <div class="controls">
                                <select id="bigCategory">
                                  <c:forEach items="${bigCategory}" var="cate">
                                    <option value="${cate.id}">${cate.name}</option>
                                  </c:forEach>
                                </select>
                              </div><!-- /.controls -->
                            </div><!-- /.control-group -->

                            <div class="type control-group">
                              <label class="control-label" for="category">
                                类别
                              </label>
                              <div class="controls">
                                <select id="category" name="category">
                                  <c:forEach items="${category}" var="cat">
                                    <option value="${cat.id}">${cat.name}</option>
                                  </c:forEach>
                                </select>
                              </div><!-- /.controls -->
                            </div><!-- /.control-group -->

                            <div class="beds control-group">
                              <label class="control-label" for="inputBeds">
                                最低价
                              </label>
                              <div class="controls">
                                <input class="price" id="inputBeds" type="number" value="0" name="lowPrice">
                              </div><!-- /.controls -->
                            </div><!-- /.control-group -->

                            <div class="baths control-group">
                              <label class="control-label" for="inputBaths">
                                最高价
                              </label>
                              <div class="controls">
                                <input class="price" id="inputBaths" type="number" name="highPrice" value="1000">
                              </div><!-- /.controls -->
                            </div><!-- /.control-group -->
                            <div class="form-actions">
                              <input type="submit" value="搜索" class="btn btn-primary btn-large">
                            </div><!-- /.form-actions -->
                          </form>
                        </div><!-- /.content -->
                      </div><!-- /.property-filter -->

                    </div><!-- /.span3 -->
                  </div><!-- /.row -->
                </div><!-- /.slider-inner -->
              </div><!-- /.slider -->
            </div><!-- /.slider-wrapper -->

            <div class="row">
              <div class="span9">
                <h1 class="page-header">最新发布</h1>
                <div class="properties-grid">
                  <div class="row">
                    <c:forEach items="${newProducts}" var="nep">
                      <div class="property span3">
                        <div class="image">
                          <div class="content">
                            <a href="/product/${nep.productId}"></a>
                            <img src="${nep.header}" alt="">
                          </div><!-- /.content -->

                          <div class="price">￥${nep.price}</div><!-- /.price -->
                          <div class="reduced">
                            <c:choose>
                              <c:when test="${nep.type == 3}">
                                闲置
                              </c:when>
                              <c:otherwise>
                                求购
                              </c:otherwise>
                            </c:choose>
                          </div><!-- /.reduced -->
                        </div><!-- /.image -->

                        <div class="title">
                          <h2><a href="/product/${nep.productId}">${nep.name}</a></h2>
                        </div><!-- /.title -->

                        <div class="location">
                          <c:set var="simpleDateFormat" value='<%= new java.text.SimpleDateFormat("hh-MM") %>'/>
                          <c:out value="${simpleDateFormat.format(nep.upTime)}"/>
                        </div><!-- /.location -->
                        <div class="area">
                          <span class="key">浏览:</span><!-- /.key -->
                          <span class="value">${nep.watchTimes}</span><!-- /.value -->
                        </div><!-- /.area -->
                        <div class="bedrooms">
                          <div class="content">${nep.favorTimes}</div>
                        </div><!-- /.bedrooms -->
                          <%--<div class="bathrooms"><div class="content"></div></div><!-- /.bathrooms -->--%>
                      </div>
                      <!-- /.property -->
                    </c:forEach>

                  </div><!-- /.row -->
                </div><!-- /.properties-grid -->
              </div>
              <div class="sidebar span3">

                <div class="hidden-tablet">
                  <div class="widget properties last">
                    <div class="title">
                      <h2>热门闲置</h2>
                    </div><!-- /.title -->

                    <div class="content">
                      <c:forEach items="${commentProducts}" var="com">
                        <div class="property">
                          <div class="image">
                            <a href="/product/${com.productId}"></a>
                            <img src="${com.header}" alt="">
                          </div><!-- /.image -->

                          <div class="wrapper">
                            <div class="title">
                              <h3>
                                <a href="product/${com.productId}">${com.name}</a>
                              </h3>
                            </div><!-- /.title -->
                            <div class="location">
                              // time
                              <c:out value="${simpleDateFormat.format(com.upTime)}"/>
                            </div><!-- /.location -->
                            <div class="price">￥${com.price}</div><!-- /.price -->
                          </div><!-- /.wrapper -->
                        </div>
                        <!-- /.property -->
                      </c:forEach>

                    </div><!-- /.content -->
                  </div><!-- /.properties -->
                </div>
              </div>
            </div>
            <div class="carousel">
              <h2 class="page-header">点赞最多</h2>

              <div class="content">
                <a class="carousel-prev" href="/products/search">Previous</a>
                <a class="carousel-next" href="/products/search">Next</a>
                <ul>
                  <c:forEach items="${favorProducts}" var="favor">
                    <li>
                      <div class="image">
                        <a href="/product/${favor.productId}"></a>
                        <img src="${favor.header}" alt="">
                      </div><!-- /.image -->
                      <div class="title">
                        <h3><a href="/product/${favor.productId}">${favor.name}</a></h3>
                      </div><!-- /.title -->
                      <div class="location">
                        <c:out value="${simpleDateFormat.format(favor.upTime)}"/>
                      </div><!-- /.location-->
                      <div class="price">￥${favor.price}</div><!-- .price -->
                      <div class="area">
                        <span class="key">浏览:</span>
                        <span class="value">${favor.watchTimes}</span>
                      </div><!-- /.area -->
                      <div class="bathrooms">
                        <div class="inner">${favor.favorTimes}</div>
                      </div><!-- /.bathrooms -->
                      <div class="bedrooms">
                        <div class="inner">${favor.favorTimes}</div>
                      </div><!-- /.bedrooms -->

                    </li>
                  </c:forEach>

                </ul>
              </div><!-- /.content -->
            </div><!-- /.carousel -->
          </div>
        </div>

        </div><!-- /#content -->
    </div><!-- /#wrapper-inner -->

    <%@ include file="footer.html"%>
  </div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->


<!--   -->
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/jquery.ezmark.js"></script>
<script type="text/javascript" src="assets/js/jquery.currency.js"></script>
<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
<!-- <script type="text/javascript" src="assets/js/retina.js"></script> -->
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/carousel.js"></script>
<!--   -->
<!--   -->
<script type="text/javascript"
        src="assets/libraries/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="assets/libraries/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="assets/libraries/iosslider/_src/jquery.iosslider.min.js"></script>
<script type="text/javascript" src="assets/libraries/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="assets/js/realia.js"></script>
<c:if test="${setSchool != null}">
<script type="text/javascript">
  $('#checkSchool-btn').on('click', function () {
    let sc = $('#school'),
      id = sc.val(),
      name = sc.text(),
      d = new Date();
    d.setTime(d.getTime() + (30*24*60*60*1000));
    let expires = "expires="+ d.toUTCString();
    document.cookie = "SCHOOLID=" + id + ";" + expires + ";path=/";
    document.cookie = "SCHOOLKEY=" + name + ";" + expires + ";path=/";
    $('#setSchool')[0].remove();
    window.location.replace(location.href);
  })

</script>
</c:if>
<script type="text/javascript">
  $('#bigCategory').on('change', function () {
    let big = $(this).val();
    $.get('/category/'+big,function (res) {
      let cate = $('#category'),
        cates = res.data;
      if (res.status === 200) {
        cate.empty();
        for(let i=0; i<cates.length; i++) {
          let t = cates[i];
          cate.append('<option value="'+t.id+'">' + t.name + '</option>');
        }
        cate.trigger("liszt:updated");
      }
    })
  })
</script>
</body>
</html>
