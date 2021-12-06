package com.springbook.biz.place;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

//@XmlRootElement : 해당 객체를 RootElement로 지정하고 이름을  boardList로 설정
@XmlRootElement(name = "placeList")
@XmlAccessorType(XmlAccessType.FIELD)
public class PlaceListVO {
	//@XmlElement : 각 각의 엘리먼트들의 이름 지정
	@XmlElement(name = "place")
	private List<PlaceVO> placeList;

	public List<PlaceVO> getPlaceList() {
		return placeList;
	}

	public void setPlaceList(List<PlaceVO> placeList) {
		this.placeList = placeList;
	}
}
