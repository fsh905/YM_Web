<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/10/2017
  Time: 9:14 PM
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
        .preview-img{
            height: 400px;
        }
        .preview {
            height: 400px;
            max-width:100%;
            text-align: center;
        }
        .user-header{
            width: 100px;
            height:100px;
        }
        .span4{
            margin-left: 4px;
        }
        #favor-btn{
            background-repeat: no-repeat;
            width: 52px;
            height: 52px;
            border:none;
        }
        .comment-date {
            font-size: small;
            margin: 7px;
        }
        .comment-main{
            font-size: x-large;
        }
        textarea#inputMessages {
            width: 100%;
        }
    </style>

    <title>Realia | HTML Template</title>
</head>
<body>
<div id="wrapper-outer" >
    <div id="wrapper">
        <div id="wrapper-inner">
            <!-- BREADCRUMB -->
            <%@ include file="../header.jsp"%>

            <!-- CONTENT -->
            <div id="content"><div class="container">
                <div id="main">
                    <div class="row">
                        <div class="span9">
                            <h1 class="page-header">${product.name}</h1>

                            <div class="carousel property">
                                <div class="preview">
                                    <c:if test="${productImages != null}">

                                        <c:if test="${productImages.get(0) != null}">
                                                <img class="preview-img" src="${productImages.get(0).url}" alt="图片">
                                        </c:if>
                                    </c:if>
                                </div><!-- /.preview -->

                                <div class="content">

                                    <a class="carousel-prev" href="#">Previous</a>
                                    <a class="carousel-next" href="#">Next</a>
                                    <ul>
                                        <c:if test="${productImages != null}">

                                            <c:if test="${productImages.get(0) != null}">
                                                <li class="active">
                                                    <img src="${productImages.get(0).url}" alt="图片">
                                                </li>
                                            </c:if>


                                            <c:forEach items="${productImages}" var="img" begin="1">
                                                <li>
                                                    <img src="${img.url}" alt="图片">
                                                </li>
                                            </c:forEach>
                                        </c:if>
                                    </ul>
                                </div>
                                <!-- /.content -->
                            </div>
                            <!-- /.carousel -->

                            <div class="property-detail">
                                <%--<div class="pull-left overview">--%>
                                <div class="overview">
                                    <div class="row">
                                        <div class="span4">
                                            <h2>概述</h2>

                                            <table>
                                                <tr>
                                                    <th>价格：</th>
                                                    <td>￥${product.price}</td>
                                                </tr>
                                                <tr>
                                                    <th>原价：</th>
                                                    <td>￥${product.originPrice}</td>
                                                </tr>
                                                <tr>
                                                    <th>类别：</th>
                                                    <td>${product.category}</td>
                                                </tr>
                                                <tr>
                                                    <th>详细:</th>
                                                    <td>手机</td>
                                                </tr>
                                                <tr>
                                                    <th>联系方式：</th>
                                                    <td>${product.contact1}</td>
                                                </tr>
                                                <tr>
                                                    <th>联系方式：</th>
                                                    <td>${product.contact2}</td>
                                                </tr>
                                                <tr>
                                                    <th>浏览次数：</th>
                                                    <td>${product.watchTimes}</td>
                                                </tr>
                                                <tr>
                                                    <th>点赞次数：</th>
                                                    <td id="favorTimes">${product.favorTimes}</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <!-- /.span2 -->
                                        <div class="span4">
                                            <h2>发布者信息</h2>

                                            <div class="image user-header">
                                                <a href="/user/info/${user.userId}"><img src="${user.photo}" alt=""></a>
                                            </div><!-- /.image -->
                                            <div class="name">姓名：${user.name}</div><!-- /.name -->
                                            <div class="phone">等级：${user.grade}</div><!-- /.phone -->
                                            <c:set var="simpleDateFormat" value='<%= new java.text.SimpleDateFormat("yyyy-MM-dd") %>'/>
                                            <div class="phone">注册时间：${simpleDateFormat.format(user.registTime)}</div><!-- /.phone -->
                                        </div>
                                    </div>
                                    <!-- /.row -->
                                    <div id="favor-show">
                                    </div>
                                    <c:choose>
                                        <c:when test="${isFavored == 'YES'}">
                                            <button  id="favor-btn" data-type="disFavor" style="background: url('/assets/img/button/heart.png') no-repeat"></button>
                                        </c:when>
                                        <c:otherwise>
                                            <button id="favor-btn" data-type="favor" style="background: url('/assets/img/button/heart_1.png') no-repeat"></button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <p>
                                    ${product.description}
                                </p>
                                    <c:if test="${product.status == 2}">
                                        <h1 style="color:red">此商品已下架</h1>
                                    </c:if>
                                <h2>这里是评论</h2>
                                <div class="row">
                                    <ul class="span12" id="comment-list">
                                        <c:forEach items="${comments}" var="comment">
                                        <li class="comment-id-${comment.productMsgId}">
                                            <div class="comment-main">
                                                <span class="comment-sender">${comment.fromUserId}:</span>
                                                <c:if test="${comment.toUserId != null}">
                                                    <span class="comment-at">@${comment.toUserId}</span>
                                                </c:if>
                                                <span class="comment-content">${comment.content}</span>
                                            </div>
                                            <div class="comment-date">
                                                ${simpleDateFormat.format(comment.sendTime)}
                                            </div>
                                            <c:if test="${login != null}">
                                                <c:choose>
                                                    <c:when test="${login == comment.fromUserId}">
                                                        <button class="delete-comment" data-id="${comment.productMsgId}">删除</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="answer-comment" data-id="${comment.productMsgId}">回复</button>
                                                        <form class="answer-comment-form form-id-${comment.productMsgId}" method="post" style="display: none;" action="/comment/add">
                                                            <input style="display: none;" name="productId" value="${product.productId}">
                                                            <input style="display: none" name="toUserId" value="${comment.fromUserId}">
                                                            <textarea name="content"></textarea>
                                                            <button type="submit">提交</button>
                                                        </form>
                                                    </c:otherwise>
                                                </c:choose>


                                            </c:if>
                                        </li>
                                        </c:forEach>

                                    </ul>
                                    <div class="comment-area">
                                        <c:if test="${login != null}">
                                            <form method="post" action="/comment/add" id="send-comment-form">
                                                <input name="productId" style="display: none;" value="${product.productId}">
                                                <div class="control-group">
                                                    <label class="control-label" for="inputMessages">
                                                        评论：
                                                        <span class="form-required" title="This field is required.">*</span>
                                                    </label>

                                                    <div class="controls">
                                                        <textarea id="inputMessages" name="content"></textarea>
                                                    </div><!-- /.controls -->
                                                </div><!-- /.control-group -->
                                                <div class="form-actions">
                                                    <input type="submit" class="btn btn-primary arrow-right" value="Send">
                                                </div><!-- /.form-actions -->
                                            </form>
                                        </c:if>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="sidebar span3">
                            <div class="widget our-agents">
                                <div class="title">
                                    <h2>Our Agents</h2>
                                </div><!-- /.title -->

                                <div class="content">
                                    <div class="agent">
                                        <div class="image">
                                            <img src="/assets/img/photos/emma-small.png" alt="">
                                        </div><!-- /.image -->
                                        <div class="name">Victoria Summer</div><!-- /.name -->
                                        <div class="phone">333-666-777</div><!-- /.phone -->
                                        <div class="email"><a href="mailto:victoria@example.com">victoria@example.com</a></div><!-- /.email -->
                                    </div><!-- /.agent -->

                                    <div class="agent">
                                        <div class="image">
                                            <img src="/assets/img/photos/john-small.png" alt="">
                                        </div><!-- /.image -->
                                        <div class="name">John Doe</div><!-- /.name -->
                                        <div class="phone">111-222-333</div><!-- /.phone -->
                                        <div class="email"><a href="mailto:john.doe@example.com">victoria@example.com</a></div><!-- /.email -->
                                    </div><!-- /.agent -->
                                </div><!-- /.content -->
                            </div><!-- /.our-agents -->
                            <div class="widget contact">
                                <div class="title">
                                    <h2 class="block-title">Contact agent</h2>
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
                            <div class="widget properties last">
                                <div class="title">
                                    <h2>Latest Properties</h2>
                                </div><!-- /.title -->

                                <div class="content">
                                    <div class="property">
                                        <div class="image">
                                            <a href="detail.html"></a>
                                            <img src="/assets/img/tmp/property-small-4.png" alt="">
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
                                            <img src="/assets/img/tmp/property-small-5.png" alt="">
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
                                            <img src="/assets/img/tmp/property-small-6.png" alt="">
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
                                </div><!-- /.content -->
                            </div><!-- /.properties -->
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
<script type="text/javascript" src="/assets/js/retina.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/assets/js/carousel.js"></script>


<script type="text/javascript" src="/assets/libraries/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/assets/libraries/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/assets/libraries/iosslider/_src/jquery.iosslider.min.js"></script>
<script type="text/javascript" src="/assets/libraries/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="/assets/js/realia.js"></script>
<script type="text/javascript">
    $(function () {
      $('#favor-btn').on('click', function () {
        //点赞
        let self = $(this),
        // send request
        type = self.attr('data-type'),
        url;
        if (type === 'favor')
          url = 'favor';
        else
          url = 'disFavor';
        $.ajax({
            url: "/product/${product.productId}/"+url,
            type: 'get',
            success: function (res) {
              if (res.status == 200) {
                let watchTimes =  $('#favorTimes').text();
                if (type === 'favor') {
                  $('#favorTimes').text(parseInt(watchTimes) + 1);
                  self.attr('data-type', 'disFavor');
                  self.removeAttr('style');
                  self.css({background: "url('/assets/img/button/heart.png') no-repeat"});
                } else {
                  self.attr('data-type', 'favor');
                  self.removeAttr('style');
                  $('#favorTimes').text(parseInt(watchTimes) - 1);
                  self.css({background: "url('/assets/img/button/heart_1.png') no-repeat"});
                }
              } else {
                alert(res.msg);
              }
            },
            error: function (err) {
              alert('请先登录');
            }
        })
      })

      <c:if test="${login != null}">
      //点击评论
      $('#send-comment-form').submit(function (env) {
        let data = new FormData(this);
        sendData('/comment/add', data, function(res) {
          if (res.status == 200) {
            let comment = res.data;
            appendComment(comment);
          }
        }, function (err) {
          console.error(err);
        })
        env.preventDefault();
        return false;
      })
      //点击删除
      $('.delete-comment').on('click',function () {
        let self = $(this),
          id = self.attr('data-id');
        sendData('/comment/'+id+'/delete',{},function(res){
          if (res.status == 200) {
            $('li.comment-id-'+id).remove();
          }
        },function (err) {
          console.log(err);
        })
      })
      //点击回复
      $('.answer-comment').on('click',function () {
        let self = $(this),
          id = self.attr('data-id'),
          form = $('.form-id-'+id);
        if (form.css('display') === 'none') {
          form.css({display: 'block'});
        } else {
          form.css({display: 'none'});
        }


      })
      //发送回复
      $('.answer-comment-form').submit(function (env) {
        let self = $(this),
          data = new FormData(this);
        sendData('/comment/add', data, function (res) {
          if (res.status == 200) {
            let comment = res.data;
            appendComment(comment);
          }
        }, function (err) {
          console.error(err);
        })
        env.preventDefault();
        return false;
      })

      let sendData = function(url, data, success, failed) {
        return $.ajax({
          url: url,
          type: "POST",
          data: data,
          processData: false,
          contentType: false,
          success: function (res) {
            success(res);
          },
          error: function (err) {
            failed(err);
          }
        })
      },
      appendComment = function(com) {
        location.href = location.href;
      }
      </c:if>

    })
</script>
</body>
</html>
