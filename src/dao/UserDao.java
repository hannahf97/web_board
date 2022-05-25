package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.UserDto;
public class UserDao {
	private static UserDao dao = null;
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	
	public UserDao() {
		DBConnection.initConnection();
	}
	
	public static UserDao getInstance() {
		if(dao == null) {
			dao = new UserDao();
		}
		return dao;
	}
	
	//삽입
	public boolean addUser(UserDto dto) {
		String sql = " INSERT INTO USERTBL(ID, PASSWORD, NAME, AGE, BIRTHDAY, ADDRESS, HEIGHT)"
				+ "VALUES(?,?,?,?,?,?,?)";
		
		conn = null;
		psmt = null;
		
		int check =0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addMember success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setInt(4, dto.getAge());
			psmt.setString(5, dto.getBirthday());
			psmt.setString(6, dto.getAddress());
			psmt.setInt(7, dto.getHeight());
			System.out.println("2/3 addMember success");
			
			check = psmt.executeUpdate();	
			System.out.println("3/3 addMember success");
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, null);			
		}
		return check>0?true:false;
		
	}
	
	
	//삭제
	public boolean signout(String id) {
		String sql = "DELETE FROM USERTBL WHERE ID=?";
		conn = null;
		psmt = null;
		int check =0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 signout success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
		
			System.out.println("2/3 signout success");
			
			 check= psmt.executeUpdate();
			System.out.println("3/3 signout success");
			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, null);			
		}
		return check>0?true:false;
		
	}
	
	//로그인
	public int login(String id, String pwd) {
		String sql = "SELECT PASSWORD FROM USERTBL WHERE ID=?";
		conn = null;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println(id);
			psmt.setString(1, id);
			
			System.out.println("1/3 success");
			rs = psmt.executeQuery();
			if(rs.next()) {
				System.out.println("2/3 success");
				System.out.println(rs.getString(1));
				System.out.println(pwd);
				
				if(rs.getString(1).equals(pwd)) {
					System.out.println("3/3 success");
					return 1;
					
				}else {
					return 0;
				}
			}
			return -1;
			}catch(Exception e) {
				e.printStackTrace();
			
		}
		return -2;
		
	}
	
	
	//탐색 
	public boolean getId(String id) {
		String sql = " SELECT ID FROM USERTBL WHERE ID=?";
		conn = null;
		psmt = null;
		rs = null;
		boolean check = false;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getId success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/3 getId success");
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				check = true;
			}
			System.out.println("3/3 getId success");
		}catch (Exception e) {
			System.out.println("getId fail");
			e.printStackTrace();
		}finally{
			DBClose.close(conn, psmt, rs);
		}
		return check;
	}
	
	

}
