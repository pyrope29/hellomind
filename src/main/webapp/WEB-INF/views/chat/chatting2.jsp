<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<!DOCTYPE html>
<link href="./semantic.min.css" rel="stylesheet">
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
	height: 10em;
	overflow: auto;
}
</style>
<script src="${root}/resources/socket.io/socket.io.js"></script>
<script src="${root}/resources/semantic.min.js"></script>

<script>
		// 문서 로딩 후 실행됨
		$(function() {
			var host = "localhost";
			var port = '3000';

               	var options = {'forceNew':true};
               	var url = 'http://' + host + ':' + port;
               	var socket = io.connect(url, options);

               	socket.on('connect', function() {
                      	println('웹소켓 서버에 연결되었습니다. : ' + url);

                       socket.on('message', function(message) {
                       	console.log('메시지를 창에 추가합니다. ' + JSON.stringify(message));

                       	println('<p>수신 메시지 : ' + message.sender + ', ' + message.recepient + ', ' + message.command + ', ' + message.data + '</p>');
       	            });
       	
       	            socket.on('response', function(response) {
       	            	console.log(JSON.stringify(response));
       	            	println('응답 메시지를 받았습니다. : ' + response.command + ', ' + response.code + ', ' + response.message);
       	            });
       	            
       	        });

       	        socket.on('disconnect', function() {
       	        	println('웹소켓 연결이 종료되었습니다.');
       	        });

			// 전송 버튼 클릭 시 처리
           /*  $("#sendButton").bind('click', function(event) {
            	var sender = $('#senderInput').val();
            	var recepient = $('#recepientInput').val();
            	var data = $('#dataInput').val();

          		var output = {sender:sender, recepient:recepient, command:'chat', type:'text', data:data};
            	console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

           		if (socket == undefined) {
             		alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
           			return;
             	}

           		socket.emit('message', output);
          	}); */

			// 파라미터로 아이디, pw 만들어주기!!
        /*     $("#loginButton").bind('click', function(event) {
            	var id = $('#id').val();
            	var password = $('#pw').val();

            	var output = {id:id, password:password};
           		console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

/*            		if (socket == undefined) {
            		alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
            		return;
           		}
 */
            	socket.emit('login', output);
            }); 
			
         	// 결과 지우기 버튼 클릭 시 처리
            $("#clearButton").bind('click', function(event) {
            	$("#result").html('');
            });

        });

    });  
		// 서버에 연결하는 함수 정의
     
           
		function println(data) {
			console.log(data);
			$('#result').append('<p>' + data + '</p>');
		}
	</script>
</head>
<body>

	<div class="container">

		<div id="cardbox" class="ui blue fluid card">
			<div class="content">
				<div class="left floated author">
					<img id="iconImage" class="ui avatar image"
						src="./images/author.png">
				</div>
				<div>
					<div id="titleText" class="header">일대일 채팅</div>
					<div id="contentsText" class="description">연결 및 로그인 후 메시지를
						보내세요.</div>
				</div>
			</div>

			<br>
			<!-- 연결하기		이부분 localhost-->
	<!-- 		<div>
				<div class="ui input">
					<input type="text" id="hostInput" value="localhost" />
				</div>
				<div class="ui input">
					<input type="text" id="portInput" value="3000" />
				</div>
				<br> <br> <input class="ui primary button" type="button"
					id="connectButton" value="연결하기" />
			</div> -->
			<br>
			<!-- 로그인/로그아웃 -->
			<div>
				<div class="ui input">
					<input type="text" id="id" value="test01" />
				</div>
				<div class="ui input">
					<input type="password" id="pw" value="123456" />
				</div>
				<br> <br> <input class="ui primary button" type="button"
					id="loginButton" value="로그인" /> <input class="ui primary button"
					type="button" id="logoutButton" value="로그아웃" />
			</div>
			<br>
			<!-- 전송하기 -->
			<div>
				<div class="description">
					<span>보내는사람 아이디 :</span>
					<div class="ui input">
						<input type="text" id="senderInput" value="test01" />
					</div>
				</div>
				<div class="description">
					<span>받는사람 아이디 :</span>
					<div class="ui input">
						<input type="text" id="recepientInput" value="ALL" />
					</div>
				</div>
				<div class="description">
					<span>메시지 데이터 :</span>
					<div class="ui input">
						<input type="text" id="dataInput" value="안녕!" />
					</div>
				</div>
				<br> <input class="ui primary button" type="button"
					id="sendButton" value="전송" /> <input class="ui primary button"
					type="button" id="clearButton" value="결과 지우기" />
			</div>
			<br>
			<!-- 결과 표시 -->
			<h4 class="ui horizontal divider header">메시지</h4>
			<div class="ui segment" id="result"></div>

		</div>

	</div>

</body>
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
<script src="${root}/resources/js/paper-kit.js"></script>

</html>
