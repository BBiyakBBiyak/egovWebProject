<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<jsp:include page="../../../include/in_head.html"/> 
<title>Board</title>
<jsp:include page="../../../include/script/hScript.html"/> 
 
<script type="text/javaScript">
$( function() {
	$('.birth').datepicker({
	});
});
function go_action(value) {
	if(value == 'L')
		location.href ="/mList.do";
}

function postSearch() {
	var url = "/post1.do";
	var setting = "width=500,height=300,left=0,top=0";
	
	window.open( url, "post_popup", setting);
}

// 아이디 중복체크여부를 확인
var isChecked = false;

// id input value 변경시 메세지숨김 & 중복체크 false
function fn_changed() {
	isChecked = false;
}

function fn_idCheck() {
	var idPattern = /^[a-z0-9_]{6,12}$/;
	var isnum = /^[0-9]{6,12}$/;
	var element = document.getElementById('idDiv');
	
	if ( $("#id").val() == "") {
		element.className ="input-group has-error";
		$("#id").attr('placeholder','아이디를 입력해주세요.');
		$("#id").focus();
		return false;
	} else {
		// 정규식 검사
		if(isnum.test($("#id").val())) {
			element.className ="input-group has-error";
			$("#id").val("");
			$("#id").attr('placeholder','아이디는 영/소문자 조합 6~12자리 입니다.');
			return false;
		} else if (!idPattern.test($("#id").val())) {
			element.className ="input-group has-error";
			$("#id").val("");
			$("#id").attr('placeholder','아이디는 영/소문자 조합 6~12자리 입니다.');
			return false;
		}
	}
	
	var params = "id="+$("#id").val();
	
	$.ajax({
	 	type: 'POST',
	 	data: params,
	 	url: "<c:url value='/mIdCheck.do'/>",
	 	dataType: "json",
	 	success: function (data) {
	 		if(data.result == "ok") {
	 			alert("사용가능합니다.");
	 			element.className ="input-group";
	 			isChecked = true;
	 		} else {
	 			alert("이미 존재하는 아이디입니다.");
	 			element.className ="input-group has-error";
	 			$("#id").val("");
	 			isChecked = false;

	 		}
	 	},
	 	error: function (error) {
	 		alert("error : " + error);
	 	}
	});	
}
		
function fn_submit() {
	var element = document.getElementById('idDiv');
	if ( $("#id").val() == "") {
		element.className ="input-group has-error";
		$("#id").attr('placeholder','아이디를 입력해주세요.');
		$("#id").focus();
		return false;
	} else {
		if(!isChecked) {
			alert("아이디 중복확인을 해주세요.");
			return;
		}
	}
	var element2 = document.getElementById('pwdDiv');
 	if( $("#pwd").val() == "") {
 		alert("비밀번호입력해");
 		element2.className ="col-sm-6 has-error";
		$("#pwd").attr('placeholder','비밀번호를 입력해주세요.');
		$("#pwd").focus();

		return false;
	}

	 var params = $("#join").serialize();
	 alert(params);

		$.ajax({
	 	type: 'POST',
	 	// data: params,
	 	data: params,
	 	url: "<c:url value='/mRegisterSave.do'/>",
	 	dataType: "json",
	 	// processData: false,
	 	// contentType: "application/json; charset=utf-8",
	 	success: function (data) {
	 		if(data.result == "ok") {
	 			alert("회원가입되었습니다.\n로그인해 주세요~");
	 			location.href = "<c:url value='/login.do'/>";
	 		} else {
	 			alert("오류발생");
	 		}
	 	},
	 	error: function (error) {
	 		alert("error : " + error);
	 	}
		});
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
		            		<a class="nav-link text-uppercase text-expanded active" href="/mRegister.do">회원가입</a> </li>
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
        <h2 class="text-center text-lg text-uppercase my-0"><strong>Member Register</strong></h2>
        <hr class="divider">
        <form class="form-horizontal" id="join">
        <div class="form-group">
         	<label class="col-sm-3 control-label" for="inputId">아이디</label>
        	<div class="col-sm-6">
	            <div class="input-group" id="idDiv">
		        	<input class="form-control" name="id" id="id" onchange="fn_changed()" type="text" placeholder="영/소문자 조합 6~12자리">
		        	<span class="input-group-btn">
		            	<input type="button" class="btn btn-success" onclick="fn_idCheck()" value="중복체크">
		            </span>
	            </div>
        	</div>
        </div>
        <div class="form-group">
          	<label class="col-sm-3 control-label" for="pwd">비밀번호</label>
       		<div class="col-sm-6" id="pwdDiv">
          		<input class="form-control" id="pwd" name="pwd" type="password" placeholder="비밀번호(숫자, 특수문자 포함 8자 이상)">
        	</div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="name">이름</label>
         	<div class="col-sm-3">
            	<input class="form-control text-center" name="name" id="name" type="text" placeholder="이름">
          	</div>
        </div>
        <div class="form-group">
         	<div class="col-sm-3">
	         	<div style="margin-top: 1rem">
					<label class="custom-control custom-radio">
					<input id="radio1" name="gender" id="gender" type="radio" value="M" class="custom-control-input">
					<span class="custom-control-indicator"></span>
					<span class="custom-control-description">남</span>
					</label>
					<label class="custom-control custom-radio">
					<input id="radio2" name="gender" id="gender" type="radio" value="F" class="custom-control-input">
					<span class="custom-control-indicator"></span>
					<span class="custom-control-description">여</span>
					</label>
				</div>
          	</div>
        </div>
        <div class="form-group date">
       		<label class="col-sm-3 control-label" for="birth">생년월일</label>
   			<div class="col-sm-3">
   				<div class="input-group date">
				    <input type="text" name="birth" class="form-control span2 text-center" id="birth" data-provide="datepicker" data-date-format="yyyy-mm-dd">
				    <span class="add-on"><i class="icon-th"></i></span>
            	</div>
		    </div>
		</div>
		<div class="form-group">
          	<label class="col-sm-3 control-label" for="phone">휴대폰</label>
       		<div class="col-sm-6">
          		<input class="form-control" id="phone" name="phone" type="text" placeholder="(-) 없이 입력해주세요.">
        	</div>
        </div>
        <div class="form-group">
        	<label class="col-sm-3 control-label">우편번호</label>
        	<div class="col-sm-6">         
				<div class="input-group">
					<input type="tel" class="form-control" name="postnum" id="postnum" readonly="readonly"/>
				  	<span class="input-group-btn">
				    	<a href="javascript:postSearch()" class="btn btn-success">우편번호 찾기<i class="fa fa-mail-forward spaceLeft"></i></a>
				 	</span>
				</div>
        	</div>
        	<div class="col-sm-6" style="margin-top: 0.5rem"> 
        		<input class="form-control" id="addr1" name="addr1" type="text" readonly="readonly">
				<input class="form-control" id="addr2" name="addr2" type="text" placeholder="나머지 주소를 입력해주세요." style="margin-top: 0.25rem">
        	</div>
        </div>
     
        <div class="form-group">
			<label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
        	<div class="col-sm-6" data-toggle="buttons">
           		<label class="btn btn-warning active">
            		<input id="agree" type="checkbox" autocomplete="off" checked>
               		<span class="fa fa-check"></span>
           		</label>
           		<a href="#">이용약관</a> 에 동의 합니다.
         	</div>
        </div>
        <div class="form-group">
        	<div class="col-sm-12 text-center">
            	<button class="btn btn-primary" type="button" onclick="fn_submit()">회원가입<i class="fa fa-check spaceLeft"></i></button>
            	<button class="btn btn-danger" type="button">가입취소<i class="fa fa-times spaceLeft"></i></button>
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

