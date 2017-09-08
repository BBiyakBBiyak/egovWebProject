<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>popup PwdCheck</title>
<script type="text/javascript">
var actionType; 
window.onload = function(){	
	actionType = window.opener.curAction;
}

function sendPwd() {
	var inputPwd = document.formPwd.pwd.value;
	
	if(actionType == 'D') {
		window.opener.deleteBoard(inputPwd);
	}
	else {
		window.opener.modifyBoard(inputPwd);
	}
	self.close();
	
}
</script>
</head>
<body>
<span style="font-size:1em; color: blue;">
게시글 작성시 입력한 비밀번호를 입력해주세요.
</span>
<p/>
<form name="formPwd">
	<input type="password" name="pwd" id="pwd"/>
	<input type="button" value="비밀번호확인" onclick="sendPwd()" />
</form>
</body>
</html>