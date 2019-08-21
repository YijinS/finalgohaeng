package com.jscb.gohaeng.websocket;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class websocket extends TextWebSocketHandler{
	//클라이언트들 관리. 복수 연결 (연결 - 데이터 전송 - 종료)메소르
	
	//웹 소켓 세션을 저장할 리스트 생성
	//전체 세팅
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(websocket.class);
	
	//1. 클라이언트와 연결 된 후 해당 클라이언트 정보를 가져와 연결확인 작업. 
	//접속한 클라이언트 세션을 세션 저장 리스트에 add()로 추가
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//맵을 쓸때 방법: sessions.put(session.getId(), session);
		//List쓸 때 방법
		sessionList.add(session);
		
		//세션값 불러오기. 0번째 중괄호에 session.getId()넣기
		logger.info("{} 연결됨", session.getId());
		
		//session값을 가지고db등의 작업을 하면 채팅 참여 사용자 정보 리스트 구현이 가능하다. 
		System.out.println("채팅방 입장자: " + session.getId());
		
		//WebSocketSession을 매개변수로 받고 클라이언트 연결 후 해당 클라이언트의 정보를 가져와 연결확인 작업을 한다. 
		//접속한 클라이언트의 세션을 세션 저장 리스트에 add()로 추가한다. 
		
	}
	
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        //0번째에 session.getId() 1번째에 message.getPayload() 넣음
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        //logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});
        
        //연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
        //getPrincipal()를 이용해서 세션에 물려있는 유저의 정보를 불러온다.세션의 정보는 User를 이용한것과 동일하다.//
        for(WebSocketSession sess : sessionList){
        	sess.sendMessage(new TextMessage(session.getId()+ "|" + message.getPayload()));
        }
     
    }
	
	
	
	//연결된 모든 사용자에게 보내야 하므로 for문으로 세션리스트에 있는 모든 세션들을 돌면서 sendMessage()를 이용해 데이터를 주고 받는다
	//3. 클라이언트와 연결이 끊어진 경우
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		//List 삭제
		sessionList.remove(session);
		
		//Map 삭제
		//session.remove(session.getId());
		
		logger.info("{} 연결 끊김", session.getId());
		System.out.println("채팅방 퇴장자" + session.getId());
	}
	
	
	
	

}
