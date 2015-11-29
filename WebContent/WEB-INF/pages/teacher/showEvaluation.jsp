<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	getSelectionList(1);
}); 
function getSelectionList(pageNo){
	var param = {};
	param.pageNo = pageNo;
    $.ajax({
        type:"POST",
        data:param,
        url:"<%=request.getContextPath()%>/admin/getEvaluationByCourse",
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

</script>
<script type="text/javascript">  
	/** 判断是否开课 */
	template.helper('isOver', function (isOver) {
		if (isOver == 1){
			return "是";
		} else {
			return "否";
		}
		
	});
</script>
<script id="id_table_selectionlist" type="text/html">    
	{{each data.selectionList.list as value i}}
	<tr>
		<td style="text-align:center;">{{value.selectId}}</td>
		<td>{{value.name}}</td>
		<td>{{isOver value.isOver}}</td>
		<td><a href="<%=request.getContextPath()%>/admin/showEvaluationDetial?courseId={{value.courseId}}">查看评教详情</a></td>
	</tr>
	{{/each}}
</script> 
</head>
<body style="FONT-SIZE: 11pt; COLOR: black;	FONT-FAMILY: Arial, Geneva, Helvetica, sans-serif;">
<p align="center"><strong><font size="5">评教管理</font></strong></p>
<div style="height:300px;">
	<table width=80% align="center">
	<tr>
		<td style="text-align:center;">选课序号</td>
		<td>课程</td>
	  	<td>是否结课</td> 
	  	<td>操作</td> 	
	</tr>
	<tbody id="id_table_elist"></tbody>
	</table><br>
</div>
	
<div style="padding-left:15%;">
<!-- 分页 -->
<div class="page" id="pages"></div>
<!-- 分页 -->
	<h3>帮助提示</h3>
	<ol>
		<li>该页面显示所有课程中有学生选课的课程
		<li>学生可以在学生登录界面对结课状态为“已结课”的课进行评价，评价之后学生即可看到其在该门课的成绩
		<li>点击“查看评教详情”可以查看课程评教的状况
	</ol>
	</div>
</body>
</html>