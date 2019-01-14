package com.hellomind.dto;

public class MemberDto {
	private String mId; // 아이디
	private String mPw; // 비밀번호
	private String mEmail; // 이메일
	private String mPnum; // 전화번호
	private String mStats; // 인증전0 인증후1 탈퇴2
	private String mRegdate; // 가입일

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPnum() {
		return mPnum;
	}

	public void setmPnum(String mPnum) {
		this.mPnum = mPnum;
	}

	public String getmStats() {
		return mStats;
	}

	public void setmStats(String mStats) {
		this.mStats = mStats;
	}

	public String getMdate() {
		return mRegdate;
	}

	public void setMdate(String mRegdate) {
		this.mRegdate = mRegdate;
	}

	@Override
	public String toString() {
		return "MemberDto [ mId=" + mId + ", mPw=" + mPw + ", mEmail=" + mEmail + ", mPnum=" + mPnum
				+ ", mStats=" + mStats + ", mRegdate=" + mRegdate + "]";
	}
}
