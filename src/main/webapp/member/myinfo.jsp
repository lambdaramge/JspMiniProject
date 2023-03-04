<%@page import="data.dto.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Nanum+Gothic&family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	//전체멤버 정보 가져오기
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//세션
	String loginOk=(String)session.getAttribute("loginOk");
	String myId=(String)session.getAttribute("myId");
	%>
	
	  <%
		for(MemberDto dto:list){
			%>
			
			<%
			//로그인 상태 + 로그인한 아이디와 같은 사람만 보기
			if(loginOk!=null && dto.getId().equals(myId)){%>
				
				<div>
				  <input name="num" num="<%=dto.getNum() %>" value="<%=dto.getNum()%>" type="hidden">
				  <table class="table" style="width: 300px; margin-left: 100px; margin-top: 30px;" >
				    <tr>
				      <td>이름</td><td><%=dto.getName() %></td>
					</tr>
					<tr>
				      <td>아이디</td><td><%=dto.getId() %></td>					
					</tr>
					<tr>
				      <td>번호</td><td><%=dto.getHp() %></td>					
					</tr>
					<tr>
				      <td>주소</td><td><%=dto.getAddr() %></td>
					</tr>
					<tr>					
				      <td>이메일</td><td><%=dto.getEmail() %></td>
					</tr>
					<tr>
				      <td>가입일</td><td><%=sdf.format(dto.getGaipday())%></td>
					</tr>
				    <tr>
						<td colspan="2">
						<button type="button" id="btn" class="btn btn-default btn-xs" 
						onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
						<button type="button" id="btn" class="btn btn-default btn-xs" 
						onclick="delfunc(<%=dto.getNum()%>)">탈퇴</button>
						
						<script type="text/javascript">
						  function delfunc(num) {
							var yes=confirm("정말 탈퇴하시겠습니까?");
							
							if(yes)
								location.href="member/mydelete.jsp?num="+num;
							
						}
						
						</script>
						</td>				    
				    </tr>
				    
				  </table>
				</div>
						
			<%}
		}
		%>
</body>
</html>