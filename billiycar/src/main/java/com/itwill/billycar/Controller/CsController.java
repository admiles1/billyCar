package com.itwill.billycar.Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.billycar.service.CsService;
import com.itwill.billycar.vo.AdminVO;
import com.itwill.billycar.vo.NoticeVO;
import com.itwill.billycar.vo.QnaVO;
import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;

@Controller
public class CsController {
	
	@Autowired
	private CsService service;
	
	@Autowired
	private HttpSession session;
	
	
	@GetMapping("cs")
	public String cs() {
		return "event/eventPage";
	}
	
	// 공지사항 ----------------------------
	@GetMapping("notice")
	public String notice(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		// 페이징 
		int listLimit = 5;
		int startRow = (pageNum-1)*listLimit;
		
		
		// 조회수
		
		// 글 목록
		List<NoticeVO> noticeList = service.getNoticeList(startRow, listLimit);
		model.addAttribute("noticeList", noticeList);
		
		return "cs/notice";
	}
	
	// 글 작성
	@GetMapping("noticeWrite")
	public String notice_write(Model model) {
		
		// 작성자가 admin이 아닐 경우 튕구기
		String id = (String)session.getAttribute("member_id");
		
		if(id==null || !id.equals("admin")) {
			model.addAttribute("msg","잘못된 접근입니다");
			model.addAttribute("targetURL","notice");
			return "err/fail";
		}
		
		return "cs/notice_write";
	}
	
	// 글 작성 처리
	@PostMapping("noticeWrite")
	public String noticePro(NoticeVO notice, Model model) {
		// 작성자id에 admin 추가
		String id = (String)session.getAttribute("member_id");
		
		if(id==null || !id.equals("admin")) {
			model.addAttribute("msg","잘못된 접근입니다");
			model.addAttribute("targetURL","notice");
			return "err/fail";
		}
		
		notice.setBoard_writer(id);
		
		// DB에 추가
		int insertCnt = service.writeNotice(notice);
		
		// 판별
		if(insertCnt > 0) {
			return "redirect:/notice";
		} else {
			model.addAttribute("msg","글쓰기 실패하셨습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
	}
	
	// 제목 누르면 게시물 보기
	@GetMapping("noticeDetail") 
	public String noticeDetail(int notice_idx, Model model) {
		
		// 디테일 가져오기
		NoticeVO notice = service.getNoticeDetail(notice_idx);
		
		// 보내기
		model.addAttribute("notice", notice);
		
		return "cs/notice_detail";
	}
	
	// 수정폼
	@GetMapping("noticeModify")
	public String noticeModify(Model model, NoticeVO notice, int notice_idx) {
		
		// 작성자가 admin이 아닐 경우 튕구기
		String id = (String)session.getAttribute("member_id");
		
		if(id==null || !id.equals("admin")) {
			model.addAttribute("msg","잘못된 접근입니다");
			model.addAttribute("targetURL","notice");
			return "err/fail";
		}
		
		notice = service.modifyInfo(notice_idx);
		model.addAttribute("notice", notice);
		
		return "cs/notice_modify";
	}
	
	// 수정 처리
	@PostMapping("noticeModify")
	public String noticeModifyPro(Model model, NoticeVO notice, int notice_idx) {
		
		// 작성자가 admin이 아닐 경우 튕구기
		String id = (String)session.getAttribute("member_id");
		
		if(id==null || !id.equals("admin")) {
			model.addAttribute("msg","잘못된 접근입니다");
			model.addAttribute("targetURL","notice");
			return "err/fail";
		}
		
		notice.setBoard_idx(notice_idx);
		System.out.println(notice.getBoard_idx());
		int insertCount = service.modifyNotice(notice);
		
		return "cs/notice";
	}
	
	// 삭제폼
	@GetMapping("noticeDelete")
	public String noticeDelete(Model model) {
		
		// 작성자가 admin이 아닐 경우 튕구기
		String id = (String)session.getAttribute("member_id");
		
		if(id==null || !id.equals("admin")) {
			model.addAttribute("msg","잘못된 접근입니다");
			model.addAttribute("targetURL","notice");
			return "err/fail";
		}
		
		return "cs/notice_delete_form";
	}
	
	// 삭제 처리
	@PostMapping("noticeDelete")
	public String noticeDeletePro(int pageNum, int notice_idx, String notice_passwd, Model model) {
		
		// 작성자가 admin이 아닐 경우 튕구기
		String id = (String)session.getAttribute("member_id");
		
		if(id==null || !id.equals("admin")) {
			model.addAttribute("msg","잘못된 접근입니다");
			model.addAttribute("targetURL","notice");
			return "err/fail";
		}
		
		// 비밀번호가 관리자 비밀번호인지 확인
		if(notice_passwd.equals(service.isAdmin())) {
//			System.out.println("어드민이네요");
			
			// 삭제하기
			int deleteCnt = service.deleteNotice(notice_idx);
			if(deleteCnt > 0) {
				System.out.println("삭제성공");
			} else {
				model.addAttribute("msg", "삭제 실패하였습니다. \\n 다시 시도해 주세요");
				return "err/fail";
			}
			
		} else {
//			System.out.println("아니시네요");
			
			model.addAttribute("msg", "삭제 권한이 없습니다");
			return "err/fail";
		}
		
		return "redirect:/notice";
	}
	
	// FAQ -------------------------------
	@GetMapping("faq")
	public String faq() {
		return "cs/FAQ";
	}
	
	// QnA -------------------------------
	@GetMapping("qna")
	public String qna(QnaVO qna, Model model, @RequestParam(defaultValue = "1") int pageNum) {
		// 페이징 
		int listLimit = 5;
		int startRow = (pageNum-1)*listLimit;
		
		String id = (String)session.getAttribute("member_id");
		
		List<QnaVO> qnaList = service.getQnaList(startRow, listLimit, id);
		model.addAttribute("qnaList", qnaList);
		return "cs/Q&A_list";
	}
	
	@GetMapping("qna_q")
	public String qna_q(QnaVO qna, Model model) {
		qna.setQna_writer((String)session.getAttribute("member_id"));
		model.addAttribute("qna", qna);
		return "cs/Q&A_Q";
	}
	
	@PostMapping("qna_q")
	public String qna_q_pro(QnaVO qna, Model model) {
		
		// [파일 업로드 처리] ---------------------------------------------------------
		
		// 1) 경로
		String uploadDir = "/resources/upload"; // 가상 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir); // 실제 경로
		
		// 2) 날짜별 서브 디렉토리 나누기
		String subDir = ""; 
		LocalDate today = LocalDate.now();
		String datePattern = "yyyy" + File.separator + "MM" + File.separator + "dd";
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(datePattern);
		
		// 3) 서브디렉토리에 저장
		subDir = today.format(dtf);
		
		// 4) 기존 업로드 실제 경로에 서브 디렉토리 결합
		saveDir += File.separator + subDir;
		
		// 5) 해당 디렉토리가 실제 경로가 존재하지 않을 경우 자동 생성
		try {
			// (1) java.nio.file.Paths의 get() 호출하여 path 객체 리턴
			Path path = Paths.get(saveDir); 
			
			// (2) files 클래스의 createDirectories()로 실제 경로 생성
			Files.createDirectories(path);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 6) 실제 파일 다루기
		MultipartFile mfile = qna.getQna_file_form();
		System.out.println(mfile.getOriginalFilename());

		// 7) 중복 이름 방지
		String uuid = UUID.randomUUID().toString();
		
		// 7-1) 업로드 안 됐을 시 널스트링
		qna.setQna_file("");
		
		// 7-2) 결합
		String fileName = uuid.substring(0,8) + "_" + mfile.getOriginalFilename();
		
		if(!mfile.getOriginalFilename().equals("")) {
			qna.setQna_file(subDir+ File.separator +fileName);
		}
		
		// [글 작성] ----------------------------------------------------------------
		
		int insertCnt = service.writeQna(qna);
		
		// 문의 실패 시
		if(insertCnt == 0) {
			model.addAttribute("msg", "문의 실패하셨습니다. \\n 다시 시도해 주세요");
			return "err/fail";
		}
		
		try {
			if(!mfile.getOriginalFilename().equals("")) {
				mfile.transferTo(new File(saveDir, fileName));
			}
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/qna";
	}
	
	@GetMapping("qna_a")
	public String qna_a() {
		return "cs/Q&A_A";
	}
	
	// 질문 가져오기
	@GetMapping("qnaAnswerDetail")
	public String Answer() {
		System.out.println("qna_a");
		return "cs/Q&A_A";
	}
}
