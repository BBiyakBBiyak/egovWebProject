<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<title>Insert title here</title>
<script src="/js/jquery-3.1.1.js"></script>
<script src="/js/jquery-ui.js"></script>
<script type="text/javascript">
/**
 * popup resize
 */
function newPopupResize() {
	var dWidth = parseInt(document.body.scrollWidth);
	var dHeight = parseInt(document.body.scrollHeight);
	
	var divEl = document.createElement('div');
	divEl.style.left = '0px';
	divEl.style.top = '0px';
	divEl.style.width = '100%';
	divEl.style.height = '100%';
	
	document.body.appendChild(divEl);
	
	window.resizeBy(dWidth-divEl.offsetWidth, dHeight - divEl.offsetHeight);
	document.body.removeChild(divEl);
}

$(function (){
	$("#post").change(function() {
		var selAddr = document.post.addr.value;
		
		var address = selAddr.split(" ");
		var result = "";
			
		for(var i = 1; i < address.length; i++) {
			result += address[i];
			if(i+1 != address.length) {
				result += " ";
			}
		}
		
		var postnum = opener.document.getElementById('postnum') ;
		var addr1 = opener.document.getElementById('addr1') ;
		
		postnum.readOnly = true;
		postnum.disabled = false;
		postnum.value = address[0];
	
		addr1.readOnly = true;
		addr1.disabled = false;
		addr1.value = result
		
		window.close();
	});
});
</script>
</head>
<body>
	<form name="post">
		<table>
			<tr>
				<td>
					<select name="addr" id="post">
						<option value="">주소를 선택해 주세요.</option>
						<c:forEach var="list" items="${postList}" varStatus="status">
							<c:set var="postnum" value="${list.postnum}"/>
							<c:set var="addr" value="${list.sido} ${list.sigun} ${list.dong} ${list.ri} ${list.bunji} ${list.other}"/>
							<option value='<c:out value="${postnum} ${addr}"/>'><c:out value="${postnum} ${addr}"/></option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>