package com.springbook.view.board;

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
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springbook.biz.board.BoardFileVO;
import com.springbook.biz.board.BoardListVO;
import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.FreeCommentVO;
import com.springbook.biz.common.BoardFileUtils;
import com.springbook.biz.common.Criteria;
import com.springbook.biz.common.PageVO;
import com.springbook.biz.member.MemberVO;

@Controller
//board로 model 저장된 객체가 있으면 HttpSession 데이터 보관소에서 동일한 키 값(board)로 저장
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping("/dataTransform.do")
	// @ResponseBody : 메소드 리턴 값을 응답 바디로 설정
	// 메소드 결과 값 자체가 응답 바디가 됨
	@ResponseBody
	public BoardListVO dataTransform(BoardVO vo) {
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		List<BoardVO> boardList = boardService.getBoardList(vo);
		BoardListVO boardListVO = new BoardListVO();
		boardListVO.setBoardList(boardList);
		return boardListVO;
	}

	// @ModelAttribute : 1. Command 객체 이름 지정
	// 2. View(JSP)에서 사용할 데이터 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		// 리턴 값은 ReqeustServlet 데이터 보관소에 저장
		// conditionMap이라는 키 값으로 데이터가 저장
		return conditionMap;
	}

	@RequestMapping(value = "/insertBoard.do")
	// Command 객체 : 사용자가 전송한 데이터를 매핑한 VO를 바로 생성
	// 사용자 입력 값이 많아지면 코드가 길어지기 때문에 간략화 가능
	// 사용자 입력 input의 name 속성과 VO 멤버변수의 이름을 매핑해주는 것이 중요
	public String insertBoard(BoardVO vo, HttpServletRequest request, MultipartHttpServletRequest mhsr)
			throws IOException {

		int seq = boardService.getBoardSeq();

		BoardFileUtils fileUtils = new BoardFileUtils();
		List<BoardFileVO> fileList = fileUtils.parseFileInfo(seq, request, mhsr);

		if (CollectionUtils.isEmpty(fileList) == false) {
			boardService.insertBoardFileList(fileList);
		}

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		System.out.println(member.getmNickname());
		vo.setWriter(member.getmNickname());

		vo.setmSeq(member.getmSeq());

		boardService.insertBoard(vo);

		System.out.println("글 등록 처리");
		System.out.println("일련번호 : " + vo.getSeq());
		System.out.println("제목 : " + vo.getTitle());
		System.out.println("작성자 이름 : " + vo.getWriter());
		System.out.println("내용 : " + vo.getContent());
		System.out.println("등록일 : " + vo.getRegDate());
		System.out.println("조회수 : " + vo.getCnt());

		// 화면 네비게이션(게시글 등록 완료 후 게시글 목록으로 이동)
		return "redirect:getBoardList.do";
	}

	// ModelAttribute로 세션에 board라는 이름으로 저장된 객체가 있는지 찾아서 Command객체에 담아줌
	@RequestMapping(value = "/updateBoard.do")
	public String updateBoard(BoardVO vo, BoardFileVO fvo, HttpServletRequest request, MultipartHttpServletRequest mhsr)
			throws IOException {
		System.out.println("글 수정 처리");
		System.out.println("일련번호 : " + vo.getSeq());
		System.out.println("제목 : " + vo.getTitle());
		System.out.println("작성자 이름 : " + vo.getWriter());
		System.out.println("내용 : " + vo.getContent());
		System.out.println("등록일 : " + vo.getRegDate());
		System.out.println("조회수 : " + vo.getCnt());

		int seq = vo.getSeq();

		HttpSession session = request.getSession();
		BoardVO board = (BoardVO) session.getAttribute("board");

		BoardFileUtils fileUtils = new BoardFileUtils();
		List<BoardFileVO> fileList = fileUtils.parseFileInfo(board.getSeq(), request, mhsr);

		// 넘겨줬던 BoardVO seq를 Comment DB의 seq로 넘겨받고싶은 상황
		System.out.println("board의 seq 넘어오냐? :" + board.getSeq());

		vo.setSeq(board.getSeq());
		fvo.setSeq(board.getSeq());

		if (fvo.getFilePath() != null) {
			boardService.deleteBoardFileList(board.getSeq());

			if (CollectionUtils.isEmpty(fileList) == false) {
				boardService.insertBoardFileList(fileList);
			}

		}

		boardService.updateBoard(vo);

		return "redirect:getBoard.do?seq=" + board.getSeq();

	}

	@RequestMapping(value = "/deleteBoard.do")
	public String deleteBoard(BoardVO vo, MemberVO mvo, HttpServletRequest request) {
		System.out.println("글 삭제 처리");

		HttpSession session = request.getSession();
		BoardVO board = (BoardVO) session.getAttribute("board");
		System.out.println("board의 seq 넘어오냐? :" + board.getWriter());

		MemberVO member = (MemberVO) session.getAttribute("member");
		System.out.println("board의 seq 넘어오냐? :" + member.getmId());

		if (member.getmNickname().equals(board.getWriter())) {

			boardService.deleteBoard(vo);
		}

		else {
			return "redirect:getBoard.do?seq=" + board.getSeq();
		}
		return "getBoardList.do";
	}

	@RequestMapping(value = "/getBoard.do")
	public String getBoard(BoardVO vo, Model model, HttpServletRequest request, FreeCommentVO fvo, Criteria cri) {
		System.out.println("글 상세 조회 처리");

		// Model 객체는 RequestServlet 데이터 보관소에 저장
		// RequestServlet 데이터 보관소에 저장하는 것과 동일하게 동작
		// request.setAttribute("board", boardDAO.getBoard(vo)) ==
		// model.addAttribute("board", boardDAO.getBoard(vo))
		boardService.updateCnt(vo);

		System.out.println("장소 리뷰 목록 검색 처리");
		int total = boardService.selectCommentCount(fvo);
		cri.setAmount(10);
		model.addAttribute("pageMaker", new PageVO(cri, total));

		model.addAttribute("freeCommentList", boardService.freeCommentList(fvo, cri));

		model.addAttribute("board", boardService.getBoard(vo));
		model.addAttribute("fileList", boardService.getBoardFileList(vo.getSeq()));
		/*
		 * model.addAttribute("commentlist", boardService.getCommentList(vo.getSeq()));
		 */

		return "admin-freeBoardcomment.jsp";

	}

	@RequestMapping(value = "/getUpdateBoard.do")
	public String getUpdateBoard(BoardVO vo, HttpServletRequest request, Model model) {
		System.out.println("글 상세 조회 처리");

		model.addAttribute("board", boardService.getBoard(vo));
		model.addAttribute("fileList", boardService.getBoardFileList(vo.getSeq()));

		System.out.println("일련번호 : " + vo.getSeq());
		return "admin-writeupdate.jsp";
	}

	@RequestMapping(value = "/getBoardCategory.do")

	public String getBoardCategory(BoardVO vo, Model model) {

		model.addAttribute("boardList", boardService.getBoardCategory(vo));

		return "admin-freeBoard.jsp";
	}

	@RequestMapping(value = "/getMyBoardList.do")
	// @RequestParam : Command 객체인 VO에 매핑값이 없는 사용자 입력정보는 직접 받아서 처리
	// value = 화면으로부터 전달된 파라미터 이름(jsp의 input의 name속성 값)
	// required = 생략 가능 여부
	public String getMyBoardList(BoardVO vo, Model model, HttpServletRequest request) {
		System.out.println("글 목록 검색 처리");

		System.out.println("일련번호 : " + vo.getSeq());
		System.out.println("제목 : " + vo.getTitle());
		System.out.println("작성자 이름 : " + vo.getWriter());
		System.out.println("내용 : " + vo.getContent());
		System.out.println("등록일 : " + vo.getRegDate());
		System.out.println("조회수 : " + vo.getCnt());

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");

		System.out.println(member.getmNickname());
		vo.setWriter(member.getmNickname());

		model.addAttribute("boardList", boardService.getMyBoardList(vo));

		return "admin-freeBoard.jsp";
	}

	@RequestMapping(value = "/deleteFile.do")
	@ResponseBody
	public void deleteFile(BoardFileVO vo) {
		boardService.deleteFile(vo);
	}

	@RequestMapping(value = "insertBoardComment.do")
	public String insertBoardComment(FreeCommentVO vo, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		System.out.println(vo.getFmNickname());
		System.out.println(vo.getFmComment());
		try {
			// 세션을 가져오기 위해 씀
			HttpSession session = request.getSession();

			// 세션에 memberVO를 담음
			MemberVO member = (MemberVO) session.getAttribute("member");
			System.out.println(member.getmNickname());

			// boardVO 를 세션에 담음
			BoardVO board = (BoardVO) session.getAttribute("board");

			// 넘겨줬던 BoardVO seq를 Comment DB의 seq로 넘겨받고싶은 상황
			System.out.println("board의 seq 넘어오냐? :" + board.getSeq());

			// commentVO의 fm닉네임에 memberVO 세션의 닉네임을 씌움
			vo.setFmNickname(member.getmNickname());

			// 세션의 멤버seq와 insert할 멤버seq를 일치
			vo.setmSeq(member.getmSeq());

			// commentseq = boardseq 처리
			vo.setSeq(board.getSeq());

			boardService.insertBoardComment(vo);

			// 화면 네비게이션(게시글 등록 완료 후 게시글 목록으로 이동)
//      return "getBoard.do";

			return "redirect:getBoard.do?seq=" + board.getSeq();

		} catch (Exception e) {
			// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('로그인을 해주세요.');</script>");
			out.flush();
			return "login.jsp";
		}
	}

	@RequestMapping(value = "/deleteComment.do")
	public String deleteComment(BoardVO vo, FreeCommentVO fvo, MemberVO mvo, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("글 삭제 처리");

		HttpSession session = request.getSession();
		BoardVO board = (BoardVO) session.getAttribute("board");

		// 로그인 세션 호출
		MemberVO member = (MemberVO) session.getAttribute("member");

//      if(fvo.getFmNickname() == member.getmNickname()) {
//         boardService.deleteComment(fvo);
//      }
//      

		// 넘겨줬던 BoardVO seq를 Comment DB의 seq로 넘겨받고싶은 상황
		System.out.println("board의 seq 넘어오냐? :" + board.getSeq());
		System.out.println("memberVO seq:" + mvo.getmSeq());
		System.out.println("memberVO NickName" + mvo.getmNickname());
		System.out.println("세션seq" + member.getmSeq());
		// commentseq = boardseq 처리
		vo.setSeq(board.getSeq());

		if ((mvo.getmSeq()) == member.getmSeq()) {
			System.out.println("삭제 처리 되었습니다.");
			boardService.deleteComment(fvo);
		} else {
			// 반드시 utf-8 먼저 지정 후 PrintWriter out 객체 생성 할 것.
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script> alert('작성자만 삭제할수 있습니다.');</script>");
			out.flush();
		}
		return "getBoard.do?seq=" + board.getSeq();
	}

	@RequestMapping(value = "/getBoardList.do")

	public String getBoardList(BoardVO vo, Model model, Criteria cri) {
		System.out.println("글 목록 검색 처리");

		int total = boardService.selectBoardCount(vo);
		cri.setAmount(10);
		model.addAttribute("pageMaker", new PageVO(cri, total));

		model.addAttribute("boardList", boardService.getBoardList(vo, cri));

		return "admin-freeBoard.jsp";
	}
}