package com.springbook.biz.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardFileVO;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.FreeCommentVO;
import com.springbook.biz.common.Criteria;

@Repository
public class BoardDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertBoard(BoardVO vo) {
		System.out.println("====> Mybatis로 insertBoard() 기능 처리");
		mybatis.insert("BoardDAO.insertBoard", vo);
	}

	public void updateBoard(BoardVO vo) {
		System.out.println("====> Mybatis로 updateBoard() 기능 처리");
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	public void deleteBoard(BoardVO vo) {
		System.out.println("====> Mybatis로 deleteBoard() 기능 처리");
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}

	public BoardVO getBoard(BoardVO vo) {
		System.out.println("====> Mybatis로 getBoard() 기능 처리");
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
	}

	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("====> Mybatis로 getBoardList() 기능 처리");
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}

	public int getBoardSeq() {
		return mybatis.selectOne("BoardDAO.getBoardSeq");
	}

	public void insertBoardFileList(List<BoardFileVO> fileList) {
		for (BoardFileVO boardFile : fileList) {
			mybatis.insert("BoardDAO.insertBoardFileList", boardFile);
		}
	}

	public List<BoardFileVO> getBoardFileList(int seq) {
		return mybatis.selectList("BoardDAO.getBoardFileList", seq);
	}

	public void deleteFile(BoardFileVO vo) {
		mybatis.delete("BoardDAO.deleteFile", vo);
	}

	public void deleteFileList(int seq) {
		mybatis.delete("deleteFileList", seq);
	}

	public List<BoardVO> getMyBoardList(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getMyBoardList", vo);
	}

	public List<BoardVO> getBoardCategory(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getBoardCategory", vo);
	}

	// 댓글 목록 보기
	public List<FreeCommentVO> freeCommentList(FreeCommentVO vo) {
		System.out.println("====> Mybatis로 getBoardList() 기능 처리");
		return mybatis.selectList("BoardDAO.freeCommentList", vo);
	}

	public void insertBoardComment(FreeCommentVO vo) {
		System.out.println("====> Mybatis로 insertBoard() 기능 처리");
		mybatis.insert("BoardDAO.insertBoardComment", vo);
	}

	public void updateCnt(BoardVO vo) {
		mybatis.update("BoardDAO.updateCnt", vo);

	}

	public void deleteComment(FreeCommentVO vo) {
		mybatis.delete("BoardDAO.deleteComment", vo);
	}

	public void deleteBoardFileList(int seq) {
		mybatis.delete("BoardDAO.deleteBoardFileList", seq);

	}

	public List<BoardVO> getBoardList(BoardVO vo, Criteria cri) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		paramMap.put("boardvo", vo);
		paramMap.put("criteria", cri);
		System.out.println("====> Mybatis로 getBoardList() 기능 처리");
		return mybatis.selectList("BoardDAO.getBoardList", paramMap);
	}

	public int selectBoardCount(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.selectBoardCount", vo);
	}

	public List<FreeCommentVO> freeCommentList(FreeCommentVO vo, Criteria cri) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		paramMap.put("commentlistvo", vo);
		paramMap.put("criteria", cri);
		System.out.println("====> Mybatis로 freeCommentList() 기능 처리");
		return mybatis.selectList("BoardDAO.freeCommentList", paramMap);
	}

	public int selectCommentCount(FreeCommentVO vo) {
		return mybatis.selectOne("BoardDAO.selectCommentCount", vo);
	}

	
}
