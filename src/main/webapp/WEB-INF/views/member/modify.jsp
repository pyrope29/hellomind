<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="wrapper">
	<div class="page-header page-header-xs" data-parallax="true"
		style="background-image: url('${root}/resources/img/counselling1.jpg')">
		<div class="filter"></div>
	</div>
	<div class="section profile-content">
		<div class="container">
			<%-- <div class="owner">
				<div class="avatar">
					<img src="${root}/resources/img/faces/joe-gardner-2.jpg"
						alt="Circle Image"
						class="img-circle img-no-padding img-responsive">
				</div> --%>
			<div class="row">
				<div class="col-md-6 ml-auto mr-auto">		
					<div class="name">
					<h5 class="title" style="margin:15 0"><i class="nc-icon nc-settings-gear-65" aria-hidden="true"></i> 내 정보 수정</h5>
					<blockquote class="blockquote" style="text-align:left">
                        <p class="description">헬로 마인드에 가입된 내 정보를 수정할 수 있는 페이지입니다</p>
                    </blockquote>
                </div>
			<br/><br/>
					<form class="settings-form" method="post" action="${root}/member/modify">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
								 <label>아이디</label> <input type="text" class="form-control border-input" value="${mId}" readonly>
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
								 <label>가입일</label> <input type="text" class="form-control border-input" value="${mRegdate}" readonly>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>이메일</label> <input type="text" value="${mEmail}"
								class="form-control border-input" placeholder="이메일을 입력해 주세요"  name="mEmail" id="mEmail">
						</div>
						<div class="form-group">
							<label>전화번호</label> <input type="text" value="${mPnum}"
								class="form-control border-input" placeholder="전화번호  (입력 예: 010-1234-5678)" name="mPnum" id="mPnum">
						</div>
						<br/>
						<div class="pull-right">
							<button type="submit" class="btn btn-info btn-round"> 수정하기</button>
							<button type="button" class="btn btn-danger btn-round">탈퇴하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
