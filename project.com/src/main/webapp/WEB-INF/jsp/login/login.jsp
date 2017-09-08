<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/ezen/structure.css'/>">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/ezen/reset.css'/>">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="/js/jquery-3.1.1.js"></script>
<script src="/js/jquery-ui.js"></script>
<script type="text/javaScript">

$( function() {
	$( '#loginAction' ).click( function () {
		//	var ppp = $("#login").serialize();
		var param = "uId="+$("#uId").val() + "&uPwd=" + $("#uPwd").val();

		$.ajax({
		 	type: "POST",
		 	data: param,
		 	url: "<c:url value='/loginProcess.do'/>",
		 	cache : false,
			async : false,
			dataType : "text",

		 	success: function (response) {
		 		if(response == '1') {
		 			location.href = "<c:url value='/loginpage.do'/>";
		 		} else {
		 			alert("아이디 또는 비밀번호가 일치하지 않습니다./n다시 입력해 주세요.");
		 		}
		 	},
		 	error: function (error) {
		 		alert("code : " + request.status + "\r\nmessage : "
						+ request.reponseText + "\r\nerror : " + error);
		 	}
 		});

	});
});


</script>
</head>
<body>

<div class="box login">
	<form id="login">
	<fieldset class="boxBody">
	  <label>Username</label>
	  <input type="text" id="uId" tabindex="1" placeholder="PremiumPixel" required>
	  <label><a href="#" class="rLink" tabindex="5">Forget your password?</a>Password</label>
	  <input type="password" id="uPwd" tabindex="2" required>
	</fieldset>
	<footer>
	  <label><input type="checkbox" tabindex="3">Keep me logged in</label>
	  <input type="button" class="btnLogin" value="Login" tabindex="4" id="loginAction">
	</footer>
	</form>
</div>
</body>
</html>



