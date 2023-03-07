<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    <%
    request.setCharacterEncoding("utf-8");
    
    String writer=request.getParameter("writer");
    String subject=request.getParameter("subject");
    String content=request.getParameter("content");
    
    SmartDto dto=new SmartDto();
    dto.setWriter(writer);
    dto.setSubject(subject);
    dto.setContent(content);
    
    SmartDao dao=new SmartDao();
    dao.insertSmartBoard(dto);
    
    response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
    
    %>