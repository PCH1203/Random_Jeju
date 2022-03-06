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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springbook.biz.email.Email;
import com.springbook.biz.email.EmailSender;
import com.springbook.biz.member.MemberService;
import com.springbook.biz.member.MemberVO;
import com.springbook.biz.member.PasswordVO;

@Controller

public class MemberController {
	@Autowired
	private MemberService memberService;

	// 1212 남주 로그인
	@RequestMapping(value = "login.do")
	public String login(MemberVO vo, @RequestParam("mId") String mId, @RequestParam("mPassword") String mPassword,
			HttpSession session, HttpServletResponse response) throws IOException {
		System.out.println("==> Mybatis로 login() 기능 처리");

		MemberVO member = memberService.existId(vo.getmId());
		try {

			System.out.println(mId);
			System.out.println(mPassword);

			int status = Integer.parseInt(member.getmAccountStatus());
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if (encoder.matches(mPassword, member.getmPassword())) {

				if (status < 3) {
					session.setAttribute("member", member);
					return "index.jsp";
				}
				if (status >= 3 && status < 99) {
					response.setContentType("text/html; charset=UTF-8");

					PrintWriter out = response.getWriter();
					out.println("<script>alert('이용 정지된 회원입니다. 관리자에게 문의 부탁드립니다.'); </script>");
					out.flush();
				} else if (status >= 99) {
					response.setContentType("text/html; charset=UTF-8");

					PrintWriter out = response.getWriter();
					out.println("<script>alert('회원 탈퇴된 아이디입니다. 관리자에게 문의 부탁드립니다.');</script>");
					out.flush();
				}
			} else {
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();
				out.println("<script>alert('잘못된 비밀번호 입니다. 확인 후 다시 로그인 해주세요');</script>");
				out.flush();
			}

		} catch (NullPointerException e) {
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입 안된 회원입니다 회원가입 후 이용 부탁드려요');</script>");
			out.flush();
		}
		return "login.jsp";
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
	// 1206 의찬 수정
	@RequestMapping(value = "/insertMember.do")
	public String insertMember(MemberVO vo, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		System.out.println("=====> insertMember.do 컨트롤러 탐");
		int seq = memberService.getMemberSeq();
		System.out.println("====>> 시퀀스값 : " + seq);
		// 1212남주 추가
		System.out.println(vo.getmPassword());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePW = encoder.encode(vo.getmPassword());
		vo.setmPassword(securePW);

		System.out.println(vo.getmPassword());
		// 1212 남주 추가

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
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
	@ResponseBody
	public String findIdAction(MemberVO vo, Model model) throws JsonProcessingException {
		MemberVO member = memberService.findId(vo);
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		if (member == null) {
			hashMap.put("check", "0");
		} else {
			hashMap.put("check", "1");
			hashMap.put("id", member.getmId());
		}

		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashMap);

		return json;
	}

	// 회원정보 가져오기
	@RequestMapping(value = "/getMember.do")
	public String getMember(Model model, HttpSession session) throws IOException {

		System.out.println("======> getmember 컨트롤러 탐");
		try {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			System.out.println("======> 세션가져왔어");
			System.out.println(memberService.getMember(vo).toString());
			model.addAttribute("memberInfo", memberService.getMember(vo));

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
		System.out.println(vo.getUploadFile());

		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "/upload/";

		File file = new File(root_path + attach_path);
		// File file = new File(attach_path);
		if (file.exists() == false) {
			file.mkdir();
		}

		MultipartFile uploadFile = vo.getUploadFile();

		if (uploadFile!=null) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(root_path + attach_path + fileName));
				
			
			//vo.setmImgPath(root_path + attach_path);
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
	public String sendEmailAction(MemberVO vo, Model model, HttpServletResponse response) throws Exception {

		System.out.println("====> 이메일 컨트롤러 탐");
		// 비밀번호찾기가 null이면 3 -> 다시 find-account로
		if (memberService.findPassword(vo) == null) {

			model.addAttribute("check", 3);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('해당 회원이 존재하지 않습니다.');</script>");
			out.flush();

			return "find-account.jsp";

			// 비밀번호 찾기가 null이 아니면
		} else {

			MemberVO memberPassword = memberService.findPassword(vo);

			String pw = memberPassword.getmPassword();

			model.addAttribute("check", 4);

			String id = memberPassword.getmId();
			String e_mail = memberPassword.getmEmail();

			model.addAttribute("check", 4);
//				email.setContent("비밀번호는 " + pw + " 입니다.");
//				email.setReceiver(e_mail);
//				email.setSubject("랜덤제주" + id + "님 비밀번호 찾기 메일입니다.");
//				emailSender.SendEmail(email);
			model.addAttribute("findPwd", memberService.findPassword(vo));

			return "find-password.jsp";
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
	@RequestMapping(value = "/getMemberList.do", method = RequestMethod.GET)
	public String getMemberList(MemberVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		String A = vo.getmAccountStatus();
		System.out.println("mAccountStatus =" + A);
		System.out.println(vo.getmGender());
		System.out.println(vo.getmId());
		System.out.println(vo.getmSeq());

		model.addAttribute("MemberList", memberService.getMemberList(vo));
		return "admin-MemberList.jsp";
	}

	// 회원 비밀번호 변경하기
	@RequestMapping(value = "/updatePassword.do")
	public String updateBoard(MemberVO vo, HttpServletResponse response) throws IOException {
		System.out.println("비번 변경 탔다");

		MemberVO member = memberService.existId(vo.getmId());

		System.out.println("비밀번호 : " + vo.getmPassword());
		System.out.println(" 아이디 :" + vo.getmId());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePW = encoder.encode(vo.getmPassword());
		member.setmPassword(securePW);

		System.out.println(securePW);

		memberService.updatePassword(member);
		// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script> alert('비밀번호가 변경되었습니다.');</script>");
		out.flush();

		return "index.jsp";
	}

	// 회원정보 가져오기
	@RequestMapping(value = "/getMembPw.do")
	public String getMembPw(Model model, HttpSession session) throws IOException {

		System.out.println("======> getMembPw.do 컨트롤러");
		try {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			model.addAttribute("memberInfo", memberService.getMember(vo));

			return "changepassword.jsp";
		} catch (Exception e) {

		}
		return null;

	}

	//비밀번호 변경하기에서 변경하기
	@RequestMapping(value = "/updatePW.do")
	public String updateMemPw(PasswordVO vo, HttpServletResponse response) throws IOException {
		System.out.println("======> updatePW.do 컨트롤러");
		System.out.println(vo.getmPassword());
		System.out.println(vo.getNewmPassword());
		System.out.println(vo.getNewmPasswordConfirm());
		System.out.println(vo.getmId());
		
		MemberVO member = memberService.existId(vo.getmId());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if (encoder.matches(vo.getmPassword(), member.getmPassword())){
			if(vo.getNewmPassword().equals(vo.getNewmPasswordConfirm())) {
				String securePW = encoder.encode(vo.getNewmPassword());
				member.setmPassword(securePW);
				memberService.updatePassword(member);
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('새로운 비밀번호 확인이 일치하지 않습니다. 다시확인해주세요');</script>");
				out.flush();
				return "getMembPw.do";
			}
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('현재 비밀번호가 일치하지 않습니다. 다시 확인해주세요');</script>");
			out.flush();
			return "getMembPw.do";
		}
		
		return "index.jsp";
	}

}
