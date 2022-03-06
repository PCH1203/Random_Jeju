package com.springbook.biz.place.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.place.Criteria;
import com.springbook.biz.place.PlaceReviewCmVO;
import com.springbook.biz.place.PlaceService;
import com.springbook.biz.place.PlaceVO;

@Service("placeService")
/*
 * 업무로직 처리를 담당하는 클래스 ex) 계좌이체 기능 처리할 때 DB입력은 DAO 하게 되는데 DB입력 전 필요한 작업들(계좌암호화, 금액
 * 컴마 추가...) 하는 로직들을 ServiceImpl클래스에서 처리해주면 됨
 */
public class PlaceServiceImpl implements PlaceService {
	@Autowired
	private PlaceDAOMybatis placeDAO;

	public void insertPlace(PlaceVO vo) {

		placeDAO.insertPlace(vo);

	}

	public int getPlaceSeq() {
		return placeDAO.getPlaceSeq();
	}

	public void deletePlace(PlaceVO vo) {
		placeDAO.deletePlace(vo);

	}

	public void updatePlace(PlaceVO vo) {
		placeDAO.updatePlace(vo);
	}

	public PlaceVO getPlace(PlaceVO vo) {
		return placeDAO.getPlace(vo);
	}

	@Override
	public List<PlaceVO> getPlaceList(PlaceVO vo) {
		return placeDAO.getPlaceList(vo);
	}

	@Override
	public List<PlaceVO> getPlaceAllList(PlaceVO vo) {
		return placeDAO.getPlaceAllList(vo);
	}

	@Override
	public void updatePlaceFile(PlaceVO vo) {
		placeDAO.updatePlaceFile(vo);

	}

//	의찬 1206 수정
	// 장소 추천 게시판 목록 가져오기
	@Override
	public List<PlaceVO> getReviewBoardList(PlaceVO vo) {
		return placeDAO.getReviewBoardList(vo);
	}

	// 장소 리뷰 창으로 목록 불러오기
	@Override
	public Map<String, Object> getReviewWriteList(PlaceVO vo) {
		return placeDAO.getReviewWriteList(vo);
	}

	// 리뷰입력
	@Override
	public void insertPlaceReview(PlaceReviewCmVO vo) {
		placeDAO.insertPlaceReview(vo);
	}

	// 리뷰 불러오기
	@Override
	public List<PlaceReviewCmVO> ReviewReadComment(int seq, Criteria cri) {
		return placeDAO.ReviewReadComment(seq, cri);
	}

	@Override
	public int selectPlaceReviewCount(int pSeq) {
		return placeDAO.selectPlaceReviewCount(pSeq);
	}

	// 리뷰 총 갯수 불러오기
	@Override
	public int ReviewAllComment(int seq) {
		return placeDAO.ReviewAllComment(seq);
	}

	// 장소 주소 불러오기
	@Override
	public PlaceVO ReviewAddress(int seq) {
		return placeDAO.ReviewAddress(seq);
	}

	// 의찬 페이징
	@Override
	public List<PlaceVO> getReviewBoardList(PlaceVO vo, Criteria cri) {
		return placeDAO.getReviewBoardList(vo, cri);
	}

	@Override
	public int selectPlaceBoardCount(PlaceVO vo) {
		return placeDAO.selectPlaceBoardCount(vo);
	}

	// 리뷰 삭제
	@Override
	public void deleteReview(PlaceReviewCmVO vo) {
		placeDAO.deleteReview(vo);
	}

}
