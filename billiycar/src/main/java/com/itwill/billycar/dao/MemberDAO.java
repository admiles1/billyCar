package com.itwill.billycar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.itwill.billycar.db.JdbcUtil;
import com.itwill.billycar.vo.MemberVO;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	private Connection con;
	
	private MemberDAO() {}
	
	public static MemberDAO getinstance() {
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertMember(MemberVO bean) {
		int insertCount = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO MEMBER VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), 0, null)";
		
		try {
			System.out.println(bean);
			pstmt = con.prepareStatement(sql);
			
			insertCount = pstmt.executeUpdate();
			System.out.println(insertCount);
		} catch (SQLException e) {
			System.out.println("구문오류 - 인서트멤버");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return insertCount;
	};
	
	public boolean selectCorrectUser(MemberVO member) {
		boolean isCorrectUser = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member WHERE id = ? AND passwd = ?";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				isCorrectUser = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return isCorrectUser;
	}
}
