<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<jsp:include page="../../../include/in_head.html"/> 
<title>Test BootStrap</title>
<jsp:include page="../../../include/script/hScript.html"/> 

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
		            <a class="nav-link text-uppercase text-expanded active" href="/notice.do">공지사항</a>
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
		            <a class="nav-link text-uppercase text-expanded" href="/surveyWrite.do">설문조사</a>
		        </li>
		    </ul>
		</div>
	</nav> 
	
    <div class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">Main Title</div>
    <div class="tagline-lower text-center text-expanded text-shadow text-uppercase text-white mb-5 d-none d-lg-block">Sub Title</div>

    <!-- Container -->
    <div class="container">
        <div class="bg-faded p-4 my-4">
            <hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0">About <strong>Business Casual</strong></h2>
            <hr class="divider">
            <div class="row">
                <div class="col-lg-6">
                    <img class="img-fluid mb-4 mb-lg-0" src="img/slide-2.jpg" alt="">
                </div>
                <div class="col-lg-6" >
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam soluta dolore voluptatem, deleniti dignissimos excepturi veritatis cum hic sunt perferendis ipsum perspiciatis nam officiis sequi atque enim ut! Velit, consectetur.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam pariatur perspiciatis reprehenderit illo et vitae iste provident debitis quos corporis saepe deserunt ad, officia, minima natus molestias assumenda nisi velit?</p>
                </div>
            </div>
        </div>

        <div class="bg-faded p-4 my-4">
            <hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0">Our <strong>Team</strong></h2>
            <hr class="divider">
            <div class="row">
                <div class="col-md-4 mb-4 mb-md-0">
                    <div class="card h-100">
                        <img class="card-img-top" src="http://placehold.it/750x450" alt="">
                        <div class="card-body text-center">
                            <h4 class="card-title m-0">John Smith <small class="text-muted">Job Title</small></h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4 mb-md-0">
                    <div class="card h-100">
                        <img class="card-img-top" src="http://placehold.it/750x450" alt="">
                        <div class="card-body text-center">
                            <h4 class="card-title m-0">John Smith <small class="text-muted">Job Title</small></h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <img class="card-img-top" src="http://placehold.it/750x450" alt="">
                        <div class="card-body text-center">
                            <h4 class="card-title m-0">John Smith <small class="text-muted">Job Title</small></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container -->

    <!-- Bootstrap core JavaScript -->
   	<jsp:include page="../../../include/script/fScript.html"/> 

</body>

</html>
