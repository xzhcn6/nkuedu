<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生评教</title>
</head>
<body style="font-family:微软雅黑;">
<c:set var="now" value="<%=new java.util.Date()%>" />
	<br>
<br>
<p align="center"><strong>南开大学<fmt:formatDate value="${now}" pattern="yyyy" />年度夏季学期选课评教 </strong></p>
<br>
		<table border="1" cellpadding="3" cellspacing="0" style="width: 60%;margin:auto">
		
			<tr bgcolor=#cccccc>
				<td>课程序号</td>
				<td colspan="3">课程名称</td>
				<td>任课老师</td>
				<td colspan="4">评教状态</td>
			</tr>
			<s:iterator id='sel' value='#request.selection'>
				<tr>
				<td><s:property value="classBelong.id"/></td>
				<td colspan="3"><s:property value="classBelong.name"/></td>
				<td><s:property value="classBelong.professor"/></td>
				<s:if test="%{#sel.isOver==1}">
			    	<td colspan="4"><s:a href='DoEvaluate?sel=%{#sel.id}'>未评教</s:a></td>
			    </s:if>
			    <s:if test="%{#sel.isOver==2}">
			    	<td colspan="4"><a>已评教</a></td>
			    </s:if>
			    <s:if  test="%{#sel.isOver==0}">
			    	<td colspan="4"><a>未结课</a></td>
			    </s:if>
				</tr>
			</s:iterator>
			
		</table>
<div class="warning" style="padding-left:20%;">	
	<h3>注意：</h3>
	<ol>
			<li>在课程结课后，您需要对课程进行评教方可查看课程成绩</li>
			<li>评教之后，点击左侧菜单“成绩查询”可以查看对应课程成绩</li>
	</ol>
</div>
</body>
</html>