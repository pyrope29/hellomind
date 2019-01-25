<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/public.jsp"%>
 <link href="${root}/resources/css/semantic.min.css" rel="stylesheet">
<style>
#chat_box {
    width: 800px;
    min-width: 800px;
    height: 500px;
    min-height: 500px;
    border: 1px solid black;
}
#msg {
    width: 700px;
}
#msg_process {
    width: 90px;
}



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
	height: 35em;
	overflow: auto;
	background-color:#ababab3b;
}
#dataInput{
	width:800px;
	overflow: auto;
	margin-right:30px;
}
.chatBox{
	width: 300px;
    height: 50;
    margin-left: 20px;
    padding: 20;
    background-color:white;
	border: 1px solid rgba(0,0,0,.15);
    color: rgba(0,0,0,.8);
    border-radius: .2857rem;
}
.chatBtn{
	margin-left:20px;
}
.chatBoxes{
	margin:5px;

}
</style>
</head>
<body>

	<div class="container">
		<div id="cardbox" class="ui blue fluid card">
		
		<div class="content section-dark">
				<div class="left floated author">
					<img id="iconImage" class="ui avatar image"
						src="${root}/resources/img/upload/pic/pic_1.jpg">
				</div>
				<div>
					<div id="titleText" class="header"><h2> HELLO, MIND 상담</h2></div>
					<div id="contentsText" class="description"> Hello, Mind 상담 페이지에 접속하셨습니다.</div>
				</div>
			</div>
		 	
		 		<!-- 결과 표시 -->
			<h4 class="ui horizontal divider header">메시지</h4>
			<div class="ui segment" id="result"></div>
		 	
		 	<!-- 전송하기 -->
			<div>
				<div class="description">
					
					<!-- <div class="ui input">
						<input type="hidden" id="senderInput" value="${id}" /> -->
					<!-- </div> -->
			<!--	</div>
		 		<div class="description">
					<span>받는사람 아이디 :</span>
					<div class="ui input">
						<input type="text" id="recepientInput" value="ALL" />
					</div>
				</div> 
				<div class="description">-->
					<!-- <span>메시지 데이터 :</span> -->
					<div class="ui input">
						<input type="text" id="dataInput" value=""/>
						 <button class="btn btn-primary" type="button" id="sendButton">전송하기</button>&nbsp;&nbsp;
						 <button class="btn btn-default" type="button" id="clearButton">내역 삭제</button>
					</div>
				</div>
			</div>
			<br>
		</div>
	</div>
    <script src="http://localhost:3000/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script>

	function print(data) {
		console.log(data);
		$('#result').append('<p>' + data + '<p>');
	}
    
	function println(data) {
		console.log(data);
		$('#result').append('<div class="chatBox">' + data + '</div>');
	}
	$(function(){
		
		
		//아랫줄 무의미!!!
		var sender = "${sender}";
		var recepient = "${recepient}";
		
		  var host = "localhost";
			var port = '3000';

	           	var options = {'forceNew':true};
	           	var url = 'http://' + host + ':' + port;
	           	var socket = io.connect(url, options);

	           	
	           	
	           	
	           	
	           	
	           	
	           	
	       
	           	
	           	socket.on('connect', function() {  
	           			print('연결이 시작되었습니다');
	           			
	           			
	           			 	//*****************여기를 채워야함!!
	           		/* 	var sender = "";
	           			var recepient = ""; */
	           			var output = {id:sender/* , recepient:recepient */};
	               		console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
	               		
	               		 
	               		
	               	    socket.on('message', function(message) {
	                       	console.log('메시지를 창에 추가합니다. ' + JSON.stringify(message));
							
	                       	
	                        $('#result').append('<div class="row chatBoxes"><button type="button" class="chatBtn btn btn-danger btn-round">'
	        	         			+'<i class="nc-icon nc-chat-33"></i></button>'
	        	         		    +'<div class="chatBox">' + 
	        	         		    '<p>수신 메시지 : ' + message.sender + ', ' + message.recepient + ', ' + message.command + ', ' + message.data + '</p>'
	        	         		    + '</div></div>');
	        	         		    
	        	         		    
	        	         		    
	                       	//println('<p>수신 메시지 : ' + message.sender + ', ' + message.recepient + ', ' + message.command + ', ' + message.data + '</p>');
	       	            });
	       	
	       	            socket.on('response', function(response) {
	       	            	console.log(JSON.stringify(response));
	       	            	
	       	            	
	       	             $('#result').append('<div class="row chatBoxes"><button type="button" class="chatBtn btn btn-danger btn-round">'
	     	         			+'<i class="nc-icon nc-chat-33"></i></button>'
	     	         		    +'<div class="chatBox">' + 
	     	         		     '응답 메시지를 받았습니다. : ' + response.command + ', ' + response.code + ', ' +  response.message 
	     	         		    + '</div></div>');
	       	             
	       	             
	       	             
	       	            	//println('응답 메시지를 받았습니다. : ' + response.command + ', ' + response.code + ', ' + response.message);
	       	            });
	       	            
	       	       

	       	        socket.on('disconnect', function() {
	       	        	
	       	        	//여기서 mysql과 연결, chat db에 insert한다
	       	        	
	       	        	println('웹소켓 연결이 종료되었습니다.');
	       	        	
	       	        });
	       	        
	       	        
	       	        

	                	socket.emit('login', output);
	                	
	                	
	                  	
	           		 $("#dataInput").keydown(function(key){
	         	        //해당하는 키가 엔터키(13) 일떄
	         	        if(key.keyCode == 13){
	         	            //msg_process를 클릭해준다.
	         	             $("#sendButton").click();
	         	        }
	         	    });
	         	    
	         	    //msg_process를 클릭할 때
	         	    $("#sendButton").click(function(){
	         	    	
	         	    
	                	var data = $('#dataInput').val();

	              		var output = {sender:sender, recepient:recepient, command:'chat', type:'text', data:data};
	                	console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

	               		if (socket == undefined) {
	                 		alert('서버에 연결되어 있지 않습니다.');
	               			return;
	                 	}

	               		 socket.emit('message', output); 
	               		 
    					//DELETE 예쩡
	         	       // socket.emit("send_msg", $("#dataInput").val()); 
	               		 
	         	        $("#dataInput").val("");
	         	    });
	         	    
	         	    
	         /* 		 //DELETE 예쩡
	         	    socket.on('message', function(msg) {
	       	        //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
	         		  $('#result').append('<div class="row chatBoxes"><button type="button" class="chatBtn btn btn-danger btn-round">'
	         			+'<i class="nc-icon nc-chat-33"></i></button>'
	         		    +'<div class="chatBox">' + msg + '</div></div>');
	       	   		 });   */
	   	             
	   	        });

	   	        socket.on('disconnect', function() {
	   	        	print('연결이 종료되었습니다.');
	   	        });

	   	        
	   	     $("#clearButton").bind('click', function(event) {
	            	$("#result").html('');
	            });
	  
	});
	</script>
</body>
</html>


