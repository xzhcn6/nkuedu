function checkEmail(){
	var email=document.getElementById("email").value;
	if(email==""){
		return false;
	}
	else{
		if(!(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/).test(email)){
//			document.getElementById("a").innerHTML="<span id='errorhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return false;
		}else{
//			document.getElementById("a").innerHTML="<span id='OKhint'>&nbsp&nbsp&nbsp&nbsp</span>";
			return true;
		}
	}
}
function checkAll(){
	if(!checkEmail()){
		   alert("您的邮箱未填或格式有误");
		   return false;
	   }else{
		   return true;
	   }
}