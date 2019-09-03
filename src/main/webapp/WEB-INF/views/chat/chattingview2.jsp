<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

.alert.alert-warning{
    background-color: #fff363;
    border-color: #eff255;
}

.alert.alert-info{
   background-color: #5aabffad;
    border-color: #3b68b9;
}

.alert.sessionid{

	 border-color: black;
}

.container-fluid1{
text-align: center;


}


.well{
	background: #5aabffad;

}

.well1{

	background: yellow;
}
</style>

<link rel="icon" type="image/png" href="resources/images/svnicon.png" />
<!-- favicon fix -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery, bootstrap CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> 
<!-- msie 문제 해결 -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> <!-- 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- Zebra-Dialog CDN -->
<script src="resources/js/zebra_dialog.src.js"></script>
<link rel="stylesheet" href="resources/css/zebra_dialog.css" type="text/css" />
<!-- SocketJS CDN -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

<title>Chatting page</title>
</head>

<body>
   <div class="container-fluid1">
      <h2>채팅방 (id: ${userid})</h2>
   </div>
<!--       <div>
         <input type="button" id="chattinglistbtn" value="채팅 참여자 리스트">
      </div> -->
      <br>
      <div>
         <div class="well" id="chatdata">
            <!-- User Session Info Hidden -->
             <input type="hidden" value='${userid}' id="sessionuserid">
             <input type="hidden" value='${name}' id="sessionname">
         </div><br>
         <div class="fixed-bottom">
            <input type="text" id="message" style="height:60px; width: 300px;" /> 
            <input type="button" id="sendBtn" value="전송" />
         </div>
      </div>
</body>
<!-- <script type="text/javascript">
$(function(){
   $("#chattinglistbtn").click(function(){
      var infodialog = new $.Zebra_Dialog('<strong>Message:</strong><br><br><p>채팅방 참여자 리스트</p>',{
         title: 'Chatting List',
         type: 'confirmation',
         print: false,
         width: 260,
         buttons: ['닫기'],
         onClose: function(caption){
            if(caption == '닫기'){
               //alert('yes click');
            }
         }
      });
    });
});
</script> -->

<script type="text/javascript">

//websocket을 지정한 URL로 연결
var sock= new SockJS("<c:url value="/echo"/>");
sock.onopen = onOpen;
//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
sock.onmessage = onMessage;
//websocket 과 연결을 끊고 싶을때 실행하는 메소드
sock.onclose = onClose;
$(function(){
   $("#message").focus();
   
   $("#sendBtn").click(function(){
      console.log('send message...');
        sendMessage();
        $('#message').val('');
        $("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
        $("#message").focus();
    });
   
   $("#message").keypress(function() {
      var keycode = (event.keyCode ? event.keyCode : event.which);
      if(keycode == '13') {
         console.log('send message...');
         sendMessage();
         $('#message').val('');
         $("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
         $("#message").focus();
      }
   });
  
});

function onOpen(evt) {
   /* $("#chatdata").append("연결 됨."); */
   alert("(관리자/사용자)와의 채팅이 연결되었습니다");
}
        
function sendMessage(){      
   //websocket으로 메시지를 보내겠다.
   console.log("sendMessage() 실행");
   sock.send($("#message").val());/* 
   sock.send($("#sessionuserid").val()); */
}
            
//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt){  //변수 안에 function자체를 넣음.
   var data = evt.data;
   var sessionName = null;
   var message = null;
   var sessionId = null;
   $(".container-fluid1").html("");
   
   console.log("data : " + data);
   //문자열을 splite//
   var strArray = data.split('|');
   
   for(var i=0; i<strArray.length; i++){
      console.log('str['+i+']: ' + strArray[i]);
   }
   
   //current session id//
   var currentuser_session = $('#sessionuserid').val();
   
   var currentuser_name = $('#sessionname').val();
   console.log('current session id: ' + currentuser_session);
   console.log('current session name: ' + currentuser_name);
   
   sessionName = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
   console.log("sessionName : " + sessionName);
   message = strArray[1]; //현재 메세지를 저장//
   console.log("message : " + message);
   sessionId = strArray[2];
   console.log("sessionId : " + sessionId);
   
   //나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
   if(sessionId == currentuser_session){
      var printHTML = "<div class='well1'>";
		      printHTML += "<div class='alert alert-info'>";
		      printHTML += "<strong>["+sessionName+"] : "+message+"</strong>";
		      printHTML += "</div>";
		      printHTML += "</div>";
	    
      
		      $("#chatdata").append(printHTML);
		      $("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
      
   }else if(currentuser_session == 'ADMIN'){
	 		 var printHTML = "<div class='well'>";
	         printHTML += "<div class='alert sessionid'>";
			 printHTML += "<strong>["+sessionName+"] : "+message+"</strong>";
			 printHTML += "</div>";
			 printHTML += "</div>";
			 
			 $("#chatdata").append(printHTML);
			 $("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
			  
   }else if(sessionId != currentuser_session){
		      var printHTML = "<div class='well1'>";
		      printHTML += "<div class='alert alert-warning'>";
		      printHTML += "<strong>["+sessionName+"] -> "+message+"</strong>";
		      printHTML += "</div>";
		      printHTML += "</div>";
		      
		      $("#chatdata").append(printHTML);
		      $("#chatdata").scrollTop($("#chatdata")[0].scrollHeight);
	   } 
   
   
   $(".container-fluid1").append('<h2>채팅방 (id: '+ currentuser_session + '/'+sessionName+')</h2>'); 
 
   console.log('chatting data: ' + data);
}
    
function onClose(evt){
    alert("(관리자/사용자)와의 채팅이 연결이 끊겼습니다");
}    
</script>
</html>