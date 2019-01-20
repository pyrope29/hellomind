package com.hellomind.dto;

public class ColDto {

	private String cId; // 아이디
	private String cName; // 이름
	private String cPw; // 비밀번호
	private String cLv; // 1급 2급 예비상담사
	private String cEmail; // 이메일
	private String cPnum; // 전화번호
	private String cStats; // 인증전0 인증후1 탈퇴2
	private String cRegdate;

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcPw() {
		return cPw;
	}

	public void setcPw(String cPw) {
		this.cPw = cPw;
	}

	public String getcLv() {
		return cLv;
	}

	public void setcLv(String cLv) {
		this.cLv = cLv;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}

	public String getcPnum() {
		return cPnum;
	}

	public void setcPnum(String cPnum) {
		this.cPnum = cPnum;
	}

	public String getcStats() {
		return cStats;
	}

	public void setcStats(String cStats) {
		this.cStats = cStats;
	}

	public String getcRegdate() {
		return cRegdate;
	}

	public void setcRegdate(String cRegdate) {
		this.cRegdate = cRegdate;
	}

	@Override
	public String toString() {
		return "ColDto [cId=" + cId + ", cName=" + cName + ", cPw=" + cPw + ", cLv=" + cLv + ", cEmail=" + cEmail
				+ ", cPnum=" + cPnum + ", cStats=" + cStats + ", cRegdate=" + cRegdate + "]";
	}

}