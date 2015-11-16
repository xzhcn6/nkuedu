<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/select_class.css">
<title>Insert title here</title>
</head>

<body style="font-family:微软雅黑;">
<br><p align="center"><strong>选 课 退 课</strong></p><br>
<script charset="utf-8" type="text/javascript" src="JS/select.js"></script>

	<form name='form1' method="post" action='DoAddSelection'>
	<div class="select">
		请输入选课序号进行选课：<input type="text" name="id" id="id">
		<input type="submit" value="选课">
	</div>
	</form>
	<form name='form2' method="post" action='DoDelSelection'>
	<div class="select">
		请输入选课序号进行退课：<input type="text" name="id" id="id">
		<input type="submit" value="退课">
	</div>
	</form>
	<P align="center">姓名：${student.name}
	<p align="center">学号：${student.studentNumber}
	<table border="1" cellpadding="3" cellspacing="0" style="width: 60%;margin:auto">
		<tr bgcolor=#cccccc>
				<td>序号</td>
				<td>选课序号</td>
				<td colspan="3">课程名称</td>
				<td>任课老师</td>
				<td>类型</td>
				<td>开课地点</td>
			</tr>
	<s:iterator value='#request.selection' status="i">
		<tr>
			<td><s:property value="#i.index+1"/></td>
			<td><s:property value="classBelong.id"/></td>
			<td colspan="3"><s:property value="classBelong.name"/></td>
			<td><s:property value="classBelong.professor"/></td>
			<td><s:property value="classBelong.type"/></td>
			<td><s:property value="classBelong.classroom"/></td>
		</tr>
	</s:iterator>
	</table>
	<br>
	<br>
<div class="warning" style="padding-left:20%;">	
	<h3>注意：</h3>
	<ol>
		<li>请点击左侧菜单“选课手册”查询课程。请在输入框内输入课程的选课序号</li>
		<li>您在本系统中最多可以两门课程</li>
	</ol>
</div>
</body>
</html>