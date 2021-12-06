package com.springbook.biz.place;

import java.util.List;
import java.util.Map;

public interface PlaceService {
	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertPlace(PlaceVO vo);

	// 글 등록 전 등록 될 일련번호 획득
	int getPlaceSeq();

	// 글 삭제
	void deletePlace(PlaceVO vo);

	// 글 수정
	void updatePlace(PlaceVO vo);

	// 글 상세 조회
	PlaceVO getPlace(PlaceVO vo);


	// 11.25일 가게목록 구현
	List<PlaceVO> getPlaceAllList(PlaceVO vo);

	List<PlaceVO> getPlaceList(PlaceVO vo);

	void updatePlaceFile(PlaceVO vo);
	
	// 의찬 1206 수정
	// 장소추천게시판 파일 조회
	 List<PlaceVO> getReviewBoardList(PlaceVO vo);


	// 장소리뷰게시판 파일 조회
	Map<String, Object> getReviewWriteList(PlaceVO vo);

	// 리뷰입력
	void insertPlaceReview(PlaceReviewCmVO vo);
}
