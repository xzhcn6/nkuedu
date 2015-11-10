<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/teacher/check.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/check.js"></script>
<script type="text/javascript">
$(function(){
	$('#commit').click(function(){
         commit();
    });
 }); 
function commit(){
	if (!checkTime()) {
		return;
	}
	var param = {};
	param.id = '${courseTime.id}'
	param.courseDay = $('#courseDay').val();
	param.startTime = $('#startTime').val();
	param.endTime = $('#endTime').val();
	$.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/updateCourseTimeInfo",
		success : function(data) {
			if (data.error != null){
				alert(data.error);
				document.location.reload();
			}
			if (data.msg != null){
				alert(data.msg);
				location.href = "<%=request.getContextPath()%>/admin/showCourseTime?id=${course.id}&selectId=${course.selectId}&=${course.name}";
			}
		}
	});
}
</script>
<title>Insert title here</title>
</head>
<body>
<p align="center"><strong><font size="5">修改课程时间信息</font></strong></p>
	<table align="center">
		<tr>
			<td>
			<strong>选课序号：${course.selectId}</strong></td>
			<td>
			<strong>&nbsp&nbsp课程名称：${course.name}</strong></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp</td>
		</tr>
		<tr>
			<td>周次：</td><td><input type="text" id="courseDay" name="courseDay" value="${courseTime.courseDay}"></td>
		</tr>
		<tr>
			<td>开始时间：</td><td><input type="text" id="startTime" name="startTime" value="${courseTime.startTime}"></td>
		</tr>
		<tr>
			<td>结束时间：</td><td><input type="text" id="endTime" name="endTime" value="${courseTime.endTime}"></td>
		</tr>
	</table>
	<table align="right" width="50%">
	<tr><td>
		<input type="button" value="确定修改" id="commit">
		<input type="submit" id="add_0" value="取消" onclick="javascript:history.go(-1);">
	</td></tr>
	</table>
</body>
</html>