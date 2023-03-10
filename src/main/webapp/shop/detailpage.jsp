<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
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

<style type="text/css">
  img.large {
    width: 450px;
    height: 550px;
  }
</style>

</head>

<%
String shopnum=request.getParameter("shopnum");
//로그인상태
String loginOk=(String)session.getAttribute("loginOk");

//로그인한 아이디
String myId=(String)session.getAttribute("myId");

//id에 해당하는 멤버의 시퀀스 변호
MemberDao mdao=new MemberDao();
String num=mdao.getNum(myId);

ShopDao sdao=new ShopDao();
ShopDto sdto=sdao.getShopData(shopnum);

%>


<body>
	<form id="frm">
	  <!-- hidden: num,shopnum(장바구니db_ -->
	  <input type="hidden" name="shopnum" value="<%=shopnum%>">
	  <input type="hidden" name="num" value="<%=num%>">
	  
	  <table style="width: 800px;">
	    <tr>
	      <td style="width: 500px;">
	        <div>
	          <img alt="" src="shopsave/<%=sdto.getPhoto()%>" class="large img-thumbnail">
	        </div>
	      </td>
	      
	      <td style="width: 300px;" valign="top">
	      <br><br>
	        <h3>카테고리: <%=sdto.getCategory() %></h3>
	        <h3>상품명: <%=sdto.getSangpum() %></h3>
	        <%
	         NumberFormat nf=NumberFormat.getCurrencyInstance();
	        %>
	        <h3>가격: <%=sdto.getPrice() %></h3>
	        
	        <!-- 개수선택 -->
	        <h3>개수: 
	          <input type="number" min="1" max="10" value="1" step="1" name="cnt">
	        </h3>
	        
	        <div style="margin-top:100px; margin-left:60px;">
	          <button type="button" id="btncart" style="width: 100px;" class="btn btn-success">장바구니</button>
	          <button type="button" onclick="location.href='index.jsp?main=shop/shoplist.jsp'" style="width: 100px;" class="btn btn-success">상품목록</button>
	        </div>
	      </td>
	    </tr>
	    
	  
	  </table>
	  
	</form>
	
	<script type="text/javascript">
	
	
	  $("#btncart").click(function(){
		  
		  var data=$("#frm").serialize();
		  
		  $.ajax({
			type:"post",
			url:"shop/insertcart.jsp",
			dataType:"html",
			data:data,
			success:function(res){
				var a=confirm("장바구니에 저장했습니다. \n 장바구니로 이동하려면 확인을 눌러주세요.")
				
				if(a){
					location.href="index.jsp?main=shop/mycart.jsp";
				}
			}
			
		  })
	  })
	
	</script>
</body>
</html>