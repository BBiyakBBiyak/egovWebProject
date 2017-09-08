<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<jsp:include page="../../../include/in_head.html"/> 

<title>Board</title>
<jsp:include page="../../../include/script/hScript.html"/> 

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

<script type="text/javaScript">
function fn_action(actionValue) {
	var b = document.board;
	if (actionValue == 'S') {
		if(b.title.value == "") {
			alert("제목을 입력해주세요");
			b.title.focus();
			return;
		}
		if(b.name.value == "") {
			alert("이름을 입력해주세요.");
			b.name.focus();
			return;
		}
		if(b.pwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			b.pwd.focus();
			return;
		} 
		if(b.content.value == "") {
			alert("내용을 입력해주세요.");
			b.content.focus();
			return;
		}
		b.action = "<c:url value='/boardEUpdate.do'/>";	
	}
	
	if (actionValue == 'L') {
		location.href = "<c:url value='/boardEList.do'/>";
		return;
	}
	
	b.submit();
}

function fn_load() {
	//  수정or삭제 버튼 클릭 후 비밀번호 불일치시 Controller에서 message받아 처리함
	if("${message}" != "")
		alert("${message}");
}
</script>

</head>

<body onload="fn_load()">
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
		            <a class="nav-link text-uppercase text-expanded active" href="/boardList.do">BOARD</a>
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
		            <a class="nav-link text-uppercase text-expanded" href="/rsurveyWritedo.do">설문조사</a>
		        </li>
		    </ul>
		</div>
	</nav> 
	
    <div class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">Main Title</div>
    <div class="tagline-lower text-center text-expanded text-shadow text-uppercase text-white mb-5 d-none d-lg-block">Sub Title</div>

    <div class="container">
   		<div class="bg-faded p-4 my-4"  align="center">
   			<hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0"><strong>Board Modify</strong></h2>
            <hr class="divider">
	    	<div class="col-lg-12" style="padding: 10px;" align="right" >
				<div class="col-lg-2">
				<input type="button" class="text-heading btn btn-secondary col-lg-12" style="font-weight:bold; padding-right: 1rem" value="List" onclick="fn_action('L')">
				</div>
       		</div>
	    	<form name="board" method="post">
				<input type="hidden" name="unq" value="${vo.unq}"/>
				<div class="form-group  col-lg-12" style="margin: 10px">
				<table class="table table-bordered" style="width: 70%;">
					<colgroup>
		    			<col width="150"/>
		    			<col width="?"/>
	    			</colgroup>
					<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em;">Title</label></th>
				  		<td>
					  		<div class="form-group col-lg-12" id="div_title">
					  			<input type="text" name="title" value="${vo.title}" class="form-control " id="title"/>
					  		</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em"> Name</label></th>
				  		<td>
				  			<div class="form-group col-lg-6" id="div_title">
					  			<input type="text" name="name" value="${vo.name}" class="form-control" id="name"/>
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
				  				<textarea name="content" class="form-control" rows="5"  style="width:99%"> ${vo.content} </textarea>
				  			</div>
				  		</td>
				  	</tr>
				</table>
				</div>
				<div class="form-group col-lg-12">
					<div class="col-lg-3">
					<input type="button" onclick="fn_action('S')" class="text-heading btn btn-secondary col-lg-12" style="font-weight:bold;" value="modify">
					</div>
                </div>	
			</form>
	    </div>
    	
   	</div>
    <!-- /.container -->
    
    <!-- Bootstrap core JavaScript -->
   	<jsp:include page="../../../include/script/fScript.html"/> 

</body>

</html>