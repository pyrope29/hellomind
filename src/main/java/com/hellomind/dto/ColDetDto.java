package com.hellomind.dto;

public class ColDetDto {

	private int cNum; // 상담사 번호
	private String pic; // 사진 이미지
	private String area; // 1~6 상담분야
	private String intro; // 소개 1000자
	private String career; // 경력 500자

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	@Override
	public String toString() {
		return "ColDetDto [cNum=" + cNum + ", pic=" + pic + ", area=" + area + ", intro=" + intro + ", career=" + career
				+ "]";
	}
}
