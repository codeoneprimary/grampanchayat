package com.gram.panchayat.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
@Table(name = "DOB_CERTIFICATE")
public class DobCertificate {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long certificateId;

	@OneToOne
	@JoinColumn(name = "APPLICATION_ID")
	private DobApplication application;

	@Column(name = "CERTIFICATE_NUMBER", unique = true)
	private String certificateNumber;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ISSUE_DATE")
	private LocalDateTime issueDate;

	@Column(name = "ISSUE_BY")
	private String issuedBy; // Admin name

	@Column(name = "DOCUMENT_NAME")
	private String documentName;

	@Column(name = "DOCUMENT_PATH")
	private String documentPath;

	public DobCertificate() {
	}

	public Long getCertificateId() {
		return certificateId;
	}

	public void setCertificateId(Long certificateId) {
		this.certificateId = certificateId;
	}

	public DobApplication getApplication() {
		return application;
	}

	public void setApplication(DobApplication application) {
		this.application = application;
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
