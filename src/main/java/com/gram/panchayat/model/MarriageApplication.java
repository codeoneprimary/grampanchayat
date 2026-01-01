package com.gram.panchayat.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "MARRIAGE_APPLICATION")
public class MarriageApplication {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long applicationId;

	@ManyToOne
	@JoinColumn(name = "USER_ID")
	private User appliedBy;

	@Column(name = "BRIDE_NAME")
	private String brideName;

	@Column(name = "GROOM_NAME")
	private String groomName;

	@Column(name = "BRIDE_AADHAR_CARD_NO")
	private String brideAadharCardNo;

	@Column(name = "GROOM_AADHAR_CARD_NO")
	private String groomAadharCardNo;

	@Column(name = "MARRIAGE_DATE")
	private String marriageDate;

	@Column(name = "PLACE_OF_MARRIAGE")
	private String placeOfMarriage;

	@Column(name = "WITNESS_1")
	private String witnessOne;

	@Column(name = "WITNESS_2")
	private String witnessTwo;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "BRIDE_AADHAR_CARD_DOCUMENT")
	private String brideAadharCardDocument;

	@Column(name = "GROOM_AADHAR_CARD_DOCUMENT")
	private String groomAadharCardDocument;

	@Column(name = "STATUS")
	private String status; // PENDING, APPROVED, REJECTED

	@Column(name = "STATUS_REMARK")
	private String statusRemark;

	@ManyToOne
	@JoinColumn(name = "STATUS_UPDATED_BY")
	private User statusUpdatedBy;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATED_DATE")
	private LocalDateTime createdDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "UPDATED_DATE")
	private LocalDateTime updatedDate;

	public MarriageApplication() {
	}

	public Long getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(Long applicationId) {
		this.applicationId = applicationId;
	}

	public User getAppliedBy() {
		return appliedBy;
	}

	public void setAppliedBy(User appliedBy) {
		this.appliedBy = appliedBy;
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

	public String getBrideAadharCardDocument() {
		return brideAadharCardDocument;
	}

	public void setBrideAadharCardDocument(String brideAadharCardDocument) {
		this.brideAadharCardDocument = brideAadharCardDocument;
	}

	public String getGroomAadharCardDocument() {
		return groomAadharCardDocument;
	}

	public void setGroomAadharCardDocument(String groomAadharCardDocument) {
		this.groomAadharCardDocument = groomAadharCardDocument;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatusRemark() {
		return statusRemark;
	}

	public void setStatusRemark(String statusRemark) {
		this.statusRemark = statusRemark;
	}

	public User getStatusUpdatedBy() {
		return statusUpdatedBy;
	}

	public void setStatusUpdatedBy(User statusUpdatedBy) {
		this.statusUpdatedBy = statusUpdatedBy;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	public LocalDateTime getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(LocalDateTime updatedDate) {
		this.updatedDate = updatedDate;
	}

}
