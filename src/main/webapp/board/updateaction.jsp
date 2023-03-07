<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    
    <%
    request.setCharacterEncoding("utf-8");
    
    String num=request.getParameter("num");
    String writer=request.getParameter("writer");
    String subject=request.getParameter("subject");
    String content=request.getParameter("content");
    
    String currentPage=request.getParameter("currentPage");
    
    SmartDto dto=new SmartDto();
    dto.setNum(num);
    dto.setWriter(writer);
    dto.setSubject(subject);
    dto.setContent(content);
    
    SmartDao dao=new SmartDao();
    dao.updateSmartBoard(dto);
    
    response.sendRedirect("../index.jsp?main=board/detailview.jsp?num="+num+"&currentPage="+currentPage);
    %>