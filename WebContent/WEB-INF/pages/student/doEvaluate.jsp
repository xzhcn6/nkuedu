<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/student/do_evaluate.js"></script>
<title>评教界面</title>
<style type="text/css">
.evaluate{
	font-family:Arial;
}
</style>
<script type="text/javascript">   
	$(function(){	
		$('#commit').click(function(){
	    	commit();
	    });
		
		var d = new Date();
	    var nowYear = d.getFullYear();
	    $("#title").html("南开大学"+nowYear+"年夏季学期选课评教"); 
	    
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
function commit(){
	if (!check()) {
		return;
	}
	var c1 = $('input:radio[name=c1]:checked').val();
	var c2 = $('input:radio[name=c2]:checked').val();
	var c3 = $('input:radio[name=c3]:checked').val();
	var c4 = $('input:radio[name=c4]:checked').val();
	var c5 = $('input:radio[name=c5]:checked').val();
	var c6 = $('input:radio[name=c6]:checked').val();
	var content = $('#Content').val();
	alert(content);
}
</script>
</head>
<body style="font-family:微软雅黑;">
<center>
	<p align="center"><strong><font size="3" id='title'></font> </strong></p>
	<br>
		<table class="evaluate">
			<tr >
				<td><font color="red">*</font><font color="blue">1.授课内容</font></td>
				<td bgcolor=#eeeeee colspan="3">
				<input type = "radio" name="c1" value="5"/>非常满意
				<input type = "radio" name="c1" value="4"/>比较满意
				<input type = "radio" name="c1" value="3"/>一般
				<input type = "radio" name="c1" value="2"/>不太满意
				<input type = "radio" name="c1" value="1"/>非常不满意
				</td>
			</tr>
			<tr >
				<td><font color="red">*</font><font color="blue">2.教学方式</font></td>
				<td bgcolor=#eeeeee colspan="3">
				<input type = "radio" name="c2" value="5"/>非常满意
				<input type = "radio" name="c2" value="4"/>比较满意
				<input type = "radio" name="c2" value="3"/>一般
				<input type = "radio" name="c2" value="2"/>不太满意
				<input type = "radio" name="c2" value="1"/>非常不满意
				</td>
			</tr>
			<tr >
				<td><font color="red">*</font><font color="blue">3.教学态度</font></td>
				<td bgcolor=#eeeeee colspan="3">
				<input type = "radio" name="c3" value="5"/>非常满意
				<input type = "radio" name="c3" value="4"/>比较满意
				<input type = "radio" name="c3" value="3"/>一般
				<input type = "radio" name="c3" value="2"/>不太满意
				<input type = "radio" name="c3" value="1"/>非常不满意
				</td>
			</tr>
			<tr >
				<td><font color="red">*</font><font color="blue">4.传授知识和引发学生思考的能力</font></td>
				<td bgcolor=#eeeeee colspan="3">
				<input type = "radio" name="c4" value="5"/>非常满意
				<input type = "radio" name="c4" value="4"/>比较满意
				<input type = "radio" name="c4" value="3"/>一般
				<input type = "radio" name="c4" value="2"/>不太满意
				<input type = "radio" name="c4" value="1"/>非常不满意
				</td>
			</tr>
			<tr >
				<td><font color="red">*</font><font color="blue">5.作业、考核方式</font></td>
				<td bgcolor=#eeeeee colspan="3">				
				<input type = "radio" name="c5" value="5"/>非常满意
				<input type = "radio" name="c5" value="4"/>比较满意
				<input type = "radio" name="c5" value="3"/>一般
				<input type = "radio" name="c5" value="2"/>不太满意
				<input type = "radio" name="c5" value="1"/>非常不满意
				</td>
			</tr>
			<tr>
			<td><br>
			<tr >
				<td><font color="red">*</font><font color="blue">对这门课程的总体印象</font></td>
				<td bgcolor=#eeeeee colspan="5">
				<input type = "radio" name="c6" value="5"/>非常满意
				<input type = "radio" name="c6" value="4"/>比较满意
				<input type = "radio" name="c6" value="3"/>一般
				<input type = "radio" name="c6" value="2"/>不太满意
				<input type = "radio" name="c6" value="1"/>非常不满意
				</td>
			</tr>
			<tr>
			<td><br>
			<tr>
			<td><font color="blue">对老师还有什么想说的：</font></td>
			<td><textarea id="Content" rows="6" cols="50" name="Content"></textarea></td>
			</tr>
			
		</table>
		<input type = "submit" value="提交" id="commit"/>	
		<input type = "button" value="取消" onclick="javascript:history.back();"/>
</center>
</body>
</html>