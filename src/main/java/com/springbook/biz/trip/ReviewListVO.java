package com.springbook.biz.trip;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

//@XmlRootElement : 해당 객체를 RootElement로 지정하고 이름을  tripList로 설정
@XmlRootElement(name = "myReviewList")
@XmlAccessorType(XmlAccessType.FIELD)
public class ReviewListVO {
	//@XmlElement : 각 각의 엘리먼트들의 이름 지정
	@XmlElement(name = "myReviewList")
	private List<ReviewVO> myReviewList;

	
	public List<ReviewVO> getmyReviewList() {
		return myReviewList;
	}

	public void setTripMemberList(List<ReviewVO> myReviewList) {
		this.myReviewList = myReviewList;
	}
}
