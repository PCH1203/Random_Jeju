package com.springbook.biz.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.member.MemberVO;

@Repository
public class MemberDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 로그인
	public MemberVO login(MemberVO vo) {
		System.out.println("==> Mybatis로 login() 기능 처리");
		return mybatis.selectOne("MemberDAO.login", vo);
	}

	// insert member (회원가입)
	public void insertMember(MemberVO vo) {
		System.out.println("===>MyBatis로 insertMember 기능처리");
		mybatis.insert("MemberDAO.insertMember", vo);
	}

	// 맴버시퀀스 얻기
	public int getMemberSeq() {
		return mybatis.selectOne("MemberDAO.getMemberSeq");
	}

	// 아이디찾기
	public MemberVO findId(MemberVO vo) {
		System.out.println("==> Mybatis로 findId() 기능 처리");
		return mybatis.selectOne("MemberDAO.findId", vo);
	}

	// 비밀번호 찾기
	public MemberVO findPassword(MemberVO vo) {
		System.out.println("==> Mybatis로 findPassword() 기능 처리");
		return mybatis.selectOne("MemberDAO.findPassword", vo);
	}

	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		System.out.println("====> Mybatis로 updateMember() 기능 처리");
		mybatis.update("MemberDAO.updateMember", vo);
	}

	// 회원정보 가져오기
	public MemberVO getMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.getMember", vo);
	}

	// 아이디 중복 체크
	public MemberVO idChk(String id) {
		System.out.println("====> Mybatis로idChk() 기능 처리");
		MemberVO member = mybatis.selectOne("MemberDAO.idChk", id);
		return member;
	}

	// 회원 탈퇴
	public void Withdrawal(MemberVO vo) {
		System.out.println("===>MyBatis로 Withdrawal 기능처리");
		mybatis.update("MemberDAO.Withdrawal", vo);
	}

	// 아이디 비교하기
	public MemberVO existId(String mId) {
		System.out.println("====> Mybatis로existId() 기능 처리");
		MemberVO member = mybatis.selectOne("MemberDAO.existId", mId);
		return member;
	}

	// 맴버스테이터스 얻기
	public int getMemberAccountStatus(String mId) {
		System.out.println("====> Mybatis로AccountStatus() 기능 처리");
		return mybatis.selectOne("MemberDAO.getMemberAccountStatus", mId);
	}

	// 11.24일 유저목록 구현
	public List<MemberVO> getMemberList(MemberVO vo) {
		System.out.println("====> Mybatis로 getMemberList() 기능 처리");
		return mybatis.selectList("MemberDAO.getMemberList", vo);
	}

	public void memberBan(MemberVO vo) {

		mybatis.update("MemberDAO.memberBan", vo);
	}

	public void memberKeep(MemberVO vo) {

		mybatis.update("MemberDAO.memberKeep", vo);
	}

	// 회원 비밀번호 수정
	public void updatePassword(MemberVO vo) {
		System.out.println("====> Mybatis로 updateMember() 기능 처리");
		mybatis.update("MemberDAO.updatePassword", vo);
	}
}
