<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<link href="${root}/resources/css/semantic.min.css" rel="stylesheet">
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

html {
	width: 100%;
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	color: #000;
	background-color: #fff;
}

.container {
	width: 100%;
	height: 100%;
	display: flex;
	flex-flow: column wrap;
	align-items: center;
	justify-content: center;
}

#cardbox {
	width: 94%;
	height: 94%;
	padding-left: 0.4em;
	padding-right: 0.4em;
}

#iconImage {
	display: inline;
}

#titleText {
	font-size: 1.4em;
	font-weight: bold;
	color: #777;
}

#contentsText {
	color: #999;
}

#result {
	height: 40em;
	overflow: auto;
	/* 	background: #d4d4d454; */
}

#dataInput {
	width: 800px;
	overflow: auto;
	margin-right: 30px;
}

.discussion {
	list-style: none;
	margin: 0;
	padding: 0;
}

.discussion li {
	padding: 0.5em;
	overflow: hidden;
	display: flex;
}

.discussion .avatar {
	width: 40px;
	position: relative;
}

.discussion .avatar img {
	display: block;
	width: 100%;
}

.other .avatar:after {
	content: "";
	position: absolute;
	top: 0;
	right: 0;
	width: 0;
	height: 0;
	border: 5px solid white;
	border-left-color: transparent;
	border-bottom-color: transparent;
}

.self {
	justify-content: flex-end;
	align-items: flex-end;
}

.self .messages {
	order: 1;
	border-bottom-right-radius: 0;
}

.self .avatar {
	order: 2;
}

.self .avatar:after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 0;
	height: 0;
	border: 5px solid white;
	border-right-color: transparent;
	border-top-color: transparent;
	box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
}

.messages {
	background: aliceblue;
	padding: 10px;
	border-radius: 2px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}

.messages p {
	font-size: 1.2em;
	margin: 0 0 0.2em 0;
}

.messages time {
	font-size: 0.7em;
	color: #ccc;
}
</style>
</head>
<body>
<!-- connect notification -->
<div class="alert alert-info alert-with-icon" data-notify="container" id="notification" style="display:none;">
   <div class="alert-wrapper">
       <button type="button" class="close" data-dismiss="alert" aria-label="Close">
           <i class="nc-icon nc-simple-remove"></i>
       </button>
       <div class="message"><i class="nc-icon nc-bell-55"></i> 헬로마인드 상담 채팅에 오신 걸 환영합니다.</div>
   </div>
 </div> 
 <!-- disconnect notification TODO-->
<div class="alert alert-error alert-with-icon" data-notify="container" id="notification2" style="display:none;">
   <div class="alert-wrapper">
       <button type="button" class="close" data-dismiss="alert" aria-label="Close">
           <i class="nc-icon nc-simple-remove"></i>
       </button>
       <div class="message"><i class="nc-icon nc-bell-55"></i> 상대방이 연결을 종료했습니다.</div>
   </div>
 </div> 
                
	<div class="container">
		<div id="cardbox" class="ui blue fluid card">

			<div class="content">
				<div class="left floated author">
					<img id="iconImage" class="ui avatar image"
						src="${root}/resources/img/upload/pic/pic_4.png">
				</div>
				<div>
					<div style="float:right; display:inline-block;">
						<button id="disconnectButton" type="button" class="btn btn-just-icon btn-outline-danger">
						<i class="nc-icon nc-simple-remove"></i></button>
					</div>
					<div id="titleText" class="header">
						<h2>HELLO, MIND 상담</h2>
					</div>
					<div id="contentsText" class="description">Hello, Mind 상담
						페이지에 접속하셨습니다.</div>
				</div>
			</div>

			<!-- 결과 표시 disconnectButton -->
			<h4 class="ui horizontal divider header">메시지</h4>
			<div class="ui segment" id="result">
				<div id="DisConnResult"></div>
				<ol class="discussion">
					<li class="self"></li>
					<li class="other"></li>

				</ol>
			</div>
			
			<!-- 전송하기 -->
			<div>
				<div class="description">
					<div class="ui input">
						<input type="text" id="dataInput" value="" />
						<button class="btn btn-primary" type="button" id="sendButton">전송하기</button>
						&nbsp;&nbsp;
						<button class="btn btn-default" type="button" id="clearButton">내역
							삭제</button>
					</div>
				</div>
			</div>
			<br>
		</div>
	</div>
	<script src="http://localhost:3000/socket.io/socket.io.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script>

	var sender = "${sender}";
	var recepient = "${recepient}";
	var dateTime = "${dateTime}";
	
	$(function(){
	
		  var host = "localhost";
			var port = '3000';

	           	var options = {'forceNew':true};
	           	var url = 'http://' + host + ':' + port;
	           	var socket = io.connect(url, options);

	           	socket.on('connect', function() {  
	           			//addConn(sender, " 님이 접속하셨습니다.");
	           			$("#notification").css("display", "block");
	     
	           			var output = {id:sender/* , recepient:recepient */};
	               		console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
	               		 
	               		socket.emit('login', output);
	               		
	               		 //채팅 보내고 받기
	               	    socket.on('message', function(message) {
	                       	console.log('메시지를 창에 추가합니다. ' + JSON.stringify(message));
	            
	                        addToDiscussion('other', message.data);
	                       	//println('<p>수신 메시지 : ' + message.sender + ', ' + message.recepient + ', ' + message.command + ', ' + message.data + '</p>');
	       	            });
	       	
	       	            socket.on('response', function(response) {
	       	            	console.log(JSON.stringify(response));
	       	            	//println('응답 메시지를 받았습니다. : ' + response.command + ', ' + response.code + ', ' + response.message);
	       	            });
	       	            

	       	        socket.on('disconnect', function() {
	       	        	
	       	        	window.history.go(-2);
	       	        	//여기서 mysql과 연결, chat db에 insert한다
	       	        	//addDisConn(sender, " 님이 접속을 종료했습니다.");
	       	        });
	       	        
	                	
	                  	
	           		 $("#dataInput").keydown(function(key){
	         	        if(key.keyCode == 13){
	         	             $("#sendButton").click();
	         	        }
	         	    });
	         	    
	         	    $("#sendButton").click(function(){
	                	var data = $('#dataInput').val();

	              		var output = {sender:sender, recepient:recepient, command:'chat', type:'text', data:data};
	                	console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

	               		if (socket == undefined) {
	                 		alert('서버에 연결되어 있지 않습니다.');
	               			return;
	                 	}

	               		 socket.emit('message', output); 
	               		 
	               		 addToDiscussion('self', data);
	         	        $("#dataInput").val("");
	         	    });
	   	        });

	           	
	   	        //채팅내역 삭제클릭
	   	     $("#clearButton").bind('click', function(event) {
	            	$("#result").html('');
	            });
	   	        
	   	        //연결끊기 버튼클릭
		   	  $("#disconnectButton").click(function() { 
		   		//mysql
		   		socket.disconnect();
		   	}); 
	   	        
	   	        //2019-01-2616:00:00.0
	   	      timerFunc(function(){
	   	    	  alert("상담 종료 시간까지 5분 남았습니다.")} , "${dateTime}")//20170331100000 인자로 넘겨주는 dateTime은 'yyyyMMddhhmiss"의 기본형
	  
	   	   setTimeout(timerFunc(), 5000);

	
	});
	
	  //파라미터의 String시간을 DateTime으로 변환
	 function timerFunc(func, dateTime){
		  
		 dateTime.replace("-","").replace(":","");
		  
	     var year = Number(dateTime.substring(0,4));
	     var month = Number(dateTime.substring(4,6));
	     var day = Number(dateTime.substring(6,8));
	     var time = Number(dateTime.substring(8,10));
	     var minute = Number(dateTime.substring(10,12));
	     var second = Number(dateTime.substring(12,14));
	  
	     var oprDate = new Date(year, month-1, day, time, minute, second); //동작을 원하는 시간의 Date 객체를 생성합니다.
	     var notifyDate = new Date();
	     notifyDate.setMinutes( oprDate.getMinutes() + 45);
	  
	     var timer = notifyDate.getMinues() - oprDate.getMinues(); //동작시간의 밀리세컨과 현재시간의 밀리세컨의 차이를 계산합니다.
	     if(timer < 0){ //타이머가 0보다 작으면 함수를 호출합니다.
	    	 return;
	     }else{
	        setTimeout(func, timer);
	     }
	 }
	

	function printConn(data) {
		console.log(data);
		$('#result').append('<p>' + data + '<p>');
	}
	
	function printDisconn(data) {
		console.log(data);
		$('#DisConnResult').append('<p>' + data + '<p>');
	} 
    
	function println(data) {
		console.log(data);
	}
	
	//채팅창에 출력
	function addToDiscussion(writer, msg) {
		println("addToDiscussion 호출됨 : " + writer + ", " + msg);
		
		var now = moment();
	
		var contents = "<li class='" + writer + "'>"
	      			 + "  <div class='messages'>"
	        		 + "    <p>" + msg + "</p>"
	        		 + "    <time datetime="
	        		 +		now.format('lll')
	        		 +		">"
	        		 +		now.format('lll')
	        		 +		"</time>"
	      			 + "  </div>"
	    			 + "</li>";
		
	    println("추가할 HTML : " + contents);
	    $(".discussion").prepend(contents);
	}
	
	//채팅창에 출력
	function addDisConn(writer, msg) {
		$('#DisConnResult').append('<p>' + writer + msg + '<p>');
	}
	//채팅창에 출력
	function addConn(writer, msg) {
		$('#result').append('<p>' + writer + msg + '<p>');
	}
	
	</script>
</body>
</html>


