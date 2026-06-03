package com.gram.panchayat.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.persistence.UniqueConstraint;

@Entity
@Table(name = "property_tax", uniqueConstraints = @UniqueConstraint(columnNames = { "property_id", "financialYear" }))
public class PropertyTax {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	private Long id;

	@Column(name = "FINANCIAL_YEAR")
	private String financialYear;

	@Column(name = "PENDING_TAX")
	private Double pendingTax;

	@Column(name = "PENALTY")
	private Double penalty;

	@Column(name = "CURRENT_TAX")
	private Double currentTax;

	@Column(name = "TOTAL_TAX")
	private Double totalTax;

	@Column(name = "PAID_AMOUNT")
	private Double paidAmount;

	@Column(name = "BALANCE_AMOUNT")
	private Double balanceAmount;

	@ManyToOne
	@JoinColumn(name = "property_id", nullable = false)
	private Property property;

	@Column(name = "STATUS")
	private String status;

	@Transient
	private String uploadStatus;

	public PropertyTax() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFinancialYear() {
		return financialYear;
	}

	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}

	public Double getPendingTax() {
		return pendingTax;
	}

	public void setPendingTax(Double pendingTax) {
		this.pendingTax = pendingTax;
	}

	public Double getPenalty() {
		return penalty;
	}

	public void setPenalty(Double penalty) {
		this.penalty = penalty;
	}

	public Double getCurrentTax() {
		return currentTax;
	}

	public void setCurrentTax(Double currentTax) {
		this.currentTax = currentTax;
	}

	public Double getTotalTax() {
		return totalTax;
	}

	public void setTotalTax(Double totalTax) {
		this.totalTax = totalTax;
	}

	public Double getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}

	public Double getBalanceAmount() {
		return balanceAmount;
	}

	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUploadStatus() {
		return uploadStatus;
	}

	public void setUploadStatus(String uploadStatus) {
		this.uploadStatus = uploadStatus;
	}

}
