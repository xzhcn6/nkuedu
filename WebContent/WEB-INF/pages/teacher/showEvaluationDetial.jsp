<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
	.evaluation{
	margin-left:50px;
	margin-right:50px;}
</style>
<title>Insert title here</title>
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">评教详情</font></strong></p>
<div class="evaluation" style="padding-left:20%;padding-right:20%;">
<strong>课程名：<s:property value="#request.courseName"/></strong><br><hr>
总分:<s:property value="#request.average"/><br><hr>
分数详情：<br>
1、授课内容：<s:property value="#request.c1"/><br>
2、教学方式：<s:property value="#request.c2"/><br>
3、教学态度：<s:property value="#request.c3"/><br>
4、传授知识和引发学生思考的能力：<s:property value="#request.c4"/><br>
5、作业、考核方式：<s:property value="#request.c5"/><br>
6、对这门课程的总体印象：<s:property value="#request.c6"/><br><hr>
学生评价：<br>
<s:iterator value="clist"><br>
<table border="1px;">
<s:property value="comment" />
</table>
</s:iterator>
</div>
<div style="padding-left:70%;">
&nbsp&nbsp&nbsp&nbsp
<a href="<%=request.getContextPath()%>/admin/showEvaluation">返回评教管理</a>
</div>
</body>
</html>