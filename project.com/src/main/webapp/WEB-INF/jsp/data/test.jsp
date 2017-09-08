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

</script>
</head>
<body>

    <div class="tagline-upper text-center text-heading text-shadow text-white mt-5 d-none d-lg-block">Main Title</div>
    <div class="tagline-lower text-center text-expanded text-shadow text-uppercase text-white mb-5 d-none d-lg-block">Sub Title</div>

    <!-- Navigation -->
    <jsp:include page="../../../include/nav.jsp"/> 

    <div class="container">
   		<div class="bg-faded p-4 my-4" align="center">
            <hr class="divider">
            <h2 class="text-center text-lg text-uppercase my-0"><strong>Member Register</strong></h2>
            <hr class="divider">
            <form class="form-horizontal">
      	    <div class="col-sm-6">
            <div class="input-group">
        	<input class="form-control" name="id" id="inputId" type="text" placeholder="영/소문자 조합 6~12자리">
        	<span class="input-group-btn">
            	<button class="btn btn-success">중복체크<i class="fa fa-mail-forward spaceLeft"></i></button>
            </span>
            </div>
        
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="이름">
          </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
              <div class="col-sm-6">
                <div class="input-group">
                  <input type="tel" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" />
                  <span class="input-group-btn">
                    <button class="btn btn-success">인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span>
                </div>
              </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumberCheck">인증번호 확인</label>
          <div class="col-sm-6">
            <div class="input-group">
              <input class="form-control" id="inputNumberCheck" type="text" placeholder="인증번호">
              <span class="input-group-btn">
                <button class="btn btn-success" type="button">인증번호 확인<i class="fa fa-edit spaceLeft"></i></button>
              </span>
            </div>
            <p class="help-block">전송된 인증번호를 입력해주세요.</p>
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
            <button class="btn btn-primary" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="submit">가입취소<i class="fa fa-times spaceLeft"></i></button>
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

