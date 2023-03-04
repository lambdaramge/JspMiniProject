<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="menu/css/menu.css">
    
	<script type="text/javascript" src="menu/js/jquery.js"></script>
	<script type="text/javascript" src="menu/js/function.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	
	
<title>Insert title here</title>
</head>
<body>
	<%
	  //프로젝트 경로구하기
	  String root=request.getContextPath();
	
	  //아이디
	  String myId=(String)session.getAttribute("myId");
	  
	  //로그인 여부 
	  String loginOk=(String)session.getAttribute("loginOk");
	%>
	
	
<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="#"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="<%=root%>/index.jsp">Home</a></li>
					<li class="parent">
						<a href="#">Member</a>
						<ul class="sub-menu">
							<li><a href="<%=root%>/index.jsp?main=member/addform.jsp"><i class="icon-credit-card"></i>회원가입</a></li>
							<%
							if(loginOk!=null){%>
  							  <li><a href="index.jsp?main=member/myinfo.jsp"><i class="icon-credit-card"></i>나의정보</a></li>
								
							<%}
							%>
							
							<%
							  //회원목록 로그인 중 + 그 아이디가 admin 이면 
							  if(loginOk!=null && myId.equals("admin")){%>
								<li><a href="<%=root%>/index.jsp?main=member/memberlist.jsp"><i class="icon-gift"></i> 회원목록</a></li>							  
							 <% }
							%>
							<li>
								<ul class="sub-menu">
									<li><a href="#">Left Sidebar</a></li>
									<li><a href="#">Full Width</a></li>
									<li><a href="#">Right Sidebar</a></li>
									<li><a href="#">Double Sidebar</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="index.jsp?main=guest/guestlist.jsp">방명록</a></li>
					<li class="parent">
						<a href="#">Board</a>
						<ul class="sub-menu">
							<li><a href="<%=root%>/index.jsp?main=board/boardlist.jsp">Q&A</a></li>
							<li><a href="#">upload</a></li>
							<li><a href="#">스마트게시판</a></li>
						</ul>
					</li>
					<li><a href="#">Shop</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div> 


	<%-- <a href="<%=root%>/index.jsp">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=loginmain.jsp">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=member/addform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=guest/guestlist.jsp">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=root%>/index.jsp?main=board/boardlist.jsp">Q&A</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#">스마트게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#">상품등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
</body>
</html>