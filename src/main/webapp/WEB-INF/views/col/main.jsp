<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<%@ include file="/WEB-INF/views/include/colHeader.jsp"%>   

<div class="wrapper">
	<div class="page-header section-dark"
		style="background-image: url('${root}/resources/img/counselling2.jpg')">
		<div class="content-center">
			<div class="container">
				<div class="title-brand">
					<h1 class="main-font presentation-title" id="h1">hello mind<br/>상담사 전용 페이지</h1>
				</div><br/>
				<h2 class="main-font presentation-subtitle" style="text-align:right" id="h2"> ____<br><br/><br/>Hello, Mind를 통해 
				<br/><br/>언제 어디서나 안정적인 상담환경을 제공해 보세요.</h2><br/>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>   
<script>
$(function(){
    $(".main-font").css("display", "none");
    $("#h1").fadeIn(400); 
    $("#h2").fadeIn(2000);
    $("#h3").fadeIn(4000);
});
</script> 
