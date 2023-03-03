<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>

<style type="text/css">


</style>

</head>
<body>
	<%
	String id=(String)session.getAttribute("myId");
	
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);
	
	%>

	<div style="margin-left: 200px;">
		<img alt="" src="image2/1.png">
		<h2><%=name %>님 안녕하세요</h2>
		<br>
		<button type="button" class="btn btn-default" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
	</div>
	
</body>
</html>