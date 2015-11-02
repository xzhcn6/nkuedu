<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="../JS/check.js"></script>
<script type="text/javascript">
	function onclick1(){
		if(checkCourse()){
			showAjax('AddClassServlet');
		}
	}
	var xmlHttpRequest;
	function showAjax(url) {
	//创建XMLHttpRequest对象
		if (window.XMLHttpRequest) {
			xmlHttpRequest = new XMLHttpRequest();
		} else {
			xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");//IE6
		}
		
		xmlHttpRequest.open("GET",url,true);//以GET方式访问string.txt，异步
		xmlHttpRequest.send();//提交
		xmlHttpRequest.onreadystatechange = callback;//设置状态改变时的回调函数
	}
	
	//回调函数
	function callback(){
		if(xmlHttpRequest.readyState==4 && xmlHttpRequest.status==200){//当请求正常完成时
			document.getElementById("sb").disabled = "disabled";
			sb.value = "添加中...";
			document.forms[0].submit();
		}
	}
</script>
<title>添加课程</title>
</head>
<body>
<p align="center"><strong><font size="5">添加课程</font></strong></p>
<div align="center">
<s:form action="add.action" method="post" onsubmit="return false">
 <table style="text-align:left;">
	 	<tr><td>课程号：</td><td><input type="text" id="courseNum" name="courseNum"></td></tr>
	 	<tr><td>课程名称：</td><td><input type="text" id="name" name="name"></td></tr>
	 	<tr><td>最大选课人数：</td><td><input type="text" id="maxStudent" name="maxStudent"></td></tr>
	 	<tr><td>教师名称：</td><td><input type="text" id="professor" name="professor"></td></tr>
	 	<tr><td>上课地点：</td><td><input type="text" id="classroom" name="classroom"></td></tr>
	 	<tr><td>选课要求：</td><td><input type="text" id="reques" name="reques"></td></tr>
	 	<tr><td>课程简介：</td><td><textarea rows="5" cols="40" id="introduction" name="introduction"></textarea></td></tr>
	 	<tr><td>课程类型：</td><td><input type="text" id="type" name="type"></td></tr>
	 	<tr><td>学分：</td><td><input type="text" id="credit" name="credit"></td></tr>
	 	<tr><td>是否开课：</td><td><input type="checkbox" id="isOpen" name="isOpen" checked="checked"></td></tr>
	 </table>
</s:form>
	<table align="right" width="50%"><tr><td>
 	<input type="submit" id="sb" value="确定添加" onclick="javascript:onclick1();">
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