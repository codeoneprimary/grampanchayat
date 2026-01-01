package com.gram.panchayat.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
@Table(name = "DOB_APPLICATION")
public class DobApplication {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "APPLICATION_ID", unique = true, nullable = false)
	private Long applicationId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "applied_by")
	private User appliedBy;

	@Column(name = "CHILD_NAME", nullable = false)
	private String childName;

	@Column(name = "FATHER_NAME")
	private String fatherName;

	@Column(name = "MOTHER_NAME")
	private String motherName;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "PLACE_OF_BIRTH")
	private String placeOfBirth;

	@Column(name = "DATE_OF_BIRTH")
	private String dateOfBirth;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "STATE")
	private String state;

	@Column(name = "DISTRICT")
	private String district;

	@Column(name = "PINCODE")
	private String pincode;

	@Column(name = "DOCTOR_CERTIFICATE")
	private String doctorCertificate;

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

	public DobApplication() {

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

	public String getChildName() {
		return childName;
	}

	public void setChildName(String childName) {
		this.childName = childName;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPlaceOfBirth() {
		return placeOfBirth;
	}

	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getDoctorCertificate() {
		return doctorCertificate;
	}

	public void setDoctorCertificate(String doctorCertificate) {
		this.doctorCertificate = doctorCertificate;
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

}
