<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>Insert title here</title>
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">学生管理</font></strong></p>

<table width=70% align="center">
	<tr>
		<td colspan="13"><strong>学生信息</strong></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>学号</td>
		<td>姓名</td>
		<td>学校</td>
		<td>电话</td>
		<td>注册邮箱</td>
	  	<td>登录密码</td>
	  	<td>操作</td>
	  	
	</tr>
	
	<s:iterator value="list">
	
    <tr>
		<td></td>
	    <td><s:property value="studentNumber"/></td>
		<td><s:property value="name"/></td>
		<td><s:property value="school"/></td>
		<td><s:property value="telephone"/></td>
		<td><s:property value="email"/></td>
	    <td><s:property value="loginKey"/></td>
	    <td><a href="updateStudent.jsp?id=<s:property value='id'/>&name=<s:property value='name'/>&school=<s:property value="school"/>&telephone=<s:property value="telephone"/>&email=<s:property value="email"/>&loginKey=<s:property value="loginKey"/>&studentNumber=<s:property value="studentNumber"/>">修改</a>
	    	<a href="deleteStudent.action?id=<s:property value='id'/>" onclick="return confirm('确定删除？')">删除</a>
	    	<a href="queryCourse.action?id=<s:property value='id' />&name=<s:property value="name"/>">查询课程</a>
	    </td>
	</s:iterator>
	</table><br>
	
	
<div style="padding-left:15%;">
    <s:if test="#request.pageNow==1">

<font color="#cccccc" >上一页  第一页</font>

</s:if>

<s:else>

<a href="showStudent.action?pageNow=<s:property value="1"/>">第一页</a>&nbsp;

<a href="showStudent.action?pageNow=${pageNow-1 }">上一页</a>

</s:else>
&nbsp
<s:iterator begin="1" end="(#request.total+#request.pagesize-1)/#request.pagesize" step="1" status="i">
	<s:if test="%{#i.index+1==#request.pageNow}"><strong><s:property value="%{#i.index+1}"/></strong></s:if>
	<s:else><a href="showStudent.action?pageNow=<s:property value="%{#i.index+1}"/>"><s:property value="%{#i.index+1}"/></a></s:else>
	&nbsp
</s:iterator>

<s:if test="(#request.total+#request.pagesize-1)/#request.pagesize==#request.pageNow">

<font color="#cccccc" >下一页  最后一页</font>

</s:if>

<s:else>

<a href="showStudent.action?pageNow=${pageNow+1 }">下一页</a>&nbsp;

<a href="showStudent.action?pageNow=<s:property value="%{(#request.total+#request.pagesize-1)/#request.pagesize}"/>">最后一页</a>

</s:else>
<br/><br/><a href="pstudent?type=3">打印学生信息核对单</a>
    <h3>帮助提示</h3>
	<ol>
		<li>该页面显示所有注册学生的信息
		<li>点击“修改”可以对学生基本信息进行编辑
		<li>点击“删除”可以删除学生相关信息（会删除学生选课、成绩和评教的信息）
		<li>点击“查询课程”可以查看学生选择的课程信息和打印学生课程成绩证明
	</ol>
</div>
</body>
</html>