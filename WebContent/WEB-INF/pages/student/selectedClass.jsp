<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	getSelectedCourse();
 }); 
function getSelectedCourse(){
	var param = {};
	param.studentId = '${student.id}';
	$.ajax({
		type:"POST",
	    data:param,
	    url:"<%=request.getContextPath()%>/student/getSelectedCourseWithTime",
		success : function(data) {
			if(data.courseList.length != 0){
				$("#id_table_elist").html(template('id_table_courselist', {data:data}));
			} else {
				$("#id_table_elist").html('<tr><td colspan="11"><center>您还未选择任何课程</center></td></tr>');
			}
		}
	});
}
</script>
<script id="id_table_courselist" type="text/html">    
	{{each data.courseList as value i}}
	{{each value.courseTime as valueT j}}
		<tr>
			<td>{{value.selectId}}</td>
			<td colspan="3">{{value.name}}</td>
			<td>{{value.professor}}</td>
			<td>{{value.type}}</td>
			<td>{{value.classroom}}</td>
			<td>{{valueT.courseDay}}</td>
			<td>{{valueT.startTime}}</td>
			<td>{{valueT.endTime}}</td>
			<td><a href="<%=request.getContextPath()%>/student/showCourseIntro?name={{value.name}}&introduction={{value.introduction}}" >查看</a></td>
		</tr>
	{{/each}}
	{{/each}}
</script> 
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
		<tbody id="id_table_elist"> </tbody>	
		</table>
<p align="center"><strong>
<a href="<%=request.getContextPath()%>/student/schedule" target="mainFrame" onclick="parent.topMenu.location.href='<%=request.getContextPath()%>/student/blank'">生成课表</a>
</strong></p>
</body>
</html>