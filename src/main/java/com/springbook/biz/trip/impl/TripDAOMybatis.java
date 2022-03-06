package com.springbook.biz.trip.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.member.MemberVO;
import com.springbook.biz.trip.CommentVO;
import com.springbook.biz.trip.ReviewVO;
import com.springbook.biz.trip.ScheduleVO;

import com.springbook.biz.trip.TripMemberVO;

import com.springbook.biz.trip.TripVO;

@Repository
public class TripDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertTrip(TripVO vo) {
		System.out.println("====> Mybatis로 insertTrip() 기능 처리");
		mybatis.insert("TripDAO.insertTrip", vo);

		// 1208 남주 수정
		System.out.println("====> Mybatis로 insertTripSchedule() 기능 처리");
		int date = (vo.getTrDateSet() + 1) * 4;
		System.out.println(">>>>>>>>>>date" + date);
		System.out.println(">>>>>>>>>>trseq" + vo.getTrSeq());
		System.out.println(">>>>>>>>>>trAreaSet" + vo.getTrAreaSet());
		System.out.println(">>>>>>>>>>trMode" + vo.getTrMode());

		String mode = vo.getTrMode();
		System.out.println(mode);
		if (mode.equals("게임모드") || mode.equals("랜덤추천모드")) {
			System.out.println("**********************************");
			for (int i = 0; i < date; i++) {
				mybatis.insert("TripDAO.insertTripSchedule", vo);
			}
		}
		// 1208 남주 수정

	}

	public void updateTrip(TripVO vo) {
		System.out.println("====> Mybatis로 updateTrip() 기능 처리");
		mybatis.update("TripDAO.updateTrip", vo);
	}

	public void deleteTrip(TripVO vo) {
		System.out.println("====> Mybatis로 deleteTrip() 기능 처리");
		mybatis.delete("TripDAO.deleteTrip", vo);
	}

	// 여행 상세 조회
	public TripVO getTrip(TripVO vo) {
		System.out.println("====> Mybatis로 getTrip() 기능 처리");
		return (TripVO) mybatis.selectOne("TripDAO.getTrip", vo);
	}

	public List<TripVO> getTripList(TripVO vo) {
		System.out.println("====> Mybatis로 getTripList() 기능 처리");
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = mybatis.selectList("TripDAO.getTripList", vo);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		return mybatis.selectList("TripDAO.getTripList", vo);
	}

	public int getTripSeq() {
		System.out.println("====> Mybatis로 getTripSeq() 기능 처리");
		return mybatis.selectOne("TripDAO.getTripSeq");
	}

	public void deleteFileList(int seq) {
		mybatis.delete("TripDAO.deleteFileList", seq);

	}

	public void insertTripMembers(TripMemberVO vo) {
		mybatis.insert("TripDAO.insertTripMembers", vo);

	}

	// 여행방 참여 인원수 조회
	public int countMember(TripMemberVO vo) {
		System.out.println("====> Mybatis로countMember() 기능 처리");
		return mybatis.selectOne("TripDAO.countMember", vo);

	}

	// 여행방 인원 중복 검사
	public int checkContain(TripMemberVO vo) {
		System.out.println("====> Mybatis로 checkContain() 기능 처리");
		return mybatis.selectOne("TripDAO.checkContainMember", vo);
	}

	public List<TripMemberVO> getTripMemberList(TripVO vo) {
		System.out.println("====> Mybatis로 getTripMemberList() 기능 처리");
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = mybatis.selectList("TripDAO.getTripMemberList", vo);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		return mybatis.selectList("TripDAO.getTripMemberList", vo);
	}

	// 여행맴버 등록(host전용)
	public void insertTripMemberH(TripMemberVO vo) {
		System.out.println("====> Mybatis로 insertTripMemberH() 기능 처리");
		mybatis.insert("TripDAO.insertTripMemberH", vo);

	}

	// 여행 맴버 정보 조회
	public TripMemberVO getTripMember(TripMemberVO vo) {
		System.out.println("====> Mybatis로 getTripMember() 기능 처리");
		return mybatis.selectOne("TripDAO.getTripMember", vo);

	}

	// 여행 참여 취소
	public void exitTrip(TripMemberVO vo) {
		System.out.println("====> Mybatis로 exitTrip() 기능 처리");
		mybatis.delete("TripDAO.exitTrip", vo);
	}

	// 일정 상태 변경
	public void changeTripStatus(TripVO vo) {
		System.out.println("====> Mybatis로 changeTripStatus() 기능 처리");
		mybatis.update("TripDAO.changeTripStatus", vo);
	}

	// 나의 리뷰 리스트 불러오기 (12.12 박찬호 추가)
	public List<ReviewVO> getmyReviewList(ReviewVO vo) {
		System.out.println("====> Mybatis로 getmyReviewList() 기능 처리");
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = mybatis.selectList("TripDAO.getmyReviewList", vo);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		return mybatis.selectList("TripDAO.getmyReviewList", vo);
	}
	// ######################## 남주 영역################################

	public List<CommentVO> readComment(int seq) {
		System.out.println("======> Mybatis로 readComment() 기능처리");
		return mybatis.selectList("TripDAO.readComment", seq);
	}

	public void insertComment(CommentVO vo) {
		System.out.println("====> Mybatis로 insertComment() 기능 처리");
		mybatis.insert("TripDAO.insertComment", vo);
	}

	// 스케쥴 정보 가져오기
	public List<ScheduleVO> getscheduleList(ScheduleVO vo) {
		System.out.println("====> Mybatis로 getscheduleList() 기능 처리");
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = mybatis.selectList("TripDAO.getscheduleList", vo);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
		return mybatis.selectList("TripDAO.getscheduleList", vo);
	}

	// 1209 추가
	public void reinsertschedule(TripVO vo) {

		System.out.println("====> Mybatis로 insertTripSchedule() 기능 처리");

		mybatis.delete("TripDAO.deleteTripSchedule", vo.getTrSeq());

		int date = (vo.getTrDateSet() + 1) * 4;
		System.out.println(">>>>>>>>>>date" + date);
		System.out.println(">>>>>>>>>>trseq" + vo.getTrSeq());
		System.out.println(">>>>>>>>>>trAreaSet" + vo.getTrAreaSet());
		System.out.println(">>>>>>>>>>trMode" + vo.getTrMode());

		String mode = vo.getTrMode();
		System.out.println(mode);
		System.out.println("**********************************");
		for (int i = 0; i < date; i++) {
			mybatis.insert("TripDAO.insertTripSchedule", vo);
		}
	}

	// 클리어된 스케쥴 정보 가져오기
	public List<Map<String, String>> getClearedscheduleList(ScheduleVO vo) {
		System.out.println("====> Mybatis로 getClearedscheduleList() 기능 처리");
		return mybatis.selectList("TripDAO.getClearedscheduleList", vo);
	}

	// 클리어된 스케쥴 정보 가져오기
	public Map<String, String> addGameModeSchedule(ScheduleVO vo) {
		System.out.println("====> Mybatis로 addGameModeSchedule() 기능 처리");
		return mybatis.selectOne("TripDAO.addGameModeSchedule", vo);
	}

	public void updateClearTrschedule(ScheduleVO vo) {
		System.out.println("====> Mybatis로 updateClearTrschedule() 기능 처리");
		mybatis.update("TripDAO.updateClearTrschedule", vo);
	}

	public void updateTrStatus(ScheduleVO vo) {
		mybatis.update("TripDAO.updateTrStatus", vo);
	}

	// MyTripList

	public List<TripVO> getMyTripList(int mSeq) {
		return mybatis.selectList("TripDAO.getMyTripList", mSeq);
	}

	public List<TripVO> getMyTripMember(TripVO vo) {
		return mybatis.selectList("TripDAO.getMyTripMember", vo);
	}

	public List<TripVO> getMyTripPlace(TripVO vo) {
		return mybatis.selectList("TripDAO.getMyTripPlace", vo);
	}

	// 개인 리뷰 등록
	public void insertReview(ReviewVO vo) {
		System.out.println("====> Mybatis로 insertReview() 기능 처리");
		mybatis.insert("TripDAO.insertReview", vo);
	}

	// 리뷰 중복 검사
	public int checkReview(ReviewVO vo) {
		System.out.println("====> Mybatis로 checkReview() 기능 처리");
		return mybatis.selectOne("TripDAO.checkReview", vo);
	}

	// 신고 대상자 ACCOUNT_STATUS + 1
	public void updateMemberStatus(ReviewVO vo) {
		mybatis.update("TripDAO.updateMemberStatus", vo);

	}
}
