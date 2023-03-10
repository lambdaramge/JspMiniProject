<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.CartDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    
    request.setCharacterEncoding("utf-8");
    
    String shopnum=request.getParameter("shopnum");
    String num=request.getParameter("num");
    String cnt=request.getParameter("cnt");
    
    
    CartDto dto=new CartDto();
    dto.setShopnum(shopnum);
    dto.setNum(num);
    dto.setCnt(cnt);
    
    ShopDao dao=new ShopDao();
    dao.insertCart(dto);
    
    response.sendRedirect("../index.jsp?main=shop/shoplist.jsp");
    %>