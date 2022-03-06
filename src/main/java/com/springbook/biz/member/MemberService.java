package com.springbook.biz.member;

import java.util.List;

import com.springbook.biz.member.MemberVO;

public interface MemberService {
	// CRUD 기능의 메소드 구현

	// 로그인
	MemberVO login(MemberVO vo);

	// 회원가입
	void insertMember(MemberVO vo);

	// 맴버 스퀀스 조회
	int getMemberSeq();

	// 아이디 찾기
	MemberVO findId(MemberVO vo);

	// 비밀번호 찾기
	MemberVO findPassword(MemberVO vo);

	// 회원 수정
	void updateMember(MemberVO vo);

	// 회원정보 받아오기
	MemberVO getMember(MemberVO vo);

	// 아이디 중복체크하기
	MemberVO idChk(String id);

	// 회원 탈퇴
	void Withdrawal(MemberVO vo);

	// DB에 있는 아이디인지 확인하기
	MemberVO existId(String mId);

	// DB에 AccountStatus 확인하기
	int getMemberAccountStatus(String mId);

	// 11.24일 유저목록 구현
	List<MemberVO> getMemberList(MemberVO vo);

	// 회원권한 정지
	void memberBan(MemberVO vo);

	// 회원권한 복구
	void memberKeep(MemberVO vo);

	// 비밀번호 수정
	void updatePassword(MemberVO vo);

}
