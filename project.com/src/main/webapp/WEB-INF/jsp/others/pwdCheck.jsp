<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
<script src="/js/jquery-2.2.2.js"></script>
<script src="/js/jquery-ui.js"></script>
<script type="text/javascript">

//초기값 세팅
window.onload = function(){
	
	 var actionType = window.opener.actionType;
	 var commUnq = window.opener.commUnq;
	 document.getElementById('actionType').value = actionType;
	 document.getElementById('unq').value = commUnq;
};
	 

// 비밀번호 체크
$( function() {
	$("#pwdCheck").click(function(){
		var params = "unq="+ $("#unq").val() + "&pwd=" + $("#pwd").val() ;

		$.ajax({
		 	type: 'POST',
		 	data: params,
		 	url: "<c:url value='/checkPwd.do'/>",
		 	dataType: "json",
		 	success: function (data) {
		 		if(data.result == "success") {
		 			// alert("성공");
		 			if ( $("#actionType").val() == 'M' ) {		 				
		 				go_modify();
		 				return;
		 				// window.opener.fn_commModify($("#commUnq").val());
		 			}
		 			else if ( $("#actionType").val() == 'D')
		 				window.close();
		 				window.opener.commDelete($("#unq").val());
		 			
		 		} else {
		 			alert("비밀번호가 일치하지 않습니다.");
		 		}
		 	},
		 	error: function (error) {
		 		alert("에러 : " + error);
		 	}
 		});
	});
	
});

function go_modify() {
	document.formPwd.action = "<c:url value='/boardEModifyComm.do'/>";
	document.formPwd.submit();
}


</script>
</head>
<body>
<span style="font-size:1em; color: blue;">
댓글 작성시 입력한 비밀번호를 입력해주세요.
</span>
<p/>
<form name="formPwd" method="post">
	<input type="hidden" name="actinType" id="actionType"/>
	<input type="hidden" name="unq" id="unq"/>
	<input type="password" name="pwd" id="pwd"/>
	<input type="button" id="pwdCheck" value="비밀번호확인" />
</form>
</body>
</html>