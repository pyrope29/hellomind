<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>

<style>
.img-col {
	width: 130px;
	height: 130px; pull-left;
	border-radius: 50% !important;
}

.col-name {
	color: black;
	margin-left: 50px;
}
.btn-col{
	margin-top:6; 
	height:30px; 
	font-size: 12px; 
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
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<%-- 
<nav class="navbar-transparent" color-on-scroll="500">
			<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="${root}/member/login">소개</li>
			</ul>
</nav>
	 --%>
	
	
	<!-- <div class="nav-tabs-navigation col-md-12" style="margin-top:50px;">
         <div class="nav-tabs-wrapper">
             <ul id="tabs" class="nav nav-tabs" role="tablist">
                 <li class="nav-item">
                     <a class="nav-link" data-toggle="tab" href="#home" role="tab" aria-expanded="false">Home</a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-link active" data-toggle="tab" href="#profile" role="tab" aria-expanded="true">Profile</a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-link" data-toggle="tab" href="#messages" role="tab" aria-expanded="false">Messages</a>
                 </li>
             </ul>
         </div>
     </div> -->
    <!--  <div class="nav-tabs-navigation col-md-12" style="margin:50 0 15 0">
         <div class="nav-tabs-wrapper">
             <ul id="tabs" class="nav nav-tabs" role="tablist">
                 <li class="nav-item row">
						<i class="nc-icon nc-zoom-split" aria-hidden="true"> </i>
						<input type="text" class="form-control" placeholder="상담사를 검색하세요">
                 </li>
             </ul>
         </div>  
     </div> -->
                            
	<div class="wrapper">
		<div class="page-header section-dark" style="background-image: url('${root}/resources/img/counselling1.jpg')">
			<div class="content-center col-md-8" style="background-color: #ffffffc4; height: 1000px">
				<div class="col-md-10 ml-auto mr-auto container" style="margin-top: 100px;">
					<div class="row">
						<div class="col-md-3" style="margin-top:20px;">
							<img src="${root}/resources/img/faces/joe-gardner-2.jpg" alt="Circle Image" 
							class="img-no-padding img-responsive img-col">
						</div>	
						<div class="col-md-9">
							<div class="col-name row">
								<div class="col-md-4"><h4 style="margin:10 0; text-align:center;">이주영</h4></div>
								<btn class="btn-col col-md-2 btn-round">
								<i class="nc-icon nc-favourite-28" aria-hidden="true">&nbsp;&nbsp;후기
									25 &nbsp;&nbsp;</i></btn>  &nbsp;&nbsp;
									<btn class="btn-info btn-round col-md-2 btn-col" 
									onclick="location.href='${root}/col/viewColDet'">더보기</btn>
							</div>
							<h6 style="color:red; margin: 10 0 0 30;">2급 상담사</h6><br/>
								<div class="col-md-12">
									<p>An artist of considerable range, Jane Faker — the name
										taken by Melbourne-raised, Brooklyn-ba Faker — the name taken by
										Melbourne-raised</p>
								</div>
						</div>
					</div></br></br>

					
				
				
						<div class="row">
						<div class="col-md-3" style="margin-top:20px;">
							<img src="${root}/resources/img/faces/joe-gardner-2.jpg" alt="Circle Image" 
							class="img-no-padding img-responsive img-col">
						</div>	
						<div class="col-md-9">
							<div class="col-name row">
								<div class="col-md-4"><h4 style="margin:10 0; text-align:center;">이주영</h4></div>
								<btn class="btn-col col-md-2 btn-round">
								<i class="nc-icon nc-favourite-28" aria-hidden="true"></i>&nbsp;&nbsp;후기
									25 &nbsp;&nbsp;</btn>  &nbsp;&nbsp;
									<btn class="btn-info btn-round col-md-2 btn-col">더보기</btn>
							</div>
							<h6 style="color:red; margin: 10 0 0 30;">2급 상담사</h6><br/>
								<div class="col-md-12">
									<p>An artist of considerable range, Jane Faker — the name
										taken by Melbourne-raised, Brooklyn-ba Faker — the name taken by
										Melbourne-raised</p>
								</div>
						</div>
					</div></br></br>
							<div class="row">
						<div class="col-md-3" style="margin-top:20px;">
							<img src="${root}/resources/img/faces/joe-gardner-2.jpg" alt="Circle Image" 
							class="img-no-padding img-responsive img-col">
						</div>	
						<div class="col-md-9">
							<div class="col-name row">
								<div class="col-md-4"><h4 style="margin:10 0; text-align:center;">이주영</h4></div>
								<btn class="btn-col col-md-2 btn-round">
								<i class="nc-icon nc-favourite-28" aria-hidden="true"></i>&nbsp;&nbsp;후기
									25 &nbsp;&nbsp;</btn>  &nbsp;&nbsp;
									<btn class="btn-info btn-round col-md-2 btn-col">더보기</btn>
							</div>
							<h6 style="color:red; margin: 10 0 0 30;">2급 상담사</h6><br/>
								<div class="col-md-12">
									<p>An artist of considerable range, Jane Faker — the name
										taken by Melbourne-raised, Brooklyn-ba Faker — the name taken by
										Melbourne-raised</p>
								</div>
						</div>
					</div></br></br>
							<div class="row">
						<div class="col-md-3" style="margin-top:20px;">
							<img src="${root}/resources/img/faces/joe-gardner-2.jpg" alt="Circle Image" 
							class="img-no-padding img-responsive img-col">
						</div>	
						<div class="col-md-9">
							<div class="col-name row">
								<div class="col-md-4"><h4 style="margin:10 0; text-align:center;">이주영</h4></div>
								<btn class="btn-col col-md-2 btn-round">
								<i class="nc-icon nc-favourite-28" aria-hidden="true"></i>&nbsp;&nbsp;후기
									25 &nbsp;&nbsp;</btn>  &nbsp;&nbsp;
									<btn class="btn-info btn-round col-md-2 btn-col">더보기</btn>
							</div>
							<h6 style="color:red; margin: 10 0 0 30;">2급 상담사</h6><br/>
								<div class="col-md-12">
									<p>An artist of considerable range, Jane Faker — the name
										taken by Melbourne-raised, Brooklyn-ba Faker — the name taken by
										Melbourne-raised</p>
								</div>
						</div>
					</div><br/><br/>
				
					<nav class="container" style="text-align:center;">
						<ul class="pagination">
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
					</nav>
				</div>
			</div>
		</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>