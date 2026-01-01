package com.gram.panchayat.dto;

public class DeathCertificateApplicationRequestDto {
	private Long userId;

	private String aadharCardNo;
	private String deceasedName;
	private String gender;

	private String dateOfBirth;
	private String dateOfDeath;
	private String placeOfDeath;
	private String causeOfDeath;
	private String age;

	private String informantName;
	private String relation;
	private String mobileNo;

	private String address;
	private String state;
	private String district;
	private String pincode;

	private DocumentDto doctorCertificate;
	private DocumentDto aadharCard;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getAadharCardNo() {
		return aadharCardNo;
	}

	public void setAadharCardNo(String aadharCardNo) {
		this.aadharCardNo = aadharCardNo;
	}

	public String getDeceasedName() {
		return deceasedName;
	}

	public void setDeceasedName(String deceasedName) {
		this.deceasedName = deceasedName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getDateOfDeath() {
		return dateOfDeath;
	}

	public void setDateOfDeath(String dateOfDeath) {
		this.dateOfDeath = dateOfDeath;
	}

	public String getPlaceOfDeath() {
		return placeOfDeath;
	}

	public void setPlaceOfDeath(String placeOfDeath) {
		this.placeOfDeath = placeOfDeath;
	}

	public String getCauseOfDeath() {
		return causeOfDeath;
	}

	public void setCauseOfDeath(String causeOfDeath) {
		this.causeOfDeath = causeOfDeath;
	}

	public String getInformantName() {
		return informantName;
	}

	public void setInformantName(String informantName) {
		this.informantName = informantName;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public DocumentDto getDoctorCertificate() {
		return doctorCertificate;
	}

	public void setDoctorCertificate(DocumentDto doctorCertificate) {
		this.doctorCertificate = doctorCertificate;
	}

	public DocumentDto getAadharCard() {
		return aadharCard;
	}

	public void setAadharCard(DocumentDto aadharCard) {
		this.aadharCard = aadharCard;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

}
