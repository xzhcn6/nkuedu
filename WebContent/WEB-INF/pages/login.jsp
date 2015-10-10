<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="./static/CSS/login.css">
<script type="text/javascript"  charset="utf-8" src="./static/JS/register.js"></script>
<title>南开大学夏季学期高中生选课系统</title>
</head>
<body>
<div class="main">
	<div class="head"></div>
	<div style="height: 1px; clear: both;"></div>
	<form action="LoginAction" method="post">
		<div class="content">
		<div style="height: 1px; clear: both;"></div>
			<ul>
				<li>学号</li>
				<li><input type="text" name="studentnum" id="studentnum"><a href="forgotPassword.jsp" target="_blank">？找回学号</a></li>		
				<li>密码</li>
				<li><input type="password" name="password" id="name"></li>
				<li>验证码</li>
				<li><table><tr><td>
				<input type="text" name="code" id="code"></td><td>
				<img src="verifyCode/code" id="codeAction"  style="cursor:pointer;" onclick="this.src='/nkuedu/verifyCode/code?k='+Math.random()" alt="看不清，换一张"/>  
				</td></tr></table>
				</li>
				<s:if test="hasFieldErrors()">
					<s:iterator value="fieldErrors">
						<li><font color=blue><s:property value="value[0]"/></font></li>
					</s:iterator>
				</s:if>
				<li><input type="submit" value="登录" onclick="return checkAll()">&nbsp;&nbsp;没有帐号？马上<a href="account/register">注册</a></li>
			</ul>
		</div>
	</form>
	
	<div class="center">
		<div class="lcenter"></div>
	</div>
	<div style="height: 1px; clear: both;"></div>
	<div class="bottom">
			选课须知：<br> 1. 选课前请务必仔细阅读选课使用帮助。<br /> <span class="STYLE1">
					2. 本选课系统使用个人邮箱认证的学号和密码。<font color="red">学生在首次注册后获取学号（请用您的常用邮箱注册）。</font>
					<br /> </span>3. 如果忘记密码，请与南开大学教务处联系。电话：23504252 邮箱：jwcqj@nankai.edu.cn<br />

				<span class="STYLE1">4. 选课结束后，请点击选课界面“退出登录”或者关闭所有浏览器窗口，以免后面的同学篡改您的选课结果。</span>
		</div>
</div>
<div style="height: 30px; clear: both;"></div>
<div align="center">
<!-- <p><font color="blue" size="4px">开发团队：张旭、郑梓坪、梅继爽、林美芳（四位都为南开大学软件学院2011级本科生）</font></p> -->
<font style="font-size: 12px;">建议采用中文windows操作系统，IE6以上浏览器，1024 ×768以上分辨率访问。</font>
<div style="height: 30px; clear: both;"></div>
<div class="footer">南开大学 <span>教务处</span> <br>地址：天津市南开区卫津路94号<span>&nbsp;&nbsp;邮政编码：300071</span>　</div>
</div>
</body>
</html>