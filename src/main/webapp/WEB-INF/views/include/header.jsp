<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<nav class="navbar navbar-expand-md fixed-top navbar-transparent" color-on-scroll="500">
	<div class="container">
		<div class="navbar-translate">
			<button class="navbar-toggler navbar-toggler-right navbar-burger"
				type="button" data-toggle="collapse" data-target="#navbarToggler"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span> 
				<span class="navbar-toggler-icon"></span> 
				<span class="navbar-toggler-icon"></span> 
			</button>
			<a class="navbar-brand" href="${root}/">
			<%-- <img src="${root}/resources/img/logo.png" alt="logo" class="nav-logo-img"/ --%> hello mind</a>
		</div>
		<div class="collapse navbar-collapse" id="navbarToggler">
			<ul class="navbar-nav ml-auto">
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="true">Counselling</a>
					<ul class="dropdown-menu dropdown-menu-right dropdown-danger">
						<li class="dropdown-header">councelling</li>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${root}/col/search">상담하기</a>
						<a class="dropdown-item" href="#pk">이용권 구매하기</a>
						<a class="dropdown-item" href="#pk">상담사 지원하기</a>
					</ul>
				</div>
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="${root}/col/colList" role="button" aria-haspopup="true"
						aria-expanded="true">My Mind</a>
					<ul class="dropdown-menu dropdown-menu-right dropdown-danger">
						<li class="dropdown-header" href="#pk">My Mind</li>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${root}/member/modify">내 정보</a>
						<a class="dropdown-item" href="#pk">예약 내역</a>
						<a class="dropdown-item" href="#pk">상담 내역</a>
					</ul>
				</div>
				
				<c:if test="${userInfo==null}">
					<li class="nav-item"><a class="nav-link"
						href="${root}/member/login">&nbsp;&nbsp;&nbsp;&nbsp; <i
							class="nc-icon nc-single-02" aria-hidden="true"></i>Login</a></li>
				</c:if>
				<c:if test="${userInfo!=null}">
					<li class="nav-item"><a class="nav-link"
						href="${root}/member/logout">&nbsp;&nbsp;&nbsp;&nbsp; <i
							class="nc-icon nc-user-run" aria-hidden="true"></i>Logout</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
