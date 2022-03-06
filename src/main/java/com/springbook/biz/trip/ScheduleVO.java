package com.springbook.biz.trip;

import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

public class ScheduleVO {

	int scSeq;
	int trSeq;
	int pSeq;
	String pCategory;
	String pName;
	String pAddress;
	String pTell;
	String pInfo;
	String originalFileName;
	String trClearFilename;
	
	@XmlTransient
	private MultipartFile uploadFile;
	
	public int getScSeq() {
		return scSeq;
	}

	public void setScSeq(int scSeq) {
		this.scSeq = scSeq;
	}

	public int getTrSeq() {
		return trSeq;
	}

	public void setTrSeq(int trSeq) {
		this.trSeq = trSeq;
	}

	public int getpSeq() {
		return pSeq;
	}

	public void setpSeq(int pSeq) {
		this.pSeq = pSeq;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpAddress() {
		return pAddress;
	}

	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}

	public String getpTell() {
		return pTell;
	}

	public void setpTell(String pTell) {
		this.pTell = pTell;
	}

	public String getpInfo() {
		return pInfo;
	}

	public void setpInfo(String pInfo) {
		this.pInfo = pInfo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getTrClearFilename() {
		return trClearFilename;
	}

	public void setTrClearFilename(String trClearFilename) {
		this.trClearFilename = trClearFilename;
	}

	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "ScheduleVO [scSeq=" + scSeq + ", trSeq=" + trSeq + ", pSeq=" + pSeq + ", pCategory=" + pCategory
				+ ", pName=" + pName + ", pAddress=" + pAddress + ", pTell=" + pTell + ", pInfo=" + pInfo
				+ ", originalFileName=" + originalFileName + ", trClearFilename=" + trClearFilename + ", uploadFile="
				+ uploadFile + "]";
	}

	
	
}
