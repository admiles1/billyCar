package com.itwill.billycar.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.billycar.service.EventService;
import com.itwill.billycar.vo.EventVO;

@Controller
public class EventController {
	
	@Autowired
	private EventService service;
	
	@GetMapping("event")
	public String event(Model model) {
		
		List<EventVO> eventList =  service.selectEventList();
//		System.out.println(eventList);
		model.addAttribute("eventList", eventList);
		
		return "event/eventPage";
	}
	
	@GetMapping("eventContent")
	public String eventContent(Model model, EventVO event) {
		
		event = service.selectEventContent(event.getEvent_idx());
		System.out.println(event);
		model.addAttribute("event", event);
		
		return "event/event_content";
	}
	
	
//	@GetMapping("event2")
//	public String event2() {
//		return "event/event2";
//	}
//	
//	@GetMapping("event3")
//	public String event3() {
//		return "event/event3";
//	}
	
	@GetMapping("eventWrite")
	public String eventWrite() {
		return "event/event_write";
	}
	
	@PostMapping("eventWrite")
	public String eventWritePro(EventVO event, HttpSession session , Model model) {
		System.out.println(event);
		
		// 가상 경로
		String uploadDir = "/resources/upload";
		
		// 가상 경로의 실제 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
//		// 날짜별 하위 디렉토리를 분류
//		String subDir = "";
//		LocalDate today = LocalDate.now();
//		
//		String datePattern = "yyyy" + File.separator + "MM" + File.separator + "dd"; 
//		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(datePattern);
//		
//		subDir = today.format(dtf);
//		
//		// 실제 경로에 날짜 경로 추가
//		saveDir += File.separator + subDir;
//		System.out.println("파일경로" + saveDir);
		
		// 디렉토리 생성
		try {
			Path path = Paths.get(saveDir); // 파라미터로 실제 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 저정된 파일 정보(이미지)를 관리하는 MultipartFile으로 실제 파일 다루기
		MultipartFile mfile = event.getEvent_image_form();
		System.out.println(mfile.getOriginalFilename());
		
		// 중복된 파일명을 막기 위한 난수 생성
		String uuid = UUID.randomUUID().toString();
		
		// 파일을 추가 안할 경우를 위해 이미지 파일명 널스트링
//		event.setEvent_image("");
		
		// 이미지 파일 명에 난수 추가
//		String imageName = uuid.substring(0,8) + "_" + mfile.getOriginalFilename();
		
		// 업로드 파일이 존재할 경우에만 파일 경로 + 파일명 저장
		if(!mfile.getOriginalFilename().equals("")) {
			event.setEvent_image(mfile.getOriginalFilename());
		}
		
		// 게시물 등록
		int insertCnt = service.insertEvent(event);
		
		// 실패시
		if(insertCnt <= 0) {
			model.addAttribute("msg", "이벤트 등록에 실패하였습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
		
		// 성공시
		try {
			if(!mfile.getOriginalFilename().equals("")) {
				mfile.transferTo(new File(saveDir, mfile.getOriginalFilename()));
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/event";
	}
	
	@GetMapping("eventModify")
	public String eventModify(EventVO event, Model model) {
		event = service.selectEventContent(event.getEvent_idx());
		model.addAttribute("event", event);
		return "event/event_modify";
	}
	
	@PostMapping("eventModify")
	public String eventModifyPro(EventVO event, Model model, HttpSession session) {
		
		String uploadDir = "/resources/upload";
		
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		try {
			Path path = Paths.get(saveDir); // 파라미터로 실제 업로드 경로 전달
			Files.createDirectories(path); // 파라미터로 Path 객체 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MultipartFile mfile = event.getEvent_image_form();
		
//		String uuid = UUID.randomUUID().toString();
		
		event.setEvent_image("");
		
//		String imageName = uuid.substring(0,8) + "_" + mfile.getOriginalFilename();
		
		if(!mfile.getOriginalFilename().equals("")) {
			event.setEvent_image(mfile.getOriginalFilename());
		}
		
		if(event.getEvent_image().equals("")){
			String event_image = service.selectEventImage(event);
			event.setEvent_image(event_image);
		}
		
		
		int updateCnt = service.updateEvent(event);
		
		if(updateCnt <= 0) {
			model.addAttribute("msg", "이벤트 수정에 실패하였습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
		
		try {
			if(!mfile.getOriginalFilename().equals("")) {
				mfile.transferTo(new File(saveDir, mfile.getOriginalFilename()));
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/eventContent?event_idx="+event.getEvent_idx();
	}
	
	@GetMapping("eventDelete")
	public String eventDelete(EventVO event, Model model, HttpServletResponse response) {
		
		int deleteCnt = service.deleteEvent(event);
		
		if(deleteCnt <= 0) {
			model.addAttribute("msg", "이벤트 삭제에 실패하였습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
		
		return "redirect:/event";
	}
	
}
