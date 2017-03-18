<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/18/2017
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>DouPHP 管理中心 - 添加分类 </title>
  <meta name="Copyright" content="Douco Design." />
  <link href="/backend/css/public.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="/backend/js/jquery.min.js"></script>
  <script type="text/javascript" src="/backend/js/global.js"></script>
</head>
<body>
<!-- 当前位置 -->

  <c:choose>
    <c:when test="${method == 'update'}">
<div id="urHere">DouPHP 管理中心<b>></b><strong>修改学校</strong> </div>   <div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
  <h3><a href="/backend/schools" class="actionBtn">学校名单</a>修改学校</h3>
      <form action="/backend/schools/${school.schoolId}/update" method="post">
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
          <tr>
            <td width="80" align="right">学校名称</td>
            <td>
              <input type="text" name="schoolName" value="${school.schoolName}" size="40" class="inpMain" />
            </td>
          </tr>
          <tr>
            <td></td>
            <td>
              <input name="submit" class="btn" type="submit" value="提交" />
            </td>
          </tr>
        </table>
      </form>
    </c:when>
    <c:otherwise>
  <div id="urHere">DouPHP 管理中心<b>></b><strong>添加学校</strong> </div>   <div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
  <h3><a href="/backend/schools" class="actionBtn">学校名单</a>添加学校</h3>
      <form action="/backend/schools/add" method="post">
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
          <tr>
            <td width="80" align="right">学校名称</td>
            <td>
              <input type="text" name="schoolName" value="" size="40" class="inpMain" />
            </td>
          </tr>
          <tr>
            <td></td>
            <td>
              <input name="submit" class="btn" type="submit" value="提交" />
            </td>
          </tr>
        </table>
      </form>
    </c:otherwise>
  </c:choose>

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
