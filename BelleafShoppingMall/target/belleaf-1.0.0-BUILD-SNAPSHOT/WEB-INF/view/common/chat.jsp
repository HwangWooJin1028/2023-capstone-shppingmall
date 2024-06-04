<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/chat.css?after">
<script type="text/javascript">

$(document).ready(function() {
	$("#user_chat_message").on("keyup", evnetPressEnterKey);//엔터키
})

function evnetPressEnterKey(key){
	if(key.keyCode==13) {//엔터
		chattingGPT();
	}
}
function chattingGPT() {
	// user가 보내고자 하는 message 값을 얻은 뒤, 화면에 출력
	var message = $('#user_chat_message').val();
	if(message != '') {
		printUserMessage(message);
		clearTextInput();
		
		sendUserMessage(message);
	}
}
// user가 보내고자 하는 메세지를 ajax를 통해 openai에 보낸다.
function sendUserMessage(message) {
	$.ajax({
		type: "POST",
		url: "${pageContext.request.contextPath}/chat",
		data: {"message": message,
	        "type": 2},
        beforeSend:function() {//엔터와 전송버튼 비활성화
        	$("#send-btn").attr("disabled", true);
        	$("#user_chat_message").off("keyup");
        },
		success: function(data) {
			$("#send-btn").attr("disabled", false);
			$("#user_chat_message").on("keyup", evnetPressEnterKey);
			printBotMessasge(data); //받은 결과값을 출력
		},
		error: function(jqXHR, textStatus, errorThrown) {
			$("#send-btn").attr("disabled", false);
			$("#user_chat_message").on("keyup", evnetPressEnterKey);
			alert("죄송합니다. 다시한번 보내주세요");
		}
	});
}
// User가 보내고자 하는 메세지를 화면에 출력한다.
function printUserMessage(message) {
	const now = new Date();	// 현재 날짜 및 시간
	const h = String(now.getHours()).padStart(2,"0");
	const m = String(now.getMinutes()).padStart(2,"0");
	const nowTime = h + ":" + m;
	$('#chat-content').append('<div class="float-right"><div class="d-flex flex-row p-3"><div class="bg-white mr-2 p-3"><span class="text-muted">'+ message +'</span></div><img src="https://img.icons8.com/color/48/000000/circled-user-male-skin-type-7.png" width="30" height="30"></div></div><div class="floatClearClass"></div>');
}
// bot이 출력하고자 하는 메세지를 화면에 출력한다.
function printBotMessasge(message) {
	const now = new Date();	// 현재 날짜 및 시간
	const h = String(now.getHours()).padStart(2,"0");
	const m = String(now.getMinutes()).padStart(2,"0");
	const nowTime = h + ":" + m;
	$('#chat-content').append('<div class="float-left"><div class="d-flex flex-row p-3"><img src="https://img.icons8.com/color/48/000000/circled-user-female-skin-type-7.png" width="30" height="30"><div class="chat ml-2 p-3"><span class="text-muted dot">'+message+'</span></div></div></div><div class="floatClearClass"></div>');
}
// User가 보낸 메세지를 화면에 출력한 후, Input 내에 있는 문자를 지운다.
function clearTextInput() {
	$('#user_chat_message').val('');
}

</script>

</head>
<body>
<div class="d-flex justify-content-center" id="chat_window_1">
	  <div class="card">
	    <div class="d-flex flex-row justify-content-between p-3 adiv text-white">
	      <i class="fas fa-chevron-left"></i>
	      <span class="pb-3">Chatting</span>
	    </div>
	      
	      <div id="chat-content" class="ps-container">
	      <!--  
		      <div class="d-flex flex-row p-3">
		        <img src="https://img.icons8.com/color/48/000000/circled-user-female-skin-type-7.png" width="30" height="30">
		        <div class="chat ml-2 p-3">Hello and thankyou for visiting birdlymind. Please click the video above</div>
		      </div>
		
		      <div class="d-flex flex-row p-3">
		        <div class="bg-white mr-2 p-3"><span class="text-muted">rdlynind.</span></div>
		        <img src="https://img.icons8.com/color/48/000000/circled-user-male-skin-type-7.png" width="30" height="30">
		      </div>
		      
		      
		      
		      <div class="d-flex flex-row p-3">
		        <img src="https://img.icons8.com/color/48/000000/circled-user-female-skin-type-7.png" width="30" height="30">
		        <div class="chat ml-2 p-3"><span class="text-muted dot">. . .</span></div>
		      </div>-->
	      </div>

	      <div class="form-group px-3" style="border-top: 1px solid #E2E2E2;padding-top: 1rem;">
	        <div class="input-group" >
					
				<textarea id="user_chat_message" class="form-control type_msg" placeholder="Type your message..."></textarea>
				<div class="input-group-append">
					<span id="send-btn" class="input-group-text send_btn" onclick="chattingGPT()"><i class="fas fa-location-arrow"></i></span>
				</div>
			</div>
	      </div>
	  </div>
	</div>
</body>
</html>