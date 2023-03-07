<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
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
	SmartDao dao=new SmartDao();
	
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//조회수 증가
	dao.updateReadCount(num);
	
	SmartDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage"+currentPage);
	%>
	
	<div style="margin: 50px 50px; width: 800px;">
	
	<!-- hidden -->
	<input type="hidden" value="<%=currentPage%>" name="currentPage">
	
	  <table class="table table-bordered" style="width: 800px;">
       <caption><h3><%=dto.getSubject() %></h3></caption>
       
       <tr>
         <td>작성자: <%=dto.getWriter() %>
            <span><%=sdf.format(dto.getWriteday()) %></span>
            &nbsp;&nbsp;조회수 <%=dto.getReadcount() %>
         </td>
       </tr>
       <tr>
         <td><%=dto.getContent() %></td>
       </tr>
       
       <tr>
         <td colspan="2" align="right">
           <button type="button" class="btn btn-sm btn-default"
            onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">
            <span class="glyphicon glyphicon-erase"></span>수정</button>
           <button type="button" class="btn btn-sm btn-default"
            onclick="location.href='index.jsp?main=board/delete.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">
            <span class="glyphicon glyphicon-remove"></span>삭제</button>
           <button type="button" class="btn btn-sm btn-default"
            onclick="location.href='index.jsp?main=board/smartform.jsp'">
            <span class="glyphicon glyphicon-pencil"></span>글쓰기</button>
           <button type="button" class="btn btn-sm btn-default"
            onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">
            <span class="glyphicon glyphicon-th-list"></span>목록</button>
         </td>
       </tr>
	  </table>
	</div>
</body>
</html>