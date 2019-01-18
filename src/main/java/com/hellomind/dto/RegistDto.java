package com.hellomind.dto;

public class RegistDto { // 상담신청 Dto
	private int mId; // 회원아이디
	private int schdNum; // 일정가능번호
	
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public int getschdNum() {
		return schdNum;
	}
	public void setschdNum(int schdNum) {
		this.schdNum = schdNum;
	}
	@Override
	public String toString() {
		return "RegistDto [mId=" + mId + ", schdNum=" + schdNum + "]";
	}
	
}
