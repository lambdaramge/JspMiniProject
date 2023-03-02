<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>
</head>
<%
  //프로젝트 경로구하기
  String root=request.getContextPath();
%>
<body>
	<a href="<%=root%>" style="color: black;">
	JSP&Jquery 미니프로젝트</a>
</body>
</html>