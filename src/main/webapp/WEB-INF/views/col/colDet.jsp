<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<script>
    function fnMove(seq){
        var offset = $(".section" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>
<style>
.img-col {
	width: 180px;
	height: 180px; pull-left;
	border-radius: 50% !important;
}
.col-name {
	color: black;
	margin-left: 50px;
}
.btn-col{
	margin-top:6; 
	height:40px; 
	font-size: 15px; 
	box-sizing: border-box;
    border-width: 2px;
    font-weight: 600;
    padding: 0.5rem 0px;
    line-height: 1.75;
    cursor: pointer;
    text-transform: uppercase;
    background-color: #66615B;
    border-color: #66615B;
    color: #FFFFFF;
    opacity: 1;
    text-align:center;
}
 
 .col-box{
 	 box-sizing: border-box;
    border: 3px solid #dddddd;
    padding:20px;
 }
 
 .col-review-box{
 	 box-sizing: border-box;
    border: 1px solid #dddddd;
    padding:15px;
 }
 .ul-career li{
 	margin-bottom:15;
 }
</style>

</head>
<body>	 
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- 	<div class="nav-tabs-navigation navbar-expand-md fixed-top navbar-transparent" style="margin-top:70px;">
         <div class="nav-tabs-wrapper navbar-nav">
             <ul id="tabs" class="nav nav-tabs" role="tablist">
                 <li class="nav-item" style="margin-right:60px">
                     <a class="nav-link" data-toggle="tab" onclick="fnMove('1')" role="tab" aria-expanded="false">소 개</a>
                 </li>
                 <li class="nav-item" style="margin-right:60px">
                     <a class="nav-link" data-toggle="tab" onclick="fnMove('2')" role="tab" aria-expanded="true">경 력</a>
                 </li>
                 <li class="nav-item" style="margin-right:60px">
                     <a class="nav-link" data-toggle="tab" onclick="fnMove('3')" role="tab" aria-expanded="false">후 기</a>
                 </li>
             </ul>
         </div>
     </div>  -->
                            
	<div class="wrapper">
		<div class="page-header section-dark" style="min-height:0; background-image: url('${root}/resources/img/counselling5.jpg')">
			<div class="content-center col-md-8" style="background-color: #fffffff1;">
				<div class="col-md-10 ml-auto mr-auto" style="margin-top: 100px;">
					<div class="container">
						<div class="row">
							<div class="col-md-4" style="margin-top:20px;">
								<img src="${root}/resources/img/upload/pic/pic_2.jpg" alt="Circle Image" 
								class="img-no-padding img-responsive img-col">
							</div>	
							<div class="col-md-8" style="margin-top:50px;">
								<div class="col-name row">
									<div class="col-md-5"><h2 style="margin:10 0; text-align:center;">이주영</h2></div>
									<btn class="btn-col col-md-3 btn-round" onclick="fnMove('3')">
									<i class="nc-icon nc-favourite-28" aria-hidden="true">&nbsp;후기
										3 &nbsp;</i></btn> 
								</div>
								<div class="row">
									<div class="col-md-5">
									<h4 style="color:red; margin: 10 0; text-align:center;">예비 상담사</h4><br/></div>
									<btn class="btn-success col-md-5 btn-col btn-round btn-lg" 
										onclick="location.href='${root}/schd/memberRegist?cId=${cId}'">예약하러 가기</btn>
								</div>
							</div>
						</div>
					</div>
					<br/><br/>
					<div class="container col-box">
						<h4 style="margin-left:30px;" class="section1"> 소 개 </h4><br/>
							 <div class="col-md-12">
								<p> 살아가는 것이 유독 힘들 때가 있습니다. '주변 사람들이 태평하고 즐겁게 하루를 사는 것 같은데 나는 왜 아닐까?'<br/>
									50회 이상의 임상 심리 전문 치료 경험과 70회 이상의 무료 봉사. 이처럼 준비된 상담사에게 한번 기대보는 것은 어떨까요?<br/>
									경희대 심리대학원을 졸업, 5년 이상을 함께 해 온 저에게 한번 맡겨보세요
								</p>
							</div>
					</div>
				</div>
			</div>
		</div>
			
			
		<div class="page-header section-dark" style="min-height:0; background-image: url('${root}/resources/img/counselling5.jpg')">
			<div class="content-center col-md-8" style="background-color: #fffffff1;">
				<div class="col-md-10 ml-auto mr-auto">
					
					<div class="container col-box">
						<h4 style="margin-left:30px;" class="section2"> 경 력 </h4><br/>
							<ul class="ul-career">
								<li>한국임상심리협회 임상심리 전문가</li>
								<li>여성가족부 청소년 상담사 2급</li>
								<li>보건복지부 정신보건 임상심리사</li>
								<li>정신보건 임상심리사</li>
								<li>상담 100회 이상</li>
							</ul>
					</div>
					<div class="container col-box">
						<h4 style="margin-left:30px;" class="section3"> 후 기 </h4><br/>
						
						 	<div class="container col-review-box">
								<div class="col-md-6"><h6><i class="nc-icon nc-chat-33"></i> ID: test1234</h6></div>
								<div class="col-md-12">
									처음이라 어색했는데 잘 들어주시고 뭔가 변화되고 있는 것 같아 좋았어요~!!!
								</div>
							</div>
							<div class="container col-review-box">
								<div class="col-md-6"><h6><i class="nc-icon nc-chat-33"></i> ID: test14</h6></div>
								<div class="col-md-12">
									안좋은 일이 연이어 겹치던 도중 찾은 사이트입니다 지인추천 받아서 왓어요
								</div>
							</div>
							<div class="container col-review-box">
								<div class="col-md-6"><h6><i class="nc-icon nc-chat-33"></i> ID: tester</h6></div>
								<div class="col-md-12">
									test
								</div>
							</div>
					
						<br/><br/>
						<div class="container col-md-offset-4">
							<ul class="pagination" style="justify-content: center;">
			                    <li class="page-item">
			                        <a class="page-link" href="#" aria-label="Previous">
			                            <i class="fa fa-angle-left" aria-hidden="true"></i>
			                            <span class="sr-only">Previous</span>
			                        </a>
			                    </li>
			                    <li class="page-item"><a class="page-link" href="#">1</a></li>
			                    <li class="page-item"><a class="page-link" href="#">2</a></li>
			                    <li class="page-item"><a class="page-link" href="#">3</a></li>
			                    <li class="page-item"><a class="page-link" href="#">4</a></li>
			                    <li class="page-item"><a class="page-link" href="#">5</a></li>
			                    <li class="page-item">
			                        <a class="page-link" href="#" aria-label="Next">
			                            <i class="fa fa-angle-right" aria-hidden="true"></i>
			                            <span class="sr-only">Next</span>
			                        </a>
			                    </li>
			                </ul>
						</div>
					</div>
					
					</div>
				</div>
			</div>
			
			
<%@ include file="/WEB-INF/views/include/footer.jsp"%>