<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html,
body {
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
    font-family: sans-serif;
    background: #1c1e22;
}
body {
  display: flex;
  align-items: center;
  justify-content: center;
    flex-direction: column;
}
::-webkit-scrollbar {
  width: 4px;
}
::-webkit-scrollbar-thumb {
  background-color: #4c4c6a;
  border-radius: 2px;
}
.chatbox {
    width: 300px;
    height: 400px;
    max-height: 400px;
    display: flex;
    flex-direction: column;
    overflow: hidden;
    box-shadow: 0 0 4px rgba(0,0,0,.14),0 4px 8px rgba(0,0,0,.28);
}
.chat-window {
    flex: auto;
    max-height: calc(100% - 60px);
    background: #2f323b;
    overflow: auto;
}
.chat-input {
    flex: 0 0 auto;
    height: 60px;
    background: #40434e;
    border-top: 1px solid #2671ff;
    box-shadow: 0 0 4px rgba(0,0,0,.14),0 4px 8px rgba(0,0,0,.28);
}
.chat-input input {
    height: 59px;
    line-height: 60px;
    outline: 0 none;
    border: none;
    width: calc(100% - 60px);
    color: white;
    text-indent: 10px;
    font-size: 12pt;
    padding: 0;
    background: #40434e;
}
.chat-input button {
    float: right;
    outline: 0 none;
    border: none;
    background: rgba(255,255,255,.25);
    height: 40px;
    width: 40px;
    border-radius: 50%;
    padding: 2px 0 0 0;
    margin: 10px;
    transition: all 0.15s ease-in-out;
}
.chat-input input[good] + button {
    box-shadow: 0 0 2px rgba(0,0,0,.12),0 2px 4px rgba(0,0,0,.24);
    background: #2671ff;
}
.chat-input input[good] + button:hover {
    box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
}
.chat-input input[good] + button path {
    fill: white;
}
.msg-container {
    position: relative;
    display: inline-block;
    width: 100%;
    margin: 0 0 10px 0;
    padding: 0;
}
.msg-box {
    display: flex;
    background: #5b5e6c;
    padding: 10px 10px 0 10px;
    border-radius: 0 6px 6px 0;
    max-width: 80%;
    width: auto;
    float: left;
    box-shadow: 0 0 2px rgba(0,0,0,.12),0 2px 4px rgba(0,0,0,.24);
}
.user-img {
    display: inline-block;
    border-radius: 50%;
    height: 40px;
    width: 40px;
    background: #2671ff;
    margin: 0 10px 10px 0;
}
.flr {
    flex: 1 0 auto;
    display: flex;
    flex-direction: column;
    width: calc(100% - 50px);
}
.messages {
    flex: 1 0 auto;
}
.msg {
    display: inline-block;
    font-size: 11pt;
    line-height: 13pt;
    color: rgba(255,255,255,.7);
    margin: 0 0 4px 0;
}
.msg:first-of-type {
    margin-top: 8px;
}
.timestamp {
    color: rgba(0,0,0,.38);
    font-size: 8pt;
    margin-bottom: 10px;
}
.username {
    margin-right: 3px;
}
.posttime {
    margin-left: 3px;
}
.msg-self .msg-box {
    border-radius: 6px 0 0 6px;
    background: #2671ff;
    float: right;
}
.msg-self .user-img {
    margin: 0 0 10px 10px;
}
.msg-self .msg {
    text-align: right;
}
.msg-self .timestamp {
    text-align: right;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body>
	<section class="chatbox">
    <section class="chat-window" id="chatSession">
      <article class="msg-container msg-remote" id="msg-0">
        <div class="msg-box">
          <div class="flr">
            <div class="messages">
              <p class="msg" id="msg-0">
                하하하하
              </p>
            </div>
            <span class="timestamp"><span class="username">Name</span>&bull;<span class="posttime">3 minutes ago</span></span>
          </div>
        </div>
      </article>
      
      <article class="msg-container msg-self" id="msg-0">
        <div class="msg-box">
          <div class="flr">
            <div class="messages">
              <p class="msg" id="msg-1">
                메세지1
              </p>
            </div>
            <span class="timestamp"><span class="username">Name</span>&bull;<span class="posttime">2 minutes ago</span></span>
          </div>
        </div>
      </article>
    </section>
      <input type="text" autocomplete="on" placeholder="Type a message" id="message"/>
      <button id="send">
      	<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="rgba(0,0,0,.38)" d="M17,12L12,17V14H8V10H12V7L17,12M21,16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V7.5C3,7.12 3.21,6.79 3.53,6.62L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.79,6.79 21,7.12 21,7.5V16.5M12,4.15L5,8.09V15.91L12,19.85L19,15.91V8.09L12,4.15Z" /></svg>
      </button>
  </section>
  
  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
  <script>
	window.onload = () => {
		const roomCode  = '${roomCode}';
		const scroll = document.getElementsByClassName('chat-window');
		
		// webSocket connect
		const sockJs = new SockJS("${contextPath}/stomp/chat");
		const stomp = Stomp.over(sockJs);
		
		// connect 시
		stomp.connect({}, function (){
			console.log('connect');
			
			// subscribe 시
			stomp.subscribe("/sub/chat/room", function (chat) {
				const content = JSON.parse(chat.body);
				console.log(content.chatContent);
				
				let str = '<article class="msg-container msg-remote" id="msg-0">';
				str += '<div class="msg-box">';
				str += '<div class="flr">';
				str += '<div class="messages">';
				str += '<p class="msg" id="msg-0">';
				str += '<p class="msg" id="msg-1">'
				str += content.chatContent;
				str += '</p>';
				str += '</div>';
				str += '<span class="timestamp"><span class="username">Name</span>&bull;<span class="posttime">3 minutes ago</span></span>';
				str += '</div>';
				str += '</div>';
				str += '</article>';
				
				$("#chatSession").append(str);
				
				console.log($('#a'));
				
				$('#chatSession').scrollTop($('#chatSession')[0].scrollHeight);
			});
			
			// send 버튼 클릭시
			document.getElementById('send').addEventListener('click', () => {
				const message = document.getElementById('message');
				stomp.send('/pub/chat/message', {}, JSON.stringify({senderId: 'sender', chatContent: message.value}));
			});
			
			
		});
	}
  </script>
</body>
</html>