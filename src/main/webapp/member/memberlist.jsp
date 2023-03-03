<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>

<style type="text/css">

 th,td{
   text-align: center;
 }
</style>

<script type="text/javascript">

	function delfunc(num){
		var yes=confirm("정말 강퇴처리 하시겠습니까?");
		
		if(yes)
	         location.href='member/memberdelete.jsp?num='+num;
	   }
</script>

</head>
<body>
	<%
	//전체멤버 정보 가져오기
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	int no=1; //for each문에서 쓸 것임 
	%>

	<table class="table table-bordered" style="width: 900px;">
	<caption><b>전체 회원 목록</b></caption>
		<tr bgcolor="#fff0f5">
		<th width="60">번호</th>
		<th width="100">회원명</th>
		<th width="100">아이디</th>
		<th width="200">핸드폰</th>
		<th width="350">주소</th>
		<th width="200">이메일</th>
		<th width="150">가입일</th>
		<th width="160">편집</th>
		</tr>
		<%
		//모든 list를 dto에 대입
		//for문으로만 할 경우 dto 선언해야하는데 for each문의 경우 안해줘도 됨
		for(MemberDto dto:list){
			%>
			<tr>
				<td><%=no++ %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getHp() %></td>
				<td><%=dto.getAddr() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=sdf.format(dto.getGaipday()) %></td>
				<td>
				<button type="button" id="btn" class="btn btn-default btn-xs" 
				onclick="delfunc(<%=dto.getNum()%>)">삭제</button>
				</td>
			</tr>

		<%}
		%>

	</table>

</body>
</html>