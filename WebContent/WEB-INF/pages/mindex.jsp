<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/manage/login.css">
<script type="text/javascript"  charset="utf-8" src="<%=request.getContextPath()%>/static/JS/register.js"></script>
<title>管理登陆</title>
</head>
<body>
<div class="main">
	<div class="head"></div>
	<div style="height: 1px; clear: both;"></div>
	<form action="AdminLoginAction" method="post">
		<div class="content">
		<div style="height: 1px; clear: both;"></div>
			<ul>
				<li>用户名</li>
				<li><input type="text" name="AdminName" id="AdminName"></li>		
				<li>密码</li>
				<li><input type="password" name="password" id="name"></li>
				<li>验证码</li>
				<li><input type="text" name="code" id="code"><img src="<%=request.getContextPath()%>/verifyCode/code" id="codeAction" onclick="this.src='<%=request.getContextPath()%>/verifyCode/code?k='+Math.random()" style="cursor:pointer;" alt="看不清，换一张"/>  
				</li>
<%-- 				<%@ taglib prefix="s" uri="/struts-tags" %> --%>
<%-- 				<s:if test="hasFieldErrors()"> --%>
<%-- 					<s:iterator value="fieldErrors"> --%>
<%-- 						<li><font color=blue><s:property value="value[0]"/></font></li> --%>
<%-- 					</s:iterator> --%>
<%-- 				</s:if> --%>
				<li><input type="submit" value="登录" onclick="return checkAll()"></li>
			</ul>
		</div>
	</form>
	
	<div class="center">
		<div class="lcenter"></div>
	</div>
	<div style="height: 1px; clear: both;"></div>
<br>
<br>
<br>
<!-- 	<div class="bottom"> -->
<%-- 			选课须知：<br> 1. 选课前请务必仔细阅读选课使用帮助。<br /> <span class="STYLE1"> --%>
<!-- 					2. 本选课系统使用统一身份认证的学号和密码。 -->
<%-- 					<br /> </span>3. 如果忘记密码，请带身份证到南开大学教务处找回密码；<br /> --%>

<%-- 				<span class="STYLE1">4. 选课结束后，请点击选课界面“退出登录”或者关闭所有浏览器窗口，以免后面的同学篡改您的选课结果。</span> --%>
<!-- 		</div> -->
</div>
<div style="height: 30px; clear: both;"></div>
<div align="center">
<font style="font-size: 12px;">建议采用中文windows操作系统，IE6以上浏览器，1024 ×768以上分辨率访问。</font>
<div style="height: 30px; clear: both;"></div>
<div class="footer">南开大学 <span>教务处</span> <br>地址：天津市南开区卫津路94号<span>&nbsp;&nbsp;邮政编码：300071</span>　</div>
</div>
</body>
</html>