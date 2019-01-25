package com.hellomind.dto;

public class RegDto extends SchdDto {
	private int schdNum; // 일정가능번호
	private String mId; // 고객 아이디

	private String cId; // 상담사 아이디
	private String schdDateTime; // 상담일정이 가능한 날짜 시간

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

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getSchdDateTime() {
		return schdDateTime;
	}

	public void setSchdDateTime(String schdDateTime) {
		this.schdDateTime = schdDateTime;
	}

	@Override
	public String toString() {
		return "RegDto [schdNum=" + schdNum + ", mId=" + mId + ", cId=" + cId + ", schdDateTime=" + schdDateTime + "]";
	}

}
