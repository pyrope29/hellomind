<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
</head>
<body>
<nav class="navbar navbar-expand-md fixed-top navbar-transparent nav-no-padding" color-on-scroll="500">
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
			<a class="navbar-brand" href="${root}/col">
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
						<a class="dropdown-item" href="${root}/col/chat">상담하기</a>
						<a class="dropdown-item" href="${root}/col/colPage">내 상담사 페이지 관리</a>
					</ul>
				</div>
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="true">My Account</a>
					<ul class="dropdown-menu dropdown-menu-right dropdown-danger">
						<li class="dropdown-header" href="#pk">My Account</li>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${root}/col/modify">내 정보</a>
						<a class="dropdown-item" href="${root}/schd/regist">일정 관리</a>
						<a class="dropdown-item" href="#pk">상담 관리</a>
					</ul>
				</div>
				
				<c:if test="${colInfo==null}">
				
				<div aria-labelledby="dLabel" class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="true">상담사 로그인</a>
                            <form class="form-horizontal dropdown-menu dropdown-menu-right dropdown-danger" 
                            	action="${root}/col/login" method="post">
                                <div class="acc-content container">
                                    <div class="item">
                                        <input type="text" id="cId" name="cId" class="form-control"
                                        placeholder="아이디를 입력해 주세요.">
                                    </div>
                                    <div class="item">
                                        <input type="password" id="cPw" name="cPw" class="form-control"
                                         placeholder="비밀번호를 입력해 주세요.">
                                    </div>
                                    <button type="submit" class="btn btn-success btn-sm">상담사 로그인</button>
                                    <button type="button" class="btn btn-primary btn-sm" onclick="location.href='${root}/col/join'">회원가입</button>
                                </div>
                            </form>
                        </div>
               </c:if>
				<c:if test="${colInfo!=null}">
					<li class="nav-item"><a class="nav-link"
						href="${root}/col/logout">&nbsp;&nbsp;&nbsp;&nbsp; <i
							class="nc-icon nc-user-run" aria-hidden="true"></i>Logout</a></li>
				</c:if>
                        
			</ul>
		</div>
	</div>
</nav>
