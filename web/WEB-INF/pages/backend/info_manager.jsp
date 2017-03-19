<%--
  Created by IntelliJ IDEA.
  User: Feng
  Date: 3/18/2017
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>YMER后台管理中心</title>
  <meta name="Copyright" content="Douco Design." />
  <link href="css/public.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/global.js"></script>
</head>
<body>

<div id="urHere">DouPHP 管理中心</div>  <div id="index" class="mainBox" style="padding-top:18px;height:auto!important;height:550px;min-height:550px;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="indexBoxTwo">
    <tr>
      <td width="65%" valign="top" class="pr">
        <div class="indexBox">
          <div class="boxTitle">本周统计</div>
          <ul>
            <table width="100%" border="0" cellspacing="0" cellpadding="7" class="tableBasic">
              <tr>
                <td width="120">新用户：</td>
                <td><strong>${user7}</strong></td>
                <td width="100">总用户：</td>
                <td><strong>${userAll}</strong></td>
              </tr>
              <tr>
                <td>新闲置：</td>
                <td><strong>${resExist7}</strong></td>
                <td>总闲置：</td>
                <td><strong>${resExistAll}</strong></td>
              </tr>
              <tr>
                <td>新下架：</td>
                <td><strong>${resPast7}
                </strong></td>
                <td>总下架：</td>
                <td><strong>${resPastAll}</strong></td>
              </tr>

            </table>
          </ul>
        </div>
      </td>

    </tr>
  </table>


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
