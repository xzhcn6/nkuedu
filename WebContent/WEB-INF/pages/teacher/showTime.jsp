<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/manage/showcourse.css">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">   
	$(function(){
		getCourseTimeList('${course.id}');
     }); 
	function getCourseTimeList(courseId){
		var param = {};
		param.courseId = courseId;
        $.ajax({
            type:"POST",
            data:param,
            url:"<%=request.getContextPath()%>/admin/getCourseTimeList",
			success : function(data) {
				if(data.courseTimeList.length != 0){
					$("#id_table_elist").html(template('id_table_coursetimelist', {data:data}));
				} else {
					$("#id_table_elist").html("<tr><td colspan='4'><center>暂无数据</center></td></tr>");
				}
			}
		});
	}
	function deleteCourseTime(courseTimeId){
		if (!confirm('确定删除？')) {
			return;
		} else {
			var param = {};
			param.id = courseTimeId;
			$.ajax({
		           type:"POST",
		           data:param,
		           url:"<%=request.getContextPath()%>/admin/deleteCourseTime",
				success : function(data) {
					alert('删除成功！');
				}
			});
		}
	}
</script>
<script id="id_table_coursetimelist" type="text/html">    
	{{each data.courseTimeList as value i}}
	<tr>
		<td>{{value.courseDay}}</td>
	    <td>{{value.startTime}}</td>
		<td>{{value.endTime}}</td>
	    <td><a href="<%=request.getContextPath()%>/admin/updateCourse?id={{value.id}}">修改</a>
	    	<a href="" onclick="deleteCourseTime('{{value.id}}')">删除</a>
		</td>
	{{/each}}
</script> 
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">编辑课程时间</font></strong></p>
	<table width=60% height=50% align="center" >
	
	<tr>
		<td colspan="13"><strong>课程名称:${course.name}</strong></td>
	</tr>
	<tr><td>&nbsp</td></tr>
	<tr>	
		<td>开课时间（周次）</td>	
		<td>开始节次</td>	
		<td>结束节次</td>
		<td>操作</td>
	</tr>
	
	<tr>
		<td>&nbsp</td>
	</tr>
	<tbody id="id_table_elist"> </tbody>
	<tr>
		<td>&nbsp</td>
	</tr>
	<tr>
		<td>&nbsp</td>
		<td>&nbsp</td>
		<td>&nbsp</td>
		<td><a href="<%=request.getContextPath()%>/admin/addTime?id=${course.id}&selectId=${course.selectId}&name=${course.name}">
			添加时间</a></td>
	</tr>
	
	</table>
	<div style="padding-left:20%;padding-right:20%;"><br>
	<h3>注意：</h3>
	<ol>
		<li>开课时间指该课每周上课的时间，如数字“5”表示周五上课</li>
		<li>开始节次和结束节次指该课每天开始上课和下课的时间，如数字“2”代表第二节课，每节课具体代表时间为：<br>第一节：8：00-8：45；第二节：8：55-9：40；
		第三节：10：00-10：45；第四节：10：55-11：40；<br>第五节：14：00-14：45；第六节：14：55-15：40；
		第七节：16：00-16：45；第八节：16：55-17：40；<br>第九节：18：30-19：15；第十节：19：25-20：10；
		第十一节：20：20-21：05；第十二节：21：15-22：00</li>
	</ol><br><br>
	<!--<s:if test="%{#request.isback==1}"><a href="javascript:history.go(-3);">返回课程管理</a></s:if>-->
	<div align="center"><s:a href="javascript:history.go(-%{#request.isback});">返回课程管理</s:a></div>
	</div>
</body>
</html>