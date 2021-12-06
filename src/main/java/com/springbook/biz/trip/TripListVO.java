package com.springbook.biz.trip;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

//@XmlRootElement : 해당 객체를 RootElement로 지정하고 이름을  tripList로 설정
@XmlRootElement(name = "tripList")
@XmlAccessorType(XmlAccessType.FIELD)
public class TripListVO {
	//@XmlElement : 각 각의 엘리먼트들의 이름 지정
	@XmlElement(name = "trip")
	private List<TripVO> tripList;

	public List<TripVO> getTripList() {
		return tripList;
	}

	public void setTripList(List<TripVO> tripList) {
		this.tripList = tripList;
	}
}
