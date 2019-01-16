<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<!-- 위의 import부터 %>까지 지우기 -->
<%-- <%
 MemberDto memberDto = new MemberDto();
memberDto.setmId("1111");
memberDto.setmPw("$2a$10$IwCqf5BKNEUfQKsB1eKxYuieK4eqQ2/X/j3FJmhDkgBR7XMnqfajq");
memberDto.setmEmail("test@dqwd.com");
memberDto.setmPnum("010-3123-1234");
memberDto.setmStats("0");
memberDto.setmRegdate("2019-01-16 14:16:08");
session.setAttribute("userInfo", memberDto); 
%> --%>

<script>
$(function(){
    $(".main-font").css("display", "none");
    $("#h1").fadeIn(400); 
    $("#h2").fadeIn(2000);
    $("#h3").fadeIn(4000);
});
</script> 

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>   

<div class="wrapper">
	<div class="page-header section-dark"
		style="background-image: url('${root}/resources/img/counselling1.jpg')">
		<div class="content-center">
			<div class="container">
				<div class="title-brand">
					<h1 class="main-font presentation-title" id="h1">hello mind</h1>
				</div>
				<h2 class="main-font presentation-subtitle" id="h2"> ____<br><br>hello,
					mind에 오신 걸 환영합니다.</h2>
				<h3 class="main-font presentation-subtitle" id="h3">인터넷으로 당신의 고민을 상담하세요</h3>	
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>   



			
			