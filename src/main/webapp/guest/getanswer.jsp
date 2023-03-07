<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.AnswerDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
    request.setCharacterEncoding("utf-8");
    
    String idx=request.getParameter("idx");
    
    AnswerDao dao=new AnswerDao();
    dao.getData(idx);
    
    %>
    