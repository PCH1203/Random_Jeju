package com.springbook.biz.member;

public class PasswordVO {
	
	private int mSeq ;
	private String mId;
	private String mPassword;
	private String newmPassword;
	private String newmPasswordConfirm;
	public int getmSeq() {
		return mSeq;
	}
	public void setmSeq(int mSeq) {
		this.mSeq = mSeq;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getNewmPassword() {
		return newmPassword;
	}
	public void setNewmPassword(String newmPassword) {
		this.newmPassword = newmPassword;
	}
	public String getNewmPasswordConfirm() {
		return newmPasswordConfirm;
	}
	public void setNewmPasswordConfirm(String newmPasswordConfirm) {
		this.newmPasswordConfirm = newmPasswordConfirm;
	}
	@Override
	public String toString() {
		return "PasswordVO [mSeq=" + mSeq + ", mId=" + mId + ", mPassword=" + mPassword + ", newmPassword="
				+ newmPassword + ", newmPasswordConfirm=" + newmPasswordConfirm + "]";
	}
}
