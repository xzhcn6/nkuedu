<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>选课详情</title>
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<div style="width:60%;padding-left:20%;padding-bottom:40px;">
<a href="javascript:history.go(-1);">返回选课手册</a><br>
<h4 align="center">${course.name}</h4><br>
课程详情：<br /><br />
<div>
<textarea rows="20" cols="100" readonly="true" style="BORDER-BOTTOM: 0px solid; BORDER-LEFT: 0px solid; BORDER-RIGHT: 0px solid; BORDER-TOP: 0px solid;"  >
${course.introduction}
</textarea>
</dir>
</div>
</body>
</html>