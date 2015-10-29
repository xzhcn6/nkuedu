<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="../CSS/manage/course.css">
<title>课程管理</title>
</head>
<body>
<p align="center"><strong><font size="5">课程管理</font></strong></p>
<div style="padding-left:2%;">
<table width=100% >
	<tr>
		<td colspan="13"><a href="addCourse.jsp"><font size="3">添加课程</font></a><br><br>
	<tr>
		<td colspan="13"><strong>课程信息</strong></td>
	</tr>
	<tr>
		<td>选课序号</td>
		<td>课程号</td>
		<td>名称</td>
		<td>最大学生数</td>
		<td>教师</td>
	  	<td>教室</td>
	  	<td>选课要求</td>
	  	<td>简介</td>	  	
	  	<td>类型</td>
	  	<td>是否开课</td>
	  	<td>学分</td>
	  	<td>操作</td>
	  	
	</tr>
	
	<s:iterator value="courseList">
	
    <tr>
		<td style="text-align:center;"><s:property value="id"/></td>
		<td><s:property value="courseNum"/></td>
		<td><s:property value="name"/></td>
		<td><s:property value="maxStudent"/></td>
		<td><s:property value="professor"/></td>	    
	    <td><s:property value="classroom"/></td>
	    <td><s:property value="reques"/></td>
	    <td><s:a href='MshowIntroduction.action?id=%{id}'>查看</s:a></td>
	    <td><s:property value="type"/></td>
	    <s:if test="%{isOpen == 1}"><td>是</td></s:if>
	    <s:if test="%{isOpen == 0}"><td>否</td></s:if>
	    <td><s:property value="credit"/></td>
	    <td><a href="showTime.action?id=<s:property value='id'/>
	    			&name=<s:property value="name"/>&isback=-1">查看/修改时间</a>
	    	<a href="getCourse.action?id=<s:property value='id'/>
	    			">修改</a>
	    			<a href="delete.action?id=<s:property value='id'/>" onclick="return confirm('确定删除？')">删除</a> 
	</s:iterator>
</table><br>
</div>

<div style="padding-left:2%;">
    <s:if test="#request.page==1">

<font color="#cccccc" >上一页  第一页</font>

</s:if>

<s:else>

<a href="show.action?page=<s:property value="1"/>">第一页</a>&nbsp;

<a href="show.action?page=${page-1 }">上一页</a>

</s:else>
&nbsp;
 
<s:iterator begin="1" end="(#request.total+10-1)/10" step="1" status="i">
	<s:if test="%{#i.index+1==#request.page}"><strong><s:property value="%{#i.index+1}"/></strong></s:if>
	<s:else><a href="show.action?page=<s:property value="%{#i.index+1}"/>"><s:property value="%{#i.index+1}"/></a></s:else>
	&nbsp;
</s:iterator>

<s:if test="(#request.total+10-1)/10==#request.page">

<font color="#cccccc" >下一页  最后一页</font>

</s:if>

<s:else>

<a href="show.action?page=${page+1 }">下一页</a>&nbsp;

<a href="show.action?page=<s:property value="%{(#request.total+10-1)/10}"/>">最后一页</a>

</s:else>
<br/><br/>

<h3>帮助提示</h3>
	<ol>
		<li>添加课程完成后，你需要在“课程管理”处选择“查看/修改时间操作”为课程添加上课时间
		<li>您可以在“课程管理”中点击“修改”对课程信息进行修改
		<li>“是否开课”指是否在选课手册显示 以及 让学生在选课系统对该课选课退课（1为开课，0为不开课）
	</ol>
</div>

</body>
</html>