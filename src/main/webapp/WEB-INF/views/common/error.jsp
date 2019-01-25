<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta charset="UTF-8">
    <link rel="icon" type="image/png" href="${root}/resources/img/favicon.ico">
    <link rel="apple-touch-icon" sizes="76x76" href="${root}/resources/img/apple-icon.png">

	<link href="${root}/resources/css/sweetalert.css" rel="stylesheet">
	<script src="${root}/resources/js/sweetalert.min.js"></script>
    <!-- Bootstrap core CSS     -->
	<link href="${root}/resources/css/bootstrap.min.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700' rel='stylesheet' type='text/css'>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href="${root}/resources/css/nucleo-icons.css" rel="stylesheet" />
	    
	<!-- Core JS Files -->
	<script src="${root}/resources/js/jquery-3.2.1.js" type="text/javascript"></script>
	<script src="${root}/resources/js/jquery-ui-1.12.1.custom.min.js" type="text/javascript"></script>
	

<script type="text/javascript">
	$(function(){
		swal({
	    title:"${msg}",
	     type:"error",
	     confirmButtonClass: "btn-error"
	  },function(){
			location.href="${url}";
		})
	})
</script>
