<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/18/2017
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>left</title>
  <link href="css/public.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/global.js"></script>
</head>
<body>
<div id="dcLeft">
  <div id="menu">
    <c:choose>
      <c:when test="${superUser.roleId == 2}">
        <ul class="top">
          <li><a href="info_manager" target="main"><i class="home"></i><em>管理首页</em></a></li>
        </ul>
        <ul>
          <li><a href="products" target="main"><i class="system"></i><em>新上架商品列表</em></a></li>
        </ul>
      </c:when>
      <c:otherwise>
        <ul class="top">
          <li><a href="info_manager" target="main"><i class="home"></i><em>管理首页</em></a></li>
        </ul>
        <ul>
          <li><a href="schools" target="main"><i class="system"></i><em>学校列表</em></a></li>
        </ul>
        <ul>
          <li><a href="admins" target="main"><i class="system"></i><em>管理员列表</em></a></li>
        </ul>
      </c:otherwise>
    </c:choose>

  </div>
</div>

</body>
</html>
