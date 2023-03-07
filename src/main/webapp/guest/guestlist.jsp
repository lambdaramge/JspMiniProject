<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
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
	
	<script type="text/javascript">
	  $(function(){
		  
		  //추천
		  $(".likes").click(function(){
			  var num=$(this).attr("num");
			  var tag=$(this);
			  //alert(num) 반응확인
			  
			  $.ajax({
				  
				  type: "get",
				  dataType: "json",
				  url: "guest/ajaxlikechu.jsp",
				  data: {"num":num},
				  success: function(res){
					  tag.next().text(res.chu);
					  
					  tag.next().next().animate({"font-size":"10px"},1000,function(){
						  //애니메이션 끝난 후 글꼴 크기 0px
						  $(this).css("font-size","0px");
					  })
				  }
			  })
		  })
		  
		  //댓글 부분 안보이게
		  $("div.answer").hide();
		  
		  //댓글 클릭시 댓글 부분이 보였따 안보였다
		  $("span.answer").click(function(){
			  $(this).parent().parent().parent().find("div.answer").toggle();
			  $(this).parent().parent().parent().parent().siblings().find("div.answer").hide();
		  })
		  
	  })
	
	</script>
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
	    	      		
	    	      		<!-- 댓글 -->
	    	      		<%
	    	      		 AnswerDao adao=new AnswerDao();
	  	    	         List<AnswerDto> alist=adao.getAllAnswers(dto.getNum());
	    	      		%>
	    	      		
	    	      		<span class="answer" style="cursor: pointer;" num="<%=dto.getNum()%>">댓글 <%=alist.size() %></span>
	    	      		
	    	      		<!-- 해당 num에 해당하는 chu가 +이므로 num을 넘겨준다 -->
	    	      		<span class="likes" style="margin-left: 20px; cursor: pointer;"
	    	      		num=<%=dto.getNum() %>>추천</span>
	    	      		<span class="chu"><%=dto.getChu() %></span>
	    	      		<span class="glyphicon glyphicon-heart" style="color: red; font-size: 0px;" ></span>
	    	      
	    	      <%
	    	      //로그인 아이디==글쓴 아이디 인 경우에만 수정, 삭제 버튼
	    	      String myId=(String)session.getAttribute("myId");
	    	      
	    	      if(loginOk!=null && dto.getMyid().equals(myId)){%>
	    	    	  | <a href="index.jsp?main=guest/getdata.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: black; text-decoration: none;">수정</a>
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
	    	      
	    	      <br><br>
	    	      
		    	  <div class="answer">
		    	    <%
		    	      if(loginOk!=null){%>
		    	    	<div class="answerform">
		    	    	  <form action="guest/answerinsert.jsp" method="post">
		    	    	  
		    	    	  <!-- hidden -->
		    	    	  <input type="hidden" name="num" value="<%=dto.getNum()%>">
		    	    	  <input type="hidden" name="myid" value="<%=myId%>">
		    	    	  <input type="hidden" name="currentPage" value="<%=currentPage%>">
		    	    	  
	    	    	    <table>
	    	    	      <tr>
	    	    	        <td>
	    	    	          <textarea style="width: 500px; height: 50px;"
	    	    	          name="content" required class="form-control"></textarea>
	    	    	        </td>
	    	    	        <td>
	    	    	          <button type="submit" class="btn btn-default"
	    	    	          style="width: 70px; height: 50px; margin-left: 20px;">등록</button>
	    	    	        </td>
	    	    	      </tr>
	    	    	    </table>
		    	    	  </form>
		    	    	</div>  
		    	      <%}%>
		    	    
	    	      <!-- 댓글 -->
		    	  <div class="answerlist">
	    	      <% 
	    	      //for(AnsertDto adto:alist)
	    	      for (int i=0;i<alist.size();i++){ 
	    	      		AnswerDto adto=alist.get(i);%>
	    	      		<table class="table" style="width: 500px;">
	    	      		  <tr>
	    	      		    <td width="60" align="left">
	    	      		      <span class="glyphicon glyphicon-user"></span>
	    	      		      <%=mdao.getName(adto.getMyid())%>(<%=adto.getMyid() %>)&nbsp;
	    	      		      
	    	      		     	 <% // 글 작성자=댓글 작성자인 경우 '작성자' 표시
	    	      		    	 if(dto.getMyid().equals(adto.getMyid())){%>
	    	      		    	   <span style="color: red; border: 1px solid red; border-radius: 10px; font-size: 9px;">작성자</span>
	    	      		    	 <%} %>
	    	      		    	 
	 							
	 							<script type="text/javascript">
	 							    //댓글 삭제
	 								$(".adel").click(function(){
	 									var idx=$(this).attr("idx");
	 									//alert(idx);
	 									
	 									$.ajax({
	 										type:"get",
	 										url:"guest/answerdelete.jsp",
	 										dataType:"html",
	 										data:{"idx":idx},
	 										success: function(res){
	 											location.reload();
			 								}
	 									})
	 								})
	 								
	 								//댓글 수정 전 getanswer
	 								$(".amod").click(function(){
	 									var idx=$(this).attr("idx");
	 									//alert(idx);
	 									
	 									$.ajax({
	 										type:"get",
	 										url:"guest/getanswer.jsp",
	 										dataType:"html",
	 										data:{"idx":idx},
	 										success: function(res){
	 											//location.reload();
			 								}
	 									})
	 								})
	 							
	 							</script>
	 							
	    	      		    	 <%
	 							//댓글 삭제) 로그인 중이면서 로그인한 아이디와 같은 경우 삭제 아이콘
								if(loginOk!=null && adto.getMyid().equals(myId)){%>
									<span class="glyphicon glyphicon-pencil amod" idx=<%=adto.getIdx() %>
									style="font-size: 12px; color: green; margin-left: 10px; cursor: pointer;"></span>
									<span class="glyphicon glyphicon-trash adel" idx=<%=adto.getIdx() %> 
									style="font-size: 12px; color: red; margin-left: 10px; cursor: pointer;"></span>
								<%}
	 							%>
	 							
	    	      		      <br><span style="font-size:11pt; margin-top:25px;"><%=adto.getContent().replace("\n","<br>") %></span>
	    	      		      <br><span style="color: gray;font-size: 9px;"><%=sdf.format(adto.getWriteday()) %></span>
	 							
	    	      		    </td>
	    	      		  </tr>
	    	      		</table>
	    	     <% }
	    	      %>
		    	    </div>
		    	  </div>
	    	      
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