package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.db.DbConnect;

public class MemberDao {
	DbConnect db=new DbConnect();
	
	//id 중복체크
    public int isIdCheck(String id) {
    	
    	int isId=0;
    	
    	Connection conn=db.getConnection();
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	
    	String sql="select count(*) from member where id=?";
    	
    	try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) //해당아이디 존재하면 1, 존재하지 않으면 0 반환
			{
				/*
				 * if(rs.getInt(1)==1) isId=1;
				 */
				isId=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
    	
    	return isId;
    }
    
    //id에 따른 name값 리턴
    public String getName(String id) {
    	String name="";
    	
    	Connection conn=db.getConnection();
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	
    	String sql="select name from member where id=?";
    	
    	try {
    		
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				name=rs.getString("name");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
    			
    	return name;
    }
	
	//insert
}
