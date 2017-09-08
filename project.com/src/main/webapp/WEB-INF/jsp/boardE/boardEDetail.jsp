<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sy"		uri="tlds/pagination" %>
<!DOCTYPE html>
<html>
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

<script type="text/javascript">
function fn_goModify() {
	document.board.action = "<c:url value='/boardUpdateView.do'/>";
	document.board.submit();
}

function fn_action(value) {
	var b = document.board;
	
	if (value == 'S') {
		// 댓글 작성
		b.action = "<c:url value='/boardESaveComm.do'/>";
	}
	
	if (value == 'M') {
		var url = "boardEModify.do?unq=" + $("#unq").val();
	   	location.href = "<c:url value='" + url + "'/>";
	   	
	   	return;
	}
	b.submit();
}


/**
 * 댓글 function
 */
var comm;
var writer;
var pwd;
var pwdCheck;
/* 
 * 댓글 입력
 */
function commInsert() {
	var params =
		"unq=" + $("#unq").val()
		+ "&comm="+ $("#comm").val()
		+ "&writer=" +  $("#writer").val()
		+ "&pwd=" +  $("#pwd").val();
	
	$.ajax({
	 	type: 'POST',
	 	data: params,
	 	url: "<c:url value='/boardECommSave.do'/>",
	 	dataType: "json",
	 	success: function (data) {
	 		if(data.result == "success") {	
	 			alert("저장되었습니다.");
	 			self.location.reload();
	 			
	 		} else {
	 			alert("Error");
	 		}
	 	},
	 	error: function (error) {
	 		alert("error : " + error);
	 	}
	});

}
/* 
 * 댓글 삭제
 */
function commDelete(commUnq) {
	var params = "unq="+ commUnq;
	$.ajax({
	 	type: 'POST',
	 	data: params,
	 	url: "<c:url value='/boardECommDelete.do'/>",
	 	dataType: "json",
	 	success: function (data) {
	 		if(data.result == "success") {	
	 			alert("삭제되었습니다.");
	 			location.reload();
	 			
	 		} else {
	 			alert("삭제할 수 없습니다.");
	 		}
	 	},
	 	error: function (error) {
	 		alert("error : " + error);
	 	}
	});
}

/* 
 * 댓글 수정
 */
function fn_commModify (data) {
	$.ajax({
	 	type: 'POST',
	 	data: data,
	 	url: "<c:url value='/boardECommUpdate.do'/>",
	 	dataType: "json",
	 	success: function (data) {
	 		if(data.result == "success") {	
	 			alert("수정되었습니다.");
	 			self.location.reload();
	 			
	 		} else {
	 			alert("Error");
	 		}
	 	},
	 	error: function (error) {
	 		alert("error : " + error);
	 	}
	});
}
/*
 * 비밀번호 체크
 */
var actionType;
var commUnq;

function fn_pwdInsert(reUnq, actionValue) {
	commUnq = reUnq;
	
	//alert(commUnq);
	
	var url = "/commPwdCheck.do";
	var setting = "width=500,height=200,left=0,top=0";
				
	window.open( url, "post_popup", setting);
	actionType = actionValue;

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
    <form name="board">
   		<div class="bg-faded p-4 my-4" align="center">
			<hr class="divider">
			<h2 class="text-center text-lg text-uppercase my-0"><strong>Board Detail</strong></h2>
			<hr class="divider">
			<div class="formgroup col-lg-12" style="padding: 10px;" align="right" >
				<div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="/boardEList.do" class="text-heading" style="color: white; font-weight:bold;">List</a>
				</div>	
			    <div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="javascript:fn_action('M')" class="text-heading" style="color: white; font-weight:bold;">Modify</a>
				</div>
				<div class="btn btn-secondary col-lg-1" style="margin-right: 10px">
					<a href="javascript:fn_action('D');" class="text-heading" style="color: white; font-weight:bold;">Delete</a>
				</div>
			</div>

		
			<input type="hidden" id="unq" name="unq" value="${vo.unq}"/>
			<div class="form-group  col-lg-12">
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
			</div>
		</div>
			
			<!-- 한줄 댓글 입력  -->
	    <div class="bg-faded p-4 my-4" align="center">
			<div id="table-responsive">
				<table class="table table-bordered table-responsive" style="width: 70%;">
					<colgroup>
		    			<col width="120"/>	
		    			<col width="?"/>		
					</colgroup>
					<tr>
						<td class="hover"><label class="text-heading" style="font-size: 1em"> Name</label></td>
				  		<td>
				  			<div class="form-group col-lg-12" id="div_name">
				  				<input type="text" class="form-control col-lg-12" name="writer" id="writer"/>
				  			</div>
				  		</td>
						<td class="hover"><label class="text-heading" style="font-size: 1em">password</label></td>
				  		<td>
				  			<div class="form-group" id="div_name">
				  				<input type="password" class="form-control col-lg-12" name="pwd" id="pwd"/>
				  			</div>
				  		</td>
					</tr>
					<tr>
				  		<td class="hover"><label class="text-heading" style="font-size: 1em">Comment</label></td>
				  		<td colspan="3">
					  		<div class="form-group" id="div_title">
					  			<input type="text" name="comm" class="form-control col-lg-12" id="comm"/>
					  		</div>
				  		</td>
				  	</tr>
				</table>
			</div>
			<div class="form-group col-lg-12">
				<div class="col-lg-2">
				<input type="button" class="text-heading btn btn-secondary col-lg-12" style="font-weight:bold;" value="CommentSave" onclick="commInsert()">
				</div>
        	</div>
        	<br/>
			<!-- 한줄 댓글 보기  -->
			<div class="table-responsive">
				<table class="table table-bordered" style="width: 70%;">
					<colgroup>
		    			<col width="70"/>
		    			<col width="100"/>
		    			<col width="?"/>	
		    			<col width="180"/>	
					</colgroup>
					<tr>
						<th class="table-success">번호</th>
						<th class="table-success">작성자</th>
						<th class="table-success">내용</th>	
						<th class="table-success"></th>	
					</tr>
				
					<c:forEach var="list" items="${result}" varStatus="status">
						<tr>
							<td align="center"><c:out value="${list.rn}"/></td>	
							<td align="center"><c:out value="${list.writer}"/></td>	
							<td align="center"><c:out value="${list.comm}"/></td>
							<td align="center">
								<input type="button" onclick="fn_pwdInsert('${list.unq}', 'M')" value="수정"/> /  
								<input type="button" onclick="fn_pwdInsert('${list.unq}', 'D')" value="삭제"/>
							</td>
						</tr>
					</c:forEach>
				</table>
				
			</div>
		</div>
	</form>
	</div>
    	
   	
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
   	<jsp:include page="../../../include/script/fScript.html"/> 

</body>

</html>

