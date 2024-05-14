package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.LicenseVO;
import com.itwill.billycar.vo.License_StandardVO;
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

	int updateLicenseStatus(MemberVO dbMember);

	boolean selectDuplicateLicense(LicenseVO license);

	List<CouponVO> selcetMemberCoupon(String memberId);




//	List<License_StandardVO> selectLicenseStandard();

//	int checkLicenseMatch(LicenseVO license);

	

	

	


	
}
