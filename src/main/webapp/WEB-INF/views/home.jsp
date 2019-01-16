<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
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
</div>


			
			<!--  Plugins for Slider -->
			<script src="${root}/resources/js/nouislider.js"></script>
			
			<!--  Plugins for DateTimePicker -->
			<script src="${root}/resources/js/moment.min.js"></script>
			<script src="${root}/resources/js/bootstrap-datetimepicker.min.js"></script>
			
			<!--  Paper Kit Initialization snd functons -->
			<script src="${root}/resources/js/paper-kit.js"></script>
			
			
			<!-- Switches -->
			<script src="${root}/resources/js/bootstrap-switch.min.js"></script>
			
				<!-- Core JS Files -->
			<script src="${root}/resources/js/jquery-3.2.1.js" type="text/javascript"></script>
			<script src="${root}/resources/js/jquery-ui-1.12.1.custom.min.js" type="text/javascript"></script>
			<script src="${root}/resources/js/popper.js" type="text/javascript"></script>
			<script src="${root}/resources/js/bootstrap.min.js" type="text/javascript"></script>
