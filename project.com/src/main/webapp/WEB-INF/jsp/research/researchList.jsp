<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sy"		uri="tlds/pagination" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head><jsp:include page="../../../include/in_head.html"/> 

<title>Board</title>
<jsp:include page="../../../include/script/hScript.html"/> 

<script type="text/javaScript">
	$(document).ready(function(){
        $("selectBox option[value=${pageVO.searchCondition}]").attr("selected", true);
    });
	
	function fn_action() {
		location.href = "<c:url value='/surveyWrite.do'/>";
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
    <div class="bg-faded p-4 my-4" align="center" >
     	<form id="pageVO" name="board" method="post">
     		<hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0"><strong>Survey List</strong></h2>
            <hr class="divider">
			<input type="hidden" name="unq"/>
			<div style="width: 80%;">
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
							<col width="250"/>
							<col width="100"/>
						</colgroup>
						<tr>
							<th class="table-success">번호</th>
							<th class="table-success">제목</th>
							<th class="table-success">기간</th>
							<th class="table-success">노출여부</th>
						</tr>
					
						<c:forEach var="list" items="${result}" varStatus="status">
							<tr>
								<td align="center"><c:out value="${paginationInfo.totalRecordCount+1 - ((pageVO.pageIndex-1) * pageVO.pageSize + status.count)}"/></td>
								<td style="text-align: left">
									<a href="javascript:select_board('<c:out value="${list.unq}"/>')">
										<c:out value="${list.title}"/>
									</a>
								</td> 	
								<td align="center"><c:out value="${list.sdate} ~ ${list.edate}"/></td>
								<td align="center"><c:out value="${list.use}"/></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- /List -->
				<br>
				<div id="paging" align="center">
		       		<sy:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="link_page" />
		       		<input type="hidden" name="pageIndex" />
		       	</div>
				<div id="sysbtn" align="right" style="margin-right: 10px">
				<a href="javascript:fn_action();" class="btn btn-secondary">설문등록</a>
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
