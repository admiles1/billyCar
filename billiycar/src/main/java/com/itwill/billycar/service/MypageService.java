package com.itwill.billycar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.billycar.mapper.MypageMapper;
import com.itwill.billycar.vo.CouponIssueVO;
import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.LicenseVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.PageInfo;
import com.itwill.billycar.vo.QnaVO;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mapper;
	
	public MemberVO getMemberInfo(String memberId) {
        // 회원 아이디를 이용하여 회원 정보를 가져오는 로직
        return mapper.selectMemberInfo(memberId);
    }

	public List<QnaVO> getMemberQna(int startRow, int listLimit, String memberId) {
		return mapper.selcetMemberQna(memberId, startRow, listLimit);
	}
	
	public int registLicense(LicenseVO license) {
		return mapper.insertLicense(license);
	}

	
	public int withdrawMember(MemberVO member) {
		return mapper.withdrawMember(member);
	}

	public int modifyInfo(MemberVO member) {
		
		return mapper.updateInfo(member);
	}

	public int getLicense(LicenseVO license) {
		return mapper.compareLicense(license);
	}

	public LicenseVO getLicenseInfo(String memberId) {
		return mapper.getMemberLicense(memberId);
	}

	public int modifyPasswd(MemberVO member) {
		return mapper.updatePasswd(member);
	}
	public int modifyPasswd2(MemberVO member) {
		System.out.println("2222222222222222222"); //까지 나옴
		System.out.println("222222222222222222의" + member);
//		System.out.println(mapper.updatePasswd(member));
		mapper.updatePasswd(member);
		System.out.println("333333333333333333333333333나와라");
		return mapper.updatePasswd(member);
	}

	public int changeLicenseStatus(MemberVO dbMember) {
		return mapper.updateLicenseStatus(dbMember);
	}

	public boolean isLicenseDuplicate(LicenseVO license) {
		return mapper.selectDuplicateLicense(license);
	}

//	public List<Map<String, Object>> getMemberCoupon(String member_id) {
//		return mapper.selcetMemberCoupon(member_id);
//	}

	public int couponUpdate(String member_id, String coupon_code) {
		return mapper.insertMyCoupon(member_id, coupon_code);
	}

	public int couponCheck(String member_id, String coupon_code) {
		return mapper.selectDuplicateCoupon(member_id, coupon_code);
	}

	public int couponExist(String coupon_code) {
		return mapper.selectCouponCode(coupon_code);
	}

	public int getQnaListCount(String writer) {
		return mapper.selectQnaListCount(writer);
	}

	public int getReservListCount(String client) {
		return mapper.selectReservListCount(client);
	}

	public List<Map<String, Object>> getMemberCoupon(int startRow, int listLimit, String member_id) {
	    return mapper.selectMemberCoupon(member_id, startRow, listLimit);
	}

	public int getCouponListCount(String memberId) {
	    return mapper.selectCouponListCount(memberId);
	}

//	public List<QnaVO> getMemberQna(String memberId, int pageNum) {
//		return mapper.selcetMemberQna(memberId, pageNum);
//	}

//	public PageInfo getPageInfo(String memberId, int pageNum) {
//		return null;
//	}

	




}
