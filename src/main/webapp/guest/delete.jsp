<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Nanum+Gothic&family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	String currentPage=request.getParameter("currentPage");
	String num=request.getParameter("num");
	
	GuestDao dao=new GuestDao();
	dao.deleteGuest(num);
	
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
	%>
</body>
</html>