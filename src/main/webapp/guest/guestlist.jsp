<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>
</head>
	<%
	  //로그인 상태 확인 후 입력폼 나타내기
	  String loginOk=(String)session.getAttribute("loginOk");
	%>
<body>
	
	<%
	if(loginOk!=null){%>
	
		<jsp:include page="addform.jsp"/>
		<hr align="left" width="800">
		
	<%}
	%>
	
	<%
	GuestDao dao=new GuestDao();
	
	int totalCount;
	int totalPage;//총페이지수
	int startPage;//각블럭의 시작페이지
	int endPage;//각블럭의 끝페이지
	int start; //각페이지의 시작번호
	int perPage=5; //한페이지에 보여질 글의 갯수
	int perBlock=5; //한블럭당 보여지는 페이지개수
	int currentPage; //현재페이지
	
	//총개수
	totalCount=dao.getTotalCount();
	//현재페이지번호 읽기(단 null 일때는 1페이지로 설정)
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
	
	//총 페이지 갯수
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	//각블럭의 시작페이지..현재페이지가 3(s:1,e:5) 6(s:6 e:10)
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	//총페이지가 8. (6~10...endpage를 8로 수정해주어야 한다)
	if(endPage>totalPage)
		endPage=totalPage;
	
	//각페이지에서 불러올 시작번호
	start=(currentPage-1)*perPage;
	//각페이지에서 필요한 게시글 가져오기
	List<GuestDto> list=dao.getList(start, perPage);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	%>
	
	<div>
	
	  <b>총 <%=totalCount %>개의 방명록이 있습니다</b>
	  <br><br>
	  
	  <%
	  	//이름 구하기
	    MemberDao mdao=new MemberDao();
	  
	    for(GuestDto dto:list){
	    	//이름 얻기
		    String name=mdao.getName(dto.getMyid()); %>
	    
	    	<table class="table" style="width: 600px;">
	    	  <tr>
	    	    <td>
	    	      <b>
	    	      	<span class="glyphicon glyphicon-user"></span>
	    	      		<%=name %>(<%=dto.getMyid() %>)</b>
	    	      
	    	      <%
	    	      //로그인 아이디==글쓴 아이디 인 경우에만 수정, 삭제 버튼
	    	      String myId=(String)session.getAttribute("myId");
	    	      
	    	      if(loginOk!=null && dto.getMyid().equals(myId)){%>
	    	    	  | <a href="index.jsp?main=guest/getdata.jsp?num=<%=dto.getNum() %>" style="color: black; text-decoration: none;">수정</a>
	    	    	  | <a href="guest/delete.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: black; text-decoration: none;">삭제</a> |
	    	      <%}
	    	      %>
	    	      
	    
	    	      
	    	      <span style="float: right;"><%=sdf.format(dto.getWriteday()) %></span>
	    	    </td>
	    	  </tr>
	    	  <tr>
	    	    <td>
	    	      <!-- 이미지가 null 이 아닌 경우에만 출력 -->
	    	      <%
	    	        if(dto.getPhotoname()!=null){%>
	    	        <a href="save/<%=dto.getPhotoname()%>" target="_blank">
		    	      <img src="save/<%=dto.getPhotoname()%>" style="width: 100px;">	    	        
	    	        </a>
	    	        <%}
	    	      %>
	    	      
	    	      <%=dto.getContent().replace("\n", "<br>") %>
	    	    </td>
	    	  </tr>
	    	</table>	
	   <% }
	  
	  %>
	  
	</div>
	<!-- 페이징 출력 -->
	<div style="width: 500px; text-align: center;">
		<ul class="pagination">
			<%
			//이전
			if (startPage > 1) {
			%>
			<li><a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage - 1%>">이전</a>
			</li>
			<%
			}
			for (int pp = startPage; pp <= endPage; pp++) {
			if (pp == currentPage) {
			%>
			<li class="active"><a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
			</li>
			<%
			} else {
			%>

			<li><a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
			<%
			}
			}
			//다음
			if (endPage < totalPage) {
			%>
			<li><a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage + 1%>">다음</a></li>
			<%
			}
			%>
		</ul>
	</div>
</body>
</html>