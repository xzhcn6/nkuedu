<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/manage/showstudent.css">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">   
	$(function(){
		getStudentList(1);
     }); 
	function getStudentList(pageNo){
		var param = {};
		param.pageNo = pageNo;
        $.ajax({
            type:"POST",
            data:param,
            url:"<%=request.getContextPath()%>/admin/getStudentList",
			success : function(data) {
				if(data.stuList.list.length != 0){
					$("#id_table_elist").html(template('id_table_stulist', {data:data}));
				} else {
					$("#id_table_elist").html("<tr><td colspan='8'><center>暂无数据</center></td></tr>");
				}
				getPages(data.stuList);
			}
		});
	}
	// 分页	 
	function getPages(page){
		var div="";
		if (page.prePage == 0){
			div += "<a href='javascript://' class='not-active' onclick='getStudentList("+page.firstPage+")' style='color:#999999;padding-right:10px;'>< 前页</a>";
		} else {
			div += "<a href='javascript://' class='active' onclick='getStudentList("+page.prePage+")' style='padding-right:10px;'>< 前页</a>";
		}
		
		if(page.pages<10){
        	for (var i=1; i<=page.pages; i++){
        		if(page.pageNum==i){
			 		div+= "<a href='javascript://' onclick='getStudentList("+i+")' class='active' style='color:#999999;padding-right:10px;'>"+i+"</a>";
			 	}else{
			 		div+= "<a href='javascript://' onclick='getStudentList("+i+")' class='not-active' style='padding-right:10px;'>"+i+"</a>";
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
			 		div+= "<a href='javascript://' onclick='getStudentList("+i+")' class='active' style='padding-right:10px;'>"+i+"</a>";
			 	}else{
			 		div+= "<a href='javascript://' onclick='getStudentList("+i+")' class='not-active' style='color:#999999;padding-right:10px;'>"+i+"</a>";
			 	}
            }
            if (endpage < page.pages){
            	div+="<a href='javascript://' onclick='getStudentList("+page.nextPage+");' style='padding-right:10px;'>...</a>";
            }
        }
		if (page.nextPage == 0){
			div += "<a href='javascript://' class='not-active' onclick='getStudentList("+page.lastPage+")' style='color:#999999;padding-right:10px;'>后页 ></a>";
		} else {
			div += "<a href='javascript://' class='active' onclick='getStudentList("+page.nextPage+")' style='padding-right:10px;'>后页 ></a>";
		}
		$("#pages").html(div);
	}
	
	function deleteStudent(stuId){
		if (!confirm('确定删除？')) {
			return;
		} else {
			var param = {};
			param.id = stuId;
			$.ajax({
		           type:"POST",
		           data:param,
		           url:"<%=request.getContextPath()%>/admin/deleteStudent",
				success : function(data) {
					document.location.reload();
				}
			});
		}
	}
</script>
<script id="id_table_stulist" type="text/html">    
	{{each data.stuList.list as value i}}
	<tr>
		<td>{{i+1}}</td>
	    <td>{{value.studentNum}}</td>
		<td>{{value.name}}</td>
		<td>{{value.school}}</td>
		<td>{{value.telephone}}</td>
		<td>{{value.email}}</td>
	    <td>{{value.passwd}}</td>
	    <td><a href="<%=request.getContextPath()%>/admin/updateStudent?id={{value.id}}">修改</a>
	    	<a href="" onclick="deleteStudent('{{value.id}}')">删除</a>
	    	<a href="<%=request.getContextPath()%>/admin/showStudentCourse?studentId={{value.id}}">查询课程</a>
	</td>
	{{/each}}
</script> 
<body>
<p align="center"><strong><font size="5">学生管理</font></strong></p>

<table width=80% align="center">
	<tr>
		<td colspan="13"><strong>学生信息</strong></td>
	</tr>
	<tr>
		<td>序号</td>
		<td>学号</td>
		<td>姓名</td>
		<td>学校</td>
		<td>电话</td>
		<td>注册邮箱</td>
	  	<td>登录密码</td>
	  	<td>操作</td>
	  	
	</tr>
	<tbody id="id_table_elist"> </tbody>
	</table><br>
<div style="padding-left:10%;">
	<!-- 分页 -->
	<div class="page" id="pages"></div>
	<!-- 分页 -->

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