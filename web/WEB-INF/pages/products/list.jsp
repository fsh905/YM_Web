<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/13/2017
  Time: 5:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
  <script type="text/javascript">
    if (window.location.href.indexOf('?') > 0)
      window.location.href = window.location.href.replace('?', '#');
  </script>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="Aviators - byaviators.com">


  <link rel="shortcut icon" href="/assets/img/favicon.png" type="image/png">
  <link rel="stylesheet" href="/assets/css/bootstrap.css" type="text/css">
  <link rel="stylesheet" href="/assets/css/bootstrap-responsive.css" type="text/css">
  <link rel="stylesheet" href="/assets/libraries/chosen/chosen.css" type="text/css">
  <link rel="stylesheet" href="/assets/libraries/bootstrap-fileupload/bootstrap-fileupload.css" type="text/css">
  <link rel="stylesheet" href="/assets/libraries/jquery-ui-1.10.2.custom/css/ui-lightness/jquery-ui-1.10.2.custom.min.css" type="text/css">
  <link rel="stylesheet" href="/assets/libraries/datepicker-master/dist/datepicker.min.css" type="text/css" id="color-variant-default">
  <link rel="stylesheet" href="/assets/css/realia-blue.css" type="text/css" id="color-variant-default">
  <link rel="stylesheet" href="#" type="text/css" id="color-variant">
  <style type="text/css">
    input.price,input.date{
      width: 50px;
      height: 13px;
      margin: 0;
    }
    input.date{
      width: 72px;
      border-radius: 4px;
    }
    .properties-grid .property:nth-last-child(1), .properties-grid .property:nth-last-child(2), .properties-grid .property:nth-last-child(3) {
      margin-bottom: 30px;
    }
    .product-categorys {
      /*background: antiquewhite;*/
      /*border: 1px dashed;*/
      margin-bottom: 1em;
    }
    .product-category {
      padding: 0;
      border-bottom: 2px ridge;
    }
    .category-header {
      display: inline-block;
      width: 100px;
      background: #fefefe;
      margin: 0;
      height: 2em;
      padding: 1em;
      font-weight: bolder;
    }
    ul.inline.category-list {
      margin: 0;
    }
    .category-list{
      display: inline-block;
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

              <%--<form method="get" class="site-search" action="/products/search">--%>
                <div class="input-append">
                  <input title="输入" id="keyword" class="search-query span2 form-text" placeholder="搜索" type="text" name="keyword">
                  <button id="keyword-btn" class="btn"><i class="icon-search"></i></button>
                </div><!-- /.input-append -->
              <%--</form><!-- /.site-search -->--%>
            </div><!-- /.navigation -->
          </div><!-- /.navigation-wrapper -->
        </div><!-- /.container -->
      </div><!-- /.navigation -->

      <!-- CONTENT -->
      <div id="content">
        <div class="container">

          <div id="main">
            <div class="row">

              <h1 class="page-header">商品列表</h1>
              <p>全部结果:"<span id="show-keyword">手机</span>"</p>
              <div class="properties-rows">

                <div class="product-categorys">
                  <c:forEach items="${category}" var="ca">
                    <div class="product-category">
                      <div class="category-header">
                        <a href="void:javascript()" class="categoryClick" data-type="bigCategory" data-category="${ca.bigCategory.id}">${ca.bigCategory.name}</a>
                      </div>
                      <ul class="inline category-list">
                        <c:forEach items="${ca.category}" var="cc">
                          <li><a href="void:javascript()" class="categoryClick" data-type="category"  data-category="${cc.id}">${cc.name}</a></li>
                        </c:forEach>
                      </ul>
                    </div>
                  </c:forEach>

                </div>

                <div class="filter">

                  <ul class="inline">
                    <li>
                      <button class="btn btn-info sort-btn" data-type="favorTimes">点赞</button>
                    </li>
                    <li>
                      <button class="btn btn-info sort-btn" data-type="watchTimes">查看</button>
                    </li>
                    <li>
                      <button class="btn btn-info sort-btn" data-type="commentTimes">评论</button>
                    </li>
                    <li>
                      价格:
                    </li>
                    <li>
                      <input type="number" min="0" class="price" name="lowPrice">
                    </li>
                    <li>
                      :
                      <input type="number" min="0" class="price" name="highPrice">
                    </li>
                    <li>
                      <button class="btn btn-primary" id="priceBtn">确定</button>
                    </li>
 <%-- 暂时不提供                   <li>
                      上架时间:
                    </li>
                    <li>
                      <input type="text" class="date" name="startDate">
                    </li>
                    <li>
                      :
                      <input type="text" class="date" name="endDate">
                    </li>
                    <li>
                      <button class="btn btn-primary" id="dataBtn">确定</button>
                    </li>--%>
                    <li>
                      <input type="checkbox" class="type-btn" name="type" value="3">
                    </li>
                    <li>
                      闲置
                    </li>
                    <li>
                      <input type="checkbox" name="type" class="type-btn" value="4">
                    </li>
                    <li>
                      求购
                    </li>

                  </ul>
                </div><!-- /.filter -->
              </div><!-- /.properties-rows -->
              <div class="properties-grid">
                <div class="row" id="product-show-list">

                </div><!-- /.row -->
              </div><!-- /.properties-grid -->
              <div class="pagination pagination-centered">
                <ul id="page-list">

                </ul>
              </div><!-- /.pagination -->

            </div>
          </div>
        </div>

      </div><!-- /#content -->
    </div><!-- /#wrapper-inner -->


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
<script type="text/javascript" src="/assets/libraries/datepicker-master/dist/datepicker.min.js"></script>
<script type="text/javascript" src="/assets/libraries/datepicker-master/i18n/datepicker.zh-CN.js"></script>

<script>



  $( function() {

    let nowPage = 1;

    $( ".date" ).datepicker({
      language: 'zh-CN',
      format: 'yyyy-mm-dd hh:MM:ss'
    });
    
    // 分类
    $(document).on('click', '.categoryClick', function () {
      let type = $(this).attr('data-type'),
        id = $(this).attr('data-category'),
        href = window.location.href;
      toggleClass($('button.btn-success'), 'btn-success', 'btn-info');
      window.location.href = href.substring(0, href.lastIndexOf('/') + 1) + '#' + type + "=" + id;
    })
    // 排序
    $('.sort-btn').on('click',  function () {
      let type = $(this).attr('data-type'),
        href = window.location.href,
        clickedBtn = $('.sort-btn.btn-success'),
        self = $(this);
      // 没有其他排序点击过
      if (!clickedBtn.length) {
        window.location.href = href + '&' + type +'=true';
      } else {
        //已经进行过其他的排序
        window.location.href = href.replace(clickedBtn.attr('data-type'), self.attr('data-type'));
        // 移除class
        toggleClass(clickedBtn, 'btn-success', 'btn-info');
      }
      toggleClass(self, 'btn-info', 'btn-success');
    })
    
    $('#priceBtn').on('click', function () {
      let low = $('input[name="lowPrice"]'),
        high = $('input[name="highPrice"]'),
        lp = low.val(),
        hp = high.val(),
        href = window.location.href;
      if (hp && lp && parseInt(hp) < parseInt(lp)) {
        alert('请输入正确的价格区间');
        return;
      }
      if (hp) {
        if (href.indexOf('highPrice') >= 0) {
          href = replaceValue(href, 'highPrice', hp);
        } else {
          href = href += '&highPrice=' + hp;
        }
      }
      if (lp) {
        if (href.indexOf('lowPrice') >= 0) {
          href = replaceValue(href, 'lowPrice', lp);
        } else {
          href = href += '&lowPrice=' + lp;
        }
      }
      window.location.href = href;
    })

    $(document).on('click', '.pageChange', function() {
      let self = $(this),
        page = self.attr('data-page');
      if (page === nowPage) {
        return;
      }
      nowPage = page;
      $('li.active').removeClass('active');
      self.parent().addClass('active');
      getSearchResultByPage(page);
    })


    
/*暂时不提供日期搜索
    $('#dateBtn').on('click', function () {
      
    })*/

    window.onhashchange = function () {
      console.log(window.location.hash.substring(1));
      getSearchResult(window.location.hash.replace('#', ''));
    }



    $('.type-btn').on('click', function () {
        let self = $(this),
          href = window.location.href,
          types = $('.type-btn'),
          flag = true;
      // 是不是两个都被点击
      for(let i = 0; i < types.length; i++) {
        let r = $(types[i]).is(':checked');
        if (r) {
          href += '&type=' + $(types[i]).val();
        } else {
          href.replace('&type='+$(types[i]).val(),'');
        }
        flag &= r;
      }
      if (flag) {
        href = href.replace(/&type=\d+/g,'');
      }
      window.location.href = href;
    });

    $('#keyword-btn').on('click', function () {
      let href = window.location.href,
          keyword = $('#keyword').val();
      if (keyword) {
        window.location.href = href.substring(0, href.lastIndexOf('/') + 1) + '#keyword=' + keyword;
        $('#search-keyword').val(keyword);
      }


    })

    let getSearchResult = function (data = {}) {
      $.ajax({
        type: 'post',
        url: '/products/search',
        data: data,
        success: function (res) {
          console.log(res);
          let pageInfo = res.data;
          showList(pageInfo.list);
          showPage(pageInfo);
        },
        error: function (err) {
          console.error(err);
        }
      })
    },

    replaceValue = function (url, key, value) {
      let pattern = new RegExp(key + '=([^&]+)');
      return url.replace(pattern, function (str,p1, off, index) {
        return str.replace(p1, value);
      })
    },
  
    /**
     * 替换对象的class
     */
    toggleClass = function(obj, oldClass, newClass) {
      obj.toggleClass(function () {
        if (obj.is("."+oldClass)) {
          obj.removeClass(oldClass);
        }
        return newClass;
      })
    },
    clearSort = function (href) {
      href = href.replace('&favorTimes=true','');
      href = href.replace('&watchTimes=true','');
      return href.replace('&commentTimes=true','');

    },
    // 关键词添加
    addKeyword = function (href) {
      let keyword = $('#keyword').val();
      if (keyword) {
        if (href.indexOf('keyword') >= 0) {
          return replaceValue(href, 'keyword', keyword);
        }
        return href + '&keyword=' + keyword;
      }
      return href;
    },
    // 加载页面
    init = function () {
      let data = window.location.href;
      console.log('load data:' + data);
      data = addKeyword(data);
      data = clearSort(data);
      if (window.location.href != data)
        window.location.href = data;
      else
        getSearchResult();
    },
    getSearchResultByPage = function (page) {
      let url = window.location.href;
      if (url.indexOf('page') >= 0) {
        url = replaceValue(url, 'page', page);
      } else {
        url += '&page=' + page;
      }
      window.location.href = url;
    }



    ///////////////////////////////////////////////////

    let showPage = function(pageInfo) {
      let allCount = pageInfo.total,
        allPages = pageInfo.pages;
        nowPage = pageInfo.pageNum,
        pageListView = $('#page-list');
      pageListView.empty();
      if (allPages < 5) {
        apendPages(1,allPages, nowPage);
      } else {
        if (pageInfo.isLastPage) {
          apendPages(nowPage-5, nowPage);
        } else if (pageInfo.isFirstPage) {
          apendPages(nowPage, nowPage+5);
        } else {
          apendPages(nowPage-1, nowPage+1);
        }
      }
      pageListView.append('<li class="active"><a href="void:javascript()" >共'+allCount+'条</a></li>');
    }

    let apendPages = function(start,end) {
      let pageListView = $('#page-list');
      for (let i=start; i <= end; i++) {
        if (i === nowPage) {
          pageListView.append('<li class="active"><a href="void:javascript()" data-page='+i+' class="pageChange">'+i+'</a></li>');
        } else
          pageListView.append('<li><a href="void:javascript()" data-page='+i+' class="pageChange">'+i+'</a></li>');
      }
    }

    let showList = function(items) {
      let listView = $('#product-show-list');
      listView.empty();
      if (!items) {
          listView.append('<h2>未找到您需要的结果</h2>');
      }
      items.forEach(item => {
        listView.append(decorate(item));
      })
    }

    let decorate = function(item) {
      let type = '闲置';
      if (item.type === 4) {
        type = "求购";
      }
      return '<div class="property span3">' +
                '<div class="image">' +
                  '<div class="content">' +
                    '<a href="/product/'+item.productId+'"></a>' +
                    '<img src="'+item.header+'" alt="">' +
                  '</div>' +
                  '<div class="price">￥'+item.price+'</div>' +
                  '<div class="reduced">'+type+' </div>' +
                '</div>' +
                '<div class="title">' +
                  '<h2>' +
                    '<a href="/product/'+item.productId+'">'+item.name+'</a>' +
                  '</h2>' +
                '</div>' +
                '<div class="location">'+new Date(item.upTime).toLocaleDateString()+'</div>' +
                  '<div class="area">' +
                    '<span class="key">查看次数:</span>' +
                    '<span class="value">'+item.watchTimes+'</span>' +
                  '</div>' +
                '<div class="bedrooms">' +
                  '<div class="content">点赞：100 '+
                  '</div>' +
                '</div>' +
                '<div class="bathrooms">' +
                  '<div class="content">评论：20</div>' +
                  '</div>' +
                '</div>';
    }


    // 页面加载时执行
    init();
  } );
</script>

</body>
</html>
