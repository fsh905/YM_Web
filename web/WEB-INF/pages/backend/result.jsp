<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/18/2017
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>结果</title>
  <link href="/backend/css/public.css" rel="stylesheet" type="text/css">
</head>
<body>
<h3>
  ${result.msg}
</h3>
<p><a href="${result.data.href}">${result.data.name}</a></p>
</body>
</html>
