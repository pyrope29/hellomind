<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md fixed-top navbar-transparent" color-on-scroll="500">
<%@ include file="/WEB-INF/views/common/public.jsp"%>
		
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
				<li class="nav-item"><a class="nav-link" href="${root}/col/colList">Counselling | </a></li>
				<li class="nav-item"><a class="nav-link" href="#">My Mind |
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Mind Note | </a></li>
				
				<c:if test="${userId==null}">
					<li class="nav-item"><a class="nav-link" href="${root}/member/login">&nbsp;&nbsp;&nbsp;&nbsp;
					<i class="nc-icon nc-single-02" aria-hidden="true"></i></a></li>
				</c:if>
				<c:if test="${userId!=null}">
					<!-- <div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown"
						href="#pk" role="button" aria-haspopup="true" aria-expanded="false"><i class="nc-icon nc-align-center" aria-hidden="true"></i></a>
					<ul class="dropdown-menu dropdown-menu-right dropdown-danger">
						<li class="dropdown-header" href="#pk">settings</li> 	
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#pk">login</a>
						<a class="dropdown-item" href="#pk">join</a>
					</ul> 
					</div> -->
					<div class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#pk" role="button" aria-haspopup="true" aria-expanded="true"><i class="nc-icon nc-settings-gear-65" aria-hidden="true"></i></a>
	                    <ul class="dropdown-menu dropdown-menu-right dropdown-danger">
	                        <li class="dropdown-header" href="#pk">login or join</li>
	                        <div class="dropdown-divider"></div>
	                        <a class="dropdown-item" href="#pk">login </a>
	                        <a class="dropdown-item" href="#pk">join</a>
	                    </ul>
                    </div>
                    
                    
                    
					<li class="nav-item"><a class="nav-link" href="${root}/member/logout">&nbsp;&nbsp;&nbsp;&nbsp;
					<i class="nc-icon nc-user-run" aria-hidden="true"></i></a></li>
				</c:if>
			</ul>
		</div>			
	</div>
</nav>
