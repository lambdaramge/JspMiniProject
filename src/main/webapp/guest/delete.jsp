<%@page import="java.io.File"%>
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
	
	//db + 업로드된 사진까지 삭제하기
	GuestDao dao=new GuestDao();
	//db로부터 저장된 이미지명 얻기
	String photoName=dao.getData(num).getPhotoname();
	
	//1. db삭제
	dao.deleteGuest(num);
	
	//프로젝트 경로
	String realPath=getServletContext().getRealPath("/save");
	//파일 객체 생성
	File file=new File(realPath+"\\"+photoName);
	//2. 파일 삭제
	file.delete();
	
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
	%>
</body>
</html>