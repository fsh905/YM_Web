<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/19/2017
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- BREADCRUMB -->
<c:if test="${sessionScope.get('LOGIN') == null}">
<div class="breadcrumb-wrapper">
  <div class="container">
    <div class="row">
      <div class="span12">
        <ul class="breadcrumb pull-left">
          <li><a href="/index">主页</a></li>
        </ul><!-- /.breadcrumb -->

        <div class="account pull-right">
          <ul class="nav nav-pills">
            <li><a href="/login">登录</a></li>
            <li><a href="/signin">注册</a></li>
          </ul>
        </div>
      </div><!-- /.span12 -->
    </div><!-- /.row -->
  </div><!-- /.container -->
</div><!-- /.breadcrumb-wrapper -->
</c:if>
<!-- HEADER -->
<div id="header-wrapper">
  <div id="header">
    <div id="header-inner">
      <div class="container">
        <div class="navbar">
          <div class="navbar-inner">
            <div class="row">
              <div class="logo-wrapper span4">
                <a href="#nav" class="hidden-desktop" id="btn-nav">菜单</a>

                <div class="logo">
                  <a href="/index" title="Home">
                    <img src="/assets/img/logo.png" alt="Home">
                  </a>
                </div><!-- /.logo -->

                <div class="site-name">
                  <a href="/index" title="Home" class="brand">YMER</a>
                </div><!-- /.site-name -->

                <div class="site-slogan">
                  <span>简单 &amp; 方便<br>自由</span>
                </div><!-- /.site-slogan -->
              </div><!-- /.logo-wrapper -->

              <div class="info">
                <c:choose>
                  <c:when test="${sessionScope.get('SCHOOLKEY') != null}">
                    <h2>${sessionScope.get('SCHOOLKEY').schoolName}</h2>
                  </c:when>
                  <c:otherwise>
                    <c:if test="${cookie.get('SCHOOLKEY') != null}">
                      <c:set value="<%= new java.net.URLDecoder()%>" var="urlDecoder"/>
                      <h2>${urlDecoder.decode(cookie.get('SCHOOLKEY').value,'utf-8')}</h2>
                    </c:if>
                  </c:otherwise>
                </c:choose>



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
            <span class="menuparent"><a href="/index">主页</a></span>
          </li>
          <li class="menuparent">
            <span class="menuparent nolink">种类</span>
            <ul>
              <li><a href="/products/search/#bigCategory=1">闲置数码</a></li>
              <li><a href="/products/search/#bigCategory=2">玩具</a></li>
              <li><a href="/products/search/#bigCategory=3">家居日用</a></li>
              <li><a href="/products/search/#bigCategory=4" >影音家电</a></li>
              <li><a href="/products/search/#bigCategory=5" >鞋服配饰</a></li>
              <li><a href="/products/search/#bigCategory=6" >珠宝收藏</a></li>
              <li><a href="/products/search/#bigCategory=11" >闲置书籍</a></li>
              <li><a href="/products/search/#bigCategory=14" >音乐乐器</a></li>
            </ul>
          </li>
          <li class="menuparent">
            <span class="menuparent nolink">热门</span>
            <ul>
              <li><a href="/products/search/#bigCategory=7">手机</a></li>
              <li><a href="/products/search/#bigCategory=9">电脑</a></li>
              <li><a href="/products/search/#bigCategory=21">衣服</a></li>
              <li><a href="/products/search/#bigCategory=26">书籍</a></li>
            </ul>
          </li>
          <li><a href="/user/index">个人中心</a></li>
          <li><a href="#">关于我们</a></li>
        </ul><!-- /.nav -->


        <form method="get" class="site-search" action="/products/search">
          <div class="input-append">
            <input title="输入你想找的物品" class="search-query span2 form-text" placeholder="搜索" type="text"
                   name="keyword">
            <button type="submit" class="btn"><i class="icon-search"></i></button>
          </div><!-- /.input-append -->
        </form><!-- /.site-search -->
      </div><!-- /.navigation -->
    </div><!-- /.navigation-wrapper -->
  </div><!-- /.container -->
</div><!-- /.navigation -->

<!-- CONTENT -->
