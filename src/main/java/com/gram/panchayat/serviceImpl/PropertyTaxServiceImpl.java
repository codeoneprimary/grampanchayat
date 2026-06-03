package com.gram.panchayat.serviceImpl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gram.panchayat.dto.PropertyTaxReportDto;
import com.gram.panchayat.dto.TaxSummaryDto;
import com.gram.panchayat.model.Property;
import com.gram.panchayat.model.PropertyTax;
import com.gram.panchayat.model.PropertyTaxPayment;
import com.gram.panchayat.repository.PropertyTaxRepository;
import com.gram.panchayat.repository.PropertyTaxPaymentRepository;
import com.gram.panchayat.services.PropertyService;
import com.gram.panchayat.services.PropertyTaxService;

@Service
public class PropertyTaxServiceImpl implements PropertyTaxService {

	private final PropertyTaxRepository propertyTaxRepository;
	private final PropertyService propertyService;
	private final PropertyTaxPaymentRepository propertyTaxPaymentRepository;

	public PropertyTaxServiceImpl(PropertyTaxRepository propertyTaxRepository, PropertyService propertyService,
			PropertyTaxPaymentRepository propertyTaxPaymentRepository) {
		this.propertyTaxRepository = propertyTaxRepository;
		this.propertyService = propertyService;
		this.propertyTaxPaymentRepository = propertyTaxPaymentRepository;
	}

	@Override
	public List<PropertyTax> getAllProprtyTaxByPropertyId(Long propertyId) {
		// TODO Auto-generated method stub
		return propertyTaxRepository.findByProperty_IdOrderByFinancialYearDesc(propertyId);
	}

	public Map<String, Object> uploadPropertyTaxCsv(MultipartFile file, String year) throws Exception {

		List<String> errors = new ArrayList<>();
		List<PropertyTax> successList = new ArrayList<>();

		BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8));

		br.readLine(); // skip header

		String line;
		int rowNum = 1, success = 0, fail = 0, total = 0;

		// ✅ 1. Check empty
		if (file == null || file.isEmpty()) {
			errors.add("Please upload a file.");
			return Map.of("totalCount", total, "successCount", success, "failCount", fail, "errors", errors,
					"successList", successList);
		}

		// ✅ 2. Check extension
		String fileName = file.getOriginalFilename();
		if (fileName == null || !fileName.toLowerCase().endsWith(".csv")) {
			errors.add("Only CSV files are allowed.");
			return Map.of("totalCount", total, "successCount", success, "failCount", fail, "errors", errors,
					"successList", successList);
		}

		// ✅ 3. Check content type
		String contentType = file.getContentType();
		if (contentType == null
				|| !(contentType.equals("text/csv") || contentType.equals("application/vnd.ms-excel"))) {
			errors.add("Invalid file type");
			return Map.of("totalCount", total, "successCount", success, "failCount", fail, "errors", errors,
					"successList", successList);
		}

		// ✅ 4. Validate CSV structure
		BufferedReader testReader = new BufferedReader(
				new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8));

		String header = testReader.readLine();
		if (header == null || !header.contains(",")) {
			errors.add("Invalid CSV format.");
			return Map.of("totalCount", total, "successCount", success, "failCount", fail, "errors", errors,
					"successList", successList);
		}
		while ((line = br.readLine()) != null) {
			rowNum++;
			total++;

			String[] cols = line.split(",");

			if (cols.length < 6) {
				errors.add("Row " + rowNum + ": Invalid column count");
				fail++;
				continue;
			}

			String owner = cols[0].trim();
			String mobile = cols[1].trim();
			mobile = mobile.replace("\"", "") // remove quotes
					.replace("'", "") // remove '
					.replace("=", "") // remove = if any
					.trim();
			String propertyNo = cols[2].trim();
			propertyNo = propertyNo.replace("\"", "") // remove quotes
					.replace("'", "") // remove '
					.replace("=", "") // remove = if any
					.trim();
			String pendingStr = cols[3].trim();
			String penaltyStr = cols[4].trim();
			String currentStr = cols[5].trim();

			// 🔴 Required validation
			if (owner.isEmpty() || mobile.isEmpty() || propertyNo.isEmpty()) {
				errors.add("Row " + rowNum + ": Missing required fields");
				fail++;
				continue;
			}

			// 🔴 Mobile validation
			if (!mobile.matches("\\d{10}")) {
				errors.add("Row " + rowNum + ": Invalid mobile");
				fail++;
				continue;
			}

			// 🔴 Numeric validation
			double pending, penalty, current;
			try {
				pending = Double.parseDouble(pendingStr);
				penalty = Double.parseDouble(penaltyStr);
				current = Double.parseDouble(currentStr);
			} catch (Exception e) {
				errors.add("Row " + rowNum + ": Invalid numeric values");
				fail++;
				continue;
			}

			// 🔴 Property check
			Optional<Property> property = propertyService.getPropertyDetailsByNo(propertyNo);
			if (property.isEmpty()) {
				errors.add("Row " + rowNum + ": Property not found");
				fail++;
				continue;
			}

			Optional<PropertyTax> existingOpt = propertyTaxRepository.findByPropertyAndFinancialYear(property.get(),
					year);

			PropertyTax tax;

			if (existingOpt.isPresent()) {
				// 🔄 UPDATE
				tax = existingOpt.get();
				tax.setUploadStatus("UPDATED");

			} else {
				// ➕ INSERT
				tax = new PropertyTax();
				tax.setProperty(property.get());
				tax.setFinancialYear(year);
				tax.setPaidAmount(0.0);
				tax.setUploadStatus("INSERT");
			}

			// common updates
			tax.setPendingTax(pending);
			tax.setPenalty(penalty);
			tax.setCurrentTax(current);

			double totalTax = pending + penalty + current;
			tax.setTotalTax(totalTax);

			double paid = tax.getPaidAmount() == null ? 0 : tax.getPaidAmount();
			double balanceAmount = totalTax - paid;
			tax.setBalanceAmount(balanceAmount);
			String status = "PENDING";
			if (balanceAmount == 0) {
				status = "PAID";
			}
			tax.setStatus(status);
			propertyTaxRepository.save(tax);

			successList.add(tax);
			success++;
		}

		return Map.of("total", total, "success", success, "fail", fail, "errors", errors, "successList", successList);
	}

	@Override
	public PropertyTax getPropertyTaxDetailsById(long id) {
		return propertyTaxRepository.findById(id);
	}

	@Override
	public void updatePropertyTax(PropertyTax tax) {
		PropertyTax propertyTax = propertyTaxRepository.findById(tax.getId());

		propertyTax.setCurrentTax(tax.getCurrentTax());
		propertyTax.setPenalty(tax.getPenalty());
		propertyTax.setPendingTax(tax.getPendingTax());
		double totalTax = tax.getPendingTax() + tax.getPenalty() + tax.getCurrentTax();
		propertyTax.setTotalTax(totalTax);

		double paid = propertyTax.getPaidAmount() == null ? 0 : propertyTax.getPaidAmount();
		double balanceAmount = totalTax - paid;
		propertyTax.setBalanceAmount(balanceAmount);
		String status = "PENDING";
		if (balanceAmount == 0) {
			status = "PAID";
		}
		propertyTax.setStatus(status);
		propertyTaxRepository.save(propertyTax);
	}

	@Override
	public TaxSummaryDto getTotalAndBalanceByPropertyId(Long propertyId) {
		// TODO Auto-generated method stub
		return propertyTaxRepository.getSummaryByPropertyId(propertyId);
	}

	@Override
	public double submitPropertyTaxPayment(Long propertyId, Double amount, String paymentMode) {
		TaxSummaryDto taxSummaryDto = propertyTaxRepository.getSummaryByPropertyId(propertyId);
		double totalBalance = taxSummaryDto.getBalanceAmount();

		if (amount > totalBalance) {
			throw new RuntimeException("Amount exceeds total balance!");
		}

		List<PropertyTax> taxList = propertyTaxRepository.findPendingTaxes(propertyId);

		double remainingAmount = amount;

		for (PropertyTax tax : taxList) {

			if (remainingAmount <= 0)
				break;

			double balance = tax.getBalanceAmount();
			double paid = Math.min(balance, remainingAmount);

			tax.setPaidAmount((tax.getPaidAmount() == null ? 0 : tax.getPaidAmount()) + paid);
			tax.setBalanceAmount(balance - paid);

			if (tax.getBalanceAmount() == 0) {
				tax.setStatus("PAID");
			} else {
				tax.setStatus("PARTIAL");
			}

			propertyTaxRepository.save(tax);

			PropertyTaxPayment payment = new PropertyTaxPayment();
			payment.setProperty(tax.getProperty());
			payment.setAmountPaid(paid);
			payment.setFinancialYear(tax.getFinancialYear());
			payment.setPaymentDate(LocalDate.now());
			payment.setPaymentMode(paymentMode);

			propertyTaxPaymentRepository.save(payment);

			remainingAmount -= paid;
		}

		// Return NEW balance
		return propertyTaxRepository.getSummaryByPropertyId(propertyId).getBalanceAmount();
	}

	@Override
	public void exportToCsv(PrintWriter writer, String year) {

		// Header
		writer.println("OWNER_NAME,MOBILE,PROPERTY_NO,FINANCIAL_YEAR,PENDING_TAX,PENALTY,PAID_AMOUNT,TOTAL_TAX");

		List<PropertyTax> list;

		if (year != null && !year.isEmpty()) {
			list = propertyTaxRepository.findByFinancialYearOrderByProperty_PropertyNoAsc(year);
		} else {
			list = propertyTaxRepository.findAll();
		}

		for (PropertyTax tax : list) {

			Property p = tax.getProperty();

			writer.println(safe(p.getOwnerName()) + "," + safe(p.getMobile()) + "," + safe(p.getPropertyNo()) + ","
					+ safe(tax.getFinancialYear()) + "," + tax.getBalanceAmount() + "," + tax.getPenalty() + ","
					+ tax.getPaidAmount() + "," + tax.getTotalTax());
		}

		writer.flush();
	}

	private String safe(Object value) {
		return value == null ? "" : value.toString().replace(",", " ");
	}

	@Override
	public Page<PropertyTaxReportDto> getReport(String year, String keyword, String status, int page) {

		Pageable pageable = PageRequest.of(page, 10, Sort.by("property.propertyNo"));

		String fYear = (year == null || year.isEmpty()) ? null : year;
		String fKeyword = (keyword == null || keyword.trim().isEmpty()) ? null : keyword;
		String fStatus = (status == null || status.isEmpty()) ? null : status;

		Page<PropertyTax> data = propertyTaxRepository.searchReport(fYear, fKeyword, fStatus, pageable);

		// ✅ Correct: keep original pagination, only map
		return data.map(t -> {

			PropertyTaxReportDto dto = new PropertyTaxReportDto();

			dto.setFinancialYear(t.getFinancialYear());
			dto.setPropertyNo(t.getProperty().getPropertyNo());
			dto.setOwnerName(t.getProperty().getOwnerName());
			dto.setMobile(t.getProperty().getMobile());

			dto.setTotalTax(nvl(t.getTotalTax()));
			dto.setPaidAmount(nvl(t.getPaidAmount()));
			dto.setBalanceAmount(nvl(t.getBalanceAmount()));

			// display status
			if (dto.getBalanceAmount() == 0)
				dto.setStatus("PAID");
			else if (dto.getPaidAmount() == 0)
				dto.setStatus("PENDING");
			else
				dto.setStatus("PARTIAL");

			return dto;
		});
	}

	private Double nvl(Double d) {
		return d == null ? 0.0 : d;
	}

	@Override
	public List<PropertyTaxReportDto> getReportListForDownload(String year, String keyword, String status) {
		String fYear = (year == null || year.isEmpty()) ? null : year;
		String fKeyword = (keyword == null || keyword.trim().isEmpty()) ? null : keyword;
		String fStatus = (status == null || status.isEmpty()) ? null : status;

		List<PropertyTax> data = propertyTaxRepository.searchReportForExport(fYear, fKeyword, fStatus);
		return data.stream().map(t -> {

			PropertyTaxReportDto dto = new PropertyTaxReportDto();

			dto.setFinancialYear(t.getFinancialYear());
			dto.setPropertyNo(t.getProperty().getPropertyNo());
			dto.setOwnerName(t.getProperty().getOwnerName());
			dto.setMobile(t.getProperty().getMobile());

			dto.setTotalTax(nvl(t.getTotalTax()));
			dto.setPaidAmount(nvl(t.getPaidAmount()));
			dto.setBalanceAmount(nvl(t.getBalanceAmount()));

			if (dto.getBalanceAmount() == 0)
				dto.setStatus("PAID");
			else if (dto.getPaidAmount() == 0)
				dto.setStatus("PENDING");
			else
				dto.setStatus("PARTIAL");

			return dto;

		}).filter(dto -> {
			if (status == null || status.isEmpty())
				return true;
			return dto.getStatus().equals(status);
		}).toList();
	}

	@Override
	public Page<PropertyTaxPayment> findByProperty_PropertyNoOrderByPaymentDateDesc(String propertyNo,
			Pageable pageable) {
		return propertyTaxPaymentRepository.findByProperty_PropertyNoOrderByPaymentDateDesc(propertyNo, pageable);
	}

}
