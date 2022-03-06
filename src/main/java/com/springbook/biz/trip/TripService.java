package com.springbook.biz.trip;

import java.util.List;
import java.util.Map;

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

	// 게시글 삭제시 해당 게시글의 첨부파일 모두 삭제
	void deleteFileList(int seq);

	// 여행맴버 등록
	void insertTripMembers(TripMemberVO vo);

	// 여행방 참여 인원수 조회
	int countMember(TripMemberVO vo);

	// 여행방 인원 중복 검사
	int checkContain(TripMemberVO vo);

	// 참여 맴버 목록 조회
	List<TripMemberVO> getTripMemberList(TripVO vo);

	// 여행맴버 등록(host전용)
	void insertTripMemberH(TripMemberVO vo);

	// 여행 맴버 정보 조회
	TripMemberVO getTripMember(TripMemberVO vo);

	// 여행 참여 취소
	void exitTrip(TripMemberVO vo);

	// 일정 상태 변경
	void changeTripStatus(TripVO vo);

	// 개인 리뷰 등록
	void insertReview(ReviewVO vo);

	// 리뷰 중복검사
	int checkReview(ReviewVO vo);

	// 신고 대상자 ACCOUNT_STATUS + 1
	void updateMemberStatus(ReviewVO vo);

	// 나의 리뷰 리스트 불러오기 (12.12 박찬호 추가)
	List<ReviewVO> getmyReviewList(ReviewVO vo);

	// ######################## 남주님 영역 ####################################

	// 댓글 불러오기
	List<CommentVO> readComment(int seq);

	// 댓글 작성하기
	void insertComment(CommentVO vo);

	// 스케쥴 정보 가져오기
	List<ScheduleVO> getscheduleList(ScheduleVO vo);

	// 다시 추천하기 스케쥴 정보 delete insert
	void reinsertschedule(TripVO vo);

	// 클리어된 스케쥴 리스트
	List<Map<String, String>> getClearedscheduleList(ScheduleVO vo);

	// 클리어 안된거 중에 가장 순번이 빠른거 데려오기
	Map<String, String> addGameModeSchedule(ScheduleVO vo);

	void updateClearTrschedule(ScheduleVO vo);

	void updateTrStatus(ScheduleVO vo);

	// Mytriplist

	List<TripVO> getMyTripList(int mSeq);

	List<TripVO> getMyTripMember(TripVO vo);

	List<TripVO> getMyTripPlace(TripVO vo);

}
