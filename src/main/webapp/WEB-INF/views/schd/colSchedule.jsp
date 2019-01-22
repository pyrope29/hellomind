<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
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

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/colHeader.jsp"%>
	<div class="wrapper">
		<div class="page-header section-dark"
			style="background-image: url('${root}/resources/img/counselling2.jpg')">
			<div class="content-center col-md-8"
				style="background-color: #ffffffc4; height: 1000px">
				<div class="col-md-10 ml-auto mr-auto container"
					style="margin-top: 100px;">
					<div class="col-md-12">
						<div class="tim-title">
							<h3>상담 관리</h3>
						</div>
						<p>날짜를 선택해 주세요
						<p>
						<div class="row">
							<div class="col-md-7">
								<div id="datepicker"></div>
							</div>
							<div class="col-md-4">
								<input type="button" class="btn btn-warning btn-just-icon"
									id="alternate" value="">
								<!-- 	<i class="nc-icon nc-calendar-60" id="icon"></i> -->
							</div> 
						</div>
					</div>
					<br />
					<br />
					<div class="container time-list">
						<p>시간을 선택해 주세요</p>
	                    	<div class="row">
	                    	<c:forEach begin="9" end="15" var="i">
		                    	<div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="${i}">
	                                     ${i} : 0 0 ~ ${i} : 5 0
	                                    <span class="form-check-sign"></span>
	                                </label>
		                          </div>
		                     </c:forEach>
		                     <c:forEach begin="16" end="22" var="i">    
		                         <div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="${i}">
	                                     ${i} : 0 0 ~ ${i} : 5 0
	                                    <span class="form-check-sign"></span>
	                                </label>
		                          </div>
		                    </c:forEach>
	                         </div> 

							<button type="button" onclick="registSchd();"
								class="btn btn-lg btn-warning btn-round pull-right col-md-2">예약 완료
							</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	
	var dtList;
	
	function registSchd(){
		var date= $("#datepicker").val();
		var time= new Array();
		
		$("input[name=time]:checked").each(function() {
			time.push($(this).val());
			console.log(time);
		});
		
		/* 
		$("input[name=time]:checked").each(function() {
			time += $(this).val();
			console.log($(this).val());
		});
		
		location.href="${root}/schd/registSchd?date="+date+"&time="+time; */
		location.href="${root}/schd/registSchd?date="+date+"&time="+time;
	}
		//날짜값, 날짜와 시간 값 String으로 받아와 배열로 변형	
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
	
	
	function toJavascript2(array){
		array = array.substring(2, array.length-2);
		
		var temp = new Array();
		temp = array.split("},"); 
		var avail = [];
	    for(var i = 0; i < temp.length; i++){
		    avail.push(temp[i].trim().replace("{","").replace("}",""));
	    }
	    
	    console.log("avail"+ avail);
	    return avail;
	}
	
	function toJavascript3(array){
		
        var idx = array.indexOf("["); 
        var idx2 = array.indexOf("]"); 

        var array = array.substring(idx+1,idx2);

		var temp = new Array();
		temp = array.split(",");
		var avail = [];
		
	    for(var i = 0; i < temp.length; i++){
		    avail.push(temp[i].trim().substr(0, 2));
	    }
	    
	    console.log("avail3"+ avail);
	    return avail;
	}
	
	var multiList2 = toJavascript2(multiList);
	
		$(function() {		
			console.log(toJavascript(dateList) + "\n" + toJavascript2(multiList));
	 		//var availableDates = toJavascript(dateList);
		
			$.datepicker.setDefaults({
				monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12' ],
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] ,
				dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
				minDate : "+1D",
				maxDate : "+14D"
			});


		/* 	function available(date) {
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
			} */

			$('#datepicker').datepicker({
				altFormat : "d, MM, yy",
				altField : "#alternate",
				dateFormat : "yy-mm-dd",
				regional : "ko"
				//beforeShowDay : available
			});
		});
 
		$('#datepicker').change(function() {
			$('.form-check-input').prop("checked", false);
			for(var i in multiList2){
				if((multiList2[i].substr(0,10))==$("#datepicker").val()){
					dtList = toJavascript3(multiList2[i]);
					for(var j in dtList){
						console.log("j :" + dtList[j]);
						
						$('input:checkbox[name="time"]:input[value="'  +dtList[j]+ '"]').prop("checked", true);
					}
				}
			}
		}); 
</script>