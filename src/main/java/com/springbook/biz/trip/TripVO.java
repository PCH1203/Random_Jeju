package com.springbook.biz.trip;

import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class TripVO {
	private int trSeq;
	private String trName;
	private String trMode;
	private String trAreaSet;
	private int trDateSet;
	private String trSteps;
	private String trStepStatus;
	private String trGenderSet; 
	private int trPersonnelSet; 
	private String trLicenseSet;
	private String trTransportationSet;
	private String trPasswordSet;
	private String trIntro;
	private String trImgName;
	private String trImgPath;
	private int trStatus;

	@XmlTransient
	private String SearchCondition;
	@XmlTransient
	private String SearchKeyword;
	@XmlTransient
	private MultipartFile uploadFile;
	public int getTrSeq() {
		return trSeq;
	}
	public void setTrSeq(int trSeq) {
		this.trSeq = trSeq;
	}
	public String getTrName() {
		return trName;
	}
	public void setTrName(String trName) {
		this.trName = trName;
	}
	public String getTrMode() {
		return trMode;
	}
	public void setTrMode(String trMode) {
		this.trMode = trMode;
	}
	public String getTrAreaSet() {
		return trAreaSet;
	}
	public void setTrAreaSet(String trAreaSet) {
		this.trAreaSet = trAreaSet;
	}
	public int getTrDateSet() {
		return trDateSet;
	}
	public void setTrDateSet(int trDateSet) {
		this.trDateSet = trDateSet;
	}
	public String getTrSteps() {
		return trSteps;
	}
	public void setTrSteps(String trSteps) {
		this.trSteps = trSteps;
	}
	public String getTrStepStatus() {
		return trStepStatus;
	}
	public void setTrStepStatus(String trStepStatus) {
		this.trStepStatus = trStepStatus;
	}
	public String getTrGenderSet() {
		return trGenderSet;
	}
	public void setTrGenderSet(String trGenderSet) {
		this.trGenderSet = trGenderSet;
	}
	public int getTrPersonnelSet() {
		return trPersonnelSet;
	}
	public void setTrPersonnelSet(int trPersonnelSet) {
		this.trPersonnelSet = trPersonnelSet;
	}
	public String getTrLicenseSet() {
		return trLicenseSet;
	}
	public void setTrLicenseSet(String trLicenseSet) {
		this.trLicenseSet = trLicenseSet;
	}
	public String getTrTransportationSet() {
		return trTransportationSet;
	}
	public void setTrTransportationSet(String trTransportationSet) {
		this.trTransportationSet = trTransportationSet;
	}
	public String getTrPasswordSet() {
		return trPasswordSet;
	}
	public void setTrPasswordSet(String trPasswordSet) {
		this.trPasswordSet = trPasswordSet;
	}
	public String getTrIntro() {
		return trIntro;
	}
	public void setTrIntro(String trIntro) {
		this.trIntro = trIntro;
	}
	public String getTrImgName() {
		return trImgName;
	}
	public void setTrImgName(String trImgName) {
		this.trImgName = trImgName;
	}
	public String getTrImgPath() {
		return trImgPath;
	}
	public void setTrImgPath(String trImgPath) {
		this.trImgPath = trImgPath;
	}
	public int getTrStatus() {
		return trStatus;
	}
	public void setTrStatus(int trStatus) {
		this.trStatus = trStatus;
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
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	@Override
	public String toString() {
		return "TripVO [trSeq=" + trSeq + ", trName=" + trName + ", trMode=" + trMode + ", trAreaSet=" + trAreaSet
				+ ", trDateSet=" + trDateSet + ", trSteps=" + trSteps + ", trStepStatus=" + trStepStatus
				+ ", trGenderSet=" + trGenderSet + ", trPersonnelSet=" + trPersonnelSet + ", trLicenseSet="
				+ trLicenseSet + ", trTransportationSet=" + trTransportationSet + ", trPasswordSet=" + trPasswordSet
				+ ", trIntro=" + trIntro + ", trImgName=" + trImgName + ", trImgPath=" + trImgPath + ", trStatus="
				+ trStatus + ", SearchCondition=" + SearchCondition + ", SearchKeyword=" + SearchKeyword
				+ ", uploadFile=" + uploadFile + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
