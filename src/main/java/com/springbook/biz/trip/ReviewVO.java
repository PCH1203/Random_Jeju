package com.springbook.biz.trip;

import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class ReviewVO {
	
	  private int rSeq;
	  private int trSeq;
	  private int mSeq;
	  private int rWriterSeq;
	  private String rTime;
	  private String rContent;
	  private String rReviewType;
	  private String rComplain;
	public int getrSeq() {
		return rSeq;
	}
	public void setrSeq(int rSeq) {
		this.rSeq = rSeq;
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
	public int getrWriterSeq() {
		return rWriterSeq;
	}
	public void setrWriterSeq(int rWriterSeq) {
		this.rWriterSeq = rWriterSeq;
	}
	public String getrTime() {
		return rTime;
	}
	public void setrTime(String rTime) {
		this.rTime = rTime;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getrReviewType() {
		return rReviewType;
	}
	public void setrReviewType(String rReviewType) {
		this.rReviewType = rReviewType;
	}
	public String getrComplain() {
		return rComplain;
	}
	public void setrComplain(String rComplain) {
		this.rComplain = rComplain;
	}
	@Override
	public String toString() {
		return "ReviewVO [rSeq=" + rSeq + ", trSeq=" + trSeq + ", mSeq=" + mSeq + ", rWriterSeq=" + rWriterSeq
				+ ", rTime=" + rTime + ", rContent=" + rContent + ", rReviewType=" + rReviewType + ", rComplain="
				+ rComplain + "]";
	}
	  
	
	  
	  
	
	  
	  
	
	
	
	  
	  
	  
	
	
	
	
	
	
	
	
	
	
}
