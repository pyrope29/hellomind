var app = require('express')();

var http = require('http').Server(app);
var http2 = require('http');
var io = require('socket.io')(http);

var cron = require('node-cron');
/* 노드의 시간을 톰캣에 전달하기 */
require('date-utils');
var newDate = new Date();
var dateTime = newDate.toFormat('YYYY-MM-DD HH24:MI:SS')

var bodyParser = require('body-parser');

// 전달하고자 하는 데이터 생성

var opts = {
    host: '127.0.0.1',
    port: 8090,
    method: 'POST',
    path: '/start',
    headers: {'Content-type': 'application/json'},
    body: {"dateTime" : dateTime}
};

var resData = '';
var req = http2.request(opts, function(res) {

    res.on('end', function() {
        console.log(resData);
    });
});

opts.headers['Content-Type'] = 'application/x-www-form-urlencoded';
req.data = opts;
opts.headers['Content-Length'] = req.data.length;

req.on('error', function(err) {
    console.log("에러 발생 : " + err.message);
});

app.use(bodyParser.urlencoded({extended: false}));

app.use(bodyParser.json());
app.use(function (req,res,next) {
    console.log("node 3000번 경로에 접속 중입니다");

    res.writeHead('200',{'Content-Type':'text/html;charset=utf8'});
    res.end('<h1>node 3000번 경로에 접속 중입니다.</h1>');
    console.log(req.body);

});

// 요청 전송
req.write(JSON.stringify(req.data.body));

req.end();



var login_ids = {};

io.on('connection', function (socket) {
	console.log('현재 시각 : ' + dateTime);
    console.log('한명의 유저가 접속을 했습니다.');
    
    
	console.log('connection info :', socket.request.connection._peername);

    // 소켓 객체에 클라이언트 Host, Port 정보 속성으로 추가
    socket.remoteAddress = socket.request.connection._peername.address;
    socket.remotePort = socket.request.connection._peername.port;
    
    
    
    
    
    
    
    
    
    // 'login' 이벤트를 받았을 때의 처리		//여기서 접속 이벤트를 받는다. login에서 id 2개를 받을것 TODO
    socket.on('login', function(login) {		//var login = {mId:mId, cId:cId};
    	console.log('login 이벤트를 받았습니다.');
    	console.dir(login);

        // 기존 클라이언트 ID가 없으면 클라이언트 ID를 맵에 추가
        console.log('접속한 소켓의 ID : ' + socket.id);
        login_ids[login.id] = socket.id;
        socket.login_id = login.id;
        
        //console.log("login_ids", login_ids);
        console.log("socket.login_id", socket.login_id);
        console.log('접속한 클라이언트 ID 갯수 : %d', Object.keys(login_ids).length);

        // 응답 메시지 전송
        sendResponse(socket, 'login', '200', login.id+'님이 입장하셨습니다.');
    });
  
    
    socket.on('disconnect', function () {
        console.log('접속 해제를 했습니다!!');
    });	
 
    
    
    //DELETE 예쩡
    
  /*  socket.on('send_msg', function (msg) {
        //콘솔로 출력을 한다.
        console.log(msg);
        //다시, 소켓을 통해 이벤트를 전송한다.
        io.emit('send_msg', msg);
    });

*/


// 'message' 이벤트를 받았을 때의 처리
	socket.on('message', function(message) {
		console.log('message 이벤트를 받았습니다.');
		console.dir(message);
		
	
	    	// 일대일 채팅 대상에게 메시지 전달
	    	if (login_ids[message.recepient]) { 
	    		io.sockets.connected[login_ids[message.recepient]].emit('message', message);
	    		
	    		// 응답 메시지 전송
	            sendResponse(socket, 'message', '200', '메시지를 전송했습니다.');
	    	} else {
	    		// 응답 메시지 전송
	            sendResponse(socket, 'login', '404', '상대방의 ID를 찾을 수 없습니다.');
	    	}
	    
	});

});
http.listen(3000, function () {
    console.log('listening on *:3000');
});



//응답 메시지 전송 메소드
function sendResponse(socket, command, code, message) {
	var statusObj = {command: command, code: code, message: message};
	socket.emit('response', statusObj);
}

