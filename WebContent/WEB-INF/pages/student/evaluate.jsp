<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>学生评教</title>
<script type="text/javascript">   
	$(function(){
		var d = new Date();
	    var nowYear = d.getFullYear();
	    $("#title").html("南开大学"+nowYear+"年夏季学期选课评教"); 
	    
	    $.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/student/getSelectionByCourse",
			success : function(data) {
				if(data.courseList.length != 0){
					$("#id_table_elist").html(template('id_table_selectionlist', {data:data}));
				} else {
					$("#id_table_elist").html("<tr><td colspan='8'><center>暂无数据</center></td></tr>");
				}
			}
		});
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
</head>
<body style="font-family:微软雅黑;">
<br>
<br>
<p align="center"><strong id='title'></strong></p>
<br>
		<table border="1" cellpadding="3" cellspacing="0" style="width: 60%;margin:auto">
		
			<tr bgcolor=#cccccc>
				<td>课程序号</td>
				<td colspan="3">课程名称</td>
				<td>任课老师</td>
				<td colspan="4">评教状态</td>
			</tr>
			<tbody id="id_table_elist"> </tbody>
			<s:iterator id='sel' value='#request.selection'>
				<tr>
				<td><s:property value="classBelong.id"/></td>
				<td colspan="3"><s:property value="classBelong.name"/></td>
				<td><s:property value="classBelong.professor"/></td>
				<s:if test="%{#sel.isOver==1}">
			    	<td colspan="4"><s:a href='DoEvaluate?sel=%{#sel.id}'>未评教</s:a></td>
			    </s:if>
			    <s:if test="%{#sel.isOver==2}">
			    	<td colspan="4"><a>已评教</a></td>
			    </s:if>
			    <s:if  test="%{#sel.isOver==0}">
			    	<td colspan="4"><a>未结课</a></td>
			    </s:if>
				</tr>
			</s:iterator>
			
		</table>
<div class="warning" style="padding-left:20%;">	
	<h3>注意：</h3>
	<ol>
			<li>在课程结课后，您需要对课程进行评教方可查看课程成绩</li>
			<li>评教之后，点击左侧菜单“成绩查询”可以查看对应课程成绩</li>
	</ol>
</div>
</body>
</html>