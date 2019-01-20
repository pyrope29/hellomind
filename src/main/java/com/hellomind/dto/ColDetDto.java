package com.hellomind.dto;

public class ColDetDto {

	private String cId; // 상담사 번호
	private String pic; // 사진 이미지
	private String intro; // 소개 1000자
	private String career; // 경력 500자

	private String cert; // 자격증 파일
	private String orignPicture;
	private String savePicture;
	private String saveFolder;

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getCert() {
		return cert;
	}

	public void setCert(String cert) {
		this.cert = cert;
	}

	public String getOrignPicture() {
		return orignPicture;
	}

	public void setOrignPicture(String orignPicture) {
		this.orignPicture = orignPicture;
	}

	public String getSavePicture() {
		return savePicture;
	}

	public void setSavePicture(String savePicture) {
		this.savePicture = savePicture;
	}

	public String getSaveFolder() {
		return saveFolder;
	}

	public void setSaveFolder(String saveFolder) {
		this.saveFolder = saveFolder;
	}

	@Override
	public String toString() {
		return "ColDetDto [cId=" + cId + ", pic=" + pic + ", intro=" + intro + ", career=" + career + ", cert=" + cert
				+ ", orignPicture=" + orignPicture + ", savePicture=" + savePicture + ", saveFolder=" + saveFolder
				+ "]";
	}

}