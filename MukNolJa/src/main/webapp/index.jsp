<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<a href="${ contextPath }/member.me">membedsewhtwhtjkWWWWsssssdss</a>
	<a href="${ contextPath }/createRoom.ch?roomName=CHAT&BoardId=23" >채팅방 만들기</a>
	<a href="${ contextPath }/chatRoomList.ch" >채팅방 목록</a>
	<a href="${ contextPath }/adminPage.me" >관리자 페이지</a>
</body>
</html>