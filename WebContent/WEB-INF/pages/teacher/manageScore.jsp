<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">成绩管理</font></strong></p>
<div style="height:300px;">
<table width=80% align="center">
<tr>
	<td style="text-align:center;">选课序号</td>
	<td>课程号</td>
	<td>名称</td>
	<td>操作</td>
</tr>
<s:iterator value="slist" status="i">

<s:if test="%{!#i.first&&classBelong.name==slist[#i.index-1].classBelong.name}">
</s:if>
<s:else>
<tr>
<td style="text-align:center;"><s:property value="classBelong.id"/></td>
<td><s:property value="classBelong.courseNum"/></td>
<td><s:property value="classBelong.name"/></td>
<td><a href="showstudent.action?course_id=<s:property value='classBelong.id'/>">学生成绩</a></td>
</tr>
</s:else>
</s:iterator>	
</table><br>
</div>

<div style="padding-left:15%;">

   <s:if test="#request.page==1">

<font color="#cccccc" >上一页  第一页</font>

</s:if>

<s:else>

<a href="showScore.action?page=<s:property value="1"/>">第一页</a>&nbsp;

<a href="showScore.action?page=${page-1 }">上一页</a>

</s:else>
&nbsp;
<s:iterator begin="1" end="(#request.total+10-1)/10" step="1" status="i">
	<s:if test="%{#i.index+1==#request.page}"><strong><s:property value="%{#i.index+1}"/></strong></s:if>
	<s:else><a href="showScore.action?page=<s:property value="%{#i.index+1}"/>"><s:property value="%{#i.index+1}"/></a></s:else>
	&nbsp;
</s:iterator>

<s:if test="(#request.total+10-1)/10==#request.page">

<font color="#cccccc" >下一页  最后一页</font>

</s:if>

<s:else>

<a href="showScore.action?page=${page+1 }">下一页</a>&nbsp;

<a href="showScore.action?page=<s:property value="%{(#request.total+10-1)/10}"/>">最后一页</a>

</s:else>

<h3>帮助提示</h3>
	<ol>
		<li>该页面显示所有课程中有学生选课的课程
		<li>您可以点击“学生成绩”对某一课程进行学生成绩录入、修改和打印操作
</div>
</body>
</html>