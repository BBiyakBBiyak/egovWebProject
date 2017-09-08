<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/js/jquery-1.12.4.js"></script>
<script type="text/javascript">

$(init);

function init() {
	var mS = parseInt('${param.mS}');
	if(!mS) {
	mS = 1;
	}
	
	$('a').eq(mS).addClass('active');
}

</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-lg-4">
	<a class="navbar-brand text-uppercase text-expanded  font-weight-bold d-lg-none" href="/main.do">Home</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		</button>
	<div class="collapse navbar-collapse font-weight-bold" id="navbarResponsive" >
	    <ul class="navbar-nav mx-auto">
	        <li class="nav-item px-lg-4">
	            <a class="nav-link text-uppercase text-expanded" href="/main.do?mS=1">HOME </a>
	        </li>
	        <li class="nav-item px-lg-4">
	            <a class="nav-link text-uppercase text-expanded" href="/notice.do?mS=2">공지사항</a>
	        </li>
	        <li class="nav-item px-lg-4">
	            <a class="nav-link text-uppercase text-expanded" href="/boardList.do?mS=3">BOARD</a>
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
	            <a class="nav-link text-uppercase text-expanded" href="/dataBoardList.do?mS=7">자료실</a>
	        </li>
	    </ul>
	</div>
</nav>
</body>
</html>

