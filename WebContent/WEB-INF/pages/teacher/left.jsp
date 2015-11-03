<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/left.css">
<title>后台管理</title>
</head>
<body>
	<div class="left">
		<ul>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/client/adminlogout" target="_top">退出登录</a></font></li>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/admin/showCourse" target="mainFrame">课程管理</a></font></li>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/admin/showStudent" target="mainFrame">学生管理</a></font></li>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/admin/showSelection" target="mainFrame">选课管理</a></font></li>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/admin/showScore" target="mainFrame">成绩管理</a></font></li>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/admin/showStudent" target="mainFrame">评教管理</a></font></li>
		</ul>
	</div>
</body>
</html>