<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
	.evaluation{
	margin-left:50px;
	margin-right:50px;}
</style>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var param = {};
	param.courseId = '${courseId}';
    $.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/getEvaluationByCourseId",
		success : function(data) {
			if(data.commentList.length != 0){
				$("#id_table_elist").html(template('id_table_commentlist', {data:data}));
			} else {
				$("#id_table_elist").html("<hr><center>暂无学生评教</center><hr>");
			}
		}
	});
});
</script>
<script id="id_table_commentlist" type="text/html">    
	{{each data.commentList as value i}}
		<hr>
		总分:{{value.total}}<br><hr>
		分数详情：<br>
		1、授课内容：{{value.score1}}<br>
		2、教学方式：{{value.score2}}<br>
		3、教学态度：{{value.score3}}<br>
		4、传授知识和引发学生思考的能力：{{value.score4}}<br>
		5、作业、考核方式：{{value.score5}}<br>
		6、对这门课程的总体印象：{{value.score6}}<br><hr>
		学生评价：<br>{{value.comment}}
	{{/each}}
</script> 
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">评教详情</font></strong></p>
<div class="evaluation" style="padding-left:20%;padding-right:20%;">
<strong>课程名：${course.name}</strong><br>
<div id="id_table_elist"></div>
</div>
<div style="padding-left:70%;">
&nbsp&nbsp&nbsp&nbsp
<a href="<%=request.getContextPath()%>/admin/showEvaluation">返回评教管理</a>
</div>
</body>
</html>