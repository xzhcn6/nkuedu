<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/left.css">
<title>选课系统</title>
<script type="text/javascript">

</script>
</head>
<body style="font-family:微软雅黑;">
<div class="left">
<!-- <table width="110" height="110" border="0" cellpadding="0" cellspacing="0" align="left"> -->
<!--  <tr> -->
<!--   <td width="105" height="81" align="left" style="marginwidth:0;marginheight:0"></td> -->
<!--  </tr> -->
<!--  <tr><td height="1" bgcolor="white"></td> -->
<!--  </tr> -->
<!--  <tr><td height="2" bgcolor="white"></td> -->
<!--  </tr> -->
<!-- </table> -->
		<ul>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/client/logout" target="_top">退出登录</a></font></li>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/student/personalInfo" target="mainFrame" onclick="parent.topMenu.location.href='<%=request.getContextPath()%>/client/blank'">个人信息</a></font></li>
			<li><font color="#FFFFFF"><a href="SelectClass" target="topMenu" onclick="parent.mainFrame.location.href='SelectCourse'">学生选课</a></font></li>
			<li><a href="ShowEvaluate" target="mainFrame" onclick="parent.topMenu.location.href='<%=request.getContextPath()%>/client/blank'">学生评教</a></li>
			<li><a href="ScoreQuery.action" target="mainFrame" onclick="parent.topMenu.location.href='<%=request.getContextPath()%>/client/blank'">成绩查询</a></li>
			<hr  style="border:1px dashed black; height:1px"/>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/student/xksc" target="_blank">选课手册</a></font></li>
			<li><font color="#FFFFFF"><a href="http://jwc.nankai.edu.cn/" target="_blank" >教务处</a></font></li>
			<li><font color="#FFFFFF"><a href="<%=request.getContextPath()%>/student/help" target="mainFrame" onclick="parent.topMenu.location.href='<%=request.getContextPath()%>/client/blank'">使用帮助</a></font></li>	
		</ul>
</div>

</body>
</html>