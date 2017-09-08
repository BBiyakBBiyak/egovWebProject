<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:include page="../../../../include/in_head.html"/> 
<title>Test BootStrap</title>
<jsp:include page="../../../../include/script/hScript.html"/> 
<script type="text/javascript">
/**
 * 새창을 데이터에 맞춰 resize
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
<body onload="newPopupResize()" style="padding: 10px; width: 100%">
	<div class="container">
	 	<div class="bg-faded p-4 my-4"  align="center">
			<hr class="divider">
	        <h2 class="text-center text-lg text-uppercase my-0"><strong>Comment Modify</strong></h2>
	        <hr class="divider">
	   		<form name="commBoard" method="post">
	   			<input type="hidden" name="unq" id="unq" value="${vo.unq}"/>
				<div class="form-group  col-lg-12" style="margin: 10px">
				<table class="table table-bordered" style="width: 70%;">
					<colgroup>
		    			<col width="150"/>
		    			<col width="?"/>
		   			</colgroup>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em"> Name</label></th>
				  		<td>
				  			<div class="form-group col-lg-6" id="div_title">
					  			<input type="text" name="writer" value="${vo.writer}" class="form-control" id="writer"/>
					  		</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em">password</label></th>
				  		<td>
				  			<div class="form-group col-lg-6" id="div_title">
					  			<input type="password" name="pwd" value="${vo.pwd}" class="form-control" id="pwd"/>
					  		</div>
				  		</td>
				  	</tr>
			  		<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em">content</label></th>
				  		<td>
				  			<div class="form-group col-lg-12" id="div_content">
				  				<input type="text" name="comm" value="${vo.comm}" class="form-control" id="comm"/>
				  			</div>
				  		</td>
				  	</tr>
				</table>
				</div>
				<div class="form-group col-lg-12">
					<div class="col-lg-3">
					<input type="button" onclick="fn_commModify()" class="text-heading btn btn-secondary" style="font-weight:bold;" value="modify">
					</div>
	            </div>	
			</form>
	    </div>
	</div>
</body>
</html>