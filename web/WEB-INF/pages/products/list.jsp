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
    if (window.location.href.indexOf('?') > 0){
      let href = window.location.href.replace('?', '#');

      window.location.href = href;
    }


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

  <title>列表</title>
</head>
<body>
<div id="wrapper-outer" >
  <div id="wrapper">
    <div id="wrapper-inner">
      <!-- BREADCRUMB -->
      <%@ include file="../header.jsp"%>

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
                        <a href="#bigCategory=${ca.bigCategory.id}" class="categoryClick" data-type="bigCategory" data-category="${ca.bigCategory.id}">${ca.bigCategory.name}</a>
                      </div>
                      <ul class="inline category-list">
                        <c:forEach items="${ca.category}" var="cc">
                          <li><a href="#category=${cc.id}" class="categoryClick" data-type="category"  data-category="${cc.id}">${cc.name}</a></li>
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

    <%@ include file="../footer.html"%>
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
    
/*    // 当点击分类上面的链接时
    $(document).on('click', '.categoryClick', function () {
      let type = $(this).attr('data-type'),
        id = $(this).attr('data-category'),
        href = window.location.href;
      toggleClass($('button.btn-success'), 'btn-success', 'btn-info');
      let u = href.substring(0, href.lastIndexOf('/') + 1) + '#' + type + "=" + id;
      console.log(u);
      window.location.href = u;
    })*/
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
      let data = window.location.href,
        url = data;
      data = addKeyword(data);
      data = clearSort(data);
      if (url != data){
        window.location.href = data;
      }
      else {
        console.log(window.location.hash.substring(1));
        getSearchResult(window.location.hash.replace('#', ''));
      }

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
        allPages = pageInfo.pages,
        pageListView = $('#page-list');
      nowPage = pageInfo.pageNum;
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
                  '<div class="content">点赞：'+ item.favorTimes +
                  '</div>' +
                '</div>';
    }


    // 页面加载时执行
    init();
  } );
</script>

</body>
</html>
