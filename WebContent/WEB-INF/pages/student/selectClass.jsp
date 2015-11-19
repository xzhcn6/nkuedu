<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/select_class.css">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<script charset="utf-8" type="text/javascript" src="<%=request.getContextPath()%>/static/JS/student/select.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	getSelectedCourse();
	$('#addselcommit').click(function(){
		addselcommit();
    });
	$('#delselcommit').click(function(){
		delselcommit();
    });
 }); 
function addselcommit(){
	var param = {};
	param.selectId = $('#selectId').val();
    $.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/student/addSelection",
		success : function(data) {
			if (data.error != null){
				alert(data.error);
				document.location.reload();
			}
			if (data.msg != null){
				alert(data.msg);
				window.location.reload(); 
			}
		}
	});
}
function delselcommit(){
	var param = {};
	param.selectId = $('#deleteId').val();
    $.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/updateCourseInfo",
		success : function(data) {
			if (data.error != null){
				alert(data.error);
				document.location.reload();
			}
			if (data.msg != null){
				alert(data.msg);
				document.location.reload();
			}
		}
	});
}
function getSelectedCourse(){
	var param = {};
	param.studentId = '${student.id}';
	$.ajax({
		type:"POST",
	    data:param,
	    url:"<%=request.getContextPath()%>/student/getSelectedCourse",
		success : function(data) {
			if(data.courseList.length != 0){
				$("#id_table_elist").html(template('id_table_courselist', {data:data}));
			} else {
				$("#id_table_elist").html('<tr><td colspan="8"><center>您还未选择任何课程</center></td></tr>');
			}
		}
	});
}
</script>
<script id="id_table_courselist" type="text/html">    
	{{each data.courseList as value i}}
		<tr>
			<td>{{i}}</td>
			<td>{{value.selectId}}</td>
			<td colspan="3">{{value.name}}</td>
			<td>{{value.professor}}</td>
			<td>{{value.type}}</td>
			<td>{{value.classroom}}</td>
		</tr>
	{{/each}}
</script> 
</head>
<body style="font-family:微软雅黑;">
<br><p align="center"><strong>选 课 退 课</strong></p><br>
	<div class="select">
		请输入选课序号进行选课：<input type="text" name="id" id="selectId">
		<input type="submit" value="选课" id="addselcommit">
	</div>
	<div class="select">
		请输入选课序号进行退课：<input type="text" name="id" id="deleteId">
		<input type="submit" value="退课" id="delselcommit">
	</div>
	<P align="center">姓名：${student.name}
	<p align="center">学号：${student.studentNum}
	<table border="1" cellpadding="3" cellspacing="0" style="width: 60%;margin:auto">
		<tr bgcolor=#cccccc>
				<td>序号</td>
				<td>选课序号</td>
				<td colspan="3">课程名称</td>
				<td>任课老师</td>
				<td>类型</td>
				<td>开课地点</td>
			</tr>
	<tbody id="id_table_elist"> </tbody>
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