<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
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

<script type="text/javascript">
   $(function(){
      
      $("span.camera").click(function(){
         
         $("#photo").trigger("click"); //trigger는 이벤트 강제 호출 
      });
   });
   
    //이미지 미리보기   
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
            reader.onload = function (e) {
            //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                $('#showimg').attr('src', e.target.result);
                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                //(아래 코드에서 읽어들인 dataURL형식)
            }                   
            reader.readAsDataURL(input.files[0]);
            //File내용을 읽어 dataURL형식의 문자열로 저장
        }
        
    }
    </script>
    
</head>
<body>

    <%
    String num=request.getParameter("num");
    
    GuestDao dao=new GuestDao();
    GuestDto dto=dao.getData(num);

    %>
    
    <div>
   <!-- 이미지 미리보기 -->
   <img id="showimg" style="position: absolute; left: 650px; top: 0px; max-width: 200px;">
   
      <form action="guest/updateaction.jsp" method="post" enctype="multipart/form-data">
	    <input type="hidden" value="<%=dto.getNum()%>" name="num" >
         <table style="width: 600px">
         <caption>
         <b>방명록 작성</b>
         <span class="glyphicon glyphicon-camera camera"></span>
         <input type="file" name="photo" id="photo" style="visibility: hidden;"
          onchange="readURL(this)" value="<%=dto.getPhotoname()%>"> 
         
         </caption>
         
         <tr height="100">
            <td width="500">
            <textarea style="width: 480px; height: 100px;" class="form-control" name="content" required ><%=dto.getContent() %></textarea>
            </td>
            <td>
            <button type="submit" class="btn btn-default" style="width: 100px; height: 100px;">등록</button>
            </td>
         </tr>
         </table>
      </form>
   </div>
    
</body>
</html>