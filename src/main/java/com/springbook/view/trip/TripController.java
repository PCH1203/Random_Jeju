
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springbook.biz.member.MemberService;
import com.springbook.biz.member.MemberVO;
import com.springbook.biz.trip.CommentVO;
import com.springbook.biz.trip.ReviewVO;
import com.springbook.biz.trip.ScheduleVO;
import com.springbook.biz.trip.TripMemberVO;
import com.springbook.biz.trip.TripService;
import com.springbook.biz.trip.TripVO;

@Controller
@SessionAttributes("trip")
public class TripController {
	@Autowired
	private TripService tripService;
	@Autowired
	private MemberService memberService;

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
	@RequestMapping(value = "/insertTrip.do")
	public String insertTrip(TripVO vo, TripMemberVO tvo, HttpServletRequest request, Model model, HttpSession session)
			throws IOException {
		System.out.println("======> insertTrip 컨트롤러 탐");

		// 2-1) trip 테이블의 (max+1) 값 가져오기
		int seq = tripService.getTripSeq();
		System.out.println("====> 신규생성할 trSeq: " + seq);

		// 1207 남주 수정
		vo.setTrSeq(seq);
		model.addAttribute("trip", tripService.getTrip(vo));
		model.addAttribute("tripseq", tripService.getTripSeq());
		System.out.println("seq= " + seq);
		System.out.println("박정보>>>>>>>>>>>" + String.valueOf(vo.getTrDateSet()));
		System.out.println("박정보>>>>>>>>>>>" + vo.getTrMode());
		System.out.println("위치 정보 >>>>>>>>>" + vo.getTrAreaSet());
		System.out.println("trSEQ>>>>>>>>>>" + seq);
		// 1207 남주 수정 끝

		// 2-2) 파일 업로드할 서버의 절대 경로 얻기
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

		// 2-3) 신규 여행 생성 및 host 정보 주입
		tripService.insertTrip(vo);
		tripService.insertTripMemberH(tvo);

		System.out.println("======> check_2");
		// 화면 네비게이션(게시글 등록 완료 후 게시글 목록으로 이동)
		return ("redirect: entranceRoom.do?trSeq=" + vo.getTrSeq());
	}

	// 남주 roomcatagory.jsp
	@RequestMapping(value = "/getTripList.do")

	public String getTripList(TripVO vo, Model model) {
		System.out.println("글 목록 검색 처리");

		model.addAttribute("tripList", tripService.getTripList(vo));
		return "RoomCatagory.jsp";
	}

	// 3) 여행방 입장하기
	@RequestMapping(value = "/entranceRoom.do")

	public String getTrip(TripVO vo, ScheduleVO svo, Model model, HttpSession session) {

		TripVO i = new TripVO();

		i = tripService.getTrip(vo);

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		// System.out.println("=======> 입장하는 사람 정보: " + mvo.toString());

		TripMemberVO tvo = new TripMemberVO();
		tvo.setTrSeq(i.getTrSeq());
		tvo.setmSeq(mvo.getmSeq());

		//System.out.println("========> trSeq: " + i.getTrSeq() + " trName: " + i.getTrName() + " 여행에 참가중인 인원:"+ tripService.countMember(tvo));

		model.addAttribute("trip", tripService.getTrip(vo));
		model.addAttribute("members", tripService.countMember(tvo));

		// 여행 참가 맴버 프로필 불러오기
		model.addAttribute("tripMemberList", tripService.getTripMemberList(vo));
		System.out.println("==========>맴버 리스트: " + tripService.getTripMemberList(vo));

		// 여행 방에 입장한 사람의 tripMemverVO 불러오기
		model.addAttribute("tripMember", tripService.getTripMember(tvo));

		// 남주님 추가 코드
		List<CommentVO> commentList = tripService.readComment(vo.getTrSeq());
		model.addAttribute("commentList", commentList);
		//System.out.println("=====> trSeq :" + model.toString());
		// 남주님 추가 코드 END

		// 여행 타입에 따른 jsp 분기
		if (i.getTrMode().equals("일반모드")) {
			System.out.println(i.getTrMode());
			System.out.println("일반모드탐");
			// 1208 추가
			model.addAttribute("scheduleList", tripService.getscheduleList(svo));

			return "room-normal.jsp";

		} else if (i.getTrMode().equals("랜덤추천모드")) {
			System.out.println(i.getTrMode());
			System.out.println("랜추모드탐");
			// 1208 추가
			model.addAttribute("scheduleList", tripService.getscheduleList(svo));

			return "room-random.jsp";

		} else {
			System.out.println("게임모드탐");
			System.out.println(i.getTrMode());
			// 1208 추가
			// 게임모드일때는 클리어된 스케쥴만 들고감
			model.addAttribute("scheduleList", tripService.getClearedscheduleList(svo));

			List<Map<String, String>> hashMap = tripService.getClearedscheduleList(svo);
			for (int j = 0; j < hashMap.size(); j++) {
				System.out.println(hashMap.get(j).toString());
			}

			return "room-game.jsp";
		}

	}

	// 4) 여행에 참여하기
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
		//String message = "";
		
		System.out.println("=====> #1): " + vo.toString());
		System.out.println("=====> #2) 세션에서 가져온 TripVO: " + i);

		int trSeq = tvo.getTrSeq();
		System.out.println("=====> 4) 여행 일련번호:" + trSeq);

		int tcnt = tvo.getTrPersonnelSet();
		System.out.println("=====> 5) 설정한 인원:" + tcnt);

		int cnt = tripService.countMember(vo);
		System.out.println("=====> 6) 참가중인 인원:" + cnt);

		// 여행 참여 가능 조건 확인

		// 1) 참여 중복 체크 -> 참여하고자 하는 방에 참가한 적이 있는지 중복 검사
		try {
			int check = 0;
			check = tripService.checkContain(vo);
			System.out.println("=====> 7) 인원중복 여부:" + check);

			if (check != 0) {

				System.out.println("========> 이미참가해서 참가실패");
				//message="이미 참가한 여행입니다.";
				model.addAttribute("message", "이미 참가한 여행입니다.");
			}

			// 2) 참가 가능 인원 조회 -> host 가 설정한 참가인원보다 참가한 인원이 적을 경우 여행에 참여 가능
		} catch (NullPointerException e) {

			if (tcnt > cnt) {

				System.out.println("=====> 참가 성공");
				//message="여행에 참가하였습니다.";
				model.addAttribute("message", "여행에 참가하였습니다.");
				tripService.insertTripMembers(vo);
			} else {

				System.out.println("========> 인원이 가득차서 참가실패");
				//message="참가 가능인원을 초과 하였습니다.";
				model.addAttribute("message", "참가 가능인원을 초과 하였습니다.");
			}

		}

		return ("redirect: entranceRoom.do?trSeq=" + trSeq);
	}

	// 5) 여행 참여 취소 하기
	@RequestMapping(value = "/exitTrip.do")
	public String exitTrip(TripMemberVO vo, HttpSession session, HttpServletResponse response)
			throws IOException, Exception {

		System.out.println("=====> exitTrip 컨트롤러 진입 ");

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		TripVO tvo = (TripVO) session.getAttribute("trip");

		vo.setTrSeq(tvo.getTrSeq());
		vo.setmSeq(mvo.getmSeq());

		tripService.exitTrip(vo);

		System.out.println("=====> 여행 참가 취소 ");

		// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script> alert('여행 참가를 취소 하였습니다.');</script>");
		out.flush();

		return "getTripList.do";

	}

	// 6) 강퇴 시키기
	@RequestMapping(value = "/exileTrip.do")
	public String exileTrip(TripMemberVO vo, HttpSession session, HttpServletResponse response)
			throws IOException, Exception {

		System.out.println("=====> exileTrip 컨트롤러 진입 ");

		TripVO tvo = (TripVO) session.getAttribute("trip");
		System.out.println("=====> 3) 세션에서 가져온 TripVO" + tvo.toString());

		vo.setTrSeq(tvo.getTrSeq());
		tripService.exitTrip(vo);

		System.out.println("=====> 참가자 강제퇴장 성공");

		// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
		/*
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		 * response.getWriter();
		 * out.println("<script> alert('참가자를 강제 퇴장 하였습니다.');</script>"); out.flush();
		 */

		int trSeq = tvo.getTrSeq();
		System.out.println("=====> 4) 여행 일련번호:" + trSeq);

		return ("entranceRoom.do?trSeq=" + trSeq);
	}

	// 7) 일정 진행 시키기
	@RequestMapping(value = "/tripStatus.do")
	public String tripStatus(TripVO vo, HttpSession session, HttpServletResponse response)
			throws IOException, Exception {

		System.out.println("=====> tripStatus 컨트롤러 진입 ");

		TripVO tvo = (TripVO) session.getAttribute("trip");

		vo.setTrSeq(tvo.getTrSeq());

		tripService.changeTripStatus(vo);

		System.out.println("=====> tripStatus 변경 완료 ");

		int trSeq = tvo.getTrSeq();

		return ("entranceRoom.do?trSeq=" + trSeq);

	}

	// 댓글 추가하기
	@RequestMapping(value = "/insertComment.do")
	@ResponseBody
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

		return null;
	}

	// 랜덤 추천모드 다시 추천하기
	@RequestMapping(value = "/reinsertSchedule.do")
	public String reinsertschedule(ScheduleVO vo, Model model, HttpSession session) {
		System.out.println("=====> reinsertSchedule.do 컨트롤러 탐");

		TripVO tvo = (TripVO) session.getAttribute("trip");
		System.out.println("======> 세션에서 가져온 TripVO" + tvo.toString());

		vo.setTrSeq(tvo.getTrSeq());
		System.out.println(vo.getTrSeq());

		tripService.reinsertschedule(tvo);

		return ("redirect: entranceRoom.do?trSeq=" + vo.getTrSeq());
	}

	// 게임모드 장소정하기 클릭
	@RequestMapping(value = "/addGameModeSchedule.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String addGameModeSchedule(ScheduleVO vo) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("addGameModeSchedule", tripService.addGameModeSchedule(vo));
		tripService.updateTrStatus(vo);

		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
		return json;
	}

	// 인증사진 올리기 했을때
	@RequestMapping(value = "/updateClearTrschedule.do")
	public String updateClearTrschedule(ScheduleVO vo, Model model, HttpServletRequest request) {
		System.out.println("=====> updateClearTrschedule.do 컨트롤러 탐");

		System.out.println(">>>>>>>>>>>trclearfilename" + vo.getTrClearFilename());

		// 2-2) 파일 업로드할 서버의 절대 경로 얻기
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
			try {
				uploadFile.transferTo(new File(root_path + attach_path + fileName));
			} catch (IllegalStateException e) {
				System.out.println("ffff");
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println("ffff");
				e.printStackTrace();
			}
			System.out.println("=========>1: " + fileName);
			System.out.println("===========>2: " + file + fileName);
			System.out.println("===============>3: " + root_path + attach_path + fileName);

			vo.setTrClearFilename(uploadFile.getOriginalFilename());
			// vo.setTrImgPath(root_path + attach_path);

		}

		tripService.updateClearTrschedule(vo);

		return ("redirect: entranceRoom.do?trSeq=" + vo.getTrSeq());
	}

	// 내 여행 내놔

	@RequestMapping(value = "/getMyTripList.do")

	public String getMyTripList(TripVO vo, TripMemberVO tvo, Model model, HttpServletRequest request) {
		System.out.println("글 목록 검색 처리");
		System.out.println("mSeq===========================" + tvo.getmSeq());
		// HttpSession session = request.getSession();
		// MemberVO member = (MemberVO)session.getAttribute("member");
		//
		// member.getmSeq();
		// System.out.println("======>" + member.getmSeq());
		// tvo.setmSeq(member.getmSeq());

		model.addAttribute("tripList", tripService.getMyTripList(tvo.getmSeq()));
		model.addAttribute("tripMemberList", tripService.getMyTripMember(vo));
		// model.addAttribute("tripPlaceList", tripService.getMyTripPlace(vo));
		return "trable.jsp";
	}

	// 개인 리뷰 작성페이지 접근
	@RequestMapping(value = "/accessReview.do")
	public String accessReview(TripMemberVO vo, HttpServletRequest request, HttpServletResponse response,
			HttpSession session, Model model) throws IOException, Exception {

		System.out.println("=====> accessReview 컨트롤러 진입 ");

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		TripVO tvo = (TripVO) session.getAttribute("trip");

		System.out.println("====> 리뷰페이지에 접근한 사람 정보: " + mvo.toString());
		System.out.println("====> 리뷰페이지에 여행 정보: " + tvo.toString());
		System.out.println("====> 리뷰 타켓 정보 : " + vo.toString());

		MemberVO mvo2 = new MemberVO();
		mvo2.setmSeq(vo.getmSeq());

		// 리뷰 중복검사하기
		ReviewVO rvo = new ReviewVO();
		rvo.setmSeq(vo.getmSeq());
		rvo.setTrSeq(tvo.getTrSeq());
		rvo.setrWriterSeq(mvo.getmSeq());

		TripVO tvo2 = tripService.getTrip(tvo);

		int checkRveiw = 0;
		checkRveiw = tripService.checkReview(rvo);
		System.out.println("======> 리뷰남긴적이 있는지 확인 : " + checkRveiw);

		if (checkRveiw == 0 && tvo2.getTrStatus() == 3) {

			System.out.println("========> 리뷰 참여 가능");

			// model.addAttribute("reviewTarget", tripService.getTripMember(vo));
			model.addAttribute("reviewTarget", memberService.getMember(mvo2));
			model.addAttribute("trip", tvo);

			return "personalreview.jsp";

		} else if (checkRveiw != 0) {
			System.out.println("========> 리뷰를 남긴적이 있음");

			// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('이미 리뷰를 남기셨습니다.');</script>");
			out.flush();

		} else {

			System.out.println("========> 여행이 완료 되지 않음");
			// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('여행이 완료된 후 리뷰를 남기실 수 있습니다.');</script>");
			out.flush();

		}

		return ("entranceRoom.do?trSeq=" + tvo.getTrSeq());

	}

	// 개인 리뷰/신고 인서트하기
	@RequestMapping(value = "/insertReview.do")
	public String insertReview(ReviewVO vo, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException, Exception {

		System.out.println("=====> insertReview 컨트롤러 진입 ");

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		TripVO tvo = (TripVO) session.getAttribute("trip");

		System.out.println("====> 리뷰페이지에 접근한 사람 정보: " + mvo.toString());
		System.out.println("====> 리뷰페이지에 여행 정보: " + tvo.toString());
		System.out.println("====> 리뷰 타켓 정보: " + vo.toString());

		vo.setTrSeq(tvo.getTrSeq());
		vo.setrWriterSeq(mvo.getmSeq());

		if (vo.getrReviewType().equals("complain")) {

			tripService.updateMemberStatus(vo);
			System.out.println("========> 신고하기 기능 수행");
		}

		tripService.insertReview(vo);
		System.out.println("========> 리뷰작성 기능 수행");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script> alert('리뷰작성을 완료 하였습니다.');</script>");
		out.flush();

		return ("entranceRoom.do?trSeq=" + tvo.getTrSeq());

	}

	// complain 작성페이지 이동
	@RequestMapping(value = "/complain.do")
	public String complain(TripMemberVO vo, HttpServletRequest request, HttpServletResponse response,
			HttpSession session, Model model) throws IOException, Exception {

		System.out.println("=====> complain 컨트롤러 진입 ");

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		TripVO tvo = (TripVO) session.getAttribute("trip");

		System.out.println("====> 리뷰페이지에 접근한 사람 정보: " + mvo.toString());
		System.out.println("====> 리뷰페이지에 여행 정보: " + tvo.toString());
		System.out.println("====> 리뷰 타켓 정보 : " + vo.toString());

		MemberVO mvo2 = new MemberVO();
		mvo2.setmSeq(vo.getmSeq());

		model.addAttribute("reviewTarget", memberService.getMember(mvo2));
		model.addAttribute("trip", tvo);

		return "complain.jsp";

	}

	// 나의 리뷰 보기 (12.12 박찬호 추가 / 12.13 박찬호 수정)
	@RequestMapping(value = "/myReviews.do")
	public String myReviews(ReviewVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model) throws IOException, Exception {

		System.out.println("=====> myReviews 컨트롤러 진입 ");

		MemberVO mvo = (MemberVO) session.getAttribute("member");

		System.out.println("====> 리뷰페이지에 접근한 사람 정보: " + mvo.toString());
		System.out.println("====> 리뷰 타켓 정보 : " + vo.toString());

		// 나의 리뷰 조회
	      if (vo.getmSeq() == 0) {
	         vo.setmSeq(mvo.getmSeq());
	         MemberVO mvo1 = memberService.getMember(mvo);

	         model.addAttribute("myInfo", mvo1);
	         model.addAttribute("myReviewList", tripService.getmyReviewList(vo));
			// 상대방 리뷰 조회
		} else {
			MemberVO targetmSeq = new MemberVO();
			targetmSeq.setmSeq(vo.getmSeq());

			MemberVO mvo2 = memberService.getMember(targetmSeq);

			model.addAttribute("myInfo", mvo2);
			model.addAttribute("myReviewList", tripService.getmyReviewList(vo));
		}

		return "myReviews.jsp";

	}
}