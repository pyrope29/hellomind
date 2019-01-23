<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>소켓 서버</title>
    </head>
    <body>
    
        <script src="http://localhost:3000/hellomind/chat.html"></script>
		<script src="${root}/resources/js/jquery-3.2.1.js" type="text/javascript"></script>
        
        <script>
            $(document).ready(function(){
                var socket = io("http://localhost:3000/hellomind/chat.html");
            });
        </script>
    </body>
</html>


