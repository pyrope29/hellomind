<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="wrapper">
	<div class="page-header page-header-xs" data-parallax="true"
		style="background-image: url('${root}/resources/img/counselling1.jpg')">
	</div>
	<div class="section profile-content">
		<div class="container">
			<div class="row">
				<div class="col-md-6 ml-auto mr-auto">		
					<div class="name">
					<h5 class="title" style="margin:15 0"><i class="nc-icon nc-settings-gear-65" aria-hidden="true"></i> 내 비밀번호 수정</h5>
					<blockquote class="blockquote" style="text-align:left">
                        <p class="description">헬로 마인드에 가입된 내 비밀번호를 수정할 수 있는 페이지입니다</p>
                    </blockquote>
                </div>
			<br/><br/>
					<form class="settings-form" method="post" action="${root}/member/modifyPw">
						<div class="form-group">
							<label>기존 비밀번호</label> <input type="password" 
								class="form-control border-input" placeholder="기존 비밀번호를 입력해 주세요"  name="originPw" id="originPw">
						</div>
						<div class="form-group">
							<label>새 비밀번호</label> <input type="password" 
								class="form-control border-input" placeholder="새 비밀번호를 입력해 주세요"  name="newPw" id="newPw">
						</div>
						<div class="form-group">
							<label>새 비밀번호 확인</label> <input type="password" 
								class="form-control border-input" placeholder="새 비밀번호를 확인해 주세요"  name="mPw" id="mPw">
						</div>
						<br/>
						<div class="pull-right">
							<button type="submit" class="btn btn-info btn-round">수정하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
