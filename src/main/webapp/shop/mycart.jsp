<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    <%
    
    String id=(String)session.getAttribute("myId");
    MemberDao mdao=new MemberDao();
    String name=mdao.getName(id);
    
    ShopDao dao=new ShopDao();
    List<HashMap<String, String>> list=dao.getCartList(id);
    
    %>
    <div style="margin-left: 100px;">
    <h3><%=name %>님 안녕하세용</h3>
    
      <table style="float: left;">
	    <%
	    
	    for(HashMap<String, String> map:list){%>
	      <tr>
	        <td>상품명 : <%=map.get("sangpum") %></td>
	      </tr>
	      <tr>
	        <td><%=map.get("price") %>원</td>
	      </tr>
	      <tr>
	        <td colspan="2"><img src='shopsave/<%=map.get("photo") %>' style="max-width: 100px;"></td>
	      </tr>
	    	
	   <% }
	    %>
	  </table>
    </div>