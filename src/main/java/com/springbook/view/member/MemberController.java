package com.springbook.view.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.email.Email;
import com.springbook.biz.email.EmailSender;
import com.springbook.biz.member.MemberService;
import com.springbook.biz.member.MemberVO;

@Controller

public class MemberController {
	@Autowired
	private MemberService memberService;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		// 리턴 값은 ReqeustServlet 데이터 보관소에 저장
		// conditionMap이라는 키 값으로 데이터가 저장
		return conditionMap;
	}

	// 의찬 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String Login(@RequestParam("mId") String mId, @RequestParam("mPassword") String mPassword,
			HttpSession session, HttpServletResponse response) throws Exception {

		String path = "";

		MemberVO vo = new MemberVO();

		vo.setmId(mId);
		vo.setmPassword(mPassword);

		MemberVO member = memberService.login(vo);

		if (member != null) {
			session.setAttribute("member", member);
			path = "index.jsp";
		} else {
			// 있는 아이디인지 체크
			MemberVO existId = memberService.existId(mId);

			if (existId != null && !existId.equals("")) {
				int status = memberService.getMemberAccountStatus(mId);
				if (status >= 3 && status < 99) {
					response.setContentType("text/html; charset=UTF-8");

					PrintWriter out = response.getWriter();
					out.println("<script>alert('이용 정지된 회원입니다. 관리자에게 문의 부탁드립니다.'); </script>");
					out.flush();
				} else {
					response.setContentType("text/html; charset=UTF-8");

					PrintWriter out = response.getWriter();
					out.println("<script>alert('회원 탈퇴된 아이디입니다. 관리자에게 문의 부탁드립니다.');</script>");
					out.flush();
				}
			} else {
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();
				out.println("<script>alert('회원 가입 후 로그인 부탁드립니다.');</script>");
				out.flush();
			}

			path = "login.jsp";
		}

		return path;

	}

	// 로그아웃
	@RequestMapping(value = "/logout.do")
	// Commedn 객체로HttepSession을 선언하게 되면 스프링컨테이너가 브라우저와 매핑된 세션 객체를 담아서 넘겨줌
	public String logout(HttpSession session) {
		System.out.println("로그아웃 처리");
		session.invalidate();
		return "index.jsp";
	}

	// 회원 가입
	//1206 의찬 수정
	@RequestMapping(value = "/insertMember.do")
	public String insertMember(MemberVO vo, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		System.out.println("=====> insertMember.do 컨트롤러 탐");
		int seq = memberService.getMemberSeq();
		System.out.println("====>> 시퀀스값 : " + seq);

		try {

			System.out.println("======> check_2");

			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "/upload/";

			File file = new File(root_path + attach_path);
			// File file = new File(attach_path);
			if (file.exists() == false) {
				file.mkdir();
			}

			MultipartFile uploadFile = vo.getUploadFile();

			if (!uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(root_path + attach_path + fileName));

				vo.setmImgPath(root_path + attach_path);
				vo.setmImgName(uploadFile.getOriginalFilename());

			}
			memberService.insertMember(vo);
			// 화면 네비게이션(게시글 등록 완료 후 게시글 목록으로 이동)
			System.out.println("=========> check_3");
			return "redirect:index.jsp";

		} catch (DuplicateKeyException e) {
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			out.println("<script> alert('중복된 아이디가 아닌 새 아이디로 회원가입 부탁드립니다.');</script>");
			out.flush();

		} catch (Exception e) {
			System.out.println("예외처리 종료");
			return "index.jsp";
		}

		return "join.jsp";
	}

	// 아이디 찾기 페이지 이동
	@RequestMapping(value = "findaccount.do")
	public String findIdView() {
		return "find-account.jsp";
	}

	// 아이디 찾기 실행
	@RequestMapping(value = "findId.do", method = RequestMethod.POST)
	public String findIdAction(MemberVO vo, Model model) {
		MemberVO member = memberService.findId(vo);

		if (member == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", member.getmId());
		}

		return "find-account.jsp";
	}

	// 회원정보 가져오기
	@RequestMapping(value = "/getMember.do")
	public String getMember(Model model, HttpSession session) throws IOException {

		System.out.println("======> getmember 컨트롤러 탐");
		// Model 객체는 RequestServlet 데이터 보관소에 저장
		// RequestServlet 데이터 보관소에 저장하는 것과 동일하게 동작
		// request.setAttribute("board", boardDAO.getBoard(vo)) ==
		// model.addAttribute("board", boardDAO.getBoard(vo))
		try {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			System.out.println("======> 세션가져왔어");
			System.out.println(memberService.getMember(vo).toString());
			model.addAttribute("memberInfo", memberService.getMember(vo));
			// model.addAttribute("mLicenseInfo",memberService.getMember(vo));

			return "changeinfo.jsp";
		} catch (Exception e) {

		}
		return null;

	}

	// 회원정보 수정
	// 의찬 1206수정
	@RequestMapping(value = "/updateMember.do")
	public String updateBoard(MemberVO vo, HttpServletRequest request) throws IOException {
		System.out.println("회원 정보 수정 처리");
		System.out.println("닉네임 : " + vo.getmNickname());
		System.out.println("이메일 : " + vo.getmEmail());
		System.out.println("비밀번호 : " + vo.getmPassword());
		System.out.println("전화번호 : " + vo.getmTell());
		System.out.println("자기소개 : " + vo.getmIntroduce());
		System.out.println("운전면허 : " + vo.getmLicense());
		System.out.println("이미지패스 : " + vo.getmImgPath());
		System.out.println("이미지이름 : " + vo.getmImgName());

		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "/upload/";

		File file = new File(root_path + attach_path);
		// File file = new File(attach_path);
		if (file.exists() == false) {
			file.mkdir();
		}

		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(root_path + attach_path + fileName));

			vo.setmImgPath(root_path + attach_path);
			vo.setmImgName(uploadFile.getOriginalFilename());

		}

		memberService.updateMember(vo);
		return "redirect:Mypage.jsp";
	}

	// 비밀번호 email로 전송 받긔
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;

	@RequestMapping("/findPWD.do")
	public String sendEmailAction(MemberVO vo, Model model) throws Exception {

		System.out.println("====> 이메일 컨트롤러 탐");

		if (memberService.findPassword(vo) == null) {

			model.addAttribute("check", 3);

			return "find-account.jsp";

		} else {

			MemberVO memberPassword = memberService.findPassword(vo);

			String pw = memberPassword.getmPassword();

			model.addAttribute("check", 4);
			String id = memberPassword.getmId();
			String e_mail = memberPassword.getmEmail();

			email.setContent("비밀번호는 " + pw + " 입니다.");
			email.setReceiver(e_mail);
			email.setSubject("랜덤제주" + id + "님 비밀번호 찾기 메일입니다.");
			emailSender.SendEmail(email);

			return "redirect:login.jsp";
		}
	}

	// 아이디 중복 체크
	@RequestMapping(value = "/id_check.do")
	@ResponseBody
	public String idCheck(@RequestParam("id") String id
	/* HttpServletResponse response */) throws IOException {
		MemberVO vo = memberService.idChk(id);

		// response.setContentType("text/html;charset=UTF-8");
		String msg = "";
		if (vo != null) {
			msg = "fail";
		} else {
			msg = "success";
		}
		return msg;
		// PrintWriter writer = response.getWriter();
		// writer.println(msg);
	}

	// 마이페이지 회원 탈퇴
	// 회원권한 정지
	@RequestMapping(value = "/Withdrawal.do")
	public String Withdrawal(MemberVO vo, HttpServletRequest request, Model model, HttpSession session)
			throws IOException {
		System.out.println("회원 탈퇴 처리");
		System.out.println("카테고리 : " + vo.getmAccountStatus());

		int seq = vo.getmSeq();

		memberService.Withdrawal(vo);
		session.invalidate();
		return "index.jsp";
	}

	// 회원권한 정지
	@RequestMapping(value = "/memberBan.do")
	public String memberBan(MemberVO vo, HttpServletRequest request, Model model) throws IOException {
		System.out.println("MemberBan 컨트롤러를 탐");
		System.out.println("회원 정지 처리");
		System.out.println("카테고리 : " + vo.getmAccountStatus());
		System.out.println(vo.getmEmail());
		System.out.println(vo.getmSeq());
		int seq = vo.getmSeq();

		// model.addAttribute("MemberBan", memberService.getMember(vo));

		memberService.memberBan(vo);
		return "getMemberList.do";
	}

	// 회원권한 복구
	@RequestMapping(value = "/memberKeep.do")
	public String memberKeep(MemberVO vo, HttpServletRequest request, Model model) throws IOException {
		System.out.println("MemberKeep 컨트롤러를 탐");
		System.out.println("회원 정지 처리");
		System.out.println("카테고리 : " + vo.getmAccountStatus());
		System.out.println(vo.getmEmail());
		System.out.println(vo.getmSeq());
		int seq = vo.getmSeq();

		// model.addAttribute("MemberBan", memberService.getMember(vo));

		memberService.memberKeep(vo);
		return "getMemberList.do";
	}

	   // Member 목록 불러오기
    @RequestMapping(value="/getMemberList.do", method= RequestMethod.GET)
    public String getMemberList( 
                         MemberVO vo, Model model) {
       System.out.println("글 목록 검색 처리");
       String A = vo.getmAccountStatus();
       System.out.println("mAccountStatus =" + A);
       System.out.println(vo.getmGender());
       System.out.println(vo.getmId());
       System.out.println(vo.getmSeq());
    
       model.addAttribute("MemberList", memberService.getMemberList(vo));
       return "admin-MemberList.jsp";
    }
}
