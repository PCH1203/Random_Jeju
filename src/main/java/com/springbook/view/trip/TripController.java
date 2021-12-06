
package com.springbook.view.trip;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.trip.CommentVO;
import com.springbook.biz.trip.TripFileVO;
import com.springbook.biz.trip.TripMemberVO;
import com.springbook.biz.trip.TripService;
import com.springbook.biz.trip.TripVO;
import com.springbook.biz.common.FileUtils;
import com.springbook.biz.member.MemberService;
import com.springbook.biz.member.MemberVO;

@Controller
@SessionAttributes("trip")
public class TripController {
	@Autowired
	private TripService tripService;
	@Autowired
	private MemberService memberService;

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// >>> 여행 생성 |||
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	// 1) 여행 만들기 페이지 이동
	@RequestMapping(value = "/createTrip.do")
	public String createTripView(Model model, HttpSession session) {

		System.out.println("=====> createTrip 컨트롤러 진입");

		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("=====> 세션정보 가지고옴");

		memberService.getMember(vo);

		System.out.println("=====> host 이름 : " + vo.getmName());

		model.addAttribute("hostInfo", memberService.getMember(vo));

		return "create_trip.jsp";
	}

	// 2) 여행 등록 실행
	// 2) 여행 등록 실행
    @RequestMapping(value = "/insertTrip.do")
    public String insertTrip(TripVO vo, TripMemberVO tvo, HttpServletRequest request, Model model,
          HttpSession session) throws IOException {
       System.out.println("======> insertTrip 컨트롤러 탐");

       int seq = tripService.getTripSeq();

       System.out.println("seq= " + seq);

       // 서버의 절대 경로 얻기
       String root_path = request.getSession().getServletContext().getRealPath("/");
       String attach_path = "/upload/";

       // 위 경로의 폴더가 없으면 폴더 생성
       File file = new File(root_path + attach_path);
       // File file = new File(attach_path);

       // file.exists() ==> 파일이 존재하면 true 를 리턴
       if (file.exists() == false) {
          // file.mkdir() ==> 디렉토리 생성해주는데 mkdir은 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우 생성 불가
          file.mkdir();
       }

       // 파일 업로드 처리
       MultipartFile uploadFile = vo.getUploadFile();
       if (!uploadFile.isEmpty()) {

          String fileName = uploadFile.getOriginalFilename();

          // uploadFile.transferTo(new File("D:/" + fileName));
          // uploadFile.transferTo(new File(file + fileName));
          uploadFile.transferTo(new File(root_path + attach_path + fileName));
          System.out.println("=========>1: " + fileName);
          System.out.println("===========>2: " + file + fileName);
          System.out.println("===============>3: " + root_path + attach_path + fileName);

          vo.setTrImgName(uploadFile.getOriginalFilename());
          vo.setTrImgPath(root_path + attach_path);

       }

       tripService.insertTrip(vo);
       tripService.insertTripMembers(tvo);

       System.out.println("======> check_2");
       // 화면 네비게이션(게시글 등록 완료 후 게시글 목록으로 이동)
       return "redirect:index.jsp";
    }

	// ----------------------------------- END 여행 생성 END
	// -------------------------------------------

	// 남주 roomcatagory.jsp
	@RequestMapping(value = "/getTripList.do")

	public String getTripList(TripVO vo, Model model) {
		System.out.println("글 목록 검색 처리");

//		List<TripVO> tripList = tripService.getTripList(vo);
//
//		for (int i = 0; i < tripList.size(); i++) {
//			System.out.println(tripList.get(i).toString());
//		}
		model.addAttribute("tripList", tripService.getTripList(vo));
		return "RoomCatagory.jsp";
	}

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// >>> 여행방 입장(호버로 요약 내용보고 방에 들어가서 상세 보기) |||
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

	@RequestMapping(value = "/entranceRoom.do")

	public String getTrip(TripVO vo, Model model) {

		System.out.println("=====> getTrip 컨트롤러 탐");
		System.out.println("=====> trSeq:" + vo.getTrSeq());

		TripVO i = new TripVO();

		i = tripService.getTrip(vo);

		System.out.println(i.toString());

		TripMemberVO tvo = new TripMemberVO();
		tvo.setTrSeq(i.getTrSeq());

		// int cnt = tripService.countMember(tvo);
		System.out.println("========> trSeq: " + i.getTrSeq() + " trName: " + i.getTrName() + " 여행에 참가중인 인원:"
				+ tripService.countMember(tvo));

		model.addAttribute("trip", tripService.getTrip(vo));
		model.addAttribute("members", tripService.countMember(tvo));

		// 남주님 추가 코드
		List<CommentVO> commentList = tripService.readComment(vo.getTrSeq());
		model.addAttribute("commentList", commentList);
		System.out.println("=====> trSeq :" + model.toString());
		// 남주님 추가 코드 END

		if (i.getTrMode().equals("일반모드")) {
			System.out.println(i.getTrMode());
			System.out.println("일반모드탐");

			return "room-normal.jsp";

		} else if (i.getTrMode().equals("랜덤추천모드")) {
			System.out.println(i.getTrMode());
			System.out.println("랜추모드탐");
			return "room-random.jsp";

		} else {
			System.out.println("게임모드탐");
			System.out.println(i.getTrMode());
			return "room-game.jsp";
		}

	}

	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// >>> 여행에 참여하기 |||
	// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	// , produces = "application/text; charset=utf8"

	@RequestMapping(value = "/attendTrip.do")
	public String attendTrip(TripMemberVO vo, HttpServletRequest request, Model model, HttpSession session,
			HttpServletResponse response) throws IOException, Exception {

		System.out.println("=====> 1) attendTrip 컨트롤러 탐");

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		System.out.println("=====> 2) 세션에서 가져온 MemberVO" + mvo.toString());

		TripVO tvo = (TripVO) session.getAttribute("trip");
		System.out.println("=====> 3) 세션에서 가져온 TripVO" + tvo.toString());

		vo.setTrSeq(tvo.getTrSeq());
		vo.setmSeq(mvo.getmSeq());
		vo.setTmName(mvo.getmName());
		vo.setTmId(mvo.getmId());
		vo.setTmRole("g");

		int i = vo.getmSeq();

		System.out.println("=====> #1): " + vo.toString());
		System.out.println("=====> #2) 세션에서 가져온 TripVO: " + i);

		int trSeq = tvo.getTrSeq();
		System.out.println("=====> 4) 여행 일련번호:" + trSeq);

		int tcnt = tvo.getTrPersonnelSet();
		System.out.println("=====> 5) 설정한 인원:" + tcnt);

		int cnt = tripService.countMember(vo);
		System.out.println("=====> 6) 참가중인 인원:" + cnt);

		String trmode = "";

		// 여행 참여 가능 조건 확인

		// 1) 참여 중복 체크 -> 참여하고자 하는 방에 참가한 적이 있는지 중복 검사
		try {
			int check = 0;
			check = tripService.checkContain(vo);
			System.out.println("=====> 7) 인원중복 여부:" + check);

			if (check != 0) {

				System.out.println("========> 이미참가해서 참가실패");

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('이미 참가한 여행입니다.');</script>");
				out.flush();
			}

			// 2) 참가 가능 인원 조회 -> host 가 설정한 참가인원보다 참가한 인원이 적을 경우 여행에 참여 가능
		} catch (NullPointerException e) {

			if (tcnt > cnt) {

				System.out.println("=====> 참가 성공");

				tripService.insertTripMembers(vo);

				// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('여행에 참가하였습니다.');</script>");
				out.flush();

			} else {

				System.out.println("========> 인원이 가득차서 참가실패");

				// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script> alert('참가 가능인원을 초과 하였습니다.');</script>");
				out.flush();
			}

		}

		return ("entranceRoom.do?trSeq=" + trSeq);
	}

	// 댓글 추가하기
	@RequestMapping(value = "/insertComment.do")
	public String insertComment(CommentVO vo, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {
		System.out.println("********************************************");
		System.out.println("=====> insertComment.do 컨트롤러 탐");

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		System.out.println("======> 세션에서 가져온 MemberVO" + vo.toString());

		TripVO tvo = (TripVO) session.getAttribute("trip");
		System.out.println("======> 세션에서 가져온 TripVO" + tvo.toString());

		vo.setTrSeq(tvo.getTrSeq());
		vo.setmSeq(mvo.getmSeq());
		tripService.insertComment(vo);

		return ("redirect: entranceRoom.do?trSeq=" + vo.getTrSeq());
	}
}