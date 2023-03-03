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
<body>
	<%
	//세션된 저장된 loginok가 yes이면 로그인 상태 확인
	String loginOk=(String)session.getAttribute("loginOk");
	
	if(loginOk==null){%>
		<jsp:include page="loginform.jsp"/>
	<%} else{%>
		<jsp:include page="logoutform.jsp"/>
	<%}
	
	%>
</body>
</html>