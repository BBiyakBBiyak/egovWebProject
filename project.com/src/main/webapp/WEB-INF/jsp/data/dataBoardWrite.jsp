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
 .table td,.table th {
 	padding: .75rem;
 	vertical-align: top;
 	border-top: 0px;
 	border-bottom: 1px solid #e9ecef
 }
</style>
<script type="text/javaScript">
$(document).ready(function(){ 
	var fileTarget = $('.filebox .upload-hidden'); 
	fileTarget.on('change', function(){ // 값이 변경되면 
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name; } 
		else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); 
		// 파일명만 추출 
		} 
	// 추출한 파일명 삽입
	$(this).siblings('.upload-name').val(filename); 
	}); 
}); 

$( function() {
	$("#submitBtn").click(function(){
		if ( $("#title").val() == "") {
			var element = document.getElementById('div_title');
			element.className ="form-group has-error";
			$("#title").focus();
			return;
		}
		
		var form = new FormData(document.getElementById('frm'));	
 		$.ajax({
		 	type: 'POST',
		 	data: form,
		 	url: "<c:url value='/uploadFileSave.do'/>",
		 	dataType: "json",
		 	processData: false,
		 	contentType: false,
		 	success: function (data) {
		 		if(data.cnt > 0) {
		 			alert("저장되었습니다.");
		 			location.href = "<c:url value='/dataBoardList.do'/>";
		 		} else {
		 			alert("오류발생");
		 		}
		 	},
		 	error: function (error) {
		 		alert("error : " + error);
		 	}
 		});
 	});
});

function fn_action() {
	var form = document.frm;
	
		form.action = "<c:url value='/dataBoardSave.do'/>";
	form.method = 'POST';
	form.submit();
	
	
}

function fn_goList() {
	location.href = "<c:url value='/dataBoardList.do'/>";
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
            <div class="col-lg-12" style="padding: 10px" align="right">
				<input type="button" class="text-heading btn btn-secondary col-lg-2" style="font-weight:bold;" value="List" onclick="fn_goList()">
        	</div>
            <form name="frm" id="frm" method="post" enctype="multipart/form-data">
                <div class="form-group  col-lg-12" align="center" style="margin: 10px">
				<table class="table" style="width: 70%;">
					<colgroup>
		    			<col width="120"/>
		    			<col width="?"/>
	    			</colgroup>
				  	<tr>
				  		<td class="hover"><label class="text-heading" style="font-size: 1.5em">Title</label></td>
				  		<td>
					  		<div class="form-group" id="div_title">
					  			<input type="text" name="title" class="form-control col-lg-12" id="title"/>
					  		</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<td class="hover"><label class="text-heading" style="font-size: 1.5em"> Name</label></td>
				  		<td>
				  			<div class="form-group" id="div_name">
				  				<input type="text" class="form-control col-lg-6" name="name"/>
				  			</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<td class="hover"><label class="text-heading" style="font-size: 1.5em">password</label></td>
				  		<td>
				  			<div class="form-group" id="div_name">
				  				<input type="password" class="form-control col-lg-6" name="pwd"/>
				  			</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<td class="hover"><label class="text-heading" style="font-size: 1.5em">content</label></td>
				  		<td>
				  			<div class="form-group" id="div_content">
				  				<textarea name="content" class="form-control col-lg-12" rows="5"  style="width:99%"></textarea>
				  			</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<td class="hover"><label class="text-heading" style="font-size: 1.5em">file1</label></td>
				  		<td>
				  			<div class="filebox form-group">
				  				
					  			<input class="upload-name" value="파일선택" disabled="disabled"> 
					  			<label for="filename1" class="text-heading">upload</label> 
					  			<input type="file" id="filename1" name="file1" class="upload-hidden"> 
					  		</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<td class="hover"><label class="text-heading" style="font-size: 1.5em">file2</label></td>
				  		<td class="">
					  		<div class="filebox form-group"> 
					  			<input class="upload-name" value="파일선택" disabled="disabled"> 
					  			<label for="filename2" class="text-heading">upload</label> 
					  			<input type="file" id="filename2" name="file2" class="upload-hidden"> 
					  		</div>
				  		</td>
				  	</tr>
				</table>
			 	<div class="form-group col-lg-12">
					<div class="col-lg-3">
					<!-- <input type="button" id="submitBtn" class="text-heading btn btn-secondary col-lg-12" style="font-weight:bold;" value="Submit"> -->
					<input type="button" onclick="fn_action()" class="text-heading btn btn-secondary col-lg-12" style="font-weight:bold;" value="Submit">
				
					</div>
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

