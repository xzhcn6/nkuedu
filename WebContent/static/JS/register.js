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

function checkIdentity_num(){
	var identity_num=document.getElementById("identity_num").value;
	if(identity_num==""){
		document.getElementById("c").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		//document.getElementById("c").innerHTML="请输入身份证号";
		return false;
	}else{
		var rex=/^[1-9][0-7]\d{4}/;
		if(!rex.test(identity_num)){
			document.getElementById("c").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			//document.getElementById("c").innerHTML="身份证号格式输入不合法，请重新输入";
			return false;
		}
		else{
			//document.getElementById("c").innerHTML="OK";
			document.getElementById("c").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return true;
		}
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
		//document.getElementById("d").innerHTML="请输入手机号";
		document.getElementById("d").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return false;
	}else{
//		if(!(/^1[3|4|5|8][0-9]\d{4,8}$/).test(phone)){
		if(!(/\d{7,11}/).test(phone)){
			//document.getElementById("d").innerHTML="手机号码格式不对，请重新输入";
			document.getElementById("d").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return false;
		}else{
			//document.getElementById("d").innerHTML="OK";
			document.getElementById("d").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return true;
		}
	}
}	
function checkPassword(){
	var password=document.getElementById("password").value;
	if(password==""){
		//document.getElementById("e").innerHTML="请输入密码";
		document.getElementById("e").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return false;
	}
	else{
		if(!(/\S{6}/).test(password)){
			//document.getElementById("e").innerHTML="密码长度不足六位，请重新输入";
			document.getElementById("e").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return false;
		}else{
			//document.getElementById("e").innerHTML="OK";
			document.getElementById("e").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return true;
		}
	}
}	
function checkRepassword(){
	var repassword=document.getElementById("repassword").value;
	var password=document.getElementById("password").value;
	if(repassword==""){
		//document.getElementById("f").innerHTML="请确认密码";
		document.getElementById("f").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
		return false;
	}else{
		if(repassword!=password){
			//document.getElementById("f").innerHTML="两次密码输入不一致，请重新输入";
			document.getElementById("f").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return false;
		}else{
			//document.getElementById("f").innerHTML="OK";
			document.getElementById("f").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return true;
		}
	}
}
function checkAll(){
	/*var input_cart=document.getElementsByTagName("INPUT");
	   var input_all=0;
	      for   (var   i=0;   i<input_cart.length;   i++)   {   
	          if   (input_cart[i].type=="text"   &&   input_cart[i].value!="")   {
	    
	              input_all=input_all+1;   
	           //alert(input_all);
	          }   
	      }
	   if (input_all<input_cart.length)
	   {
		   alert("请确认信息已填写完整");
		   return false;
	   }else*/{
		   if(!checkName()){
			   alert("请输入您的姓名");
			   return false;
		   }else if(!checkSchool()){
			   alert("请输入您的学校");
			   return false;
		   }else if(!checkEmail()){
			   alert("您的邮箱未填或格式有误");
			   return false;
		   }else if(!checkPhone()){
			   alert("您的电话号码未填或格式有误");
			   return false;
		   }else if(!checkPassword()){
			   alert("您的密码未填或长度不足六位");
			   return false;
		   }else if(!checkRepassword()){
			   alert("您两次输入的密码不一致");
			   return false;
		   }else{
			   return true;
		   }
	   }
}

function checkUpdate(){
		   var email=document.getElementById("email").value;
		   var rex=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		   var phone=document.getElementById("phone").value;
		   var rex2=/\d{7,11}/;
		   var password=document.getElementById("password").value;
		   if(document.getElementById("name").value==""){
			   alert("请输入姓名");
			   return false;
		   }else if(document.getElementById("school").value==""){
			   alert("请输入学校");
			   return false;
		   }else if(email==""||!rex.test(email)){
			   alert("邮箱地址未填或格式有误");
			   return false;
		   }else if(phone==""||!rex2.test(phone)){
			   alert("电话号码未填或格式有误");
			   return false;
		   }else if(password=""||!(/\S{6}/).test(password)){
			   alert("密码未填或长度不足六位");
			   return false;
		   }else{
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
