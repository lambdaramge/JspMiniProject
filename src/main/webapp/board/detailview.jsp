<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
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

<style type="text/css">

  .aday{
    color: gray;
    float: right;
  }

</style>


</head>

<script type="text/javascript">

  $(function(){
	  
	  //시작시 리스트 호출
	  list();
	  
	  //insert
	  $("#btnanswer").click(function(){
		  var num=$("#num").val();
		  var nick=$("#nickname").val();
		  var content=$("#content").val();
		  //var data=$("#aform").serialize();
		  //alert(num)
		  
		  $.ajax({
			  type: "post",
			  url: "smartanswer/insertanswer.jsp",
			  dataType:"html",
			  data:{"num":num,"nickname":nick,"content":content},
			  success: function(res){
				  $("#nickname").val("");
				  $("#content").val("");
				  
				  list();
			  }
		  
		  })
		  
	  })
	  
	  //삭제
	  $(document).on("click",".adel",function(){
		  
		  var a=confirm("진짜 삭제할건가요???????????????????????????????????????");

		  if(a){
			  setTimeout(() => {
				
			  var b=confirm("다시한번 생각해보세요.");
			  
			  if(b){
				  var c=confirm("마지막 기회를 드릴게요");
				  
				  if(c){
					  
			  var idx=$(this).attr("idx");
			  $.ajax({
			  type:"get",
			  url:"smartanswer/deleteanswer.jsp",
			  dataType:"html",
			  data:{"idx":idx},
			  success: function(res){
				  alert("삭제성공");
				  list();
			  }
			  
		  })}}
			}, 500);
			  }
	  })
	  
	  //수정 모달 띄우기
	  $(document).on("click",".amod",function(){
		  idx=$(this).attr("idx"); //전역변수로 해야 아래 모달 창에서 수정이 된다!!주의
		  //alert(idx);
		  
		  $.ajax({
			  
			  type:"get",
			  url:"smartanswer/jsonupdateform.jsp",
			  dataType:"json",
			  data:{"idx":idx},
			  success:function(res){
				  $("#unickname").val(res.nickname);
				  $("#ucontent").val(res.content);
			  }
		  
		  })
		  
		  $("#myModal").modal();
		  
	  })
	  
	  //수정
	  $(document).on("click","#btn-update",function(){
		  //alert(idx);
		  var nickname=$("#unickname").val();
		  var content=$("#ucontent").val();
		  
		  $.ajax({
		  	  type:"post",
			  url:"smartanswer/updateanswer.jsp",
			  dataType:"html",
			  data:{"idx":idx,"nickname":nickname,"content":content},
			  success: function(res){
				  list();
			  }
		})
	  })
	  
  })
  
  //list 사용자 정의함수
   function list(){
	  
	  $.ajax({
		  type:"get",
		  url:"smartanswer/listanswer.jsp",
		  dataType:"json",
		  data:{"num":$("#num").val()},
		  success:function(res){
			  
			  //댓글개수 출력
			  $("b.acount>span").html(res.length);
			  
			  var s="";
			  $.each(res,function(i,elt){
				  s+="<div>";
				  s+=elt.nickname+":"+elt.content;
				  s+="<span class='aday'>"+elt.writeday+"</span>";
				  s+="<button type='button' idx="+elt.idx+" class='amod btn btn-xs btn-default'>수정</button>";
				  s+="<button type='button' idx="+elt.idx+" class='adel btn btn-xs btn-default'>삭제</button>";
				  s+="</div>";
			  })
			  $(".alist").html(s);
			  
		  }
	  })
  }
  
</script>

<body>
	<%
	SmartDao dao=new SmartDao();
	
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//조회수 증가
	dao.updateReadCount(num);
	
	SmartDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage"+currentPage);
	%>
	
	<div style="margin: 50px 50px; width: 800px;">
	
	<!-- hidden -->
	<input type="hidden" value="<%=currentPage%>" name="currentPage">
	
	  <table class="table table-bordered" style="width: 800px;">
       <caption><h3><%=dto.getSubject() %></h3></caption>
       
       <tr>
         <td>작성자: <%=dto.getWriter() %>
            <span><%=sdf.format(dto.getWriteday()) %></span>
            &nbsp;&nbsp;조회수 <%=dto.getReadcount() %>
         </td>
       </tr>
       <tr>
         <td><%=dto.getContent() %></td>
       </tr>
       
       <!-- 댓글 -->
       <tr>
         <td>
           <b class="acount">댓글<span>0</span></b>
           <div class="alist">
             댓글 목록
           </div>
           <div class="aform form-inline">
           <input type="hidden" value="<%=num%>" name="num" id="num">
             <input type="text" name="nickname" id="nickname" class="form-control" style="width: 100px;"
             placeholder="닉네임 입력">
             <input type="text" name="content" id="content" class="form-control" style="width: 300px;"
             placeholder="댓글 입력">
             <button type="button" id="btnanswer" class="btn btn-info">저장</button>
           </div>
         </td>
       </tr>
       
       <tr>
         <td colspan="2" align="right">
           <button type="button" class="btn btn-sm btn-default"
            onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">
            <span class="glyphicon glyphicon-erase"></span>수정</button>
            
           <button type="button" class="btn btn-sm btn-default"
            onclick="funcdel(<%=dto.getNum()%>,<%=currentPage%>)">
            <span class="glyphicon glyphicon-remove"></span>삭제</button>
            
           <button type="button" class="btn btn-sm btn-default"
            onclick="location.href='index.jsp?main=board/smartform.jsp'">
            <span class="glyphicon glyphicon-pencil"></span>글쓰기</button>
            
           <button type="button" class="btn btn-sm btn-default"
            onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">
            <span class="glyphicon glyphicon-th-list"></span>목록</button>
            
            <script type="text/javascript">
              function funcdel(num,currentPage){
            	  //alert(num+","+currentPage);
            	  
            	  var a=confirm("삭제하려면 [확인]을 눌러주세요");
            	  
            	  if(a){
            		  location.href="board/delete.jsp?num="+num+"&currentPage="+currentPage;
            	  }
              }
            </script>
            
         </td>
       </tr>
	  </table>
	</div>
	
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">댓글 수정</h4>
        </div>
        <div class="modal-body">
          <b>닉네임: </b>
          <input type="text" id="unickname" style="width: 100px;">
          <b>내용: </b>
          <input type="text" id="ucontent" style="width: 200px;">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-update">수정</button>
        </div>
      </div>
      
    </div>
  </div>
  
</body>
</html>