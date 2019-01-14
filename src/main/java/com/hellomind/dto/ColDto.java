package com.hellomind.dto;

public class ColDto {

	private String cId; // 아이디
	private String cPw; // 비밀번호
	private String cEmail; // 이메일
	private String cPnum; // 전화번호
	private String cert; // 자격증 파일
	private String cRegdate; // 가입일
	private String cStats; // 인증전0 인증후1 탈퇴2


	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getcPw() {
		return cPw;
	}

	public void setcPw(String cPw) {
		this.cPw = cPw;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}

	public String getCpnum() {
		return cPnum;
	}

	public void setCpnum(String cPnum) {
		this.cPnum = cPnum;
	}

	public String getCert() {
		return cert;
	}

	public void setCert(String cert) {
		this.cert = cert;
	}

	public String getcRegdate() {
		return cRegdate;
	}

	public void setcRegdate(String cRegdate) {
		this.cRegdate = cRegdate;
	}

	public String getcStats() {
		return cStats;
	}

	public void setcStats(String cStats) {
		this.cStats = cStats;
	}

	@Override
	public String toString() {
		return "ColDto [ cId=" + cId + ", cPw=" + cPw + ", cEmail=" + cEmail + ", cPnum=" + cPnum
				+ ", cert=" + cert + ", cRegdate=" + cRegdate + ", cStats=" + cStats + "]";
	}
}
