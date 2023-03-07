<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

request.setCharacterEncoding("utf-8");

String num=request.getParameter("num");
String myid=request.getParameter("myid");
String content=request.getParameter("content");
String currentPage=request.getParameter("currentPage");

AnswerDto dto=new AnswerDto();
dto.setNum(num);
dto.setMyid(myid);
dto.setContent(content);

AnswerDao dao=new AnswerDao();
dao.insertAnswer(dto);

response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);

%>