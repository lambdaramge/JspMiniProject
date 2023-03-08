<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    <%
    
    //multi
    String realPath=getServletContext().getRealPath("/shopsave");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*2; //2mb
	MultipartRequest multi=null;
	
    try{
    	
    	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
    	
    	//multi 변수로 모든 폼데이터 읽어오기
		String category=multi.getParameter("category");
		String sangpum=multi.getParameter("sangpum");
    	String photoname=multi.getFilesystemName("photo"); //실제업로드된 파일명
		int price=Integer.parseInt(multi.getParameter("price"));
		String ipgoday=multi.getParameter("ipgoday");
    			
	    ShopDto dto=new ShopDto();
	    dto.setCategory(category);
	    dto.setSangpum(sangpum);
	    dto.setPhoto(photoname);
	    dto.setPrice(price);
	    dto.setIpgoday(ipgoday);
	    
	    ShopDao dao=new ShopDao();
	    dao.insertShop(dto);

	    response.sendRedirect("../index.jsp?main=shop/shoplist.jsp");
    } catch (Exception e){
    	System.out.print("업로드오류:"+e.getMessage());
    }
    
    %>