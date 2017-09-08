<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<jsp:include page="../../../include/in_head.html"/> 
<title>Test BootStrap</title>
<jsp:include page="../../../include/script/hScript.html"/> 
<style type="text/css">
.row {
	margin-right: 0px;
	margin-left: 0px;
}
.table .table {
   background-color: RGBA(255, 255, 255, 0);
   text-align: center;
   font-size: 12px;
   border-color: #21b2a6;
}
.table-bordered {
    border: 1px solid #21b2a6;
}
.btn-group-xs>.btn, .btn-xs {
    padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}

</style>

<script type="text/javascript">
function fn_goVote(value) {
	var mcd = value;
	
	var url = "/popSurvey.do?mcd="+ mcd;
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
		            <a class="nav-link text-uppercase text-expanded active" href="/main.do">HOME </a>
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
		            <a class="nav-link text-uppercase text-expanded" href="/surveyWrite.do">설문조사</a>
		        </li>
		    </ul>
		</div>
	</nav> 
    
    <div class="text-center mt-5 d-none d-lg-block" style="margin: 0px"><img class="img-responsive" src="img/profile.png" alt=""></div>
    
    <div class="tagline-upper text-center text-shadow text-white mt-5 d-none d-lg-block">Main Title</div>
    <div class="tagline-lower text-center text-expanded text-shadow  text-white mb-5 d-none d-lg-block">Sub Title</div>  

    <div class="container">
	    <!-- Main Slide -->	
		<div class="bg-faded p-4 my-4">
		    <!-- Image Carousel -->
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
				    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
					    <img class="d-block img-fluid w-100" src="img/slide-1.jpg" alt="">
					    <div class="carousel-caption d-none d-md-block">
					        <h3 class="text-shadow">First Slide</h3>
					        <p class="text-shadow">This is the caption for the first slide.</p>
					    </div>
					</div>
					<div class="carousel-item">
					    <img class="d-block img-fluid w-100" src="img/slide-2.jpg" alt="">
					    <div class="carousel-caption d-none d-md-block">
					        <h3 class="text-shadow">Second Slide</h3>
					        <p class="text-shadow">This is the caption for the second slide.</p>
					    </div>
					</div>
					<div class="carousel-item">
					    <img class="d-block img-fluid w-100" src="img/slide-3.jpg" alt="">
					    <div class="carousel-caption d-none d-md-block">
					        <h3 class="text-shadow">Third Slide</h3>
					        <p class="text-shadow">This is the caption for the third slide.</p>
					    </div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				</a>
			</div>
			<!-- Welcome Message -->
		    <div class="text-center mt-4">
		        <div class="text-heading text-muted text-lg">Welcome To</div>
		        <h1 class="my-2">Business Casual</h1>
		        <div class="text-heading text-muted text-lg">By <strong>Start Bootstrap</strong></div>
		    </div>
		</div>
		<!-- /.Main Slide -->
	
		<!-- middle -->
		<div class="row my-4">
			<div class="bg-faded p-4 my-4" style="margin-left: 0; width: 67%">
			 	<hr class="divider">
	            <h2 class="text-center text-lg text-uppercase my-0">Build a website <strong>worth visitng</strong></h2>
	            <hr class="divider">
	            <img class="img-fluid float-left mr-4 d-none d-lg-block" src="img/intro-pic.jpg" alt="">
	            <p>1.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam soluta dolore voluptatem, deleniti dignissimos excepturi veritatis cum hic sunt perferendis ipsum perspiciatis nam officiis sequi atque enim ut! Velit, consectetur.</p>
	            <p>2.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam pariatur perspiciatis reprehenderit illo et vitae iste provident debitis quos corporis saepe deserunt ad, officia, minima natus molestias assumenda nisi velit?</p>
	     	</div>
			<!-- empty space -->
			<span style="width: 3%"></span>
			<div class="bg-faded p-4 my-4 table" style="margin-right: 0px; width: 30%">
				<table class="table table-bordered">
					<tr>
						<td colspan="2">설문조사</td>
					</tr>
					<c:forEach var="RsList" items="${rsList}" varStatus="status">
					<tr>
						<td>${RsList.title} </td>
						<td>
							<div class="row" >
								<div class="col-sm-6" style="padding-right: 5px; padding-left: 0px;">
								<a href="javascript:fn_goVote('${RsList.mcd}');" class="btn btn-success btn-xs">응모</a>
								</div>
								<div class="col-sm-6" style="padding-right: 5px; padding-left: 0px;">
								<a href="javascript:fn_goResult('${RsList.mcd}');" class="btn btn-success btn-xs">결과</a>
								</div>
							</div>	
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
        <!-- /middle -->
        
		<!-- bottom -->
        <div class="bg-faded p-4 my-4">
            <hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0">Beautiful boxes to <strong>showcase your content</strong></h2>
            <hr class="divider">
            <p>a.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam soluta dolore voluptatem, deleniti dignissimos excepturi veritatis cum hic sunt perferendis ipsum perspiciatis nam officiis sequi atque enim ut! Velit, consectetur.</p>
            <p>b.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam pariatur perspiciatis reprehenderit illo et vitae iste provident debitis quos corporis saepe deserunt ad, officia, minima natus molestias assumenda nisi velit?</p>
        </div>
		<!-- /bottom -->
	</div>
    <!-- /.container -->

    <!-- footer -->
    <!--
    <jsp:include page="../../../include/in_footer.html"/> 
    -->

    <!-- Bootstrap core JavaScript -->
   	<jsp:include page="../../../include/script/fScript.html"/> 

</body>

</html>
