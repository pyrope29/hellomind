<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ko">
<head>
<meta charset="UTF-8">
    <link rel="icon" type="image/png" href="${root}/resources/img/favicon.ico">
    <link rel="apple-touch-icon" sizes="76x76" href="${root}/resources/img/apple-icon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>hello mind</title>


<link href="${root}/resources/css/sweetalert.css" rel="stylesheet">
<script src="${root}/resources/js/sweetalert.min.js"></script>

<%-- <link href="${root}/resources/img/favicon.ico" rel="shortcut icon"> --%>

<%-- <link href="${root}/resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${root}/resources/css/bootstrap.css" rel="stylesheet">
<link href="${root}/resources/css/sweetalert.css" rel="stylesheet">
<link href="${root}/resources/css/public.css" rel="stylesheet">

<script src="${root}/resources/js/jquery.min.js"></script>
<script src="${root}/resources/js/bootstrap.js"></script>
<script src="${root}/resources/js/sweetalert.min.js"></script> --%>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
	<link href="${root}/resources/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${root}/resources/css/paper-kit.css" rel="stylesheet"/>
	<link href="${root}/resources/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700' rel='stylesheet' type='text/css'>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href="${root}/resources/css/nucleo-icons.css" rel="stylesheet" />
	    
	
	
	<!-- Core JS Files -->
	<script src="${root}/resources/js/jquery-3.2.1.js" type="text/javascript"></script>
	<script src="${root}/resources/js/jquery-ui-1.12.1.custom.min.js" type="text/javascript"></script>
	<script src="${root}/resources/js/popper.js" type="text/javascript"></script>
	<script src="${root}/resources/js/bootstrap.min.js" type="text/javascript"></script>
	
	<!-- Switches -->
	<script src="${root}/resources/js/bootstrap-switch.min.js"></script>
	
	<!--  Plugins for Slider -->
	<script src="${root}/resources/js/nouislider.js"></script>
	
	<!--  Plugins for DateTimePicker -->
	<script src="${root}/resources/js/moment.min.js"></script>
	<script src="${root}/resources/js/bootstrap-datetimepicker.min.js"></script>
	
	<!--  Paper Kit Initialization and functons -->
	<script src="${root}/resources/js/paper-kit.js?v=2.1.0"></script>

