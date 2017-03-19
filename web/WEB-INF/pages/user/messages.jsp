<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/15/2017
  Time: 7:17 PM
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
  <style type="text/css">
    .message {
      background: azure;
      padding: 1em;
      margin-bottom: 7px;
    }
    .edit{
      text-align: right;
    }
  </style>
  <title>Realia | HTML Template</title>
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
                <img src="${user.photo}">
                <h2>${user.name}</h2>
                <p>等级：${user.grade}</p>
                <c:set var="simpleDateFormat" value='<%= new java.text.SimpleDateFormat("yyyy-MM-dd") %>'/>
                <p>注册时间：${simpleDateFormat.format(user.registTime)}</p>
                <ul class="nav nav-pills nav-stacked">
                      <%--登录--%>
                      <li ><a href="/user/info">信息</a></li>
                      <li class="active"><a href="/user/messages">消息<span class="badge badge-info">${messageCount}</span></a></li>
                      <li><a href="/user/index">闲置</a></li>
                      <li><a href="/user/favor">点赞</a></li>
                      <li><a href="/logout">退出</a></li>
                </ul>
              </div>
            </div>
            <div class="span9">
              <div class="rows">

                <h2>最近闲置</h2>
                <hr/>
                <div id="message-show">

                </div>
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
    $.ajax({
      type: "post",
      url: '/message/list',
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
        pageListView.append('<li class="page-li active"><a href="void:javascript()"  data-page='+i+' class="pageChange">'+i+'</a></li>');
      else
        pageListView.append('<li class="page-li"><a href="void:javascript()" data-page='+i+' class="pageChange">'+i+'</a></li>');
    }
  }

  let showList = function(items) {
    let listView = $('#message-show');
    listView.empty();
    if (items == null) {
      listView.appned('<h1>没有数据</h1>');
      return;
    }
    items.forEach(item => {
      listView.append(decorate(item));
    })
  }

  let decorate = function(item) {
    return '<div class="message"><div class="msg-header"><h2>'+item.title+'</h2></div><div class="msg-content"><p>'+item.content+'</p></div><div class="edit"><button class="delete-btn" data-id="'+item.msgId+'">删除</button></div></div>'
  };

  $(document).on('click', '.delete-btn', function () {
    let self = $(this),
    id = self.attr('data-id');
    $.ajax({
      type: 'post',
      url: '/message/'+id+'/delete',
      success: function (res) {
        alert(res.msg);
      },
      error: function (err) {
        console.error(err);
      }
    })
  })

  $(document).on('click', '.pageChange', function () {
    let self = $(this),
      page = self.attr('data-page');
    $('.page-li').removeClass('active');
    self.parent().addClass('active');
    if (nowPage != page)
      requestData({page})
  })


  $(function () {
    requestData();
  })

</script>
</body>
</html>