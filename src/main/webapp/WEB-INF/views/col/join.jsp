<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<style>
/* 	.col-join-form .form-group{
		margin-bottom: 3px;
		border-bottom: 1px dotted gray;
	} */
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/colHeader.jsp"%>
<!-- modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	    <div class="modal-content">
	        <div class="modal-header" >
	            <h5 class="modal-title text-center" id="ModalLabel"><i class="nc-icon nc-check-2"> 
	            	상담사 신청 전 아래의 내용을 확인해 주세요!</i></h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	            </button>
	        </div>
	        <div class="modal-body container"> 
	        	<div class="row">
					<div class="col-md-4">
					01. 심리상담 진행 관련 내용
					</div>
					<div class="divider"></div>
					<div class="col-md-8">
						내담자와 심리상담사는 Web에서 원하는 시간에 상담 진행 (태블릿 PC 가능)
					</div>
				</div> 
				<hr/>
				<div class="row">
					<div class="col-md-4">
					02. 지원 자격
					</div>
					<div class="divider"></div>
					<div class="col-md-8">
						(사)한국상담심리학회 상담심리사, (사)한국상담학회 전문상담사,여성가족부 청소년상담사 2급 이상<br/>
						 또는 (사)한국임상심리학회 임상심리전문가 자격증을 소지하신 분.<br/>
						심리대학원 졸업증명서 취득하고 준비 중이인 예비상담사 분.<br/>
					</div>
				</div> 
				<hr/>
				<div class="row">
					<div class="col-md-4">
					03. 상담사 등록 신청 방법
					</div>
					<div class="divider"></div>
					<div class="col-md-8">
						Web페이지에서 양식에 맞게 작성하고, 증명 서류 업로드.<br/>
						증명 서류 : 이력서 1부, 심리대학원 졸업증명서 혹은 각종 심리관련 자격증 사본.<br/>
					</div>
				</div> 
	        </div>
	        <div class="modal-footer">
	            <div>
	                <button type="button" class="btn btn-danger btn-link" data-dismiss="modal">닫기</button>
	            </div>
	        </div>
	    </div>
	</div>
</div>

<div class="wrapper">
	<div class="page-header page-header-xs" data-parallax="true"
		style="background-image: url('${root}/resources/img/counselling2.jpg')">
	</div>
	<div class="section profile-content">
		<div class="container">
			<div class="row">
				<div class="col-md-6 ml-auto mr-auto">		
					<div class="name">
					<h5 class="title" style="margin:15 0"> 상담사 가입 </h5>
					<blockquote class="blockquote" style="background-color: aliceblue; ">
                     	<p>01. 상담사 가입을 위한 기본 정보를 입력해 주세요</p>
                    </blockquote>
                </div>
			<br/><br/>
					<form class="col-join-form" method="post" action="${root}/col/join" enctype="Multipart/form-data">
						<div class="row"> 
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
								 <label>아이디</label> <input type="text" class="form-control border-input" placeholder="아이디를 입력해 주세요"
								 name="cId" id="id">
								</div>
							</div>
							<div class="col-md-6 col-sm-6">
								<div class="form-group">
								 <label>이름</label> <input type="text" class="form-control border-input" placeholder="이름을 입력해 주세요"
								 name="cName" id="name">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input type="password" 
								class="form-control border-input" placeholder="비밀번호를 입력해 주세요"  name="cPw" id="pw">
						</div>
						<div class="form-group">
							<label>비밀번호 확인</label> <input type="password" 
								class="form-control border-input" placeholder="비밀번호를 확인해 주세요"  name="cPwCheck" id="pwCheck">
						</div>
						<div class="form-group">
							<label>이메일</label> <input type="text"
								class="form-control border-input" placeholder="이메일을 입력해 주세요"  name="cEmail" id="email">
						</div>
						<div class="form-group">
							<label>전화번호</label> <input type="text" 
								class="form-control border-input" placeholder="전화번호를 입력해 주세요" name="cPnum" id="pnum">
						</div><br/>
						<blockquote class="blockquote" style="background-color: aliceblue">
	                     	<p class="description"> 02. 사용자들에게 보여지는 상담사 정보를 입력해 주세요</p>
	                    </blockquote>
	                    <br/><br/>
	                    <div class="row">
		                    <div class="form-check-radio col-md-3">
	                            <label class="form-check-label">
	                                <input class="form-check-input" type="radio" name="cLv" value="1" checked="">
	                                1급 상담사
	                                <span class="form-check-sign"></span>
	                            </label>
	                        </div>
                        	<div class="form-check-radio col-md-3">
	                            <label class="form-check-label">
	                                <input class="form-check-input" type="radio" name="cLv" value="2">
	                                2급 상담사
	                                <span class="form-check-sign"></span>
	                            </label>
	                        </div><div class="form-check-radio col-md-3">
	                            <label class="form-check-label">
	                                <input class="form-check-input" type="radio" name="cLv" value="3">
	                                                                예비 상담사
	                                <span class="form-check-sign"></span>
	                            </label>
	                        </div>
	                    </div>
	                   <br/><hr/>
                    	 <div class="row">
                    	 	<div class="col-md-2">
                    	 		사진
                    	 	</div>
                    	 	<div class="col-md-3">
                    	 		<div>
                                      <img src="${root}/resources/img/avatar_men.png" class="img-circle img-no-padding img-responsive" 
                                      alt="Rounded Image" id="previewAvatar" style="width:90px">
                                </div>
                    	 	</div>
                    	 	<div class="col-md-6">
                    	 		<div class="text-info small-font" style="font-size:0.8em">프로필 사진은 내담자에게 가장 먼저 보여집니다.</div>
                    	 		<div class="text-info small-font" style="font-size:0.8em">단정한 사진을 등록해 주세요.</div><br/>
                    	 		 <div class="row">
                    	 		 	<div class="col-md-4">
                    	 		 	<input type="file" name="pic" id="pic" class="btn btn-outline-info btn-sm" value="찾아보기">
                    	 		 	</div>
                    	 		 	<div class="col-md-8">
                    	 		 	<!-- <div class="small-font" style="font-size:0.8em">※ .jpg, .png, .gif<br>최소 300x300 업로드</div> -->
									</div>
                    	 		 </div>
                    	 		
                    	 	</div>
                    	 </div>
                    	 <br/><hr/>
                    	 <div class="row">
                    	 	<div class="col-md-5">
                    	 		증명 서류 등록
                    	 	</div>
                    	 	<div class="col-md-7">
                    	 		<div class="text-info small-font" style="font-size:0.8em">※ 상담사 자격증 및 기타 증명서를 등록해 주세요</div><br/>
                    	 		 	<input type="file" name="cert" id="cert" class="btn btn-outline-info btn-sm" value="찾아보기">
                    	 	</div>
                    	 </div>
                    	 <br/><hr/>
                    	 <div class="row">
                    	 	<div class="col-md-2">
                    	 		소개 문구
                    	 	</div>
                    	 	<div class="col-md-10">
                    	 		<textarea class="form-control" rows="8" placeholder="500자 이내로 입력해 주세요" name="intro"></textarea>
                    		</div>
                    	</div>
                    	<br/><hr/>
                    	<div class="row">
                    	 	<div class="col-md-2">
                    	 		경력 사항
                    	 	</div>
                    	 	<div class="col-md-10">
                    	 		<textarea class="form-control" rows="4" placeholder="100자 이내로 입력해 주세요" name="career"></textarea>
                    		</div>
                    	</div>
                    	<br/>
						<div class="pull-right">
							<button type="submit" class="btn btn-info"> 가입하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#myModal").modal("show");
	});
</script>
