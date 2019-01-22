package com.hellomind.dto;

public class RegDto {
	private int schdNum; // 일정가능번호
	private String mId; // 고객 아이디

	public int getSchdNum() {
		return schdNum;
	}

	public void setSchdNum(int schdNum) {
		this.schdNum = schdNum;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "RegDto [schdNum=" + schdNum + ", mId=" + mId + "]";
	}

}
