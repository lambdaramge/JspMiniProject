<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>

<style type="text/css">
  a{
    color: black;
  }
  
  .cart{
    float: right;
    cursor: pointer;
    
  }
  
  .carticon{
    font-size: 20px;
    
  }
  
  .count{
    color: white;
    width: 20px;
    height: 20px;
    float: right;
    border-radius: 10px;
    line-height: 20px;
    text-align: center;
    background-color: red;
    font-size: 15px;
  }
  
  
</style>

</head>
<%
  //프로젝트 경로구하기
  String root=request.getContextPath();
%>
<body>
	<a href="<%=root%>" style="color: black;">
	<img alt="" src="image/doggy.jpg">
	JSP&Jquery 미니프로젝트</a>
	
	<div style="float: right; padding-right: 100px;">
	
	<%
	  //로그인세션
	  String loginOk=(String)session.getAttribute("loginOk");
	
	  //name
	  String id=(String)session.getAttribute("myId");
	  MemberDao dao=new MemberDao();
	  String name=dao.getName(id);
	  
	  //로그아웃 상태
	  if(loginOk==null){%>
		<a style="text-decoration: none; color:black; font-size: 13px;" 
		 href="index.jsp?main=login/loginmain.jsp">로그인</a>
		<a style="text-decoration: none; color:black; font-size: 13px;" 
		 href="index.jsp?main=member/addform.jsp">회원가입</a>   
	
	 <% //로그인 상태
	 }else{%>
	 	 <span style="font-size: 10px; color: gray"><%=name %>님 로그인중..</span>
		 <button type="button" class="btn btn-default btn-sm" style="width: 70px;"
		 onclick="location.href='login/logoutaction.jsp'">logout</button> 
	 <%}
	%>
	
	<div class="cart">
		<%
		
		//shopdao
		ShopDao sdao=new ShopDao();
		
		int cartSize=sdao.getCartList(id).size();
		
		%>		
			<span class="glyphicon glyphicon-shopping-cart carticon"></span>
			<div class="count"><%=cartSize %></div>
		</div>
		
		<script type="text/javascript">
		  $(".cart").click(function(){
			  location.href="index.jsp?main=shop/mycart.jsp";
		  })
		
		</script>
	
	
	</div>
</body>
</html>