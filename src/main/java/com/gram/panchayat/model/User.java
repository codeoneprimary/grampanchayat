package com.gram.panchayat.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
@Table(name = "USERS", uniqueConstraints = { @UniqueConstraint(columnNames = "MOBILE_NO") })
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "REG_USER_ID", unique = true, nullable = false)
	private Long regUserId;

	@Column(name = "MOBILE_NO", length = 10, nullable = false)
	private String mobileNo;

	@Column(name = "FULL_NAME", length = 100)
	private String fullName;

	@Column(name = "EMAIL", length = 100)
	private String email;

	@Column(name = "USERNAME", unique = true)
	private String username;

	@Column(name = "USER_ROLE", nullable = false)
	private String userRole; // SUPER_ADMIN / ADMIN / CITIZEN

	@Column(name = "CREATE_DATE", nullable = false)
	private LocalDateTime createdDate;

	@Column(name = "IS_ACTIVE", nullable = false)
	private boolean isActive;

	@PrePersist
	public void onCreate() {
		createdDate = LocalDateTime.now();
	}

	public User() {
	}

	public Long getRegUserId() {
		return regUserId;
	}

	public void setRegUserId(Long regUserId) {
		this.regUserId = regUserId;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

}