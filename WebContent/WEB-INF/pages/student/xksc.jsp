<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" style="text/html" href="<%=request.getContextPath()%>/static/CSS/manage/course.css">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/static/JS/template.js"></script>
<title>选课手册</title>
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
            url:"<%=request.getContextPath()%>/student/getCourseList",
			success : function(data) {
				if(data.courseList.length != 0){
					$("#id_table_elist").html(template('id_table_courselist', {data:data}));
				} else {
					$("#id_table_elist").html("<tr><td colspan='8'><center>暂无数据</center></td></tr>");
				}
				getPages(data.page);
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
	
</script>
<script type="text/javascript">  
	/** 判断是否开课 */
	template.helper('tabcolor', function (i) {
		if(i%2==1){
			return '#cccccc';
		} else {
			return;
		}
	});
</script>
<script id="id_table_courselist" type="text/html">    
	{{each data.courseList as value i}}
	<tr bgcolor='{{tabcolor i}}'>
		<td>{{value.selectId}}</td>
		<td>{{value.name}}</td>
		<td><a href="<%=request.getContextPath()%>/student/showCourseIntro?name={{value.name}}&introduction={{value.introduction}}">查看</a></td>
		<td>{{value.request}}</td>
		<td>{{value.maxStudent}}</td>
		<td>{{value.maxStudent}}</td>
		<td>{{value.professor}}</td>
		<td>{{value.classroom}}</td>
	    <td>{{value.maxStudent}}</td>
		<td>{{value.maxStudent}}</td>
		<td>{{value.maxStudent}}</td>
		<td>{{value.type}}</td>
		<td>{{value.credit}}</td>
	</tr>
	{{/each}}
</script> 
<body  style="font-family:微软雅黑;">
<table  width=85% height=50% align="center" >
    <tr align="center" ><td colspan="13">
    <strong><h3>南开大学<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy" />年度夏季学期高中生选课手册 </h3></strong>
    </td>
    </tr>
	<tr bgcolor=#eeeeee>
		<td>选课序号</td>
		<td>名称</td>
		<td>简介</td>
		<td>选课要求</td>
		<td>限选学生数</td>
		<td>已选人数</td>
		<td>授课教师</td>
	  	<td>教室</td>
	  	<td>开课时间</td>
	  	<td>开始节次</td>
	  	<td>结束节次</td>
	  	<td>类型</td>	
	  	<td>学分</td>
	</tr>
	<tbody id="id_table_elist"> </tbody>
</table><br>
<div style="padding:auto;padding-left:10%;padding-bottom:1%;">

<!-- 分页 -->
<div class="page" id="pages"></div>
<!-- 分页 -->

<br><br>
	<strong>注意：</strong>
	<ol>
		<li>如需选课，请在选课系统选课输入框内输入课程的选课序号</li>
		<li>开课时间指该课每周上课的时间，如数字“5”表示周五上课</li>
		<li>开始节次和结束节次指该课每天开始上课和下课的时间，如数字“2”代表第二节课，每节课具体代表时间为：<br>第一节：8：00-8：45；第二节：8：55-9：40；
		第三节：10：00-10：45；第四节：10：55-11：40；<br>第五节：14：00-14：45；第六节：14：55-15：40；
		第七节：16：00-16：45；第八节：16：55-17：40；<br>第九节：18：30-19：15；第十节：19：25-20：10；
		第十一节：20：20-21：05；第十二节：21：15-22：00</li>
	</ol>
</div>
</body>
</html>
