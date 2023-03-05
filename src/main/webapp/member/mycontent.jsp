<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
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
	<%
	String num=request.getParameter("num");
	String myId=(String)session.getAttribute("myId");
	
	GuestDao dao=new GuestDao();
	List<GuestDto> list=dao.getMyContent(myId);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd HH:mm");
	%>
<body>
	
	<table class="table table-inline" style="width: 600px; margin-left: 200px;" >
	
	  <%for(int i=0;i<list.size();i++){
		  GuestDto dto=list.get(i);
		  %>
		  
		  <tr>
		    <td><%=i+1 %></td>
		    <td width="300px;"><%=dto.getContent() %></td>
		    <td><%=sdf.format(dto.getWriteday()) %></td>
		    <td>
		    	<button type="button" class="btn btn-xs btn-default">수정</button>
		    	<button type="button" class="btn btn-xs btn-default">삭제</button>
		    </td>
		  </tr>
	  <%} %>
	  
	  
	  <tr></tr>
	</table>
	
</body>
</html>