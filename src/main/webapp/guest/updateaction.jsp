<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    <%
    /* String num=request.getParameter("num");
    String content=request.getParameter("content");
    String p=request.getParameter("photo");    

    GuestDto dto=new GuestDto();
    
    dto.setNum(num);
    dto.setContent(content);
	dto.setPhotoname(p);    
    
    GuestDao dao=new GuestDao();
    dao.updateGuest(dto);
    
    response.sendRedirect("../index.jsp?main=guest/guestlist.jsp"); */
    
  //세션에 저장한 id 
  	String id=(String)session.getAttribute("myId");
  	
  	//file upload, 이미지가 업로드되는 실제경로
  	String realPath=getServletContext().getRealPath("/save");
  	System.out.print(realPath);
  	
  	int uploadSize=1024*1024*2; //2mb
  	MultipartRequest multi=null;
  	
  	try{
  		multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
  		
  		//multi 변수로 모든 폼데이터 읽어오기
  		String num=multi.getParameter("num");
  		String content=multi.getParameter("content");
  		String photoname=multi.getFilesystemName("photo"); //실제업로드된 파일명
  		
  		//dto에 저장
  		GuestDto dto=new GuestDto();
  		dto.setNum(num);
  		dto.setContent(content);
  		dto.setPhotoname(photoname);
  		
  		//update
  		GuestDao dao=new GuestDao();
  		dao.updateGuest(dto);
  		
  		//방명록 목록으로 이동
  		response.sendRedirect("../index.jsp?main=guest/guestlist.jsp");
  	} catch (Exception e){
  		System.out.print("업로드 오류:"+e.getMessage());
  	}
  	
    %>
    
    