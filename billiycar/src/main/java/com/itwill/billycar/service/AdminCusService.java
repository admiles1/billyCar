package com.itwill.billycar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwill.billycar.mapper.AdminCusMapper;
import com.itwill.billycar.mapper.CsMapper;
import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.FaqVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.NoticeVO;
import com.itwill.billycar.vo.QnaVO;

@Service
public class AdminCusService {

	@Autowired
	private AdminCusMapper mapper;

	//-----------------------------------------------------------------------------
	// ** [FaQ] **
	// 글쓰기 처리
	public int writeFaq(FaqVO faq) {
		return mapper.insertFaq(faq);
	}

	// 글 목록 불러오기
	public List<FaqVO> getFaqList(int listLimit, int startRow) {
		return mapper.selectFaqList(listLimit, startRow);
	}
	
	// 글 목록 개수
	public int getFaqListCount() {
		return mapper.selectFaqCount();
	}

	// 글 목록 자세히
	public FaqVO selectFaqDetail(int faq_idx) {
		return mapper.selectFaqDetail(faq_idx);
	}

	// 자주묻는질문 수정
	public int modifyFaq(FaqVO faq) {
		return mapper.updateFaq(faq);
	}

	// 자주묻는질문 삭제
	public int deleteFaq(int faq_idx) {
		return mapper.deleteFaq(faq_idx);
	}

	// ---------------------------------------------------------------------------------------------
	// ** [문의] **
	
	// 문의 내역 불러오기
	public List<QnaVO> getQnaList(int startRow, int listLimit, int answer_status) {
		return mapper.selectQnaList(startRow, listLimit, answer_status);
	}

	public int getQnaListCount(int answer_status) {
		return mapper.selectQnaListCount(answer_status);
	}

	public QnaVO getQna(QnaVO qna) {
		return mapper.selectQna(qna);
	}

	public int wrtieAnswer(QnaVO qna) {
		return mapper.updateAnswer(qna);
	}

	// ---------------------------------------------------------------------------------------------
	// ** [쿠폰 등록] **
	
	// 중복된 쿠폰 확인
	public CouponVO selectCouponCode(CouponVO coupon) {
		return mapper.selectCouponCode(coupon);
	}
	
	// 쿠폰 등록하기
	public int addCoupon(CouponVO coupon) {
		return mapper.insertCoupon(coupon);
	}

	// 쿠폰 내역 불러오기
	public List<CouponVO> getCouponList() {
		return mapper.selectCouponList();
	}

	// 쿠폰 삭제하기
	public int removeCoupon(String coupon_code) {
		return mapper.deleteCoupon(coupon_code);
	}

	// -----------------------------------------------------------------------------------------
	// ** [면허 인증 관리] **
	
	// 회원 수 출력
	public int getMemberCount(int license_auth) {
		return mapper.selectMemberCount(license_auth);
	}
	
	public List<Map<String, Object>> getLicenseList(int listLimit, int startRow, int license_auth) {
		return mapper.selectLicense(listLimit, startRow, license_auth);
	}

	

	




}
