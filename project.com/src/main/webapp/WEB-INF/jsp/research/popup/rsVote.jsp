<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>

</head>
<body>
	<div class="table">
		<table class="table table-bordered">
			<tr>
				<td>
					${title}
				</td>
			</tr>
			<c:forEach var="list" items="${subList}">
				<tr>
					<td>
						<label class="custom-control custom-radio">
						<input id="radio1" name="comm" type="radio" value="${list.scd}" class="custom-control-input">
						<span class="custom-control-indicator"></span>
						<span class="custom-control-description">${list.comm}</span>
						</label>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>