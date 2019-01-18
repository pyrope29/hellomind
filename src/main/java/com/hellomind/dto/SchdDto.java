package com.hellomind.dto;

public class SchdDto {
	private int schdNum; // 일정가능번호
	private String cId; // 상담사번호
	private String schdDate; // 상담일정이 가능한 시간

	public int getschdNum() {
		return schdNum;
	}

	public void setschdNum(int schdNum) {
		this.schdNum = schdNum;
	}

	public String getschdDate() {
		return schdDate;
	}

	public void setschdDate(String schdDate) {
		this.schdDate = schdDate;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	@Override
	public String toString() {
		return "SchdDto [schdNum=" + schdNum + ", cId=" + cId + ", schdDate=" + schdDate + "]";
	}

}
