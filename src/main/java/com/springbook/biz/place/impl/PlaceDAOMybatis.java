package com.springbook.biz.place.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.place.Criteria;
import com.springbook.biz.place.PlaceReviewCmVO;
import com.springbook.biz.place.PlaceVO;

@Repository
public class PlaceDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertPlace(PlaceVO vo) {
		System.out.println("====> Mybatis로 insertBoard() 기능 처리");
		mybatis.insert("PlaceDAO.insertPlace", vo);
	}

	public int getPlaceSeq() {
		return mybatis.selectOne("PlaceDAO.getPlaceSeq");
	}

	public void deletePlace(PlaceVO vo) {
		mybatis.delete("PlaceDAO.deletePlace", vo);

	}

	public void updatePlace(PlaceVO vo) {

		mybatis.update("PlaceDAO.updatePlace", vo);
	}

	/*
	 * public void insertPlaceFileList(List<PlaceFileVO> fileList) { for(PlaceFileVO
	 * placeFile : fileList) { mybatis.insert("PlaceDAO.insertPlaceFileList",
	 * placeFile); } }
	 * 
	 * 
	 * public PlaceFileVO getPlaceFileList(int pSeq) {
	 * 
	 * return (PlaceFileVO)mybatis.selectOne("PlaceDAO.getPlaceFileList", pSeq); }
	 */

	public PlaceVO getPlace(PlaceVO vo) {
		return (PlaceVO) mybatis.selectOne("PlaceDAO.getPlace", vo);
	}

	public List<PlaceVO> getPlaceAllList(PlaceVO vo) {
		System.out.println("====> Mybatis로 getPlaceAllList() 기능 처리");
		return mybatis.selectList("PlaceDAO.getPlaceAllList", vo);

	}

	public List<PlaceVO> getPlaceList(PlaceVO vo) {
		System.out.println("====> Mybatis로 getPlaceListt() 기능 처리");
		return mybatis.selectList("PlaceDAO.getPlaceList", vo);
	}

	public void updatePlaceFile(PlaceVO vo) {
		mybatis.update("PlaceDAO.updatePlaceFile", vo);

	}

//		의찬 1206 수정
	public List<PlaceVO> getReviewBoardList(PlaceVO vo) {
		System.out.println("====> Mybatis로 getReviewBoardList() 기능 처리");
		List<Map<String, Object>> Reviewlist = new ArrayList<Map<String, Object>>();
		Reviewlist = mybatis.selectList("PlaceDAO.getReviewBoardList", vo);
		for (int i = 0; i < Reviewlist.size(); i++) {
			System.out.println(Reviewlist.get(i).toString());
		}
		return mybatis.selectList("PlaceDAO.getReviewBoardList", vo);
	}

	public Map<String, Object> getReviewWriteList(PlaceVO vo) {
		System.out.println("====> Mybatis로 getReviewWriteList() 기능 처리");
		List<Map<String, Object>> ReviewWritelist = new ArrayList<Map<String, Object>>();
		ReviewWritelist = mybatis.selectList("PlaceDAO.getReviewWriteList", vo);
		System.out.println("------------------------------------------------");
		for (int i = 0; i < ReviewWritelist.size(); i++) {
			System.out.println(ReviewWritelist.get(i).toString());
		}
		return mybatis.selectOne("PlaceDAO.getReviewWriteList", vo);
	}

	// insertPlaceReview (리뷰입력)
	public void insertPlaceReview(PlaceReviewCmVO vo) {
		System.out.println("===>MyBatis로 insertPlaceReview 기능처리");
		mybatis.insert("PlaceDAO.insertPlaceReview", vo);
	}

	// 리뷰 불러오기
	public List<PlaceReviewCmVO> ReviewReadComment(int seq, Criteria cri) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		paramMap.put("pSeq", seq);
		paramMap.put("criteria", cri);
		System.out.println("======> Mybatis로 ReviewReadComment() 기능처리");
		return mybatis.selectList("PlaceDAO.ReviewReadComment", paramMap);
	}

	public int selectPlaceReviewCount(int pSeq) {
		return mybatis.selectOne("PlaceDAO.selectPlaceReviewCount", pSeq);
	}

	// 리뷰 총 갯수 불러오기
	public int ReviewAllComment(int seq) {
		System.out.println("======> Mybatis로 ReviewAllComment() 기능처리");
		return mybatis.selectOne("PlaceDAO.ReviewAllComment", seq);
	}

	// 장소 주소 불러오기
	public PlaceVO ReviewAddress(int seq) {
		System.out.println("======> Mybatis로 ReviewAddress() 기능처리");
		return mybatis.selectOne("PlaceDAO.ReviewAddress", seq);
	}

	// 의찬 페이징
	public List<PlaceVO> getReviewBoardList(PlaceVO vo, Criteria cri) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		paramMap.put("placevo", vo);
		paramMap.put("criteria", cri);
		System.out.println("====> Mybatis로 getReviewBoardList() 기능 처리");
		return mybatis.selectList("PlaceDAO.getReviewBoardList", paramMap);
	}

	public int selectPlaceBoardCount(PlaceVO vo) {
		return mybatis.selectOne("PlaceDAO.selectPlaceBoardCount", vo);
	}

	// 리뷰 삭제
	public void deleteReview(PlaceReviewCmVO vo) {
		System.out.println("====> Mybatis로 deleteReview() 기능 처리");
		mybatis.delete("PlaceDAO.deleteReview", vo);
	}
}
