<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	<%
	
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
		String content=multi.getParameter("content");
		String photoname=multi.getFilesystemName("photo"); //실제업로드된 파일명
		
		//dto에 저장
		GuestDto dto=new GuestDto();
		dto.setMyid(id);
		dto.setContent(content);
		dto.setPhotoname(photoname);
		
		//insert
		GuestDao dao=new GuestDao();
		dao.insertGuest(dto);
		
		//방명록 목록으로 이동
		response.sendRedirect("../index.jsp?main=guest/guestlist.jsp");
	} catch (Exception e){
		System.out.print("업로드 오류:"+e.getMessage());
	}
	
	
	%>
