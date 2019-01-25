var http = require('http');
var express = require('express');
var pool = require('./dbConnect');
var bodyParser = require('body-parser');

//Socket.IO 사용
var socketio = require('socket.io');
app = express();

var inputData = { inputData1 : 'node to tomcat testdata1', inputData2 : 'node to tomcat testdata2'};
// 전달하고자 하는 데이터 생성

var opts = {
    host: 'localhost',
    port: 8090,
    method: 'POST',
    path: '/start',
    headers: {'Content-type': 'application/json'},
    body: inputData
};

// 포트 81 에서는 톰캣 서버가 대기하고 있다.
// 스프링 컨트롤러에서 '/start' URI 에 매핑하는 메소드를 두었다.
// 전달 방식은 json 형태로 하였다.
var resData = 'this is resData';
var req = http.request(opts, function(res) {

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
// 요청 전송
req.write(JSON.stringify(req.data.body));
req.end();
var server = http.createServer(function(request,response){
    response.writeHead(200,{'Content-Type':'text/html'});
    response.end('Hello node.js!!');		//eclipse console에 찍힌다.
});
server.listen(3000, function(){
    console.log('Server is running...');	//cmd console에 찍힌다.
});

