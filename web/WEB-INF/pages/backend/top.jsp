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
  <title>顶部</title>
  <link href="css/public.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/global.js"></script>
</head>
<body>
<div id="dcHead">
  <div id="head">
    <div class="logo"><a href="/backend/main"><img src="images/dclogo.gif" alt="logo"></a></div>
    <div class="nav">

      <ul class="navRight">
        <c:choose>
          <c:when test="${superUser.roleId == 2}">
          <li class="M noLeft"><a href="JavaScript:void(0);">您好，${superUser.schoolName}管理员：${superUser.userName}</a>
          </c:when>
          <c:otherwise>
          <li class="M noLeft"><a href="JavaScript:void(0);">您好，超级管理员：${superUser.userName}</a>
          </c:otherwise>
        </c:choose>
        </li>
        <li class="noRight"><a href="/backend/logout" target="_top">退出</a></li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>
