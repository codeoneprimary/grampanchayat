package com.gram.panchayat.dto;

import java.util.List;

import com.gram.panchayat.model.PropertyTax;

public class PropertyDetailDto {

	private Long id;
	private String ownerName;
	private String mobile;
	private String propertyNo;
	private double area;
	private String propertyType;
	private String constructionType;
	private int wardNo;
	private String address;

	private TaxSummaryDto taxSummary;
	private List<PropertyTax> propertyTaxHistory;

	public PropertyDetailDto() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getPropertyNo() {
		return propertyNo;
	}

	public void setPropertyNo(String propertyNo) {
		this.propertyNo = propertyNo;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public String getConstructionType() {
		return constructionType;
	}

	public void setConstructionType(String constructionType) {
		this.constructionType = constructionType;
	}

	public int getWardNo() {
		return wardNo;
	}

	public void setWardNo(int wardNo) {
		this.wardNo = wardNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public TaxSummaryDto getTaxSummary() {
		return taxSummary;
	}

	public void setTaxSummary(TaxSummaryDto taxSummary) {
		this.taxSummary = taxSummary;
	}

	public List<PropertyTax> getPropertyTaxHistory() {
		return propertyTaxHistory;
	}

	public void setPropertyTaxHistory(List<PropertyTax> propertyTaxHistory) {
		this.propertyTaxHistory = propertyTaxHistory;
	}

}
