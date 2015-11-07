function checkCourse(){
	if(document.getElementById("courseNum").value==""){
		alert("请输入课程号");
		return false;
	}
	else if(document.getElementById("name").value==""){
		alert("请输入课程名称");
		return false;
	}
	else if(document.getElementById("maxStudent").value==""){
		alert("请输入最大学生数");
		return false;
	}
	else if(document.getElementById("professor").value==""){
		alert("请输入教师");
		return false;
	}
	else if(document.getElementById("classroom").value==""){
		alert("请输入教室");
		return false;
	}
	else if(document.getElementById("introduction").value==""){
		alert("请输入简介");
		return false;
	}
	else if(document.getElementById("type").value==""){
		alert("请输入类型");
		return false;
	}
	else if(document.getElementById("isOpen").value==""){
		alert("请输入是否开课");
		return false;
	}
	else if(document.getElementById("credit").value==""){
		alert("请输入学分");
		return false;
	}
	else return true;
}
function checkTime(){
	if(document.getElementById("courseDay").value==""){
		alert("请输入开课周次");
		return false;
	}else if(document.getElementById("courseDay").value>7||document.getElementById("courseDay").value<1){
		alert("输入的开课周次不合法");
		return false;
	}
	if(document.getElementById("startTime").value==""){
		alert("请输入开始时间");
		return false;
	}else if(document.getElementById("startTime").value>12||document.getElementById("startTime").value<1){
		alert("输入的开始时间不合法");
		return false;
	}
	if(document.getElementById("endTime").value==""){
		alert("请输入结束时间");
		return false;
	}else if(document.getElementById("endTime").value>12||document.getElementById("endTime").value<document.getElementById("startTime").value){
		alert("输入的结束时间不合法");
		return false;
	}
	return true;
}