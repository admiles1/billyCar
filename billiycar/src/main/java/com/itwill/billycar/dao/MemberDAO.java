package com.itwill.billycar.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

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
		String sql = "INSERT INTO `member` VALUES (null, ?, ?, ?, ?, ?, ?, now(), 2 , ?)";
		if(bean.getInviter().equals("")) {
			bean.setInviter("추천인없음");
		}
		
		try {
			pstmt = con.prepareStatement(sql);
//			(null, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), 0, null)
//			 idx, id , name, passwd, email, birth, phone, inviter
			pstmt.setString(1, bean.getMember_id());
			pstmt.setString(2, bean.getMember_name());
			pstmt.setString(3, bean.getMember_passwd());
			pstmt.setString(4, bean.getMember_email());
			pstmt.setString(5, bean.getMember_birth());
			pstmt.setString(6, bean.getMember_phone());
			pstmt.setString(7, bean.getInviter());
			
			insertCount = pstmt.executeUpdate();
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
