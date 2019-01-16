<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>   
<script>
var pageViewCount = 10;
var pageNum = 0;
var entList = JSON.parse('${entList}');
var keyword2 = '${keyword2}';
$(function() {
	appendEntList(entList, pageNum, pageViewCount);
	pageNum ++;
	/* 무한 스크롤 코딩*/
	$(document).scroll(function() {
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();

		if (maxHeight <= currentScroll + 1) {
				appendEntList(entList, pageNum, pageViewCount);
				pageNum ++;
		}

	})
	$(window).scroll(function() {
			 if ($(this).scrollTop() > 500) {
					 $('.move-top').fadeIn();
			 } else {
					 $('.move-top').fadeOut();
			 }
	 });

	 $(".move-top").click(function() {
			 $('html, body').animate({
					 scrollTop : 0
			 }, 400);
			 return false;
	 });
});
</script>


	<button type="button" class="btn btn-default move-top" >
		<span class="glyphicon glyphicon-chevron-up" aria-hidden="true">TOP</span>
	</button>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>   

