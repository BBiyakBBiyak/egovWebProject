<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="sy"		uri="tlds/pagination" %>

<!DOCTYPE html>
<html>
<head><jsp:include page="../../../include/in_head.html"/> 

<title>ReBoard</title>
<jsp:include page="../../../include/script/hScript.html"/> 
<script type="text/javaScript">
	function select_board(unq) {
		var b = document.board;
		var url = "boardEDetail.do?unq=" + unq;

	   	location.href = "<c:url value='" + url + "'/>";
	}
	
	function fn_action(value) {
		var b = document.board;
		
		// 추후 정규식 체크 함수 필요
		if(value == 'W') {
			b.action = "<c:url value='/boardEWrite.do'/>";
		}	
		b.submit();
	}
	
	/* 글 목록 화면 function */
    function link_search() {
    	var b = document.board;
    	b.pageIndex.value = 1;
		b.action = "<c:url value='/boardEList.do'/>";
       	b.submit();
    }
	
	 /* pagination 페이지 링크 function */
    function link_page(pageNo){
		var b = document.board;
		
    	b.pageIndex.value = pageNo;
    	b.action = "<c:url value='/boardEList.do'/>";
       	b.submit();
    }
	 
    
	$(document).ready(function(){
        $("selectBox option[value=${pageVO.searchCondition}]").attr("selected", true);
    });



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
		            <a class="nav-link text-uppercase text-expanded" href="/boardList.do">BOARD</a>
		        </li>
		        <li class="nav-item px-lg-4">
		            <a class="nav-link text-uppercase text-expanded active" href="/boardEList.do">REBOARD</a>
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
	<div class="bg-faded p-4 my-4">
		<form id="pageVO" name="board">
			<input type="hidden" name="unq"/>
			<!-- 타이틀 -->
		    <hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0"><strong>ReBoard List</strong></h2>
            <hr class="divider">
			<!-- 검색 -->
			<div align="right">        	
				<label for="searchCondition" style="visibility:hidden;">choose</label>
				<select name="searchCondition" id="selectBox">
					<option value="title" label="title" <c:if test="${pageVO.searchCondition eq 'title'}">selected</c:if>/>
					<option value="name" label="name"  <c:if test="${pageVO.searchCondition eq 'name'}">selected</c:if>/>
				</select>
				<label for="searchKeyword" style="visibility:hidden;display:none;">keyword</label>
                <input class="txt" name="searchKeyword" type="text" value="${pageVO.searchKeyword}"/>
	      		<a href="javascript:link_search()" class="btn btn-secondary">search</a>  
        	</div>
        	<br>
			<!--  테이블 -->
			<div class="table-responsive">
				<table class="table table-hover table-bordered">
					<colgroup>
						<col width="90"/>
						<col width="?"/>
						<col width="120"/>
						<col width="150"/>
						<col width="100"/>
					</colgroup>
					<tr>
						<th class="table-success">번호</th>
						<th class="table-success">제목</th>
						<th class="table-success">글쓴이</th>
						<th class="table-success">날짜</th>
						<th class="table-success">조회수</th>
					</tr>
				
					<c:forEach var="list" items="${result}" varStatus="status">
						<tr>
							<td align="center"><c:out value="${paginationInfo.totalRecordCount+1 - ((pageVO.pageIndex-1) * pageVO.pageSize + status.count)}"/></td>
							<td style="text-align: left">
								<a href="javascript:select_board('<c:out value="${list.unq}"/>')"><c:out value="${list.title}"/></a>
							</td>
									
							<td align="center"><c:out value="${list.name}"/></td>
							<td align="center"><c:out value="${list.rdate}"/></td>
							<td align="center"><c:out value="${list.hit}"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- /List -->
			<div id="paging" align="center">
	       		<sy:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="link_page" />
	       		<input type="hidden" name="pageIndex" />
	       	</div>
			<div id="sysbtn" align="right" style="margin-right: 10px">
				<a href="javascript:fn_action('W');" class="text-heading btn btn-secondary col-lg-2" style="font-weight:bold;">Write</a>
			</div>
		</form>
	</div>
</div>
</body>
</html>