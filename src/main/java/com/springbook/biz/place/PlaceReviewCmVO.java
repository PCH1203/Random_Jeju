package com.springbook.biz.place;

//1206 의찬 수정
public class PlaceReviewCmVO {
	private int rcSeq;
	private int mSeq;
	private String rcWriter;
	private int pSeq;
	private String bab;
	private String clean;
	private String kind;
	private String swim;
	private String parking;
	private String review;
	private String rcTime;

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

	public String getRcWriter() {
		return rcWriter;
	}

	public void setRcWriter(String rcWriter) {
		this.rcWriter = rcWriter;
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

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSwim() {
		return swim;
	}

	public void setSwim(String swim) {
		this.swim = swim;
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

	@Override
	public String toString() {
		return "PlaceReviewCmVO [rcSeq=" + rcSeq + ", mSeq=" + mSeq + ", rcWriter=" + rcWriter + ", pSeq=" + pSeq
				+ ", bab=" + bab + ", clean=" + clean + ", kind=" + kind + ", swim=" + swim + ", parking=" + parking
				+ ", review=" + review + ", rcTime=" + rcTime + "]";
	}
}
