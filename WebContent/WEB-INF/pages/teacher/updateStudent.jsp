<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/teacher/update-student.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">     
	$(function(){
		$('#commit').click(function(){
             commit();
        });
     }); 
	function commit(){
		if (!checkAll()) {
			return;
		}
		var param = {};
		param.stuId = '${student.id}';
		param.name = $('#name').val();
		param.school = $('#school').val();
		param.phone = $('#phone').val();
		param.password = $('#password').val();
		param.code = $('#code').val();
        $.ajax({
            type:"POST",
            data:param,
            url:"<%=request.getContextPath()%>/admin/updateStudentInfo",
			success : function(data) {
				if (data.error != null){
					alert(data.error);
					document.location.reload();
				}
				if (data.msg != null){
					alert(data.msg);
					location.href = "<%=request.getContextPath()%>/admin/showStudent";
				}
			}
		});
	}
</script>
<body>
	<p align="center">
		<strong><font size="5">编辑学生信息</font></strong>
	</p>
	<table align="center">
		<tr>
			<td>学号：${student.studentNum}</td>
		</tr>
	</table>
	<div align="center">
		<table cellpadding="5" align="center">
			<tr>
				<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 名：&nbsp;</td>
				<td><input type="text" name="name" id="name"
					value="${student.name}" onblur="checkName()">&nbsp;</td>
				<td><div id="a">*</div></td>
			</tr>
			<tr>
				<td>所在学校：</td>
				<td><input type="text" name="school" id="school"
					value="${student.school}" onblur="checkSchool()">&nbsp;</td>
				<td><div id="b">*</div></td>
			</tr>
			<tr>
				<td>电子邮箱：</td>
				<td><input type="text" name="email" id="email"
					value="${student.email}" onblur="checkEmail()" readonly>&nbsp;</td>
				<td><div id="c">*</div></td>
			</tr>
			<tr>
				<td>联系电话：</td>
				<td><input type="text" name="phone" id="phone"
					value="${student.telephone}" onblur="checkPhone()">&nbsp;</td>
				<td><div id="d">*</div></td>
			</tr>
			<tr>
				<td>登录密码：</td>
				<td><input type="text" name="password"
					value="${student.passwd}" id="password" onblur="checkPassword()">&nbsp;</td>
				<td><div id="e">*</div></td>
			</tr>
			<tr>
				<td>验&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码：</td>
				<td><input type="text" name="code" id="code"></td>
				<td><img src="<%=request.getContextPath()%>/verifyCode/code"
					id="codeAction" style="cursor: pointer;"
					onclick="this.src='<%=request.getContextPath()%>/verifyCode/code?k='+Math.random()"
					alt="看不清，换一张" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" id="commit" value="提交修改" onclick="">
					<input type="submit" id="add_0" value="取消"
					onclick="javascript:history.go(-1);"></td>
			</tr>
		</table>
	</div>
</body>
</html>