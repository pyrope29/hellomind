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
	width: 150;
	height: 150;
	margin-top: 60;
	border-radius: 100px;
	font-size: 1.5em;
}

.nc-calendar-60::before {
	font-size: 3em;
}

.time-list {
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
							<div class="col-md-8">
								<div id="datepicker"></div>
							</div>
							<div class="col-md-3">
								<input type="button" class="btn btn-warning btn-just-icon"
									id="alternate" value="">
								<!-- 	<i class="nc-icon nc-calendar-60" id="icon"></i> -->
							</div> 
						</div>
					</div>
					<br />
					<br />
					<%-- 				<c:if test="${schdNum==null}">
					<div class="col-md-12">
						<div class="tim-title">
							<h5>안내 사항</h5>
						</div>
						<ul>
							<li>원활한 상담을 위해 시간을 준수해 주세요</li>
							<li>채팅 내용은 절대 기록되지 않습니다.</li>
						</ul>
					</div>
				</c:if>
				<c:if test="${schdNum=!null}"> --%>
					<!-- <div class="schedule-info">
							<h5>안내 사항</h5>
						<ul>
							<li>원활한 상담을 위해 시간을 준수해 주세요</li>
							<li>채팅 내용은 절대 기록되지 않습니다.</li>
						</ul>
					</div> -->
					
					<div class="container time-list">
						<p>시간을 선택해 주세요</p><br/>
						<div class="row">
						 	<div class="form-check col-md-4">
	                               <label class="form-check-label">
	                                   <input class="form-check-input" name="time" type="checkbox" value="09:00:00">
	                                   AM 09:00 ~ 09:50
	                                   <span class="form-check-sign"></span>
	                               </label>
	                         </div>
	                         <div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="10:00:00">
	                                    AM 10:00 ~ 10:50
	                                    <span class="form-check-sign"></span>
	                                </label>
	                            </div>
	                         <div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="11:00:00">
	                                    AM 11:00 ~ 11:50
	                                    <span class="form-check-sign"></span>
	                                </label>
	                            </div>
                          </div>
						<div class="row">
						 	<div class="form-check col-md-4">
	                               <label class="form-check-label">
	                                   <input class="form-check-input" name="time" type="checkbox" value="12:00:00">
	                                   PM 12:00 ~ 12:50
	                                   <span class="form-check-sign"></span>
	                               </label>
	                         </div>
	                         <div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="13:00:00">
	                                    PM 13:00 ~ 13:50
	                                    <span class="form-check-sign"></span>
	                                </label>
	                            </div>
	                         <div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="14:00:00">
	                                    PM 14:00 ~ 14:50
	                                    <span class="form-check-sign"></span>
	                                </label>
	                            </div>
                          </div><div class="row">
						 	<div class="form-check col-md-4">
	                               <label class="form-check-label">
	                                   <input class="form-check-input" name="time" type="checkbox" value="15:00:00">
	                                   PM 15:00 ~ 15:50
	                                   <span class="form-check-sign"></span>
	                               </label>
	                         </div>
	                         <div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="16:00:00">
	                                    PM 16:00 ~ 16:50
	                                    <span class="form-check-sign"></span>
	                                </label>
	                            </div>
	                         <div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="17:00:00">
	                                    PM 17:00 ~ 17:50
	                                    <span class="form-check-sign"></span>
	                                </label>
	                            </div>
                          </div>
                            <div class="row">
						 	<div class="form-check col-md-4">
	                               <label class="form-check-label">
	                                   <input class="form-check-input" name="time" type="checkbox" value="18:00:00">
	                                   PM 18:00 ~ 18:50
	                                   <span class="form-check-sign"></span>
	                               </label>
	                         </div>
	                         <div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="19:00:00">
	                                    PM 19:00 ~ 19:50
	                                    <span class="form-check-sign"></span>
	                                </label>
	                            </div>
	                         <div class="form-check col-md-4">
	                                <label class="form-check-label">
	                                    <input class="form-check-input" name="time" type="checkbox" value="20:00:00">
	                                    PM 20:00 ~ 20:50
	                                    <span class="form-check-sign"></span>
	                                </label>
	                            </div>
                          </div>        
					</div>
						<br />
						<button type="button" onclick="dateTimeFunc();"
							class="btn btn-lg btn-warning btn-round pull-right">예약 완료
						</button>
					</div>
				</div>
			</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	function dateTimeFunc(){
		var dateTime = $("#datepicker").val() + " "+ $("input[name=time]:checked").val();
		location.href="${root}/schd/registSchd?dateTime="+dateTime;
	}
	
	function toJavascript(){
	    var array="${availableDates}";
	    array=array.replace("[", "");
	    array=array.replace("]", "");
	    return array.split(",");
	}
		$(function() {		/* availableTime */
			/* var avail = [];
			avail.push("111");
			avail.push("222");
			console.log(avail);
	 		alert( "${availableDates}");
	 		console.log(availableDates); */
	 		
	 		/* console.log();
	 		var availableDates = ["2019-01-18","2019-01-25"];
	 		console.log(availableDates);
	 		 

	 		var avail = [];
	 		
	 		 for ( var i in toJavascript() ) {
	 	        avail.push(toJavascript()[i]);
	 	        console.log(avail);
	 	      }
	 		 
	 		var availableDates = avail;
	 		*/
	 		
	 		var availableDates = ["2019-01-18","2019-01-25","2019-01-29"];
	 		
	 		
			$.datepicker.setDefaults({
				monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
						'9', '10', '11', '12' ] //달력의 월 부분 텍스트
				,
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
				,
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
				,
				dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ] //
				,
				minDate : "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
				,
				maxDate : "+14D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                   
			});

			//선택가능 날짜  배열로 가져오기(DB에서)

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
		});

		$('#datepicker').change(function() {
			$('#datepicker').datepicker({
				altField : "#alternate"
			});
		});

</script>