<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    <%
    
    String nums=request.getParameter("nums");
    
    //읽어온 nums를 ,를 기준으로 분리 ->배열
    String [] num=nums.split(",");
    
    //배열의 개수만큼 delete한 후
    SmartDao dao=new SmartDao();

    for(String n:num){
    	dao.deleteSmartBoard(n);
    }
    
    response.sendRedirect("../index.jsp?main=board/boardlist.jsp");
    
    %>