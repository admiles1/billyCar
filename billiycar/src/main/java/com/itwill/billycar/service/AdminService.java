package com.itwill.billycar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.billycar.mapper.AdminMapper;
import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.CarVO;
import com.itwill.billycar.vo.CommonVO;
import com.itwill.billycar.vo.MemberVO;
import com.itwill.billycar.vo.QnaVO;

@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;
	
	public AdminVO adminlogin(AdminVO admin) {
		System.out.println("AdminService - adminlogin()");
		return mapper.selectMember(admin);
	}

	public List<MemberVO> adminMemberList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.adminMemberList(searchType,searchKeyword,startRow,listLimit);
	}

	public int getMemberListCount(String searchType, String searchKeyword, int startRow, int listLimit) {
		
		int listCount = 0;
		
		listCount = mapper.getMemberCount(searchType,searchKeyword,startRow,listLimit);
		return listCount;
	}

	public int carUpload(CarVO car) {
		
		return mapper.insertCar(car);
	}

	public int MemberStatusModify(MemberVO member) {
		return mapper.updateMember(member);
	}

	public List<CarVO> getCar(CarVO car) {
		return mapper.selectCar(car);
	}
	
	public List<QnaVO> adminAnswerList() {
		return mapper.selectQnaList();
	}


	public List<CommonVO> getBrands() {
		
		return mapper.selectBrands();
	}

	public List<CommonVO> getModel() {
		
		return mapper.selectModel();
	}

	public List<CommonVO> getTypes() {
		
		return mapper.selectTypes();
	}

	public List<CommonVO> getFuels() {

		return mapper.selectFuels();
	}
	
	public List<CommonVO> getBusinesshours() {
		
		return mapper.selectBusinesshours();
	}

	public CarVO getCarById(int carId) {
		
		return mapper.selectCarId(carId);
	}

	public int updateCar(CarVO car) {
		
		return mapper.updateCar(car);
	}
	public int selectAllcar(int status) {
		return mapper.selectAllcar(status);
	}

	public int addBrandModel(String newBrandName) {
//		System.out.println("서비스까지 도착햇어");
		
		return mapper.insertNewBrand(newBrandName);
	}

	public int addModel(String brandName, String newModelName) {
		System.out.println("서비스까지 도착햇어");
		
		return mapper.insertNewModel(brandName,newModelName);
	}

	public int deleteCar(int carId) {
		
		return mapper.deleteCar(carId);
	}

	public int deleteCode(String code) {
		// TODO Auto-generated method stub
		return mapper.deleteCode(code);
	}

	public List<String> searchModel(String code) {
		
		return mapper.selectSearchModel(code);
	}

	public int deleteModelCode(String code) {
		
		return mapper.deleteNewModel(code);
	}

	

}
