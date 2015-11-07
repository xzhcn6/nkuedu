<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/teacher/check.js"></script>
<script type="text/javascript">
$(function(){
	if('${course.isOpen}'==1){
		$('#isOpen').attr("checked","checked");
	}
	$('#commit').click(function(){
         commit();
    });
	$('#isOpen').click(function(){
    	if($('#isOpen').attr("checked")){
    		$('#isOpen').attr("value","off");
    		$('#isOpen').removeAttr("checked");
    	} else {
    		$('#isOpen').attr("value","on");
    		$('#isOpen').attr("checked","checked");
    	}
    });
 }); 
function commit(){
	if (!checkCourse()) {
		return;
	}
	var param = {};
	param.courseId = '${course.id}';
	param.courseNum = $('#courseNum').val();
	param.name = $('#name').val();
	param.maxStudent = $('#maxStudent').val();
	param.professor = $('#professor').val();
	param.classroom = $('#classroom').val();
	param.request = $('#request').val();
	param.introduction = $('#introduction').val();
	param.type = $('#type').val();
	param.credit = $('#credit').val();
	param.isOpen = $('#isOpen').val();
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
				location.href = "<%=request.getContextPath()%>/admin/showCourse";
			}
		}
	});
}
</script>
</head>
<body>
<p align="center"><strong><font size="5">修改课程信息</font></strong></p>
<div align="center">
<table style="text-align:left;">
	<tr><td>课程号：</td><td><input type="text" id="courseNum" name="courseNum" value="${course.courseNum}"></td></tr>
	<tr><td>课程名称：</td><td><input type="text" id="name" name="name" value="${course.name}"></td></tr>
	<tr><td>最大选课人数：</td><td><input type="text" id="maxStudent" name="maxStudent" value="${course.maxStudent}"></td></tr>
	<tr><td>教师名称：</td><td><input type="text" id="professor" name="professor" value="${course.professor}"></td></tr>
	<tr><td>上课地点：</td><td><input type="text" id="classroom" name="classroom" value="${course.classroom}"></td></tr>
	<tr><td>选课要求：</td><td><input type="text" id="request" name="request" value="${course.request}"></td></tr>
	<tr><td>课程简介：</td><td><textarea rows="5" cols="40" id="introduction" name="introduction" >${course.introduction}</textarea></td></tr>
	<tr><td>课程类型：</td><td><input type="text" id="type" name="type" value="${course.type}"></td></tr>
	<tr><td>学分：</td><td><input type="text" id="credit" name="credit" value="${course.credit}"></td></tr>
	<tr><td>是否开课：</td><td><input type="checkbox" id="isOpen" name="isOpen"></td></tr>
</table>
<table align="right" width="50%"><tr><td>
 	<input type="submit" id="commit" value="修改">
	<input type="submit" id="add_0" value="取消" onclick="javascript:history.go(-1);">
	</td></tr>
</table>
<br>
</div>
</body>
</html>