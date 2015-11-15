<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/teacher/check.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	if('${sysStatus}'==1){
		$('#statYes').attr("checked","true");
		$('#statNo').removeAttr("checked");
	} else {
		$('#statNo').attr("checked","true");
		$('#statYes').removeAttr("checked");
	}
	$('#commit').click(function(){
         commit();
    });
	function commit(){
		
	}
}); 
</script>
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">选课管理</font></strong></p>
<div style="padding-left:10%;">
	<div style="float: left;">
	<form action="ChangeState">
		选课系统是否开放给学生选课：
		<input type="radio" name="state" value="1" id="statYes">是
		<input type="radio" name="state" value="0" id="statNo">否
		<input type="submit" value="提交" id="commit">
	</form>
	</div>
	
	<div style="float: left; padding-left: 80px;">
	一键置为结课/未结课：</div>
	<div style="float: left;">
	<form action="AllOver">
		<input type="hidden" name="toOver" value=1>
		<input type="submit" value="全部置为结课">
		&nbsp;
	</form>
	</div>
	<div style="float: left;">
	<form action="AllOver">
		<input type="hidden" name="toOver" value=0>
		<input type="submit" value="全部置为未结课">
	</form>
	</div>
</div>
	<table width=80% align="center">
	<tr>
		<td>选课序号</td>
		<td>课程</td>
	  	<td>是否结束</td> 
	  	<td colspan="2">操&nbsp;&nbsp;&nbsp;&nbsp;作</td> 	
	</tr>
	
	<s:iterator value="selectedCourseList" status="i">
	
    
		<s:if test="%{!#i.first&&classBelong.name==selectedCourseList[#i.index-1].classBelong.name}">
		</s:if>
		<s:else>
	<tr>
		<td align="center"><s:property value="classBelong.id"/></td>
		<td><s:property value="classBelong.name"/></td>
		
		<td>
		<s:if test="%{isOver>=1}">
			<s:a href="ChangeIsOver?cid=%{classBelong.id}">当前状态：已结课；点击改为未结课</s:a>
		</s:if>
		<s:else>
			<s:a href="ChangeIsOver?cid=%{classBelong.id}">当前状态：未结课；点击改为已结课</s:a>
		</s:else>
		</td>
		<td><a href="detailSelectedCourse.action?course_id=<s:property value='classBelong.id'/>
						&courseName=<s:property value='classBelong.name'/>">查看选课详情</a></td>
		<td><a href="PrintSelectionList?type=1&course_id=<s:property value='classBelong.id'/>
						&courseName=<s:property value='classBelong.name'/>">导出选课名单</a></td>
		<td><a href="PrintSelectionList?type=2&course_id=<s:property value='classBelong.id'/>
						&courseName=<s:property value='classBelong.name'/>">导出空白成绩单</a></td>
	</tr>
		</s:else>
	</s:iterator>
	
	</table><br>
	<div style="padding-left:10%;">
    <s:if test="#request.page==1">

<font color="#cccccc" >上一页  第一页</font>

</s:if>

<s:else>

<a href="showAllSelectedCourse.action?page=<s:property value="1"/>">第一页</a>&nbsp;

<a href="showAllSelectedCourse.action?page=${page-1 }">上一页</a>

</s:else>
&nbsp;
<s:iterator begin="1" end="(#request.total+10-1)/10" step="1" status="i">
	<s:if test="%{#i.index+1==#request.page}"><strong><s:property value="%{#i.index+1}"/></strong></s:if>
	<s:else><a href="showAllSelectedCourse.action?page=<s:property value="%{#i.index+1}"/>"><s:property value="%{#i.index+1}"/></a></s:else>
	&nbsp;
</s:iterator>

<s:if test="(#request.total+10-1)/10==#request.page">

<font color="#cccccc" >下一页  最后一页</font>

</s:if>

<s:else>

<a href="showAllSelectedCourse.action?page=${page+1 }">下一页</a>&nbsp;

<a href="showAllSelectedCourse.action?page=<s:property value="%{(#request.total+10-1)/10}"/>">最后一页</a>

</s:else>

	<h3>帮助提示</h3>
	<ol>
		<li>该页面显示所有课程中有学生选课的课程
		<li>学生可以在学生登录界面对结课状态为“已结课”的课进行评价，评价之后学生即可看到其在该门课的成绩
		<li>您可以修改选课系统开放/关闭状态，选课系统开放时学生方可选课退课
		<li>您可以通过一键结课来一次性将所有课程结课
		<li>点击“查看选课详情”可以查看选课的学生信息
	</ol>
</div>
</body>
</html>