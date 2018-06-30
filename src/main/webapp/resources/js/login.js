$(function(){
})

function loginSuccess(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var verification = document.getElementById("verification").value;
	console.log(username);
	console.log(password);
	if(username==null || username==""){
		alert("请输入您的用户名！");
	}else if(password == null ||password==""){
		alert("请输入您的密码！");
	}else if(verification == null || verification==""){
		alert("请输入验证码！");
	}else{
		$("form:first").submit();
	}
}

function MM_swapImage(srcObj,image_src){
	srcObj.src=image_src;
}