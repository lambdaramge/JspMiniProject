<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<jsp:useBean id="dao" class="data.dao.SmartAnswerDao"/>
<jsp:useBean id="dto" class="data.dto.SmartAnswerDto"/>
<jsp:setProperty property="*" name="dto"/>

<%

  request.setCharacterEncoding("utf-8");

  String nickname=request.getParameter("nickname");
  String content=request.getParameter("content");

  dto.setNickname(nickname);
  dto.setContent(content);
  
  dao.insertSmartAnswer(dto);
  

%>