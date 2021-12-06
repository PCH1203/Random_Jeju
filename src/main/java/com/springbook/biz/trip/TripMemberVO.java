package com.springbook.biz.trip;

import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class TripMemberVO {
	private int tmSeq;
	private int trSeq;
	private int mSeq;
	String tmRole;	
	String tmName;
	String tmId;

	@XmlTransient
	private String SearchCondition;
	@XmlTransient
	private String SearchKeyword;
	public int getTmSeq() {
		return tmSeq;
	}
	public void setTmSeq(int tmSeq) {
		this.tmSeq = tmSeq;
	}
	public int getTrSeq() {
		return trSeq;
	}
	public void setTrSeq(int trSeq) {
		this.trSeq = trSeq;
	}
	public int getmSeq() {
		return mSeq;
	}
	public void setmSeq(int mSeq) {
		this.mSeq = mSeq;
	}
	public String getTmRole() {
		return tmRole;
	}
	public void setTmRole(String tmRole) {
		this.tmRole = tmRole;
	}
	public String getTmName() {
		return tmName;
	}
	public void setTmName(String tmName) {
		this.tmName = tmName;
	}
	public String getTmId() {
		return tmId;
	}
	public void setTmId(String tmId) {
		this.tmId = tmId;
	}
	public String getSearchCondition() {
		return SearchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		SearchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return SearchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		SearchKeyword = searchKeyword;
	}
	@Override
	public String toString() {
		return "TripMemberVO [tmSeq=" + tmSeq + ", trSeq=" + trSeq + ", mSeq=" + mSeq + ", tmRole=" + tmRole
				+ ", tmName=" + tmName + ", tmId=" + tmId + ", SearchCondition=" + SearchCondition + ", SearchKeyword="
				+ SearchKeyword + "]";
	}
	
	
	
	

	

	
	
	
	
	
}
