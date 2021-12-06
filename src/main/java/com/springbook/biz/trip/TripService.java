package com.springbook.biz.trip;

import java.util.List;

import com.springbook.biz.trip.TripFileVO;
import com.springbook.biz.trip.TripVO;

public interface TripService {
	// CRUD 기능의 메소드 구현
	// 방등록
	void insertTrip(TripVO vo);

	// 글 수정
//	void updateTrip(TripVO vo);

	// 글 삭제
	void deleteTrip(TripVO vo);

	// 여행 상세 조회
	TripVO getTrip(TripVO vo);

	// 글 목록 조회
	List<TripVO> getTripList(TripVO vo);

	// 글 등록 전 등록 될 일련번호 획득
	int getTripSeq();

	// 디비에 파일 리스트 등록
	void insertTripFileList(List<TripFileVO> fileList);

	// 파일목록 리턴
	List<TripFileVO> getTripFileList(int seq);

	// 파일삭제
	void deleteFile(TripFileVO vo);

	// 게시글 삭제시 해당 게시글의 첨부파일 모두 삭제
	void deleteFileList(int seq);

	// 여행맴버 등록
	void insertTripMembers(TripMemberVO vo);

	// 여행방 참여 인원수 조회
	int countMember(TripMemberVO vo);

	// 여행방 인원 중복 검사
	int checkContain(TripMemberVO vo);

	// ######################## 남주님 영역 ####################################

	// 댓글 불러오기
	List<CommentVO> readComment(int seq);

	void insertComment(CommentVO vo);

}
