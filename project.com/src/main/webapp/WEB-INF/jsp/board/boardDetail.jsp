<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sy"		uri="tlds/pagination" %>
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

	function fn_action(value) {
		var b = document.board;		
		if (value == 'D') {
			// 비밀번호 체크후
			fn_getPassword(value);
			
		} else if (value == 'M') {
			// 수정페이지로 이동
			fn_getPassword(value);
	
		   	
		   	return;
		} else if (value =='R') {
			// 댓글작성
			
			b.action = "<c:url value='/boardWriteComm.do'/>";
		}
		b.submit();
	}
	var curAction;
	
	function fn_getPassword(value) {
		var url = "/BoardPwdCheck.do";
		var setting = "width=500,height=200,left=0,top=0";
					
		window.open( url, "post_popup", setting);
		curAction = value;
	}
	

	function deleteBoard(pwd) {
		$("#pwd").val(pwd);
		var params =  $("#board").serialize();
		
		$.ajax({
			type : 'POST',
			data : params,
			url : "<c:url value='/boardDelete.do'/>",
			dataType : "json",
			success : function(data) {
				if(data.result == "NotMatched") {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				else if(data.result == "fail") {
					alert("게시글을 삭제할 수 없습니다.");
					return;
				}
				else {
					// 성공
					alert("삭제되었습니다.");
					location.href = "<c:url value='/boardList.do'/>";
				}
			},
			error : function(error) {
				alert("에러가 발생했습니다.");
			}
		});
	}
	
	
	function modifyBoard(pwd) {
		$("#pwd").val(pwd);
		
		var params =  $("#board").serialize();
		
		$.ajax({
			type : 'POST',
			data : params,
			url : "<c:url value='/checkedPwd.do'/>",
			dataType : "json",
			success : function(data) {
				if(data.result == "NotMatched") {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				else {
					// 성공 수정페이지로 이동
					var b = document.board;
					
					b.action = "<c:url value='/boardModifyView.do'/>";
				   	b.method = 'post';
				   	b.submit();
				}
			},
			error : function(error) {
				alert("에러가 발생했습니다.");
			}
		});
	}


	
</script>
<style>
 .table-bordered td,.table-bordered th {
  	text-align: center;
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
			<h2 class="text-center text-lg text-uppercase my-0"><strong>Board Detail</strong></h2>
			<hr class="divider">
			<div class="formgroup col-lg-12" style="padding: 10px;" align="right" >
				<div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="/boardList.do" class="text-heading" style="color: white; font-weight:bold;">List</a>
				</div>	
				<div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="javascript:fn_action('R');" class="text-heading" style="color: white; font-weight:bold;">Reply</a>
				</div>
			    <div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="javascript:fn_action('M')" class="text-heading" style="color: white; font-weight:bold;">Modify</a>
				</div>
				<div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="javascript:fn_action('D');" class="text-heading" style="color: white; font-weight:bold;">Delete</a>
				</div>
			</div>
			<div class="form-group  col-lg-12">
			
			    <form name="board" id="board">
					<input type="hidden" id="unq" name="unq" value="${vo.unq}"/>
					<input type="hidden" id="pwd" name="pwd"/>
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
					</table>
				</form>
			</div>
		</div>
	</div>
    	
   	
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
   	<jsp:include page="../../../include/script/fScript.html"/> 

</body>

</html>

