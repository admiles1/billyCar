package com.itwill.billycar.service;

import java.sql.Connection;

import com.itwill.billycar.dao.MemberDAO;
import com.itwill.billycar.db.JdbcUtil;
import com.itwill.billycar.vo.MemberVO;

public class Joinservice {
	
	public boolean registMember(MemberVO bean) {
		boolean isJoinSuccess = false;
		Connection con = JdbcUtil.getConnection(); 
		
		MemberDAO dao = MemberDAO.getinstance();
		dao.setConnection(con);
		int insertCount = dao.insertMember(bean);
		
		if (insertCount > 0) {
			JdbcUtil.commit(con);
			isJoinSuccess = true;
		} else {
			JdbcUtil.rollback(con);
		}
		
		JdbcUtil.close(con);
		return isJoinSuccess;
	} 
}
