<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<link rel="stylesheet" style="text/html" href="${pageContext.request.contextPath}/CSS/personal_info.css">
<title>成绩查询</title>
</head>
<body style="font-family:微软雅黑;">
	<div class="query">		
	<c:set var="now" value="<%=new java.util.Date()%>" />	
	<p align="center"><strong>南开大学<fmt:formatDate value="${now}" pattern="yyyy" />年度夏季学期成绩 </strong></p>
	<table border="1" cellpadding="3" cellspacing="0" style="width: 60%;margin:auto">
		<tr>
				<td bgcolor=#cccccc>姓名</td>
				<td colspan="2">${student.name}</td>				
				<td bgcolor=#cccccc>学号</td>
				<td colspan="2">${student.studentNum}</td>	
		</tr>
		<tr bgcolor=#cccccc>
				<td>选课序号</td>
				<td>课程名称</td>
				<td>教师</td>
				<td>学分</td>
				<td>成绩</td>
		</tr>
			<s:iterator value='#request.selection'>
				<tr>
					<td><s:property value="classBelong.id"/></td>
					<td ><s:property value="classBelong.name"/></td>
					<td><s:property value="classBelong.professor"/></td>
					<td><s:property value="classBelong.credit"/></td>
					<td>
					<s:if test="%{isOver==1}">
						未评教
					</s:if>
					<s:if test="%{isOver==2}">
						<s:if test="%{score==-1}">未出成绩</s:if>
						<s:if test="%{score!=-1}"><s:property value="score"/></s:if>
					</s:if>
					</td>
				</tr>
			</s:iterator>
	</table>
	</div>
	<div class="warning" style="padding-left:20%;">	
	<h3>注意：</h3>
	<ol>
			<li>在课程结课后，您需要对课程<font color="red">进行评教</font>方可查看课程成绩</li>
			<li>评教之后，课程成绩显示“未出成绩”表示该门课的成绩还未录入，请学生耐心等待</li>
	</ol>
</div>
</body>
</html>