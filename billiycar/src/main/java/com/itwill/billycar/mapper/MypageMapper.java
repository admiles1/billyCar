package com.itwill.billycar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.LicenseVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;

@Mapper
public interface MypageMapper {
	MemberVO selectMemberInfo(String memberId);

	MemberVO selectMemberPasswd(String memberId);

	List<QnaVO> selcetMemberQna(String memberId);

	int insertLicense(LicenseVO license);


	int withdrawMember(MemberVO member);

	int updateInfo(MemberVO member);

	int compareLicense(LicenseVO license);

	LicenseVO getMemberLicense(String memberId);

	int updatePasswd(MemberVO member);

	int updatePasswd2(MemberVO member);

	int updateLicenseStatus(MemberVO dbMember);

	boolean selectDuplicateLicense(LicenseVO license);

	List<Map<String, Object>> selcetMemberCoupon(String member_id);




//	List<License_StandardVO> selectLicenseStandard();

//	int checkLicenseMatch(LicenseVO license);

	

	

	


	
}
