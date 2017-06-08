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
    <title>个人信息</title>
</head>
<body>
<div id="wrapper-outer" >
    <div id="wrapper">
        <div id="wrapper-inner">
            <!-- BREADCRUMB -->
            <%@ include file="../header.jsp"%>
            <c:choose>
                <c:when test="${isSelf == 'NO'}" >
                    <c:set var="user" value="${result.data}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="user" value="${sessionScope.get('LOGINUSER')}"/>
                </c:otherwise>
            </c:choose>
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
                                <c:if test="${user.registTime != null}">
                                    <p>注册时间：${simpleDateFormat.format(user.registTime)}</p>
                                </c:if>
                                <ul class="nav nav-pills nav-stacked">
                                    <c:choose>
                                        <c:when test="${isSelf != 'NO'}">
                                            <%--登录--%>
                                            <li ><a href="/user/info">信息</a></li>
                                            <li><a href="/user/messages">消息<span class="badge badge-info">${messageCount}</span></a></li>
                                            <li class="active"><a href="/user/index">闲置</a></li>
                                            <li><a href="/user/favor">点赞</a></li>
                                            <li><a href="/logout">退出</a></li>
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
                                    <div class="filter">
                                        <form action="?" method="get" class="form-horizontal">
                                            <div class="control-group">
                                                <label class="control-label" >
                                                    排序条目
                                                    <span class="form-required" title="This field is required.">*</span>
                                                </label>
                                                <div class="controls">
                                                    <select id="orderBy">
                                                        <option value="price">价格</option>
                                                        <option value="date">发布时间</option>
                                                    </select>
                                                </div><!-- /.controls -->
                                            </div><!-- /.control-group -->

                                            <div class="control-group">
                                                <label class="control-label" for="orderMethod">
                                                    排序方式
                                                    <span class="form-required" title="This field is required.">*</span>
                                                </label>
                                                <div class="controls">
                                                    <select id="orderMethod">
                                                        <option value="1">升序</option>
                                                        <option value="0">降序</option>
                                                    </select>
                                                </div><!-- /.controls -->
                                            </div><!-- /.control-group -->
                                        </form>
                                    </div><!-- /.filter -->
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
    let nowPage = 1;
    let requestData = function(data) {
      <c:if test="${isSelf == 'NO'}">
      if (data === undefined) {
        data = {};
      }
      data.userId = ${user.userId};
      </c:if>
      $.ajax({
        type: "post",
        url: '/product/list',
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
    // 显示页数
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
          pageListView.append('<li  class="page-li active"><a href="void:javascript()">'+i+'</a></li>');
        else
          pageListView.append('<li class="page-li"><a href="void:javascript()" data-page='+i+' class="pageChange">'+i+'</a></li>');
      }
    }

    let showList = function(items) {
      let listView = $('#product-show-list');
      listView.empty();
      if (items == null){
        listView.append('<h1>没有数据</h1>');
        return;
      }
      items.forEach(item => {
        listView.append(decorate(item));
      })
    }

    let decorate = function(item) {
      let pastClass = 'productOnline',
        editBtn = '';
      <c:if test="${isSelf != 'NO'}">
      editBtn = '<a href="/product/'+item.productId+'/update"  class="btn btn-primary">编辑</a>'+
        '<button class="productDelete btn btn-link" data-product-id="'+item.productId+'" >下架</button>';
      </c:if>
      if (item.status === 2) {
        pastClass = 'productPasted';
        editBtn = '';
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
      ' <div class=""><div class="content">点赞次数：'+ item.favorTimes +'</div></div>'+
        '<div class="editArea">'+
          editBtn +
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

    <c:if test="${isSelf != 'NO'}">

    $(document).on('click', '.productDelete', function() {
      if (confirm('是否下架?')){
        let id = $(this).attr('data-product-id');
        deleteProduct(id, function (res) {
          if (res.status == 200){
//              $('div[data-product-id="'+id+'"]').remove();
            requestDataBySort();
          } else {
            alert(data.msg);
          }
        });
      }
    })

    let deleteProduct = function(id, callback) {
      $.ajax({
        type: 'post',
        url: '/product/' + id +'/past',
        success: function (res) {
          callback(res);
        },
        error: function (err) {
          console.error(err);
        }
      })
    }
    </c:if>
    $(function () {
      requestData();
      $('#orderBy').on('change', function() {
        requestDataBySort();
      })
      $('#orderMethod').on('change', function () {
        requestDataBySort();
      })
      $(document).on('click', '.pageChange', function() {
        let self = $(this),
          page = self.attr('data-page');
        $('.page-li').removeClass('.active');
        self.addClass('active');
        if (nowPage != page)
          requestDataBySort(page);
      })

    })

</script>

</body>
</html>