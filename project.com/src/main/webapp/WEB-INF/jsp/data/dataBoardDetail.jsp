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
<script type="text/javaScript">

function fn_action(value) {
	if(value == 'M') {
		var url = "dataBoardModify.do?unq=" + $("#unq").val();
	   	location.href = "<c:url value='" + url + "'/>";
	}
	
	else if(value == 'D') {
		document.frm.action = "<c:url value='/dataBoardDelete.do'/>";
		document.frm.submit();
	}

}

</script>

<style type="text/css">
  .table-bordered th {
  	text-align: center;
  	font-weight: normal;
 }
 .table-bordered td {
 	padding-left: 2em;
 }
 .form-group {
 	padding: 0;
 	margin: 0;
 }
</style>
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
		            		<a class="nav-link text-uppercase text-expanded" href="/login.do?unq=${vo.unq}">로그인</a> </li>
		  				</c:when>
		  				<c:otherwise>
		      				<li class="nav-item px-lg-4">
		            		<a class="nav-link text-uppercase text-expanded" href="#">마이페이지</a></li>
						<li class="nav-item px-lg-4">
		            		<a class="nav-link text-uppercase text-expanded" href="/logout.do?unq=${vo.unq}">로그아웃</a>
		  				</c:otherwise>
				</c:choose>
		        <li class="nav-item px-lg-4">
		            <a class="nav-link text-uppercase text-expanded  active" href="/dataBoardList.do">자료실</a>
		        </li>
		        <li class="nav-item px-lg-4">
		            <a class="nav-link text-uppercase text-expanded" href="/surveyWrite.do">설문조사</a>
		        </li>
		        
		    </ul>
		</div>
	</nav> 
    <div class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">Main Title</div>
    <div class="tagline-lower text-center text-expanded text-shadow text-uppercase text-white mb-5 d-none d-lg-block">Sub Title</div>
    <div class="container">
    	
   		<div class="bg-faded p-4 my-4" align="center">
            <hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0"><strong>Data Board</strong></h2>
            <hr class="divider">
            <div class="formgroup col-lg-12" style="padding: 10px;" align="right" >
				<div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="/dataBoardList.do" class="text-heading" style="color: white; font-weight:bold;">List</a>
				</div>
				<div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="javascript:fn_action('M');" class="text-heading" style="color: white; font-weight:bold;">Modify</a>
				</div>
				<div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="javascript:fn_action('D');" class="text-heading" style="color: white; font-weight:bold;">Delete</a>
				</div>
        	</div>
        	
            <form name="frm" id="frm">
            	<input type="hidden" name="unq" id="unq" value="${vo.unq}">
                <div class="form-group  col-lg-12" style="margin: 10px">
				<table class="table table-bordered" style="width: 70%;">
					<colgroup>
		    			<col width="150"/>
		    			<col width="?"/>
	    			</colgroup>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em;">Title</label></th>
				  		<td>
					  		<div class="form-group colum" id="div_title">
					  			<c:out value="${vo.title}"/>
					  		</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em"> Name</label></th>
				  		<td>
				  			<div class="form-group" id="div_name">
				  				<c:out value="${vo.name}"/>
				  			</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em">content</label></th>
				  		<td>
				  			<div class="form-group" id="div_content">
				  				<c:out value="${vo.content}"/>
				  			</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em">file</label></th>
				  		<td>
							<c:set var="file" value="${fn:split(vo.filename,'／')}" />
							<c:forEach var="fileName" items="${file}" varStatus="g">
								<c:choose>
									<c:when test="${fileName != ''}">
										<div>
											<a onclick="window.open(encodeURI('<c:url value='/downloadFile.do?'/>requestedFile=${fileName}'))">
											<i class="fa fa-download" style="color:green" aria-label="${fileName}"></i></a>
											<font style="font-size: 10pt"><c:out value="${fileName}"/></font>
										</div>
									</c:when>
									<c:otherwise>
										<font style="font-size: 10pt">저장된 파일이 없습니다.</font>
									</c:otherwise> 
								</c:choose>	      
							</c:forEach> 
						</td>
					</tr>
				</table>
			 	
			</div>
            </form>
        </div>
   	</div>
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
   	<jsp:include page="../../../include/script/fScript.html"/> 

</body>

</html>

