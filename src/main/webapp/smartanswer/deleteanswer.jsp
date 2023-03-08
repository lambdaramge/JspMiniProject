<%@page import="data.dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
    
    String idx=request.getParameter("idx");
    
    SmartAnswerDao dao=new SmartAnswerDao();
    dao.deleteSmartAnswer(idx);
    
    %>