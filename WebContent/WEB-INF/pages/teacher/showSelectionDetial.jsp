<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<script type="text/javascript">   
$(function(){
	var param = {};
	param.courseId = '${course.id}';
	$.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/getSelectionDetialList",
		success : function(data) {
			if(data.selectionList.length != 0){
				$("#id_table_elist").html(template('id_table_selectionlist', {data:data}));
			}
		}
	});
});
function deleteSelection(studentId){
	if (!confirm('确定进行此操作？将会退掉该学生的选课')){
		return ;
	} else {
		var param = {};
		param.studentId = studentId;
		param.courseId = '${course.id}';
		$.ajax({
			type:"POST",
	        data:param,
	        url:"<%=request.getContextPath()%>/admin/deleteSelectionByExample",
			success : function(data) {
				alert('退选成功！');
			}
		});
	}
}
</script> 
<script id="id_table_selectionlist" type="text/html">    
	{{each data.selectionList as value i}}
	<tr>
		<td>{{value.studentNum}}</td>
		<td>{{value.name}}</td>
		<td>{{value.school}}</td>
		<td><a href="" onclick="deleteSelection('{{value.id}}')">强制退选</a></td>
	</tr>
	{{/each}}
</script> 
<title>Insert title here</title>
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">选课详情</font></strong></p>
	<table width=50% height=50% align="center">
	<tr>
		<td>课程名称：${course.name}</td>
		<td></td>
	</tr>
	<tr>
		<td>限选人数：${course.maxStudent}</td>
	</tr>
	<tr>
		<td>已选人数：${selectCount}</td></tr>
	<tr>
		<td>学号</td><td>学生姓名</td><td>所在学校</td>
	</tr>
	<tbody id="id_table_elist"> </tbody>
	
	</table><br>
	<div style="padding-left: 65%;"><a href="<%=request.getContextPath()%>/admin/showSelection">返回选课管理</a></div>
</body>
</html>