<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/personal_info.css">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>成绩查询</title>
</head>
<script type="text/javascript">   
	$(function(){
		var d = new Date();
	    var nowYear = d.getFullYear();
	    $("#title").html("南开大学"+nowYear+"年度夏季学期成绩"); 
	    
	    $.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/student/getSelectionByCourse",
			success : function(data) {
				if(data.courseList.length != 0){
					$("#id_table_elist").html(template('id_table_courselist', {data:data}));
				} else {
					$("#id_table_elist").html("<tr><td colspan='8'><center>暂无数据</center></td></tr>");
				}
			}
		});
     });
</script>
<script type="text/javascript">  
	/** 判断是否开课 */
	template.helper('score', function (score) {
		if (score == null){
			return "未登记";
		} else if (score == -1){
			return "未评教";
		} else {
			return score;
		}
		
	});
</script>
<script id="id_table_courselist" type="text/html">    
	{{each data.courseList as value i}}
	<tr>
		<td>{{value.selectId}}</td>
		<td>{{value.name}}</td>
		<td>{{value.professor}}</td>
		<td>{{value.credit}}</td>
	    <td>{{score value.score}}</td>
	{{/each}}
</script> 
<body style="font-family:微软雅黑;">
	<div class="query">		
	<p align="center"><strong id="title"></strong></p>
	<table border="1" cellpadding="3" cellspacing="0" style="width: 60%;margin:auto">
		<tr>
				<td bgcolor=#cccccc>姓名</td>
				<td colspan="2">${student.name}</td>				
				<td bgcolor=#cccccc>学号</td>
				<td colspan="2">${student.studentNum}</td>	
		</tr>
		<tr bgcolor=#cccccc>
				<td>选课序号</td>
				<td>课程名称</td>
				<td>教师</td>
				<td>学分</td>
				<td>成绩</td>
		</tr>
		<tbody id="id_table_elist"> </tbody>
	</table>
	</div>
	<div class="warning" style="padding-left:20%;">	
	<h3>注意：</h3>
	<ol>
			<li>在课程结课后，您需要对课程<font color="red">进行评教</font>方可查看课程成绩</li>
			<li>评教之后，课程成绩显示“未出成绩”表示该门课的成绩还未录入，请学生耐心等待</li>
	</ol>
</div>
</body>
</html>