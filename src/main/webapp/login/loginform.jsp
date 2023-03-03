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
	td,th{
	  text-align: center;
	}
</style>

</head>
<body>

<%
  String saveOk=(String)session.getAttribute("saveOk"); //아이디저장 세션, yes면 checked
  String myId="";

  if(saveOk!=null){
	  myId=(String)session.getAttribute("myId");
  }
%>


  <div style="margin-left: 330px;">
	<form action="login/loginaction.jsp" method="post" >
	  <table class="table table-bordered" style="width: 300px;">
	    <caption><b>세션로그인</b></caption>
	    <tr>
	      <td colspan="2" align="center">
	        <input type="checkbox" name="cbsave" <%=saveOk==null?"":"checked" %>>아이디저장
	        
	      </td>
	    </tr>
	    <tr>
	      <th width="100">아이디</th>
	      <td><input type="text" name="id" class="form-control" required style="width: 120px;" value="<%=myId%>"></td>
	    </tr>
	    <tr>
	      <th width="100">비밀번호</th>
	      <td><input type="password" name="pass" class="form-control" required style="width: 120px;"></td>
	    </tr>
	    
	    <tr>
	      <td colspan="2" align="center">
	        <button type="submit" class="btn btn-default" style="width: 100px;">로그인</button>
	      </td>
	    </tr>
	  </table>
	</form>
  </div>
</body>
</html>