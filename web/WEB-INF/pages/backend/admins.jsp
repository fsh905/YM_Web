<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/18/2017
  Time: 10:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>后台管理中心 - 超级管理员 </title>
  <meta name="Copyright" content="Douco Design." />
  <link href="css/public.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/global.js"></script>
</head>
<body>

<!-- 当前位置 -->
<div id="urHere">后台管理中心<b>></b><strong>管理员</strong> </div>   <div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
  <h3><a href="/backend/admins/add" class="actionBtn add">添加管理员</a>管理员</h3>
  <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
    <tr>
      <th width="120" align="left">编号</th>
      <th align="left">名称</th>
      <th align="left">性别</th>
      <th width="60" align="center">联系方式</th>
      <th width="80" align="center">操作</th>
    </tr>
    <c:set var="admins" value="${pageInfo.list}"/>
    <c:forEach items="${admins}" var="admin">

    <tr>
      <td align="left"> <a href="/user/info/${admin.userId}">${admin.userId}</a></td>
      <td><a href="/user/info/${admin.userId}">${admin.userName}</a></td>
      <c:choose>
        <c:when test="${admin.sex == 0}">
          <td>男</td>
        </c:when>
        <c:otherwise>
          <td>女</td>
        </c:otherwise>
      </c:choose>
      <td align="center">${admin.phone}</td>
      <td align="center"><a href="/backend/admins/${admin.userId}/delete">删除</a></td>
    </tr>
    </c:forEach>
      </table>
<div class="pager">总计 ${pageInfo.total} 个记录，共 ${pageInfo.pages} 页，当前第 ${pageInfo.pageNum} 页 | <a href="/backend/admins?page=1">第一页</a>
  <c:if test="${pageInfo.hasPreviousPage}">
    <a href="/backend/admins?page=${pageInfo.prePage}">上一页</a>
  </c:if>
  <c:if test="${pageInfo.hasNextPage}">
    <a href="/backend/admins?page=${pageInfo.nextPage}">下一页</a>
  </c:if>
  <a href="/backend/admins?page=${pageInfo.lastPage}">最末页</a></div>
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