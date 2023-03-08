<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	<div style="margin: 30px 30px;"> 
	  <form action="shop/addaction.jsp" method="post" enctype="multipart/form-data">
	    <table class="table table-bordred" style="width: 600px;">
	      <caption><b>상품등록</b></caption>
	        <tr>
	          <td style="width: 150px; background-color: lightyellow">
	            <b>카테고리</b>
	          </td>
	          <td>
	            <select style="width: 200px;" name="category" class="form-control" required>
	              <option value="피규어">피규어</option>
	              <option value="선물세트">선물세트</option>
	              <option value="선물세트">의상</option>
	              <option value="악세서리" selected>악세서리</option>
	              <option value="게임기">게임기</option>
	            </select>
	          </td>
	        </tr>
	        
	        <tr>
	          <td style="width: 150px; background-color: lightyellow">
	          <b>상품명</b>
	          
	          </td>
			  <td>
			    <input type="text" name="sangpum" class="form-control" style="width: 200px;" placeholder="상품명 입력">
			  </td>
			  
			  <tr>
			    <td  style="width: 150px; background-color: lightyellow;">
			      <b>상품이미지</b>
			    </td>
			    <td>
			    
			      <input type="file" name="photo" style="width: 300px;" class="form-control">
			    </td>
			    
	        </tr>
	        
	        <tr>
	          <td style="width: 150px; background-color: lightyellow;">
	            <b>상품가격</b>
	           </td>
	           <td>
	             <input type="text" name="price" class="form-control" style="width: 120px;" placeholder="가격입력" required>
	           </td>
	        </tr>
	        
	        <tr>
	          <td style="width: 150px; background-color: lightyellow;"><b>입고일</b></td>
	          <td>
	          <%
	          
	            //현재 날짜
	            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	            String day=sdf.format(new Date());
	          
	          %>
	          
	          <input type="date" name="ipgoday" required value="<%=day %>">
	          </td>
	        </tr>
	        
	        <tr>
	          <td colspan="2" align="center">
	            <button type="submit" class="btn btn-default">저장</button>
	            <button type="button" class="btn btn-default">목록</button>
	          </td>
	        </tr>
	    </table>
	  </form>
	</div>
</body>
</html>