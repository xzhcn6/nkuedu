<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/teacher/check.js"></script>
<script type="text/javascript">
	$(function(){
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
	        url:"<%=request.getContextPath()%>/admin/insertCourse",
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
<title>添加课程</title>
</head>
<body>
<p align="center"><strong><font size="5">添加课程</font></strong></p>
<div align="center">
 <table style="text-align:left;">
	 	<tr><td>课程号：</td><td><input type="text" id="courseNum" name="courseNum"></td></tr>
	 	<tr><td>课程名称：</td><td><input type="text" id="name" name="name"></td></tr>
	 	<tr><td>最大选课人数：</td><td><input type="text" id="maxStudent" name="maxStudent"></td></tr>
	 	<tr><td>教师名称：</td><td><input type="text" id="professor" name="professor"></td></tr>
	 	<tr><td>上课地点：</td><td><input type="text" id="classroom" name="classroom"></td></tr>
	 	<tr><td>选课要求：</td><td><input type="text" id="request" name="request"></td></tr>
	 	<tr><td>课程简介：</td><td><textarea rows="5" cols="40" id="introduction" name="introduction"></textarea></td></tr>
	 	<tr><td>课程类型：</td><td><input type="text" id="type" name="type"></td></tr>
	 	<tr><td>学分：</td><td><input type="text" id="credit" name="credit"></td></tr>
	 	<tr><td>是否开课：</td><td><input type="checkbox" id="isOpen" name="isOpen" checked="checked" ></td></tr>
	 </table>
	<table align="right" width="50%"><tr><td>
 	<input type="submit" id="commit" value="确定添加">
	<input type="submit" id="add_0" value="取消" onclick="javascript:history.go(-1);">
	</td></tr></table>
</div>
<div style="padding-left:20%;">
<h3>帮助提示</h3>
	<ol>
		<!-- <li>添加加“简介”时，请在word文件中进行全文替换：1.将“ ”（空格）换为“&amp;nbsp”；2.将“^p”换为“&ltbr&gt” -->
		<li>添加课程后，您需要在“课程管理”中点击“查看/修改时间”添加课程的上课时间信息
	</ol>
</div>
</body>
</html>