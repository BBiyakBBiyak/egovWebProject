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

//�ʱⰪ ����
window.onload = function(){
	
	 var actionType = window.opener.actionType;
	 var commUnq = window.opener.commUnq;
	 document.getElementById('actionType').value = actionType;
	 document.getElementById('unq').value = commUnq;
};
	 

// ��й�ȣ üũ
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
		 			// alert("����");
		 			if ( $("#actionType").val() == 'M' ) {		 				
		 				go_modify();
		 				return;
		 				// window.opener.fn_commModify($("#commUnq").val());
		 			}
		 			else if ( $("#actionType").val() == 'D')
		 				window.close();
		 				window.opener.commDelete($("#unq").val());
		 			
		 		} else {
		 			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		 		}
		 	},
		 	error: function (error) {
		 		alert("���� : " + error);
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
��� �ۼ��� �Է��� ��й�ȣ�� �Է����ּ���.
</span>
<p/>
<form name="formPwd" method="post">
	<input type="hidden" name="actinType" id="actionType"/>
	<input type="hidden" name="unq" id="unq"/>
	<input type="password" name="pwd" id="pwd"/>
	<input type="button" id="pwdCheck" value="��й�ȣȮ��" />
</form>
</body>
</html>