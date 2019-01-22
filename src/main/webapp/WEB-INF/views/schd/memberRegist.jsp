<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.small-font{
	font-size:0.8em;
}

.acc-content{
    width: 250px;
    height: 170px;
    padding: 20px;
}

.item{
	margin-top:5px;
}

.ui-datepicker {
	font-size: 12px;
	width: 430px;
	height: 330px;
}

.ui-datepicker select.ui-datepicker-month {
	width: 70%;
	font-size: 11px;
}

.ui-datepicker select.ui-datepicker-year {
	width: 70%;
	font-size: 11px;
}

.ui-datepicker table {
	width: 100%;
	height: 280;
	font-size: 1.5em;
}

.ui-datepicker .ui-datepicker-title {
	line-height: 3em;
}

#alternate {
	width: 200;
	height: 200;
	margin-top: 60;
	border-radius: 100px;
	font-size: 1.5em;
}

.nc-calendar-60::before {
	font-size: 3em;
}

.time-list .form-check {
	margin-left: 30px;
}

.radio-list {
	margin-left: 30px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="wrapper">
		<div class="page-header section-dark"
			style="background-image: url('${root}/resources/img/counselling2.jpg')">
			<div class="content-center col-md-8"
				style="background-color: #ffffffc4; height: 1000px">
				<div class="col-md-10 ml-auto mr-auto container"
					style="margin-top: 100px;">
					<div class="col-md-12">
						<div class="tim-title">
							<h3>상담 예약</h3>
						</div>
						<p>날짜를 선택해 주세요
						<p>
						<div class="row">
							<div class="col-md-8">
								<div id="datepicker"></div>
							</div>
							<div class="col-md-3">
								<input type="button" class="btn btn-danger btn-just-icon"
									id="alternate" value="">
								<!-- 	<i class="nc-icon nc-calendar-60" id="icon"></i> -->
							</div> 
						</div>
					</div>
					<br />
<!-- 							<br />
			<div class="col-md-12">
						<div class="tim-title">
							<h5>안내 사항</h5>
						</div>
						<ul>
							<li>원활한 상담을 위해 시간을 준수해 주세요</li>
							<li>채팅 내용은 절대 기록되지 않습니다.</li>
						</ul>
					</div> -->
					<br/>
					<div class="container time-list">
						<p>시간을 선택해 주세요</p>
	                    	<div class="row ">
	                    	<div class="radio-box"></div>
					</div>
							<button type="button" onclick="registSchd();"
							class="btn btn-lg btn-warning btn-danger pull-right col-md-2">예약 완료
						</button>
				</div>
			</div>
		</div>
	</div>
</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	
	function registSchd(){
		var date= $("#datepicker").val();
		var time= $("input[name=time]:checked").val();
		var cId= "${cId}";
		console.log("${root}/schd/registChat?date="+date+"&time="+time);

		location.href="${root}/schd/registChat?cId="+cId+"&date="+date+"&time="+time;
	}
	var multiList="${multiList}";
	var dateList="${dateList}";

	function toJavascript(array){
		array=array.replace("[", "").replace("]", "");
		var temp = new Array();
		temp = array.split(",");
		var avail = [];
		
	    for(var i = 0; i < temp.length; i++){
		    avail.push(temp[i].trim().substr(0, 10));
	    }
	    return avail;
	}

		$(function() {	
			var jsonMultiList = JSON.parse('${jsonMultiList}');
			console.log(jsonMultiList[0][dateList]);
		
			/* console.log(jsonMultiList[0]['2019-01-23']); */
	
		/* 	console.log(toJavascript(dateList) + "\n" + toJavascript2(multiList)); */
	 		var availableDates = toJavascript(dateList);
	 		
			$.datepicker.setDefaults({
				monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12' ],
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] ,
				dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
				minDate : "+1D",
				maxDate : "+14D"
			});


			function available(date) {
				var thismonth = date.getMonth() + 1;
				var thisday = date.getDate();

				if (thismonth < 10) {
					thismonth = "0" + thismonth;
				}
				if (thisday < 10) {
					thisday = "0" + thisday;
				}

				ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;

				if ($.inArray(ymd, availableDates) >= 0) {
					return [ true, "", "" ];
				} else {
					return [ false, "", "" ];
				}
			}

			$('#datepicker').datepicker({
				altFormat : "d, MM, yy",
				altField : "#alternate",
				dateFormat : "yy-mm-dd",
				regional : "ko",
				beforeShowDay : available
			});
			
			$('#datepicker').change(function() {
					console.log( "%%%%%%%%%%%%%%%%%%%%%" + availableDates + "%%%%%%%%%%%%%%%%%%%%%");
		 			console.log($('#datepicker').val());
		 			var timeValue;
		 			for(var i in jsonMultiList){
		 				timeValue =  jsonMultiList[i][$('#datepicker').val()];
		 				if(timeValue != null){
		 					console.log(timeValue);
		 					$('.radio-box').empty();
		 					for(var j in timeValue){
		 						$('.radio-box').append('<div class="form-check"><label class="form-check-label">'
									+'<input class="form-check-input" name="time" type="radio"' 
									+'value="' + timeValue[j] + '"> '
									+ timeValue[j] + ' : 0 0 ~ '+ timeValue[j] + ' : 5 0'
									+'</label></div>');
		 					}
		 				}
		 			}
			}); 
		});
</script>