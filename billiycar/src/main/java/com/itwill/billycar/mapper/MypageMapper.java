package com.itwill.billycar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.vo.CouponIssueVO;
import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.LicenseVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;

import lombok.Builder.Default;

@Mapper
public interface MypageMapper {
	MemberVO selectMemberInfo(String memberId);

	MemberVO selectMemberPasswd(String memberId);

	List<QnaVO> selcetMemberQna(@Param(value = "memberId")String memberId, @Param(value = "startRow")int startRow, @Param(value = "listLimit")int listLimit);
	

	int insertLicense(LicenseVO license);


	int withdrawMember(MemberVO member);

	int updateInfo(MemberVO member);

	int compareLicense(LicenseVO license);

	LicenseVO getMemberLicense(String memberId);

	int updatePasswd(MemberVO member);

	int updatePasswd2(MemberVO member);

	int updateLicenseStatus(MemberVO dbMember);

	boolean selectDuplicateLicense(LicenseVO license);

//	List<Map<String, Object>> selcetMemberCoupon(String member_id);

	int insertMyCoupon(@Param(value = "member_id") String member_id, @Param(value = "coupon_code") String coupon_code);

	int selectDuplicateCoupon(@Param(value = "member_id") String member_id, @Param(value = "coupon_code") String coupon_code);

	int selectCouponCode(String coupon_code);

	int selectQnaListCount(String writer);

	int selectReservListCount(String client);

	List<Map<String, Object>> selectMemberCoupon(@Param("member_id") String member_id, @Param("startRow") int startRow, @Param("listLimit") int listLimit);

	int selectCouponListCount(String memberId);

//	List<QnaVO> selcetMemberQna(String memberId, int pageNum);
//
//	int selectQnaCount(String memberId);

	
	




//	List<License_StandardVO> selectLicenseStandard();

//	int checkLicenseMatch(LicenseVO license);

	

	

	


	
}
