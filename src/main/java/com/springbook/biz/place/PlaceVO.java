package com.springbook.biz.place;

import javax.xml.bind.annotation.XmlTransient;


import org.springframework.web.multipart.MultipartFile;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
@XmlAccessorType(XmlAccessType.FIELD)

public class PlaceVO {
	private int z_seq;
	   private int pSeq;
	   private String pCategory;
	   private String pArea;
	   private String pName;
	   private String pAddress;
	   private String pTell;
	   private String pInfo;
	   private String pImgpath;
	   private String pXaxis;
	   private String pYaxis;
	   private String originalFileName;
	   private String filePath;

	   @XmlTransient
	   private MultipartFile uploadFile;

	public int getZ_seq() {
		return z_seq;
	}

	public void setZ_seq(int z_seq) {
		this.z_seq = z_seq;
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

	public String getpArea() {
		return pArea;
	}

	public void setpArea(String pArea) {
		this.pArea = pArea;
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

	public String getpImgpath() {
		return pImgpath;
	}

	public void setpImgpath(String pImgpath) {
		this.pImgpath = pImgpath;
	}

	public String getpXaxis() {
		return pXaxis;
	}

	public void setpXaxis(String pXaxis) {
		this.pXaxis = pXaxis;
	}

	public String getpYaxis() {
		return pYaxis;
	}

	public void setpYaxis(String pYaxis) {
		this.pYaxis = pYaxis;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "PlaceVO [z_seq=" + z_seq + ", pSeq=" + pSeq + ", pCategory=" + pCategory + ", pArea=" + pArea
				+ ", pName=" + pName + ", pAddress=" + pAddress + ", pTell=" + pTell + ", pInfo=" + pInfo
				+ ", pImgpath=" + pImgpath + ", pXaxis=" + pXaxis + ", pYaxis=" + pYaxis + ", originalFileName="
				+ originalFileName + ", filePath=" + filePath + ", uploadFile=" + uploadFile + "]";
	}

}
