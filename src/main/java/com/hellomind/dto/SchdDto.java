package com.hellomind.dto;

public class SchdDto {
	private int schdNum; // 일정가능번호
	private String cId; // 상담사 아이디
	private String schdDate; // 상담일정이 가능한 일 + 시간
	private String schdDates; // 상담일정이 가능한 날짜
	private String schdTime; // 상담일정이 가능한 시간

	public int getSchdNum() {
		return schdNum;
	}

	public void setSchdNum(int schdNum) {
		this.schdNum = schdNum;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getSchdDate() {
		return schdDate;
	}

	public void setSchdDate(String schdDate) {
		this.schdDate = schdDate;
	}

	public String getschdDates() {
		return schdDates;
	}

	public void setschdDates(String schdDates) {
		this.schdDates = schdDates;
	}

	public String getschdTime() {
		return schdTime;
	}

	public void setschdTime(String schdTime) {
		this.schdTime = schdTime;
	}

	@Override
	public String toString() {
		return "SchdDto [schdNum=" + schdNum + ", cId=" + cId + ", schdDate=" + schdDate + ", schdDates=" + schdDates
				+ ", schdTime=" + schdTime + "]";
	}

}
