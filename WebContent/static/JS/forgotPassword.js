
function checkEmail() {
	var email = $('#email').val();
	if (email == null || email == "") {
		return false;
	} else {
		if (!(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/).test(email)) {
			return false;
		} else {
			return true;
		}
	}
}

function checkCode(){
	var code = $('#code').val();
    if(code==null||code==""){
    	return false;
    } else {
    	return true;
    }
}

function checkAll() {
	if (!checkEmail()) {
		alert("您的邮箱未填或格式有误！");
		$('#email').focus();
		return false;
	}
	if (!checkCode()) {
		alert("请输入验证码！");
		$('#code').focus();
		return false;
	}
	return true;
}

function refresh(){
	document.location.reload();
}
