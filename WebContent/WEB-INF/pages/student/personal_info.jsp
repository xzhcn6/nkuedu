<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/CSS/personal_info.css">
<title>个人信息</title>
</head>
<body style="font-family:微软雅黑;">
<center><a href="test.action?type=1&name=${student.name}">导出听课证</a>（导出格式为.doc文件，请用office word打开，以免出现排版出现问题。打印后请到南开大学教务处进行盖章后听课证方可生效。）</center>
	<div class="info">
	<p align="center"><strong>南开大学夏季学期听课证 </strong></p>
	<table border="1" cellpadding="3" cellspacing="0" style="width:60%;margin:auto">
		<tr>
				<td bgcolor=#cccccc>姓名</td>
				<td colspan="2">${student.name}</td>				
				<td bgcolor=#cccccc>学号</td>
				<td colspan="2"><b>${student.studentNum}</b></td>
				
		</tr>
			<tr>
				<td bgcolor=#cccccc>所在学校</td>
				<td colspan="2">${student.school}</td>
				<td bgcolor=#cccccc>联系电话</td>
				<td colspan="2">${student.telephone}</td>
				
			</tr>
			<tr>
				<td bgcolor=#cccccc>注册邮箱</td>
				<td colspan="5">${student.email }</td>
				
			</tr>
			<tr>
				<td colspan="6">所选课程</td>
			</tr>
			<tr bgcolor=#cccccc>
				<td>课程序号</td>
				<td colspan="2">课程名称</td>
				<td>任课老师</td>
				<td>类型</td>
				<td>开课地点</td>
			</tr>
			<s:iterator value='#request.selection'>
				<tr>
					<td><s:property value="classBelong.id"/></td>
					<td colspan="2"><s:property value="classBelong.name"/></td>
					<td><s:property value="classBelong.professor"/></td>
					<td><s:property value="classBelong.type"/></td>
					<td style="font-size:12px;"><s:property value="classBelong.classroom"/></td>
				</tr>
			</s:iterator>
			
		</table>
	</div>
<!-- <a href="print.action">导出word文档</a> -->

</body>
</html>