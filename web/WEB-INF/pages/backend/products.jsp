<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/18/2017
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>后台管理中心 - 商品列表 </title>
  <meta name="Copyright" content="Douco Design." />
  <link href="css/public.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/global.js"></script>
  <script type="text/javascript" src="js/products.js"></script>
</head>
<body>
<!-- 当前位置 -->
<div id="urHere">DouPHP 管理中心<b>></b><strong>商品列表</strong> </div>   <div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
  <h3>商品列表</h3>
  <div class="filter">
    <form action="/backend/products" name="search" method="get">
      <select name="sort">
        <option value="1">今天</option>
        <option value="2">昨天</option>
        <option value="3">最近三天</option>
        <option value="7">最近七天</option>
        <option value="30">最近三十天</option>
        <option value="31">本月</option>
        <option value="32">上月</option>
      </select>
      <input name="keyword" type="text" class="inpMain" value="" size="20" />
      <input name="submit" class="btn" type="submit" value="筛选" />
    </form>
  </div>
  <div id="list">
      <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
        <tr id="product-list-header">
          <th width="40" align="center">编号</th>
          <th align="left">商品名称</th>
          <th width="150" align="center">简介</th>
          <th width="150" align="center">详细信息</th>
          <th width="80" align="center">添加日期</th>
          <th width="80" align="center">操作</th>
        </tr>

      </table>
  </div>
  <div class="clear"></div>
  <div class="pager" id="page">
    总计 15 个记录，共 1 页，当前第 1 页 | <a href="product.php?page=1">第一页</a> 上一页 下一页 <a href="product.php?page=1">最末页</a>
  </div>
  <h3 id="show-msg"></h3>
</div>
<div class="clear"></div>
<div id="dcFooter">
  <div id="footer">
    <div class="line"></div>
    <ul>
      Design by YMER
    </ul>
  </div>
</div><!-- dcFooter 结束 -->
<div class="clear"></div>

</body>
</html>

