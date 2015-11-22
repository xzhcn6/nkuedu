<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>Insert title here</title>
<script type="text/javascript">   
	$(function(){
		var param = {};
		param.studentId = '${student.id}';
		$.ajax({
	        type:"POST",
	        data:param,
	        url:"<%=request.getContextPath()%>/admin/getStudentCourse",
			success : function(data) {
				if(data.courseList.length != 0){
					$("#id_table_elist").html(template('id_table_courselist', {data:data}));
				} else {
					$("#id_table_elist").html('此学生未选择任何课程！');
				}
			}
		});
     });
</script>
<script id="id_table_courselist" type="text/html">    
	{{each data.courseList as value i}}
	<tr>
		<td>{{value.selectId}}</td>
		<td>{{value.name}}</td>
		<td>{{value.professor}}</td>
		<td>{{value.score}}</td>
		<td>{{value.isOver}}</td>
	</tr>
	{{/each}}
</script> 
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">学生选课详情</font></strong></p>
<h5 align="center">学生姓名： ${student.name}&nbsp&nbsp&nbsp学号：${student.studentNum}</h5>
	<table width=60% height=50% align="center">
	<tr>
		<td colspan="7"><strong>课程信息</strong></td>
	</tr>
	<tr>
		<td>选课序号</td>
		<td>课程名称</td>
		<td>任课老师</td>
	  	<td>成绩</td>
	  	<td>是否结课</td>
	  	
	</tr>
	<tbody id="id_table_elist"> </tbody>
	<s:iterator value="selectionList">
	
    <tr>
		<td><s:property value="classBelong.id"/></td>
		<td><s:property value="classBelong.name"/></td>
		<td><s:property value="classBelong.professor"/></td>
	    <td>
	    <s:if test="%{score==-1}">
	    	未登记
	    </s:if>
	    <s:else>
	    	<s:property value="score"/>
	    </s:else>
	    </td>
	    <s:if test="%{isOver>=1}"><td>是</td></s:if>
	    <s:if test="%{isOver==0}"><td>否</td></s:if>
	    
	    
	</s:iterator>
	</table><br/><br/>
	<div style="padding-left:60%;">
	<a href="testStu.action?id=${id}&name=&type=2">打印学生成绩证明</a>&nbsp&nbsp&nbsp&nbsp
	<a href="showStudent.action?page=1">返回学生管理</a>
	</div>
</body>
</html>