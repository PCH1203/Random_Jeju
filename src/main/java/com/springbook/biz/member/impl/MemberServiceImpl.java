package com.springbook.biz.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.member.MemberService;
import com.springbook.biz.member.MemberVO;

@Service("memberService")

public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAOMybatis memberDAO;

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) {
		return memberDAO.login(vo);
	}

	// 회원가입
	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}

	// MEMBER TABLE 에서 시퀀서번호 가져오기
	@Override
	public int getMemberSeq() {
		return memberDAO.getMemberSeq();
	}

	// ID찾기
	@Override
	public MemberVO findId(MemberVO vo) {
		return memberDAO.findId(vo);
	}

	// password 찾기
	@Override
	public MemberVO findPassword(MemberVO vo) {

		return memberDAO.findPassword(vo);
	}

	// 회원정보 수정
	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);

	}

	// 회원정보 가져오기
	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);

	}

	// 아이디 중복 체크하기
	@Override
	public MemberVO idChk(String id) {
		return memberDAO.idChk(id);
	}

	// 회원 탈퇴
	@Override
	public void Withdrawal(MemberVO vo) {
		memberDAO.Withdrawal(vo);

	}

	// DB에 있는 아이디인지 확인하기
	@Override
	public MemberVO existId(String mId) {
		return memberDAO.existId(mId);
	}

	// DB에 AccountStatus 확인하기
	@Override
	public int getMemberAccountStatus(String mId) {
		return memberDAO.getMemberAccountStatus(mId);
	}

	// 회원목록 가져오기
	public List<MemberVO> getMemberList(MemberVO vo) {
		return memberDAO.getMemberList(vo);
	}

	// 회원권한 정지
	public void memberBan(MemberVO vo) {
		memberDAO.memberBan(vo);
	}

	// 회원권한 복구
	public void memberKeep(MemberVO vo) {
		memberDAO.memberKeep(vo);
	}

	// 비밀번호 수정
	@Override
	public void updatePassword(MemberVO vo) {
		memberDAO.updatePassword(vo);

	}

}
