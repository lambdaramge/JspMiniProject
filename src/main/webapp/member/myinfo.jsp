<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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
	//전체멤버 정보 가져오기
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//세션
	String loginOk=(String)session.getAttribute("loginOk");
	String myId=(String)session.getAttribute("myId");
	%>
	
	  <%
		for(MemberDto dto:list){
			%>
			
			<%
			//로그인 상태 + 로그인한 아이디와 같은 사람만 보기
			if(loginOk!=null && dto.getId().equals(myId)){%>
				
				<div>
				  
				</div>
				<tr>
				<td><%=dto.getName() %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getHp() %></td>
				<td><%=dto.getAddr() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=sdf.format(dto.getGaipday()) %></td>
				<td>
				<button type="button" id="btn" class="btn btn-default btn-xs" 
				onclick="delfunc(<%=dto.getNum()%>)">탈퇴</button>
				<button type="button" id="btn" class="btn btn-default btn-xs" 
				onclick="delfunc(<%=dto.getNum()%>)">수정</button>
				</td>
			</tr>
			<%}
			
			
		}
		%>
</body>
</html>