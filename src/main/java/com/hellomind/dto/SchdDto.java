package com.hellomind.dto;

public class SchdDto {
	private int schdNum; // 일정가능번호
	private int cId; // 상담사번호
	private String schDate; // 상담일정이 가능한 시간

	public int getschdNum() {
		return schdNum;
	}

	public void setschdNum(int schdNum) {
		this.schdNum = schdNum;
	}

	public String getschDate() {
		return schDate;
	}

	public void setschDate(String schDate) {
		this.schDate = schDate;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	@Override
	public String toString() {
		return "SchdDto [schdNum=" + schdNum + ", cId=" + cId + ", schDate=" + schDate + "]";
	}

}
