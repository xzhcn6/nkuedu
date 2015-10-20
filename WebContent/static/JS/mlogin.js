
function checkName(){
	var adminname = $('#adminName').val();
	if (adminname == null || adminname == "") {
		return false;
	}
	return true;
}

function checkPasswd(){
	var password = $('#password').val();
	if (password == null || password == "") {
		return false;
	}
	return true;
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
		alert("请输入账户！");
		$('#adminName').focus();
		return false;
	}
	if (!checkPasswd()) {
		alert("请输入密码！");
		$('#password').focus();
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
