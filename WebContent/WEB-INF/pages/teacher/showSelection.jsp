<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/teacher/check.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	getSelectionList(1);
	if('${sysStatus}'==1){
		$('#statYes').attr("checked","true");
		$('#statNo').removeAttr("checked");
	} else {
		$('#statNo').attr("checked","true");
		$('#statYes').removeAttr("checked");
	}
	$('#commitStatus').click(function(){
		commitStatus();
    });
	
	$('#onAllCoursecommit').click(function(){
		overAllCoursecommit(0);
    });
	$('#overAllCoursecommit').click(function(){
		overAllCoursecommit(1);
    });
}); 

function commitStatus(){
	var param = {};
	param.status = $("input[name='state']:checked").val();
	$.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/changeSystemStatus",
		success : function(data) {
			if (data.error != null){
				alert(data.error);
				document.location.reload();
			}
			if (data.msg != null){
				alert(data.msg);
				document.location.reload();
			}
		}
	});
}

function overAllCoursecommit(isOver){
	var param = {};
	param.isOver = isOver;
	$.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/overAllCourse",
		success : function(data) {
			if (data.error != null){
				alert(data.error);
				document.location.reload();
			}
			if (data.msg != null){
				alert(data.msg);
				document.location.reload();
			}
		}
	});
}

function getSelectionList(pageNo){
	var param = {};
	param.pageNo = pageNo;
    $.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/getSelectionByCourse",
		success : function(data) {
			if(data.selectionList.list.length != 0){
				$("#id_table_elist").html(template('id_table_selectionlist', {data:data}));
			} else {
				$("#id_table_elist").html("<tr><td colspan='8'><center>暂无数据</center></td></tr>");
			}
			getPages(data.selectionList);
		}
	});
}
// 分页	 
function getPages(page){
	var div="";
	if (page.prePage == 0){
		div += "<a href='javascript://' class='not-active' onclick='getSelectionList("+page.firstPage+")' style='color:#999999;padding-right:10px;'>< 前页</a>";
	} else {
		div += "<a href='javascript://' class='active' onclick='getSelectionList("+page.prePage+")' style='padding-right:10px;'>< 前页</a>";
	}
	
	if(page.pages<10){
    	for (var i=1; i<=page.pages; i++){
    		if(page.pageNum==i){
		 		div+= "<a href='javascript://' onclick='getSelectionList("+i+")' class='active' style='color:#999999;padding-right:10px;'>"+i+"</a>";
		 	}else{
		 		div+= "<a href='javascript://' onclick='getSelectionList("+i+")' class='not-active' style='padding-right:10px;'>"+i+"</a>";
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
		 		div+= "<a href='javascript://' onclick='getSelectionList("+i+")' class='active' style='padding-right:10px;'>"+i+"</a>";
		 	}else{
		 		div+= "<a href='javascript://' onclick='getSelectionList("+i+")' class='not-active' style='color:#999999;padding-right:10px;'>"+i+"</a>";
		 	}
        }
        if (endpage < page.pages){
        	div+="<a href='javascript://' onclick='getSelectionList("+page.nextPage+");' style='padding-right:10px;'>...</a>";
        }
    }
	if (page.nextPage == 0){
		div += "<a href='javascript://' class='not-active' onclick='getSelectionList("+page.lastPage+")' style='color:#999999;padding-right:10px;'>后页 ></a>";
	} else {
		div += "<a href='javascript://' class='active' onclick='getSelectionList("+page.nextPage+")' style='padding-right:10px;'>后页 ></a>";
	}
	$("#pages").html(div);
}

function overCourse(courseId,isOver){
	var param = {};
	param.courseId = courseId;
	if (isOver == 1){
		param.isOver = 0;	
	} else if (isOver == 0){
		param.isOver = 1;
	}
	$.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/overCourse",
		success : function(data) {
			if (data.error != null){
				alert(data.error);
				document.location.reload();
			}
			if (data.msg != null){
				alert(data.msg);
				document.location.reload();
			}
		}
	});
}

</script>
<script type="text/javascript">  
	/** 判断是否结课 */
	template.helper('isOver', function (isOver) {
		if (isOver == 1){
			return "当前状态：已结课；点击改为未结课";
		} else if (isOver == 0){
			return "当前状态：未结课；点击改为已结课";
		} else {
			return "数据库有误！";
		}
		
	});
</script>
<script id="id_table_selectionlist" type="text/html">    
	{{each data.selectionList.list as value i}}
	<tr>
		<td>{{value.selectId}}</td>
		<td>{{value.name}}</td>
		<td><a href="" onclick="overCourse('{{value.courseId}}',{{value.isOver}})">{{isOver value.isOver}}</a></td>
		<td><a href="<%=request.getContextPath()%>/admin/showSelectionDetial?courseId={{value.courseId}}">查看选课详情</a></td>
		<td><a href="">导出选课名单</a></td>
	</tr>
	{{/each}}
</script> 
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">选课管理</font></strong></p>
<div style="padding-left:10%;">
	<div style="float: left;">
		选课系统是否开放给学生选课：
		<input type="radio" name="state" value="1" id="statYes">是
		<input type="radio" name="state" value="0" id="statNo">否
		<input type="submit" value="提交" id="commitStatus">
	</div>
	
	<div style="float: left; padding-left: 80px;">
	一键置为结课/未结课：</div>
	<div style="float: left;">
		<input type="submit" id="overAllCoursecommit" value="全部置为结课">
		&nbsp;
	</div>
	<div style="float: left;">	
		<input type="submit" id="onAllCoursecommit" value="全部置为未结课">
	</div>
</div>
	<table width=80% align="center">
	<tr>
		<td>选课序号</td>
		<td>课程</td>
	  	<td>是否结束</td> 
	  	<td colspan="2">操&nbsp;&nbsp;&nbsp;&nbsp;作</td> 	
	</tr>
	<tbody id="id_table_elist"> </tbody>
	</table><br>
	<div style="padding-left:10%;">
    <!-- 分页 -->
	<div class="page" id="pages"></div>
	<!-- 分页 -->

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