<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");

	SmartDao dao=new SmartDao();
	dao.deleteSmartBoard(num);
	
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage="+currentPage);

%>