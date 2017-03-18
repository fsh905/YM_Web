<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/18/2017
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>DouPHP 管理中心 - 学校列表 </title>
  <meta name="Copyright" content="Douco Design." />
  <link href="css/public.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/global.js"></script>
</head>
<body>

<!-- 当前位置 -->
<div id="urHere">后台管理中心<b>></b><strong>学校列表</strong> </div>   <div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
  <h3><a href="/backend/schools/add" class="actionBtn add">添加学校</a>学校名单</h3>
  <div class="filter">
    <form action="/backend/schools" method="post">
      <input name="keyword" type="text" class="inpMain" value="" size="20" />
      <input name="submit" class="btn" type="submit" value="筛选" />
    </form>
  </div>
  <table width="100%" border="0" cellpadding="8" cellspacing="0" class="tableBasic">
    <tr>
      <th width="120" align="left">学校编号</th>
      <th align="left">名称</th>
      <th align="left">创建时间</th>
      <th width="60" align="center">管理员</th>
      <th width="80" align="center">操作</th>
    </tr>
    <c:set var="schools" value="${pageInfo.list}"/>
    <c:set var="simpleDateFormat" value='<%= new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss") %>'/>
    <c:forEach items="${schools}" var="school">
    <tr>
      <td align="left"> <a href="#">${school.schoolId}</a></td>
      <td>${school.schoolName}</td>
      <td>${simpleDataFormat.format(school.createTime)}${school.createTime}</td>
      <td align="center"><a href="/backend/schools/${school.schoolId}/manager">查看</a></td>
      <td align="center"><a href="/backend/schools/${school.schoolId}/update">编辑</a></td>
    </tr>
    </c:forEach>

  </table>
  <div class="pager">总计 ${pageInfo.total} 个记录，共 ${pageInfo.pages} 页，当前第 ${pageInfo.pageNum} 页 | <a href="/backend/schools?page=1">第一页</a>
    <c:if test="${pageInfo.hasPreviousPage}">
      <a href="/backend/schools?page=${pageInfo.prePage}">上一页</a>
    </c:if>
    <c:if test="${pageInfo.hasNextPage}">
      <a href="/backend/schools?page=${pageInfo.nextPage}">下一页</a>
    </c:if>
    <a href="/backend/schools?page=${pageInfo.lastPage}">最末页</a></div>
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