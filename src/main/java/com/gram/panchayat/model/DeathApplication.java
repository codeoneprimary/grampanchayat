package com.gram.panchayat.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "DEATH_APPLICATION")
public class DeathApplication {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "APPLICATION_ID", unique = true, nullable = false)
	private Long applicationId;

	// Who applied (user)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "applied_by")
	private User appliedBy;

	@Column(name = "AADHAR_CARD_NO")
	private String aadharCardNo;

	@Column(name = "DECEASE_NAME", nullable = false)
	private String deceasedName;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "AGE")
	private String age;

	@Column(name = "DATE_OF_BIRTH")
	private String dateOfBirth;

	// -------------------------
	// Death Details
	// -------------------------
	@Column(name = "DATE_OF_DEATH", nullable = false)
	private String dateOfDeath;

	@Column(name = "PLACE_OF_DEATH")
	private String placeOfDeath;

	@Column(name = "CAUSE_OF_DEATH")
	private String causeOfDeath;

	// relative details
	@Column(name = "INFORMANT_NAME")
	private String informantName;

	@Column(name = "RELATION")
	private String relation;
	@Column(name = "MOBILE_NO")
	private String mobileNo;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "STATE")
	private String state;

	@Column(name = "DISTRICT")
	private String district;

	@Column(name = "PINCODE")
	private String pincode;

	// -------------------------
	// Uploaded Documents
	// -------------------------

	@Column(name = "DOCTOR_CERTIFICATE")
	private String doctorCertificate;

	@Column(name = "AADHAR_CARD")
	private String aadharCard;

	// -------------------------
	// Status Tracking
	// -------------------------
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "APPLICATION_DATE")
	private LocalDateTime applicationDate;

	@Column(name = "STATUS") // PENDING / APPROVED / REJECTED
	private String status = "PENDING";

	@Column(name = "STATUS_REMARK")
	private String statusRemark;

	// NEW → which admin updated status
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "STATUS_UPDATED_BY")
	private User statusUpdatedBy; // ADMIN

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "STATUS_UPDATE_DATE")
	private LocalDateTime statusUpdatedDate;

	public DeathApplication() {
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

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
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

	public String getDoctorCertificate() {
		return doctorCertificate;
	}

	public void setDoctorCertificate(String doctorCertificate) {
		this.doctorCertificate = doctorCertificate;
	}

	public String getAadharCard() {
		return aadharCard;
	}

	public void setAadharCard(String aadharCard) {
		this.aadharCard = aadharCard;
	}

	public LocalDateTime getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(LocalDateTime applicationDate) {
		this.applicationDate = applicationDate;
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

	public LocalDateTime getStatusUpdatedDate() {
		return statusUpdatedDate;
	}

	public void setStatusUpdatedDate(LocalDateTime statusUpdatedDate) {
		this.statusUpdatedDate = statusUpdatedDate;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
