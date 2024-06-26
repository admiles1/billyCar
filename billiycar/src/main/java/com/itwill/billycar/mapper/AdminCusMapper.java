package com.itwill.billycar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.billycar.vo.CouponVO;
import com.itwill.billycar.vo.FaqVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.NoticeVO;
import com.itwill.billycar.vo.QnaVO;

@Mapper
public interface AdminCusMapper {

	int insertFaq(FaqVO faq); // 자주묻는질문 글쓰기 처리
	List<FaqVO> selectFaqList(@Param(value = "startRow") int startRow,@Param(value = "listLimit") int listLimit); // 자주묻는질문 목록 가져오기
	int selectFaqCount(); // 자주묻는질문 개수
	FaqVO selectFaqDetail(int faq_idx); // 자주묻는질문 자세히
	int updateFaq(FaqVO faq); // 자주묻는질문 수정
	int deleteFaq(int faq_idx); // 자주묻는질문 삭제
	List<QnaVO> selectQnaList(@Param(value="startRow") int startRow, @Param(value = "listLimit") int listLimit, @Param(value = "answer_status") int answer_status); // 문의내역 목록 불러오기
	int selectQnaListCount(int answer_status); // 문의 내역 개수 가져오기
	QnaVO selectQna(QnaVO qna); // 문의 내역 답변을 위해 불러오기
	int updateAnswer(QnaVO qna); // 문의 내역 답변 저장하기
	CouponVO selectCouponCode(CouponVO coupon); // 중복된 쿠폰 막기
	int insertCoupon(CouponVO coupon); // 쿠폰 등록하기
	List<CouponVO> selectCouponList(); // 쿠폰 내역 불러오기
	int deleteCoupon(String coupon_code); // 쿠폰 삭제하기
	int selectMemberCount(int license_auth); // 회원 수 출력
	List<Map<String, Object>> selectLicense(@Param(value="startRow") int startRow, @Param(value = "listLimit") int listLimit, @Param(value = "license_auth") int license_auth); // 회원 목록 불러오기

}
