<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<jsp:include page="../../../include/in_head.html"/> 
<title>Board</title>
<jsp:include page="../../../include/script/hScript.html"/> 

<style type="text/css">
 .table {
 	border: 1px solid #e9ecef
 }
 .table td,.table th {
 	padding: .75rem;
 	vertical-align: middle;
 	border-top: 0px;
 }
 .table th {
 	border-right: 1px solid #e9ecef;
 	text-align: center;
 }
 .form-group {
 	padding-bottom: 0px;
 	margin-bottom: 0px;
 }
</style>

<script type="text/javascript">
$( function() {
	$('.datepicker').datepicker({
	});
});

function fn_submit() {
	document.frm.method = 'POST';
	document.frm.action = '<c:url value="/surveySave.do"/>';
	document.frm.submit();
}
</script>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-lg-4">
		<a class="navbar-brand text-uppercase text-expanded  font-weight-bold d-lg-none" href="/main.do">Home</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			</button>
		<div class="collapse navbar-collapse font-weight-bold" id="navbarResponsive" >
		    <ul class="navbar-nav mx-auto">
		        <li class="nav-item px-lg-4">
		            <a class="nav-link text-uppercase text-expanded" href="/main.do">HOME </a>
		        </li>
		        <li class="nav-item px-lg-4">
		            <a class="nav-link text-uppercase text-expanded" href="/notice.do">공지사항</a>
		        </li>
		        <li class="nav-item px-lg-4">
		            <a class="nav-link text-uppercase text-expanded" href="/boardList.do">BOARD</a>
		        </li>
		        <li class="nav-item px-lg-4">
		            <a class="nav-link text-uppercase text-expanded" href="/boardEList.do">REBOARD</a>
		        </li>
		        <c:choose>
			 		<c:when test="${session.id == null}">
				 		<li class="nav-item px-lg-4">
		            		<a class="nav-link text-uppercase text-expanded" href="/mRegister.do">회원가입</a> </li>
						<li class="nav-item px-lg-4">
		            		<a class="nav-link text-uppercase text-expanded" href="/login.do">로그인</a> </li>
		  				</c:when>
		  				<c:otherwise>
		      				<li class="nav-item px-lg-4">
		            		<a class="nav-link text-uppercase text-expanded" href="#">마이페이지</a></li>
						<li class="nav-item px-lg-4">
		            		<a class="nav-link text-uppercase text-expanded" href="/logout.do">로그아웃</a>
		  				</c:otherwise>
				</c:choose>
		        <li class="nav-item px-lg-4">
		            <a class="nav-link text-uppercase text-expanded" href="/dataBoardList.do">자료실</a>
		        </li>
		        <li class="nav-item px-lg-4">
		            <a class="nav-link text-uppercase text-expanded active" href="/surveyWrite.do">설문조사</a>
		        </li>
		    </ul>
		</div>
	</nav> 
	
    <div class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">Main Title</div>
    <div class="tagline-lower text-center text-expanded text-shadow text-uppercase text-white mb-5 d-none d-lg-block">Sub Title</div>

    <div class="container">  	
   		<div class="bg-faded p-4 my-4" align="center">
   		 	<hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0"><strong>설문조사 등록</strong></h2>
            <hr class="divider">
            <div class="col-lg-12" style="padding: 10px" align="right">
				<a href="/surveyList.do" class="text-heading btn btn-secondary col-lg-2" style="color: white; font-weight:bold;">List</a>
        	</div>
            <form name="frm" id="frm" method="post" enctype="multipart/form-data">
                <div class="form-group" align="center" style="margin: 10px">
				<table class="table" style="width: 70%;">
	    			<tr style="border-bottom: 1px solid #e9ecef">
				  		<th><label style="font-size: 1em; margin: 0.5rem">설문제목</label></th>
				  		<td>
					  		<div class="form-group" id="div_title">
					  			<input type="text" name="title" class="form-control col-lg-12" id="title"/>
					  		</div>
				  		</td>
				  	</tr>
				  	<tr style="border-bottom: 1px solid #e9ecef">
				  		<th><label style="font-size: 1em">항목</label></th>
				  		<td>
				  				<c:forEach var="i" begin="1" end="10" step="1">
				  				<div class="form-group row" style="padding: 0.25rem">
					  				<label for="example-text-input" class="col-1 col-form-label">${i}.</label>
	 								<div class="col-11">
					  					<input type="text" name="comm" class="form-control col-lg-12" id="comm+${i}">	
					  				</div>	
				  				</div>		
				  				</c:forEach>
				  		</td>
				  	</tr>
				  	<tr>
				  		<th><label style="font-size: 1em">기간</label></th>
				  		<td>
					  		<div class="form-group row">
				  				<label for="example-text-input" class="col-1 col-form-label">start</label>
 								<div class="col-4">
				  					<input type="text" name="sdate" class="form-control col-lg-12" data-provide="datepicker" data-date-format="yyyy-mm-dd">	
				  				</div>	
				  				<label for="example-text-input" class="col-1 col-form-label">end</label>
 								<div class="col-4">
				  					<input type="text" name="edate" class="form-control col-lg-12" data-provide="datepicker" data-date-format="yyyy-mm-dd">	
				  				</div>
				  			</div>
				  			<div style="margin-top: 1rem">
				  				<label class="custom-control custom-radio">
								<input id="radio1" name="use" type="radio" value="Y" class="custom-control-input">
								<span class="custom-control-indicator"></span>
								<span class="custom-control-description">노출</span>
								</label>
								<label class="custom-control custom-radio">
								<input id="radio2" name="use" type="radio" value="N" class="custom-control-input">
								<span class="custom-control-indicator"></span>
								<span class="custom-control-description">숨김</span>
								</label>
				  			</div>
				  		</td>
				  	</tr>
				</table>
				<input type="button" onclick="fn_submit()" class="btn btn-secondary col-lg-2" value="submit">
				</div>
			</form>
  		</div>
  	</div>
	<!-- /.container -->

    <!-- Bootstrap core JavaScript -->
   	<jsp:include page="../../../include/script/fScript.html"/> 
</body>

</html>

