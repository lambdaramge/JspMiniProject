package data.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.MemberDto;
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
			
			//해당 아이디가 존재하면 1을 반환하고 존재하지 않으면 0을 반환
			if(rs.next()) {
				
				isId=rs.getInt(1);
				/* if(rs.getInt(1)==1)
				 * isid=1;
				 * 지난번에는 이렇게 했음!! 
				 */	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
		
		String sql="select * from member where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			//id만 조회하면 되니까 if문 사용
			if(rs.next())
				name=rs.getString("name");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	}
	
	//insert
	 public void insertMember(MemberDto dto) {
	       
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	       
	      //name id pass hp addr mail
	      String sql="insert into member values(null,?,?,?,?,?,?,now())";
	       
	      try {
	        pstmt=conn.prepareStatement(sql);
	         
	        pstmt.setString(1, dto.getName());
	        pstmt.setString(2, dto.getId());
	        pstmt.setString(3, dto.getPass());
	        pstmt.setString(4, dto.getHp());
	        pstmt.setString(5, dto.getAddr());
	        pstmt.setString(6, dto.getEmail());
	         
	        pstmt.execute();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         db.dbClose(pstmt, conn);
	      }
	 
	 }

	 //전체목록 출력 
	 public List<MemberDto> getAllMembers(){

		 List<MemberDto> list=new Vector<>();

		 Connection conn=db.getConnection();
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;

		 String sql="select * from member order by id";

		 try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next()) {

				MemberDto dto=new MemberDto();

				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setEmail(rs.getString("email"));
				dto.setGaipday(rs.getTimestamp("gaipday"));

				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}


		return list;
	 }

	 //삭제메서드, 삭제 클릭시 jsp를 모달 창에서 처리,
	 //삭제처리는 memberdelete.jsp에서 삭제처리 (삭제form에 num hidden)
	 public void deleteMember(String num) {
		 
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from member where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	 }
	 
	 //아이디와 비번 체크
	 public boolean isIdPassCheck(String id, String pass) {
		 
		 boolean b=false;
		 Connection conn=db.getConnection();
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 
		 String sql="select * from member where id=? and pass=?";
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			//입력한 id, pass를 가진 db가 있으면 true 반환
			if(rs.next()) {
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		 return b;
	 }
	 
	 //getdata
	 public MemberDto getData(String num) {
		 MemberDto dto=new MemberDto();
		 
		 Connection conn=db.getConnection();
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 
		 String sql="select * from member where num=?";
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setEmail(rs.getString("email"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		 
		 return dto;
	 }
	 
	 //update
	 public void updateMember(MemberDto dto) {
		 Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update member set pass=?,hp=?,addr=?,email=? where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getPass());
				pstmt.setString(2, dto.getHp());
				pstmt.setString(3, dto.getAddr());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getNum());
				
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
	 }
}