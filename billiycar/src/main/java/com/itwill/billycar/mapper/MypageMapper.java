package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.LicenseVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;

@Mapper
public interface MypageMapper {
	MemberVO selectMemberInfo(String memberId);

	MemberVO selectMemberPasswd(String memberId);

	List<QnaVO> selcetMemberQna(String memberId);

	int insertLicense(LicenseVO license);

	int checkLicenseMatch(LicenseVO license);

	int withdrawMember(MemberVO member);

	int updateInfo(MemberVO member);

	

	

	


	
}
