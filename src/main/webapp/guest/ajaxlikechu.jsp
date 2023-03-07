<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
    
    String num=request.getParameter("num");
    
    //dao
    GuestDao dao=new GuestDao();
    dao.updateChu(num);
    
    //ajax로 할거니까 num에 해당하는 chu를 json 형식으로 반환
    int chu=dao.getData(num).getChu();
    
    JSONObject ob=new JSONObject();
    ob.put("chu",chu);
    
    
    %>
    
    <%=ob.toString()%>