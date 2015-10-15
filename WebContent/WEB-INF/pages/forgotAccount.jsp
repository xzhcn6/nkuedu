<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/forgotPassword.css">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/forgotPassword.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回账户</title>
</head>
<body style="font-family:微软雅黑;">
<div class="main">
	<div class="header"></div>
	<center><br><br>
	<form action="findAccount" method="post" onsubmit="return checkAll()">
	<p align="center"></p>
	<table>
		<tr><td><strong>您注册时所使用的邮箱：</strong></td>
		<td><input type="text" name="email" id="email" onblur="checkEmail()"></td></tr>
		<tr><td>请输入验证码：</td>
		<td><input type="text" name="code" id="code"></td>
		<td><img src="<%=request.getContextPath()%>/verifyCode/code" id="codeAction"  style="cursor:pointer;" onclick="this.src='<%=request.getContextPath()%>/verifyCode/code?k='+Math.random()" alt="看不清，换一张"/></td></tr>
<%-- 		<tr><td><%@ taglib prefix="s" uri="/struts-tags" %> --%>
<%-- 					<s:if test="hasFieldErrors()"> --%>
<%-- 						<s:iterator value="fieldErrors"> --%>
<%-- 							<td><font color=blue><s:property value="value[0]"/></font></td> --%>
<%-- 						</s:iterator> --%>
<%-- 					</s:if></td></tr> --%>
		<tr><td></td><td align="right"><input type="submit" value="确定"></td></tr>
	</table>
	</form>
	</center>
</div>
</body>
</html>