package com.gram.panchayat.dto;

public class MarriageApplicationRequest {

	private Long userId;
	private String brideName;
	private String groomName;
	private String brideAadharCardNo;
	private String groomAadharCardNo;
	private String marriageDate;
	private String placeOfMarriage;
	private String witnessOne;
	private String witnessTwo;
	private String address;
	private DocumentDto brideAadharCard;
	private DocumentDto groomAadharCard;

	public MarriageApplicationRequest() {
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getBrideName() {
		return brideName;
	}

	public void setBrideName(String brideName) {
		this.brideName = brideName;
	}

	public String getGroomName() {
		return groomName;
	}

	public void setGroomName(String groomName) {
		this.groomName = groomName;
	}

	public String getBrideAadharCardNo() {
		return brideAadharCardNo;
	}

	public void setBrideAadharCardNo(String brideAadharCardNo) {
		this.brideAadharCardNo = brideAadharCardNo;
	}

	public String getGroomAadharCardNo() {
		return groomAadharCardNo;
	}

	public void setGroomAadharCardNo(String groomAadharCardNo) {
		this.groomAadharCardNo = groomAadharCardNo;
	}

	public String getMarriageDate() {
		return marriageDate;
	}

	public void setMarriageDate(String marriageDate) {
		this.marriageDate = marriageDate;
	}

	public String getPlaceOfMarriage() {
		return placeOfMarriage;
	}

	public void setPlaceOfMarriage(String placeOfMarriage) {
		this.placeOfMarriage = placeOfMarriage;
	}

	public String getWitnessOne() {
		return witnessOne;
	}

	public void setWitnessOne(String witnessOne) {
		this.witnessOne = witnessOne;
	}

	public String getWitnessTwo() {
		return witnessTwo;
	}

	public void setWitnessTwo(String witnessTwo) {
		this.witnessTwo = witnessTwo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public DocumentDto getBrideAadharCard() {
		return brideAadharCard;
	}

	public void setBrideAadharCard(DocumentDto brideAadharCard) {
		this.brideAadharCard = brideAadharCard;
	}

	public DocumentDto getGroomAadharCard() {
		return groomAadharCard;
	}

	public void setGroomAadharCard(DocumentDto groomAadharCard) {
		this.groomAadharCard = groomAadharCard;
	}

}
