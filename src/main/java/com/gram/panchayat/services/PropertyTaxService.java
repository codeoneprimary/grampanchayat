package com.gram.panchayat.services;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.gram.panchayat.dto.PropertyTaxReportDto;
import com.gram.panchayat.dto.TaxSummaryDto;
import com.gram.panchayat.model.PropertyTax;
import com.gram.panchayat.model.PropertyTaxPayment;

public interface PropertyTaxService {

	List<PropertyTax> getAllProprtyTaxByPropertyId(Long id);

	Map<String, Object> uploadPropertyTaxCsv(MultipartFile file, String string) throws Exception;

	PropertyTax getPropertyTaxDetailsById(long id);

	void updatePropertyTax(PropertyTax tax);

	TaxSummaryDto getTotalAndBalanceByPropertyId(Long id);

	double submitPropertyTaxPayment(Long propertyId, Double amount, String paymentMode);

	void exportToCsv(PrintWriter writer, String year);

	Page<PropertyTaxReportDto> getReport(String year, String keyword, String status, int page);

	List<PropertyTaxReportDto> getReportListForDownload(String year, String keyword, String status);

	Page<PropertyTaxPayment> findByProperty_PropertyNoOrderByPaymentDateDesc(String propertyNo, Pageable pageable);

}
