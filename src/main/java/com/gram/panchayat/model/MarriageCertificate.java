package com.gram.panchayat.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "MARRIAGE_CERTIFICATE")
public class MarriageCertificate {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long certificateId;

	@OneToOne
	@JoinColumn(name = "APPLICATION_ID")
	private MarriageApplication marriageApplication;

	@Column(name = "CERTIFICATE_NUMBER", unique = true)
	private String certificateNumber;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ISSUE_DATE")
	private LocalDateTime issueDate;

	@Column(name = "ISSUED_BY")
	private String issuedBy; // Admin Name

	@Column(name = "DOCUMENT_NAME")
	private String documentName;

	@Column(name = "DOCUMENT_PATH")
	private String documentPath;

	public MarriageCertificate() {
	}

	public Long getCertificateId() {
		return certificateId;
	}

	public void setCertificateId(Long certificateId) {
		this.certificateId = certificateId;
	}

	public MarriageApplication getMarriageApplication() {
		return marriageApplication;
	}

	public void setMarriageApplication(MarriageApplication marriageApplication) {
		this.marriageApplication = marriageApplication;
	}

	public String getCertificateNumber() {
		return certificateNumber;
	}

	public void setCertificateNumber(String certificateNumber) {
		this.certificateNumber = certificateNumber;
	}

	public LocalDateTime getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(LocalDateTime issueDate) {
		this.issueDate = issueDate;
	}

	public String getIssuedBy() {
		return issuedBy;
	}

	public void setIssuedBy(String issuedBy) {
		this.issuedBy = issuedBy;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public String getDocumentPath() {
		return documentPath;
	}

	public void setDocumentPath(String documentPath) {
		this.documentPath = documentPath;
	}

}
