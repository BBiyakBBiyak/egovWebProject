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
function fn_commModify () {
	var data = "unq=" + $("#unq").val()
		+ "&comm="+ $("#comm").val()
		+ "&writer=" +  $("#writer").val()
		+ "&pwd=" +  $("#pwd").val(); 
	
	window.close();
	window.opener.fn_commModify(data);
}
</script>
</head>
<body style="padding: 10px; width: 100%">
	<div id="title" style="width: 90%;">
	<ul>
		<li>
			<img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/> Comment Modify
       	</li>
	</ul>
	<span class="btn_blue_l" style="float:right; margin: 5px;">
		<a href="javascript:fn_commModify();">Modify</a>
		<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" alt=""/>
    </span>
    </div>
    <input type="hidden" name="unq" id="unq" value="${vo.unq}"/>
	<div id="table" style="width: 90%">
	<form name="commBoard" method="post">
		<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 1px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
			<colgroup>
    			<col width="60"/>	
    			<col width="?"/>	
    			<col width="80"/>
    			<col width="?"/>		
    			<col width="60"/>
    			<col width="?"/>		
			</colgroup>
			<tr>
				<td class="tbtd_caption">이름</td>
				<td class="tbtd_content"><input type="text" name="writer" id="writer" value="${vo.writer}"/></td>
				<td class="tbtd_caption">비밀번호</td>
				<td class="tbtd_content">
					<input type="password" name="pwd" id="pwd" value="${vo.pwd}"/>
				</td>
			</tr>
			<tr>	
				<td class="tbtd_caption">댓글</td>
				<td class="tbtd_content" colspan="3">
            	 	<input type="text" name="comm" id="comm" value="${vo.comm}" style="width:90%"/>
            	</td>
            </tr>
		</table>
	</form>
	</div>
</body>
</html>