<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
    String num=request.getParameter("num");
    
    MemberDao dao=new MemberDao();
    dao.deleteMember(num);
   
    //세션만료
    session.removeAttribute("loginOk");
    
    response.sendRedirect("../index.jsp");
    
    %>