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
</head>
<body>
	<%
	
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave"); //checkbox (on,null)
	
	MemberDao dao=new MemberDao();
	boolean b=dao.isIdPassCheck(id, pass);
	
	//if b==true(id==pw이면) 3개의 세션을 저장하고 로그인 메인으로 이동
	if(b){
		
		//세션유지시간 8시간 (생략시 30분)
		session.setMaxInactiveInterval(60*60*8);
		
		session.setAttribute("loginOk", "yes");
		session.setAttribute("myId", id);
		session.setAttribute("saveOk", cbsave==null?null:"yes"); //로그인유지 체크사항 저장
		
		//로그인메인으로 이동
		response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
		
	}else{%>
		<script type="text/javascript">
		
		alert("id와 비밀번호가 일치하지 않습니다.");
		history.back();
		
		</script>
	<%}
	
	%>
</body>
</html>