<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
</head>
<body>
    <div class="wrapper">
        <div class="page-header" style="background-image: url('${root}/resources/img/counselling1.jpg');">
            <div class="filter"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 ml-auto mr-auto">
                            <div class="card card-register">
                                <h3 class="title" style="color:white"><i class="nc-icon nc-single-02" aria-hidden="true"></i>&nbsp;&nbsp;로그인</h3>
                                <form class="register-form" method="post" action="${root}/member/login">
                                    <label>아이디</label>
                                    <input type="text" class="form-control" placeholder="아이디를 입력해 주세요" name="mId" id="id">
                                    <label>비밀번호</label>
                                    <input type="password" class="form-control" placeholder="비밀번호를 입력해 주세요" name="mPw" id="pw">
                                	<input class="btn btn-outline-danger btn-block btn-round" type="submit" 
									 value="로그인">
                                </form>
                            	<hr>
                               <div class="row pull-right" style="margin-top:10px">
                               		 <input class="btn btn-outline-danger btn-round" style="width:150px; margin:0" value="회원가입" onclick="location.href='${root}/member/join'">&nbsp;&nbsp;
                               		 <input class="btn btn-default btn-round" style="width:150px; margin:0" onclick="location.href='${root}/member/findPw'"value="비밀번호 찾기">
                                </div>
                            </div>
                        </div>
                    </div>
           	  </div>
     	  </div>
   	 </div>
</body>
</html>