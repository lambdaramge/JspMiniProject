<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Nanum+Gothic&family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

	<%
	
	ShopDao dao=new ShopDao();
	List<ShopDto> list=dao.getAllSangpums();

	%>
	
<body>

 <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">전체</a></li>
    <li><a data-toggle="tab" href="#menu1">피규어</a></li>
    <li><a data-toggle="tab" href="#menu2">의상</a></li>
    <li><a data-toggle="tab" href="#menu3">악세서리</a></li>
    <li><a data-toggle="tab" href="#menu4">선물세트</a></li>
    <li><a data-toggle="tab" href="#menu5">게임</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3></h3>
      <table class="table table-bordered" style="width: 800px;">
        <caption>전체상품목록</caption>
        <tr>
          <%
          NumberFormat nf=NumberFormat.getCurrencyInstance();
          int i=0;
          for(ShopDto dto:list){
        	  //img
        	  String photo=dto.getPhoto();
        	  
        	  //20~40 난수 발생
        	  int sale=(int)(Math.random()*31)+10;
        	  %>
          	  
	          <td>
	            <a href="index.jsp?main=shop/detailpage.jsp?shopnum=<%=dto.getShopnum()%>"><img src="shopsave/<%=photo%>" class="photo" style="max-width: 100px;">
	            <br>
	            <%=dto.getSangpum() %>
	            <b style="color: red;"><%=sale %>%</b>
	            <span style="float: right;">
	              <div style="color: gray; font-size: 13px;">
	                <%
	                int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	                %>
	                <strike><%=nf.format(price) %></strike>
	              </div>
	              
	              <div style="color: black; font-size: 16px;">
	                <%=nf.format(dto.getPrice()) %>
	              </div>
	            </span>
	            </a>
	          </td>
	          
	          <%
	          if((i+1)%4==0){%>
	        	</tr>
	        	<tr>  
	         <% }
	          i++;
	     	 }
	          %>
        </tr>
      </table>
      
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>피규어</h3>
      <table class="table table-bordered" style="width: 800px;">
        <caption>피규어</caption>
        <tr>
        
          <%
          
          i=0;
          for(ShopDto dto:list){
        	  
        	  if(dto.getCategory().equals("피규어")){
        		  
        	 
	          String photo=dto.getPhoto();
        	  
        	  //20~40 난수 발생
        	  int sale=(int)(Math.random()*31)+10;
        	  %>
          	  
	          <td>
	            <a><img src="shopsave/<%=photo%>" class="photo" style="max-width: 100px;">
	            <br>
	            <%=dto.getSangpum() %>
	            <b style="color: red;"><%=sale %>%</b>
	            <span style="float: right;">
	              <div style="color: gray; font-size: 13px;">
	                <%
	                int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	                %>
	                <strike><%=nf.format(price) %></strike>
	              </div>
	              
	              <div style="color: black; font-size: 16px;">
	                <%=nf.format(dto.getPrice()) %>
	              </div>
	            </span>
	            </a>
	          </td>
	          
	          <%
	          if((i+1)%4==0){%>
	        	</tr>
	        	<tr>  
	         <% }
	          i++;
	     	 }}
	          %>
        </tr>
      </table>
    </div>
    
    
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <h3>의상</h3>
      <table class="table table-bordered" style="width: 800px;">
        <caption>의상</caption>
        <tr>
        
          <%
          
          i=0;
          for(ShopDto dto:list){
        	  
        	  if(dto.getCategory().equals("의상")){
        		  
        	 
	          String photo=dto.getPhoto();
        	  
        	  //20~40 난수 발생
        	  int sale=(int)(Math.random()*31)+10;
        	  %>
          	  
	          <td>
	            <a><img src="shopsave/<%=photo%>" class="photo" style="max-width: 100px;">
	            <br>
	            <%=dto.getSangpum() %>
	            <b style="color: red;"><%=sale %>%</b>
	            <span style="float: right;">
	              <div style="color: gray; font-size: 13px;">
	                <%
	                int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	                %>
	                <strike><%=nf.format(price) %></strike>
	              </div>
	              
	              <div style="color: black; font-size: 16px;">
	                <%=nf.format(dto.getPrice()) %>
	              </div>
	            </span>
	            </a>
	          </td>
	          
	          <%
	          if((i+1)%4==0){%>
	        	</tr>
	        	<tr>  
	         <% }
	          i++;
	     	 }}
	          %>
        </tr>
      </table>
    </div>
    
    
    <div id="menu3" class="tab-pane fade">
      <h3>악세서리</h3>
      
      <table class="table table-bordered" style="width: 800px;">
        <caption>악세서리</caption>
        <tr>
        
          <%
          
          i=0;
          for(ShopDto dto:list){
        	  
        	  if(dto.getCategory().equals("악세서리")){
        		  
        	 
	          String photo=dto.getPhoto();
        	  
        	  //20~40 난수 발생
        	  int sale=(int)(Math.random()*31)+10;
        	  %>
          	  
	          <td>
	            <a><img src="shopsave/<%=photo%>" class="photo" style="max-width: 100px;">
	            <br>
	            <%=dto.getSangpum() %>
	            <b style="color: red;"><%=sale %>%</b>
	            <span style="float: right;">
	              <div style="color: gray; font-size: 13px;">
	                <%
	                int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	                %>
	                <strike><%=nf.format(price) %></strike>
	              </div>
	              
	              <div style="color: black; font-size: 16px;">
	                <%=nf.format(dto.getPrice()) %>
	              </div>
	            </span>
	            </a>
	          </td>
	          
	          <%
	          if((i+1)%4==0){%>
	        	</tr>
	        	<tr>  
	         <% }
	          i++;
	     	 }}
	          %>
        </tr>
      </table>
    </div>
    <div id="menu4" class="tab-pane fade">
      <table class="table table-bordered" style="width: 800px;">
        <caption>선물세트</caption>
        <tr>
        
          <%
          
          i=0;
          for(ShopDto dto:list){
        	  
        	  if(dto.getCategory().equals("선물세트")){
        		  
        	 
	          String photo=dto.getPhoto();
        	  
        	  //20~40 난수 발생
        	  int sale=(int)(Math.random()*31)+10;
        	  %>
          	  
	          <td>
	            <a><img src="shopsave/<%=photo%>" class="photo" style="max-width: 100px;">
	            <br>
	            <%=dto.getSangpum() %>
	            <b style="color: red;"><%=sale %>%</b>
	            <span style="float: right;">
	              <div style="color: gray; font-size: 13px;">
	                <%
	                int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	                %>
	                <strike><%=nf.format(price) %></strike>
	              </div>
	              
	              <div style="color: black; font-size: 16px;">
	                <%=nf.format(dto.getPrice()) %>
	              </div>
	            </span>
	            </a>
	          </td>
	          
	          <%
	          if((i+1)%4==0){%>
	        	</tr>
	        	<tr>  
	         <% }
	          i++;
	     	 }}
	          %>
        </tr>
      </table>
    </div>
    <div id="menu5" class="tab-pane fade">
      <table class="table table-bordered" style="width: 800px;">
        <caption>게임</caption>
        <tr>
        
          <%
          
          i=0;
          for(ShopDto dto:list){
        	  
        	  if(dto.getCategory().equals("게임")){
        		  
        	 
	          String photo=dto.getPhoto();
        	  
        	  //20~40 난수 발생
        	  int sale=(int)(Math.random()*31)+10;
        	  %>
          	  
	          <td>
	            <a><img src="shopsave/<%=photo%>" class="photo" style="max-width: 100px;">
	            <br>
	            <%=dto.getSangpum() %>
	            <b style="color: red;"><%=sale %>%</b>
	            <span style="float: right;">
	              <div style="color: gray; font-size: 13px;">
	                <%
	                int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
	                %>
	                <strike><%=nf.format(price) %></strike>
	              </div>
	              
	              <div style="color: black; font-size: 16px;">
	                <%=nf.format(dto.getPrice()) %>
	              </div>
	            </span>
	            </a>
	          </td>
	          
	          <%
	          if((i+1)%4==0){%>
	        	</tr>
	        	<tr>  
	         <% }
	          i++;
	     	 }}
	          %>
        </tr>
      </table>
    </div>
  </div>
  
</body>
</html>