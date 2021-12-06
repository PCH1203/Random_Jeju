package com.springbook.biz.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	
	private int mSeq ;
	private String mId;
	private String mPassword;
	private String mName;
	private String mBirthday;
	private String mEmail;
	private String mGender;
	private String mTell;
	private String mLicense;
	private String mNickname;
	private String mImgPath;
	private String mImgName;
	private String mIntroduce;
	private String mAccountStatus;

	private MultipartFile uploadFile;

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

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmBirthday() {
		return mBirthday;
	}

	public void setmBirthday(String mBirthday) {
		this.mBirthday = mBirthday;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmTell() {
		return mTell;
	}

	public void setmTell(String mTell) {
		this.mTell = mTell;
	}

	public String getmLicense() {
		return mLicense;
	}

	public void setmLicense(String mLicense) {
		this.mLicense = mLicense;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public String getmImgPath() {
		return mImgPath;
	}

	public void setmImgPath(String mImgPath) {
		this.mImgPath = mImgPath;
	}

	public String getmImgName() {
		return mImgName;
	}

	public void setmImgName(String mImgName) {
		this.mImgName = mImgName;
	}

	public String getmIntroduce() {
		return mIntroduce;
	}

	public void setmIntroduce(String mIntroduce) {
		this.mIntroduce = mIntroduce;
	}
	public String getmAccountStatus() {
		return mAccountStatus;
	}
	public void setmAccountStatus(String mAccountStatus) {
		this.mAccountStatus = mAccountStatus;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "MemberVO [mSeq=" + mSeq + ", mId=" + mId + ", mPassword=" + mPassword + ", mName=" + mName
				+ ", mBirthday=" + mBirthday + ", mEmail=" + mEmail + ", mGender=" + mGender + ", mTell=" + mTell
				+ ", mLicense=" + mLicense + ", mNickname=" + mNickname + ", mImgPath=" + mImgPath + ", mImgName="
				+ mImgName + ", mIntroduce=" + mIntroduce + ", mAccountStatus=" + mAccountStatus + ", uploadFile="
				+ uploadFile + "]";
	}

	
	
}
