package com.itwill.billycar.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.billycar.service.GuideService;
import com.itwill.billycar.vo.CarVO;

@Controller
public class GuideController {

	@Autowired
	private GuideService service;
	
	@GetMapping("guideCompany")
	public String guideCompany() {
		return "guidance/company";
	}
	
	@GetMapping("guideRental")
	public String guideReantal() {
		return "guidance/rental";
	}
	
	@GetMapping("guideRefund")
	public String guideRefund() {
		return "guidance/refund";
	}
	
	@GetMapping("guideCar")
	public String guideCar(Model model
							, @RequestParam(defaultValue = "1")int pageNum) {
	    int listLimit = 4;
	    int startRow = (pageNum - 1) * listLimit;
	    
		List<Map<String, Object>> carList = service.carList(startRow,listLimit);
		
		System.out.println(carList);
		model.addAttribute("carList", carList);
		return "guidance/car_introduction";
	}
	
	
}
