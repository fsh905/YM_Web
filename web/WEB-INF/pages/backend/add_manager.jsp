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

<div id="urHere">后台管理中心<b/><strong>添加管理员</strong> </div>   <div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
  <h3><a href="admins.html" class="actionBtn">管理员列表</a>添加管理员</h3>
  <c:choose>
    <c:when test="${method == 'addAdmins'}">
      <form action="/backend/admins/add" method="post">
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
          <tr>
            <td width="80" align="right">职位</td>
            <td>
              <input type="text" name="cat_name" disabled size="40" class="inpMain" value="${school.schoolName}管理员" />
            </td>
          </tr>
          <tr>
            <td align="right">用户id</td>
            <td>
              <input type="text" name="userId" value="" size="40" class="inpMain" />
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
      <form action="/backend/schools/${school.schoolId}/manager/add" method="post">
        <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
          <tr>
            <td width="80" align="right">职位</td>
            <td>
              <input type="text" name="cat_name" disabled size="40" class="inpMain" value="${school.schoolName}管理员" />
            </td>
          </tr>
          <tr>
            <td align="right">用户id<span style="color:red">此用户必须是本学校的</span></td>
            <td>
              <input type="text" name="userId" value="" size="40" class="inpMain" />
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
