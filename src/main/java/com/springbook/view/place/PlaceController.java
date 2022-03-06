package com.springbook.view.place;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.member.MemberVO;
import com.springbook.biz.place.Criteria;
import com.springbook.biz.place.PageVO;
import com.springbook.biz.place.PlaceReviewCmVO;
import com.springbook.biz.place.PlaceService;
import com.springbook.biz.place.PlaceVO;

@Controller
//board로 model 저장된 객체가 있으면 HttpSession 데이터 보관소에서 동일한 키 값(board)로 저장
@SessionAttributes("place")
public class PlaceController {
	@Autowired
	private PlaceService placeService;

	@RequestMapping(value = "/insertplace.do")
	// Command 객체 : 사용자가 전송한 데이터를 매핑한 VO를 바로 생성
	// 사용자 입력 값이 많아지면 코드가 길어지기 때문에 간략화 가능
	// 사용자 입력 input의 name 속성과 VO 멤버변수의 이름을 매핑해주는 것이 중요
	public String insertPlace(PlaceVO vo, HttpServletRequest request, Model model, HttpSession session)
			throws IOException {

		int seq = placeService.getPlaceSeq();
		System.out.println("=====> seq= " + seq);

		/*
		 * PlaceFileUtils fileUtils = new PlaceFileUtils(); List<PlaceFileVO> fileList =
		 * fileUtils.parseFileInfo(seq, request, mhsr);
		 * 
		 * if (CollectionUtils.isEmpty(fileList) == false) {
		 * placeService.insertPlaceFileList(fileList); }
		 * 
		 * placeService.insertPlace(vo);
		 * 
		 * // 화면 네비게이션(게시글 등록 완료 후 게시글 목록으로 이동) return
		 * "redirect:getPlaceList.do?pCategory=" + vo.getpCategory();
		 */

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

			vo.setOriginalFileName(uploadFile.getOriginalFilename());
			vo.setFilePath(root_path + attach_path);
		}
		placeService.insertPlace(vo);

		System.out.println("======> check_2");
		// 화면 네비게이션(게시글 등록 완료 후 게시글 목록으로 이동)
		return "redirect:getPlaceList.do?pCategory=" + vo.getpCategory();
	}

	// ModelAttribute로 세션에 board라는 이름으로 저장된 객체가 있는지 찾아서 Command객체에 담아줌
	@RequestMapping(value = "/updatePlace.do")
	public String updatePlace(PlaceVO vo, HttpServletRequest request, MultipartHttpServletRequest mhsr)
			throws IOException {
		PlaceVO oldvo = placeService.getPlace(vo);
		String oldFileName = oldvo.getOriginalFileName();

		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "/upload/";

		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {

			String fileName = uploadFile.getOriginalFilename();

			// uploadFile.transferTo(new File("D:/" + fileName));
			// uploadFile.transferTo(new File(file + fileName));
			uploadFile.transferTo(new File(root_path + attach_path + fileName));

			vo.setOriginalFileName(uploadFile.getOriginalFilename());
			vo.setFilePath(root_path + attach_path);

		} else {
			vo.setOriginalFileName(oldFileName);
			vo.setFilePath(root_path + attach_path);
		}

		System.out.println("파일 : " + vo.getOriginalFileName());
		System.out.println("패스 : " + vo.getFilePath());

		/*
		 * vo.getOriginalFileName(); vo.getFilePath();
		 */
		placeService.updatePlace(vo);

		return "redirect:getPlaceList.do?pCategory=" + vo.getpCategory();
	}

	@RequestMapping(value = "/getPlace.do")
	public String getPlace(PlaceVO vo, Model model) {
		System.out.println("글 상세 조회 처리");

		// Model 객체는 RequestServlet 데이터 보관소에 저장
		// RequestServlet 데이터 보관소에 저장하는 것과 동일하게 동작
		// request.setAttribute("board", boardDAO.getPlace(vo)) ==
		// model.addAttribute("board", placeDAO.getPlace(vo))
		model.addAttribute("getPlace", placeService.getPlace(vo));
		/*
		 * model.addAttribute("fileList", placeService.getPlaceFileList(vo.getpSeq()));
		 */
		return "admin-Editpage.jsp";
	}

	@RequestMapping("/getPlaceList.do")
	public String getPlaceList(PlaceVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
		System.out.println("cate================================" + vo.getpCategory());

		model.addAttribute("placeList", placeService.getPlaceList(vo));

		return "admin-RoomsList3.jsp";

	}

	//
	@RequestMapping("/getPlaceAllList.do")
	public String getPlaceAllList(PlaceVO vo, Model model) {
		System.out.println("글 목록 검색 처리");

		model.addAttribute("placeAllList", placeService.getPlaceAllList(vo));

		return "admin-RoomsList2.jsp";
	}

	@RequestMapping(value = "/deletePlace.do")
	public String deleteCafe(PlaceVO vo) throws IOException {
		System.out.println("글 삭제 처리");
		placeService.deletePlace(vo);
		System.out.println("pSeq" + vo.getpSeq());
		System.out.println(vo.getpCategory());

		return "redirect:getPlaceList.do?pCategory=" + vo.getpCategory();
	}

	// 의찬 ReviewBoard.jsp
	@RequestMapping(value = "/getReviewBoardList.do")

	public String getReviewBoardList(PlaceVO vo, Model model, Criteria cri) {
		System.out.println("장소 리뷰 목록 검색 처리");

		int total = placeService.selectPlaceBoardCount(vo);
		cri.setAmount(12);
		model.addAttribute("pageMaker", new PageVO(cri, total));

		model.addAttribute("reviewBoardList", placeService.getReviewBoardList(vo, cri));

		return "ReviewBoard.jsp";
	}

	// 의찬 ReviewWrite.jsp
	@RequestMapping(value = "/getReviewWriteList.do")

	public String getReviewWriteList(PlaceVO vo, Model model, Criteria cri) {
		System.out.println("=====> getReviewWrite 컨트롤러 탐");
		System.out.println("=====> Seq:" + vo.getpSeq());
		System.out.println("=====> Seq:" + vo.toString());

		List<PlaceReviewCmVO> ReviewCommentList = placeService.ReviewReadComment(vo.getpSeq(), cri);
		model.addAttribute("ReviewCommentList", ReviewCommentList);
		System.out.println("=====> pSeq :" + model.toString());

		System.out.println("pv.getpSeq()=============================================" + vo.getpSeq());
		int total = placeService.selectPlaceReviewCount(vo.getpSeq());
		model.addAttribute("pageMaker", new PageVO(cri, total));

		PlaceVO ReviewAdr = placeService.ReviewAddress(vo.getpSeq());
		model.addAttribute("ReviewAddress", ReviewAdr);

		int ReviewAllComment = placeService.ReviewAllComment(vo.getpSeq());
		model.addAttribute("ReviewAllComment", ReviewAllComment);
		System.out.println(ReviewAdr);

		model.addAttribute("place", placeService.getReviewWriteList(vo));

		return "ReviewWrite.jsp";
	}

	// 리뷰 입력
	@RequestMapping(value = "/insertPlaceReview.do")
	public String insertPlaceReview(PlaceReviewCmVO vo, HttpServletRequest request, HttpServletResponse response,
			HttpSession session, Model model) throws IOException {

		MemberVO mvo = (MemberVO) session.getAttribute("member");
		System.out.println("---->세션에서 가져온 MemberVO" + mvo.toString());
		System.out.println("=====> insertPlaceReview.do 컨트롤러 탐");

		vo.setmSeq(mvo.getmSeq());

		System.out.println("======> check_2");

		placeService.insertPlaceReview(vo);
		// 화면 네비게이션(게시글 등록 완료 후 게시글 목록으로 이동)
		System.out.println("=========> check_3");
		return "redirect:getReviewWriteList.do?pSeq=" + vo.getpSeq();

	}

	@RequestMapping(value = "/deleteReview.do")
	public String deleteReview(PlaceReviewCmVO vo, MemberVO mvo, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("리뷰 삭제 처리");

		HttpSession session = request.getSession();
		// 로그인 세션 호출
		MemberVO member = (MemberVO) session.getAttribute("member");

		// 넘겨줬던 PlaceReviewCmVO rcSeq를 reviewboardComment DB의 reSeq로 넘겨받고싶은 상황
		System.out.println("memberVO mSeq:" + mvo.getmSeq());
		System.out.println("세션seq" + member.getmSeq());

		if ((mvo.getmSeq()) == member.getmSeq()) {
			System.out.println("삭제 처리 되었습니다.");

			placeService.deleteReview(vo);
		} else {
			// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('작성자만 삭제할수 있습니다.');</script>");
			out.flush();
		}
		return "getReviewWriteList.do?pSeq=" + vo.getpSeq();
	}
}