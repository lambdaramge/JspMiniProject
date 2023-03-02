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
		$("#btncheck").click(function(){
			var id=$("#id").val();
			
			$.ajax({
				type: "get",
				url: "member/idsearch.jsp",
				dataType: "json",
				data: {"id":id},
				success: function(res){
					if(res.count==1){
						$("#id-success").text(" 이미 존재하는 아이디입니다.");
						$("#id").val("");
						$("#id").focus();
					}else{
						$("#id-success").text(" 사용가능한 아이디입니다.")
					}
				}
			
			})
			
		})
		
		
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
		
		//pw 길이확인
		$("#pass").keyup(function(){
			var pass=$("#pass").val();
			
			if (pass.length<4){
				$("#pass-success").text("비밀번호는 최소 4글자입니다");
				$("#pass-success").css("color","red");
			} else{
				$("#pass-success").text("");
			}
		})
		
		//pw 재확인 
		$("#pass2").keyup(function(){
			var pass=$("#pass").val();
			var pass2=$("#pass2").val();
			
			if (pass == pass2){
				$("#pass-success").text(" 비밀번호가 일치합니다");
				$("#pass-success").css("color","green");
			}else{
				$("#pass-success").text(" 비밀번호가 일치하지 않습니다");
				$("#pass-success").css("color","red");
			}
		})
		
		//email 형식확인
		$("#email2").keyup(function(){
			var e=$("")
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
  	  	  <button type="button" class="btn btn-danger" id="btncheck" onfocusout="lengthCheck">중복체크</button>
  	  	  <span id="id-success"></span>
  	  	</td>
  	  </tr>
  	  <tr>
  	  	<th width='100' bgcolor="lightyellow">PW</th>
  	  	<td>
  	  	  <input type="password" id="pass" name="pass" class="form-control" required style="width: 120px;"
  	  	  placeholder="비밀번호" onfocusout="lengthCheck">
  	  	  <input type="password" id="pass2" name="pass2" class="form-control" required style="width: 120px;"
  	  	  placeholder="비밀번호 확인">
  	  	  <span id="pass-success"></span>
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
  	      <input type="text" name="addr" class="form-control" required style="width: 400px;">
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