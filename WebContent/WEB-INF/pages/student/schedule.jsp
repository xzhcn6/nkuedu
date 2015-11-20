<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/student/CSS/schedule.css">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>课表</title>
<script type="text/javascript">
$(function(){
	getSelectedCourse();
 }); 
function getSelectedCourse(){
	var param = {};
	param.studentId = '${student.id}';
	$.ajax({
		type:"POST",
	    data:param,
	    url:"<%=request.getContextPath()%>/student/getSelectedCourseWithTime",
		success : function(data) {
			if(data.courseList.length != 0){
				for (var i=0;i<data.courseList.length;i++){
					for (var j=0;j<data.courseList[i].courseTime.length;j++){
						for (var k=data.courseList[i].courseTime[j].startTime;k<=data.courseList[i].courseTime[j].endTime;k++){
							var id = k+"_"+data.courseList[i].courseTime[j].courseDay;
							$('#'+id).html(data.courseList[i].name+"<br>"+data.courseList[i].professor+"<br>"+data.courseList[i].classroom);
						}
					}
				}
			}
		}
	});
}
</script>
</head>
<body style="font-family:微软雅黑;">
<center><strong><font size="5">课程表</font></strong>
<table border="1" cellpadding="3" cellspacing="0" style="margin:auto; margin-top:20px;">
<tr bgcolor=#cccccc >
	<th><font color="#990000">节次</font></th>
	
	<th width="100"><font color="#990000">星期一</font></th>
	<th width="100"><font color="#990000">星期二</font></th>
	<th width="100"><font color="#990000">星期三</font></th>
	<th width="100"><font color="#990000">星期四</font></th>
	<th width="100"><font color="#990000">星期五</font></th>
	<th width="100"><font color="#990000">星期六</font></th>
	<th width="100"><font color="#990000">星期日</font></th>
</tr>
<tr align="center" height="38" >
	<th width="120"><font color="#990000" size="0.8">第一节：08:00-08:45</font></th>
	<td width="100"><font size="1.5" ><div id=1_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=1_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=1_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=1_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=1_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=1_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=1_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第二节：08:55-09:40</font></th>
	<td width="100"><font size="1.5" ><div id=2_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=2_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=2_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=2_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=2_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=2_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=2_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第三节：10:00-10:45</font></th>
	<td width="100"><font size="1.5" ><div id=3_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=3_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=3_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=3_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=3_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=3_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=3_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第四节：10:55-11:40</font></th>
	<td width="100"><font size="1.5" ><div id=4_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=4_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=4_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=4_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=4_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=4_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=4_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第五节：14:00-14:45</font></th>
	<td width="100"><font size="1.5" ><div id=5_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=5_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=5_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=5_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=5_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=5_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=5_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第六节：14:55-15:40</font></th>
	<td width="100"><font size="1.5" ><div id=6_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=6_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=6_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=6_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=6_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=6_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=6_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第七节：16:00-16:45</font></th>
	<td width="100"><font size="1.5" ><div id=7_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=7_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=7_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=7_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=7_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=7_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=7_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第八节：16:55-17:40</font></th>
	<td width="100"><font size="1.5" ><div id=8_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=8_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=8_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=8_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=8_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=8_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=8_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第九节：18:30-19:15</font></th>
	<td width="100"><font size="1.5" ><div id=9_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=9_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=9_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=9_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=9_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=9_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=9_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第十节：19:25-20:10</font></th>
	<td width="100"><font size="1.5" ><div id=10_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=10_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=10_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=10_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=10_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=10_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=10_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第十一节:20:20-21:05</font></th>
	<td width="100"><font size="1.5" ><div id=11_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=11_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=11_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=11_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=11_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=11_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=11_7></div></font></td>
</tr>
<tr align="center" height="38">
	<th><font color="#990000" size="0.8">第十二节:21:15-22:00</font></th>
	<td width="100"><font size="1.5" ><div id=12_1></div></font></td>
	<td width="100"><font size="1.5" ><div id=12_2></div></font></td>
	<td width="100"><font size="1.5" ><div id=12_3></div></font></td>
	<td width="100"><font size="1.5" ><div id=12_4></div></font></td>
	<td width="100"><font size="1.5" ><div id=12_5></div></font></td>
	<td width="100"><font size="1.5" ><div id=12_6></div></font></td>
	<td width="100"><font size="1.5" ><div id=12_7></div></font></td>
</tr>
</table>
</center>
<div align="center"><a href="javascript:history.go(-1);">[点此返回已选课程]</a></div>
</body>
</html>