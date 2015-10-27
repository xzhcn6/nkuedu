
function jsmethod(){
        document.getElementById("name").focus(); 
}

function checkName(){
	var name=document.getElementById("name").value;
	if(name==""){
		document.getElementById("a").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return false;
	}
	else{
		document.getElementById("a").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return true;
	}
}
function checkSchool(){
	var school=document.getElementById("school").value;
	if(school==""){
		document.getElementById("b").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return false;
		//document.getElementById("b").innerHTML="请输入所在学校";
	}else{
		//document.getElementById("b").innerHTML="OK";
		document.getElementById("b").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return true;
	}
}

function checkEmail(){
	var email=document.getElementById("email").value;
	if(email==""){
		document.getElementById("c").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return false;
	}
	else{
		if(!(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/).test(email)){
			document.getElementById("c").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return false;
		}else{
			document.getElementById("c").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return true;
		}
	}
}
function checkPhone(){
	var phone=document.getElementById("phone").value;
	if(phone==""){
		document.getElementById("d").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return false;
	}else{
		if(!(/\d{7,11}/).test(phone)){
			document.getElementById("d").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return false;
		}else{
			document.getElementById("d").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return true;
		}
	}
}	
function checkPassword(){
	var password=document.getElementById("password").value;
	if(password==""){
		document.getElementById("e").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return false;
	}
	else{
		if(!(/\S{6}/).test(password)){
			document.getElementById("e").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return false;
		}else{
			document.getElementById("e").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return true;
		}
	}
}

function checkCode(){
	var code = $('#code').val();
    if(code==null||code==""){
    	return false;
    }
    return true;
}

function checkAll() {
	if (!checkName()) {
		alert("请输入您的姓名");
		return false;
	} else if (!checkSchool()) {
		alert("请输入您的学校");
		return false;
	} else if (!checkEmail()) {
		alert("您的邮箱未填或格式有误");
		return false;
	} else if (!checkPhone()) {
		alert("您的电话号码未填或格式有误");
		return false;
	} else if (!checkPassword()) {
		alert("您的密码未填或长度不足六位");
		return false;
	} else if (!checkCode()){
		alert("请输入验证码");
		return false;
	} else {
		return true;
	}
}

function reset1(){
	document.getElementById("a").innerHTML="*";
	document.getElementById("b").innerHTML="*";
	document.getElementById("c").innerHTML="*";
	document.getElementById("d").innerHTML="*";
	document.getElementById("e").innerHTML="*";
	document.getElementById("f").innerHTML="*";
	document.forms[0].reset();
	return true;
}
