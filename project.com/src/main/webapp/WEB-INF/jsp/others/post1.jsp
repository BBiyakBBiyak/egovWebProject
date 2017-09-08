<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fn_action() {
	var f = document.post;
	
	if(f.dong.value == "") {
		opener.alert("동(읍/리)를 입력해주세요.");
		return;
	}
	
	f.action = "<c:url value='/postSelect.do'/>";
	f.submit();
}
</script>
</head>
<body>
<form name="post">
<table>
	<tr>
		<td>동(면/리)입력:<input type="text" name="dong"></td>
		<td><input type="button" value="우편번호검색" onClick="fn_action()"></td>
	</tr>
</table>
</form>
</body>
</html>