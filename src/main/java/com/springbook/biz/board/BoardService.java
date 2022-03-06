package com.springbook.biz.board;

import java.util.List;

import com.springbook.biz.common.Criteria;

public interface BoardService {
	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertBoard(BoardVO vo);

	// 글 수정
	void updateBoard(BoardVO vo);

	// 글 삭제
	void deleteBoard(BoardVO vo);

	// 글 상세 조회
	BoardVO getBoard(BoardVO vo);

	// 글 목록 조회
	List<BoardVO> getBoardList(BoardVO vo);

	// 글 등록 전 등록 될 일련번호 획득
	int getBoardSeq();

	// 디비에 파일 리스트 등록
	void insertBoardFileList(List<BoardFileVO> fileList);

	// 파일목록 리턴
	List<BoardFileVO> getBoardFileList(int seq);

	// 파일삭제
	void deleteFile(BoardFileVO vo);

	// 게시글 삭제 시 해당 게시글의 첨부파일 모두 삭제
	void deleteFileList(int seq);

	List<BoardVO> getMyBoardList(BoardVO vo);

	List<BoardVO> getBoardCategory(BoardVO vo);

	// 글 댓글 조회
	List<FreeCommentVO> freeCommentList(FreeCommentVO vo);

	// 댓글 등록
	void insertBoardComment(FreeCommentVO vo);

	// 조회수
	void updateCnt(BoardVO vo);

	// 댓글 삭제
	void deleteComment(FreeCommentVO vo);

	//파일 전부 삭제 (업데이트)
	void deleteBoardFileList(int seq);
	
	List<BoardVO> getBoardList(BoardVO vo, Criteria cri);
	int selectBoardCount(BoardVO vo);
	
	List<FreeCommentVO> freeCommentList(FreeCommentVO vo, Criteria cri);
	
	int selectCommentCount(FreeCommentVO vo);
}
