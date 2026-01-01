package com.gram.panchayat.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;

@Entity
@Table(name = "OTP_VERIFICATION")
public class OtpVerification {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OPT_ID", unique = true, nullable = false)
	private Long otpId;

	@Column(name = "MOBILE_NO", length = 10, nullable = false)
	private String mobileNo;

	@Column(name = "OTP_HASH", length = 255, nullable = false)
	private String otpHash;

	@Column(name = "EXPIRY_TIME", nullable = false)
	private LocalDateTime expiryTime;

	@Column(name = "CREATE_DATE", nullable = false)
	private LocalDateTime createdDate;

	@PrePersist
	public void onCreate() {
		createdDate = LocalDateTime.now();
	}

	public boolean isExpired() {
		return LocalDateTime.now().isAfter(expiryTime);
	}

	public OtpVerification() {
	}

	public Long getOtpId() {
		return otpId;
	}

	public void setOtpId(Long otpId) {
		this.otpId = otpId;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getOtpHash() {
		return otpHash;
	}

	public void setOtpHash(String otpHash) {
		this.otpHash = otpHash;
	}

	public LocalDateTime getExpiryTime() {
		return expiryTime;
	}

	public void setExpiryTime(LocalDateTime expiryTime) {
		this.expiryTime = expiryTime;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}
}
