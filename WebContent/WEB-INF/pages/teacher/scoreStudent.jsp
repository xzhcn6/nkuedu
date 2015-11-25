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
        url:"<%=request.getContextPath()%>/admin/getScoreCourseList",
		success : function(data) {
			if(data.selectionList.length != 0){
				$("#id_table_elist").html(template('id_table_selectionlist', {data:data}));
			}
		}
	});
});
function addScore(id){
	var param = {};
	param.studentId = id;
	param.courseId = '${course.id}';
	score = $('#'+id).val();
	if (score==null||score==''||!(/^\d{1,3}(\.\d{1,2})?$/).test(score)){	
		alert('请填写有效成绩！');
		return;
	}
	param.score = score;
	$.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/addScoreByExample",
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
</script> 
<script type="text/javascript">  
	/** 判断是否开课 */
	template.helper('score', function (score) {
		if (score == null){
			return "未登记";
		} else {
			return score;
		}
		
	});
</script>
<script id="id_table_selectionlist" type="text/html">    
	{{each data.selectionList as value i}}
	<tr>
		<td>{{value.name}}</td>
		<td>{{value.studentNum}}</td>
		<td>{{score value.score}}</td>
		<td><input type="text" id ="{{value.studentId}}" style="width:50px;"><input type="submit" value="添加或修改成绩" onclick="addScore('{{value.studentId}}')"></td>
	</tr>
	{{/each}}
</script> 
<title>Insert title here</title>
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">成绩管理</font></strong></p>
<table width=80% height=50% align="center" style="padding-left:10%;">
<tr>
	<td>姓名</td>
	<td>学号</td>
	<td>成绩</td>
	<td>修改后成绩</td>
</tr>
<tbody id="id_table_elist"> </tbody>
</table><br/><br/>
<div style="padding-left:50%;">
<a href="testScore.action?course_id=${cid}&name=${course.name}">打印课程成绩单</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/admin/manageScore">返回成绩管理</a>
</div>
</body>
</html>