package com.springbook.biz.trip;

public class CommentVO {
	private int cmSeq;
	private int trSeq;
	private int mSeq;
	private String cmTime;
	private String cmComent;
	
	public int getCmSeq() {
		return cmSeq;
	}
	public void setCmSeq(int cmSeq) {
		this.cmSeq = cmSeq;
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
	public String getCmTime() {
		return cmTime;
	}
	public void setCmTime(String cmTime) {
		this.cmTime = cmTime;
	}
	public String getCmComent() {
		return cmComent;
	}
	public void setCmComent(String cmComent) {
		this.cmComent = cmComent;
	}
	@Override
	public String toString() {
		return "CommentVO [cmSeq=" + cmSeq + ", trSeq=" + trSeq + ", mSeq=" + mSeq + 
				 ", cmTime=" + cmTime + ", cmComent=" + cmComent
				+ "]";
	}	
}
