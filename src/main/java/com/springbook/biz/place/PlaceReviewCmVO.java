package com.springbook.biz.place;

//1206 의찬 수정
public class PlaceReviewCmVO {
	private int rcSeq;
	private int mSeq;
	private int pSeq;
	private String bab;
	private String clean;
	private String parking;
	private String review;
	private String rcTime;
	private String view;
	private String revisit;
	public int getRcSeq() {
		return rcSeq;
	}
	public void setRcSeq(int rcSeq) {
		this.rcSeq = rcSeq;
	}
	public int getmSeq() {
		return mSeq;
	}
	public void setmSeq(int mSeq) {
		this.mSeq = mSeq;
	}
	public int getpSeq() {
		return pSeq;
	}
	public void setpSeq(int pSeq) {
		this.pSeq = pSeq;
	}
	public String getBab() {
		return bab;
	}
	public void setBab(String bab) {
		this.bab = bab;
	}
	public String getClean() {
		return clean;
	}
	public void setClean(String clean) {
		this.clean = clean;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getRcTime() {
		return rcTime;
	}
	public void setRcTime(String rcTime) {
		this.rcTime = rcTime;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public String getRevisit() {
		return revisit;
	}
	public void setRevisit(String revisit) {
		this.revisit = revisit;
	}
	@Override
	public String toString() {
		return "PlaceReviewCmVO [rcSeq=" + rcSeq + ", mSeq=" + mSeq + ", pSeq=" + pSeq + ", bab=" + bab + ", clean="
				+ clean + ", parking=" + parking + ", review=" + review + ", rcTime=" + rcTime + ", view=" + view
				+ ", revisit=" + revisit + "]";
	}

	
}
