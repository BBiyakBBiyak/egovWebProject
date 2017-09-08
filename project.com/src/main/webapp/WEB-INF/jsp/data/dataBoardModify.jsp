<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
		//alert("asdasd");	
		if ( $("#title").val() == "") {
			var element = document.getElementById('div_title');
			element.className ="form-group col-lg-12 has-error";
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

function fn_Modify() {

	var form = document.frm;
	
	form.deleteFile.value = deleteList;
	form.action = "<c:url value='/updataDataBoard.do'/>";
	form.method = 'POST';
	form.submit();
}

//삭제할 파일을 임시저장할 list
var deleteList = [];

function fn_fileDelete(file) {
	if(confirm("삭제하시겠습니까?")) {
		var count = deleteList.length;
		//alert(count);
		
		$("#file1").empty();
		
		deleteList[count] = file;
		//alert(deleteList[count]);
	}
}

/*
function fn_fileDelete(file, u) {
	
	var data = "unq=" + u + "&filename=" + file + "／";
	// alert(data);
	
	$.ajax({
	 	type: 'POST',
	 	data: data,
	 	url: "<c:url value='/fileDelete.do'/>",
	 	dataType: "json",
	 	success: function (data) {
	 		if(data.result == "success") {
	 			alert("삭제되었습니다.");
	 			self.location.reload();
	 		} else {
	 			alert("오류발생");
	 		}
	 	},
	 	error: function (error) {
	 		alert("error : " + error);
	 	}
	});
	
}
*/

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
            <h2 class="text-center text-lg text-uppercase my-0"><strong>Data Board Modify</strong></h2>
            <hr class="divider">
            <div class="col-lg-12" style="padding: 10px;" align="right" >
				<div class="col-lg-2">
				<input type="button" class="text-heading btn btn-secondary col-lg-12" style="font-weight:bold; padding-right: 1rem" value="List" onclick="fn_goList()">
				</div>
        	</div>
        	
            <form name="frm" id="frm" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="unq" value="${vo.unq}">
            	<input type="hidden" name="deleteFile"/>
            	
                <div class="form-group  col-lg-12" style="margin: 10px">
				<table class="table table-bordered table-responsive" style="width: 70%;">
					<colgroup>
		    			<col width="150"/>
		    			<col width="?"/>
	    			</colgroup>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em;">Title</label></th>
				  		<td>
					  		<div class="form-group col-lg-12" id="div_title">
					  			<input type="text" name="title" class="form-control " id="title" value="${vo.title}"/>
					  		</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em"> Name</label></th>
				  		<td>
				  			<div class="form-group col-lg-6" id="div_title">
					  			<input type="text" name="name" value="${vo.name}" class="form-control" id="title"/>
					  		</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em">password</label></th>
				  		<td>
				  			<div class="form-group col-lg-6" id="div_title">
					  			<input type="password" name="pwd" value="${vo.pwd}" class="form-control" id="title"/>
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
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em">File</label></th>
				  		<td>
							<c:set var="file" value="${fn:split(vo.filename,'／')}" />
							<c:forEach var="fileName" items="${file}" varStatus="g">
								<c:choose>
									<c:when test="${fileName != ''}">
										<div id="file${g.count}">
											<!--  <a href="javascript:fn_fileDelete('${fileName}', '${vo.unq}');"> -->
											<a href="javascript:fn_fileDelete('${fileName}');">
											<i class="fa fa-times-circle fa-lg" style="color:red" aria-label="${fileName}"></i></a>
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
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em">file1</label></th>
				  		<td>
				  			<div class="filebox form-group">
					  			<input class="upload-name" value="파일선택" disabled="disabled"> 
					  			<label for="filename1" class="text-heading">upload</label> 
					  			<input type="file" id="filename1" name="file1" class="upload-hidden"> 
					  		</div>
				  		</td>
				  	</tr>
				  	<tr>
				  		<th class="table-success"><label class="text-heading" style="font-size: 1.5em">file2</label></th>
				  		<td>
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
					<input type="button" onclick="fn_Modify()" class="text-heading btn btn-secondary col-lg-12" style="font-weight:bold;" value="modify">
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

