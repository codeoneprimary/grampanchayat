package com.gram.panchayat.dto;

public class TaxSummaryDto {
	private Double totalTax;
	private Double balanceAmount;

	public TaxSummaryDto(Double totalTax, Double balanceAmount) {
		this.totalTax = totalTax;
		this.balanceAmount = balanceAmount;
	}

	public TaxSummaryDto() {
	}

	public Double getTotalTax() {
		return totalTax;
	}

	public void setTotalTax(Double totalTax) {
		this.totalTax = totalTax;
	}

	public Double getBalanceAmount() {
		return balanceAmount;
	}

	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}

}
