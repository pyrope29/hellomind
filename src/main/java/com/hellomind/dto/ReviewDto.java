package com.hellomind.dto;

public class ReviewDto {

	private int cId; // 상담사 번호
	private int mId; // 회원번호
	private String rCont; // 후기내용
	private String rDate; // 후기 남긴 날
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getrCont() {
		return rCont;
	}
	public void setrCont(String rCont) {
		this.rCont = rCont;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	@Override
	public String toString() {
		return "ReviewDto [cId=" + cId + ", mId=" + mId + ", rCont=" + rCont + ", rDate=" + rDate + "]";
	}

	
}
