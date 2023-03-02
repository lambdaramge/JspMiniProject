<%@page import="data.dao.MemberDao"%>
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
	String id=request.getParameter("id");
	
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);
	
	%>
	<div  align="center">
	<img alt="" src="image2/3.png">
	<h1><%=name %>님, 환영합니다.</h1>
	<br><br>
	<button type="button" class="btn btn-default"
   onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>   
   <button type="button" class="btn btn-default"
   onclick="location.href='index.jsp'">Home</button>
	</div>
</body>
</html>