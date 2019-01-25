package com.hellomind.dto;

public class SchdDto {
	private int schdNum; // 일정가능번호
	private String cId; // 상담사 아이디
	private String schdDates; // 상담일정이 가능한 날짜
	private String schdTime; // 상담일정이 가능한 시간
	private String schdDateTime; // 상담일정이 가능한 날짜 시간

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

	public String getSchdDates() {
		return schdDates;
	}

	public void setSchdDates(String schdDates) {
		this.schdDates = schdDates;
	}

	public String getSchdTime() {
		return schdTime;
	}

	public void setSchdTime(String schdTime) {
		this.schdTime = schdTime;
	}

	public String getSchdDateTime() {
		return schdDateTime;
	}

	public void setSchdDateTime(String schdDateTime) {
		this.schdDateTime = schdDateTime;
	}

	@Override
	public String toString() {
		return "SchdDto [schdNum=" + schdNum + ", cId=" + cId + ", schdDates=" + schdDates + ", schdTime=" + schdTime
				+ ", schdDateTime=" + schdDateTime + "]";
	}

}
