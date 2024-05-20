package com.itwill.billycar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.CommonVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;
import com.itwill.billycar.vo.ReservVO;

@Mapper
public interface AdminMapper {
	AdminVO selectMember(AdminVO admin);
	
	//회원 목록 조회
	List<MemberVO> adminMemberList(@Param("searchType") String searchType,
			@Param("searchKeyword") String searchKeyword,
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	int getMemberCount(@Param("searchType") String searchType,
			@Param("searchKeyword") String searchKeyword,
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);
	
	// 차 등록
	int insertCar(CarVO car);

	int updateMember(MemberVO member);
	
	// 차량 조회
	List<CarVO> selectCarList(@Param(value = "startRow") int startRow,@Param(value = "listLimit") int listLimit);
	
	List<QnaVO> selectQnaList();
	
	// 공통 코드 색출
	List<CommonVO> selectBrands();

	List<CommonVO> selectModel();

	List<CommonVO> selectTypes();

	List<CommonVO> selectFuels();
	
	List<CommonVO> selectBusinesshours();
	// 여기까지

	// 수정할 차량 정보 조회
	CarVO selectCarId(int carId);

	int updateCar(CarVO car);
	
	int selectAllcar(int status);

	int insertNewBrand(@Param("newBrandName") String newBrandName);

	int insertNewModel(@Param("brandName")String brandName, @Param("newModelName") String newModelName);

	int deleteCar(int carId);

	int deleteCode(String code);

	List<String> selectSearchModel(String code);

	int deleteNewModel(String code);

	List<CarVO> selectCarModel(String modelCode);

	List<ReservVO> selectReservation(String carNumber);

	int selectCarListCount();
	
	
}
