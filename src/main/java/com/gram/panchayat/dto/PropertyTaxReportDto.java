package com.gram.panchayat.dto;

public class PropertyTaxReportDto {

    private String financialYear;
    private String propertyNo;
    private String ownerName;
    private String mobile;

    private Double totalTax;
    private Double paidAmount;
    private Double balanceAmount;

    private String status;
	// 🔹 Default Constructor
	public PropertyTaxReportDto() {
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public String getPropertyNo() {
		return propertyNo;
	}
	public void setPropertyNo(String propertyNo) {
		this.propertyNo = propertyNo;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
}
