<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/manage/showcourse.css">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>课程管理</title>
</head>
<script type="text/javascript">   
	$(function(){
		getCourseList(1);
     }); 
	function getCourseList(pageNo){
		var param = {};
		param.pageNo = pageNo;
        $.ajax({
            type:"POST",
            data:param,
            url:"<%=request.getContextPath()%>/admin/getCourseList",
			success : function(data) {
				if(data.courseList.list.length != 0){
					$("#id_table_elist").html(template('id_table_courselist', {data:data}));
				} else {
					$("#id_table_elist").html("<tr><td colspan='8'><center>暂无数据</center></td></tr>");
				}
				getPages(data.courseList);
			}
		});
	}
	// 分页	 
	function getPages(page){
		var div="";
		if (page.prePage == 0){
			div += "<a href='javascript://' class='not-active' onclick='getCourseList("+page.firstPage+")' style='color:#999999;padding-right:10px;'>< 前页</a>";
		} else {
			div += "<a href='javascript://' class='active' onclick='getCourseList("+page.prePage+")' style='padding-right:10px;'>< 前页</a>";
		}
		
		if(page.pages<10){
        	for (var i=1; i<=page.pages; i++){
        		if(page.pageNum==i){
			 		div+= "<a href='javascript://' onclick='getCourseList("+i+")' class='active' style='color:#999999;padding-right:10px;'>"+i+"</a>";
			 	}else{
			 		div+= "<a href='javascript://' onclick='getCourseList("+i+")' class='not-active' style='padding-right:10px;'>"+i+"</a>";
			 	}
        	}
        } else {
        	var startpage = page.pageNum - 4;
            var endpage = page.pageNum + 5;
            
            if(startpage<1){
                startpage = 1;
                endpage = 9;
            }
            if(endpage>page.pages){
                endpage = page.pages;
                startpage = page.pages - 9;
            }    
            for(var i=startpage; i<=endpage; i++){
            	if(page.pageNum==i){
			 		div+= "<a href='javascript://' onclick='getCourseList("+i+")' class='active' style='padding-right:10px;'>"+i+"</a>";
			 	}else{
			 		div+= "<a href='javascript://' onclick='getCourseList("+i+")' class='not-active' style='color:#999999;padding-right:10px;'>"+i+"</a>";
			 	}
            }
            if (endpage < page.pages){
            	div+="<a href='javascript://' onclick='getCourseList("+page.nextPage+");' style='padding-right:10px;'>...</a>";
            }
        }
		if (page.nextPage == 0){
			div += "<a href='javascript://' class='not-active' onclick='getCourseList("+page.lastPage+")' style='color:#999999;padding-right:10px;'>后页 ></a>";
		} else {
			div += "<a href='javascript://' class='active' onclick='getCourseList("+page.nextPage+")' style='padding-right:10px;'>后页 ></a>";
		}
		$("#pages").html(div);
	}
	
	function deleteCourse(courseId){
		if (!confirm('确定删除？')) {
			return;
		} else {
			var param = {};
			param.id = courseId;
			$.ajax({
		           type:"POST",
		           data:param,
		           url:"<%=request.getContextPath()%>/admin/deleteCourse",
				success : function(data) {
					alert('删除成功！');
				}
			});
		}
	}
</script>
<script id="id_table_courselist" type="text/html">    
	{{each data.courseList.list as value i}}
	<tr>
		<td>{{value.selectId}}</td>
	    <td>{{value.courseNum}}</td>
		<td>{{value.name}}</td>
		<td>{{value.maxStudent}}</td>
		<td>{{value.professor}}</td>
		<td>{{value.classroom}}</td>
	    <td>{{value.request}}</td>
		<td><a href="">查看</a></td>
		<td>{{value.type}}</td>
		<td>{{value.isOpen}}</td>
		<td>{{value.credit}}</td>
	    <td><a href="<%=request.getContextPath()%>/admin/updateCourse?id={{value.id}}">查看/修改时间</a>
	    	<a href="" onclick="deleteStudent('{{value.id}}')">修改</a>
	    	<a href="" onclick="deleteCourse('{{value.id}}')">删除</a>
		</td>
	{{/each}}
</script> 
<body>
<p align="center"><strong><font size="5">课程管理</font></strong></p>
<div>
<table width=100% align="center"　 style="padding-left:2%;">
	<tr>
		<td colspan="13"><a href="<%=request.getContextPath()%>/admin/addCourse"><font size="3">添加课程</font></a><br><br>
	<tr>
		<td colspan="13"><strong>课程信息</strong></td>
	</tr>
	<tr>
		<td>选课序号</td>
		<td>课程号</td>
		<td>名称</td>
		<td>最大学生数</td>
		<td>教师</td>
	  	<td>教室</td>
	  	<td>选课要求</td>
	  	<td>简介</td>	  	
	  	<td>类型</td>
	  	<td>是否开课</td>
	  	<td>学分</td>
	  	<td>操作</td>
	</tr>
	<tbody id="id_table_elist"> </tbody>
</table><br>
</div>

<div style="padding-left:2%;">
 <!-- 分页 -->
	<div class="page" id="pages"></div>
	<!-- 分页 -->
<br/><br/>

<h3>帮助提示</h3>
	<ol>
		<li>添加课程完成后，你需要在“课程管理”处选择“查看/修改时间操作”为课程添加上课时间
		<li>您可以在“课程管理”中点击“修改”对课程信息进行修改
		<li>“是否开课”指是否在选课手册显示 以及 让学生在选课系统对该课选课退课（1为开课，0为不开课）
	</ol>
</div>

</body>
</html>