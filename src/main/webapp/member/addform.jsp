<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<script type="text/javascript">
	$(function(){
		
		//id중복체크
		
		
		//email선택
		$("#sel-email").change(function(){
			
			//직접선택
			if($(this).val()=='-'){
				$("#email2").val("");
			}else{
			//나머지
				$("#email2").val($(this).val());				
			}
			
		})
		
	})
	
	//비밀번호 확인 사용자 정의함수 -> 안되면 진행 불가
	function passCheck(f){
		
		if(f.pass.value!=f.pass2.value){
			alert('비밀번호가 서로 다릅니다.');
			
			f.pass.value="";
			f.pass2.value="";
			
			return false; //action 호출되지 않는다
		}
	}
	

</script>

<title>Insert title here</title>
</head>
<body>
  <form action="member/addaction.jsp" method="post" class="form-inline"
  	onsubmit="return passCheck(this)">
  	<table class="table table-bordered" style="width: 80%;">
  	  <tr>
  	  	<th width='100' bgcolor="lightyellow">ID</th>
  	  	<td>
  	  	  <input type="text" name="id" id="id" class="form-control" required style="width: 120px;">
  	  	  <button type="button" class="btn btn-danger" id="btncheck">중복체크</button>
  	  	</td>
  	  </tr>
  	  <tr>
  	  	<th width='100' bgcolor="lightyellow">PW</th>
  	  	<td>
  	  	  <input type="password" name="pass" class="form-control" required style="width: 120px;"
  	  	  placeholder="비밀번호">
  	  	  <input type="password" name="pass2" class="form-control" required style="width: 120px;"
  	  	  placeholder="비밀번호 확인">
  	  	</td>
  	  </tr>
  	  
  	  <tr>
  	    <th width='100' bgcolor="lightyellow">이름</th>
  	    <td>
  	      <input type="text" name="name" class="form-control" required style="width: 120px;">
  	    </td>
  	  </tr>
  	  
  	  <tr>
  	    <th width='100' bgcolor="lightyellow">핸드폰</th>
  	    <td>
  	      <input type="text" name="hp" class="form-control" required style="width: 200px;">
  	    </td>
  	  </tr>
  	  
  	  <tr>
  	    <th width='100' bgcolor="lightyellow">주소</th>
  	    <td>
  	      <input type="text" name="addf" class="form-control" required style="width: 400px;">
  	    </td>
  	  </tr>
  	  
  	  <tr>
  	    <th width='100' bgcolor="lightyellow">이메일</th>
  	    <td>
  	      <input type="text" name="email1"  class="form-control" required style="width: 150px;">
  	      <b>@</b>
  	      <input type="text" name="email2" id="email2" class="form-control" required style="width: 150px;">
  	      
  	      <select id="sel-email" class="form-control">
  	        <option value="-">직접입력</option>
  	        <option value="naver.com">네이버</option>
  	        <option value="gmail.com">구글</option>
  	        <option value="hanmail.com">다음</option>
  	        <option value="nate.com">네이트</option>
  	      </select>
  	    </td>
  	  </tr>
  	  
  	  <tr>
  	    <td colspan="2" align="center">
  	      <button type="reset" class="btn btn-default" style="width: 100px;">초기화</button>
  	      <button type="submit" class="btn btn-default" style="width: 100px;">저장하기</button>
  	    </td>
  	  </tr>
  	</table>
  </form>
</body>
</html>