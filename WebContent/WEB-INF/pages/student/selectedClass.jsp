<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="font-family:微软雅黑;">
<br>
<br>
<p align="center"><strong>已选课程</strong></p>
<br>
		<table border="1" cellpadding="3" cellspacing="0" style="width: 60%;margin:auto">
		
			<tr bgcolor=#cccccc>
				<td>课程序号</td>
				<td colspan="3">课程名称</td>
				<td>任课老师</td>
				<td>类型</td>
				<td>开课地点</td>
				<td>星期</td>
				<td>起始节次</td>
				<td>结束节次</td>
				<td>课程介绍</td>
			</tr>
			<s:iterator value='#request.selection'>
				<tr>
				<td><s:property value="course.id"/></td>
				<td colspan="3"><s:property value="course.name"/></td>
				<td><s:property value="course.professor"/></td>
				<td><s:property value="course.type"/></td>
			    <td><s:property value="course.classroom"/></td>
			    <td><s:property value="courseDay"/></td>
			    <td><s:property value="startTime"/></td>
			    <td><s:property value="endTime"/></td>
			    <td><s:a href='ShowIntroduction2?sel=%{course.id}' target="_blank">查看</s:a></td>
					
				</tr>
			</s:iterator>
			
		</table>
<p align="center"><strong>
<a href="Schedule.action" target="mainFrame" onclick="parent.topMenu.location.href='<%=request.getContextPath()%>/student/blank'">生成课表</a>
</strong></p>
</body>
</html>