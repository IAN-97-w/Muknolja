package com.spring.muknolja.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.spring.muknolja.chat.model.vo.ChatMessage;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatController {
	private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달

    //Client가 SEND할 수 있는 경로
    //stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
    //"/pub/chat/enter"
    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessage message){
    	System.out.println("gegetWriter : " + message.getSenderId());
        message.setChatContent(message.getSenderId() + "님이 채팅방에 참여하였습니다.");
        template.convertAndSend("/sub/chat/room", message);
    }

    @MessageMapping(value = "/chat/message")
    public void message(ChatMessage message){
    	System.out.println("ㅁㅁㅁ :" + message.getChatContent());
        template.convertAndSend("/sub/chat/room", message);
    }
}
