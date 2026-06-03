package com.gram.panchayat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.usermodel.DataValidationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.services.ContactNumberService;
import com.gram.panchayat.util.ExcelValidationUtil;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ContactNumberController {

	private final ContactNumberService contactService;

	public ContactNumberController(ContactNumberService contactService) {
		this.contactService = contactService;
	}

	@PostMapping("/uploadContactNumber")
	@ResponseBody
	public ResponseEntity<?> uploadExcelContactNumber(@RequestParam("file") MultipartFile file) {

		if (file.isEmpty()) {
			return ResponseEntity.badRequest().body("❌ File is empty");
		}

		if (!ExcelValidationUtil.isExcelFile(file)) {
			return ResponseEntity.badRequest().body("❌ Invalid file type");
		}

		List<ContactNumber> validContacts = new ArrayList<>();
		Set<String> excelDuplicates = new HashSet<>();
		Set<String> seenContacts = new HashSet<>();

		List<String> skippedRows = new ArrayList<>();
		Sheet sheet;
		int totalRecords = 0;
		try (Workbook workbook = new XSSFWorkbook(file.getInputStream())) {

			sheet = workbook.getSheetAt(0);

			// HEADER VALIDATION
			Row header = sheet.getRow(0);
			if (header == null || header.getCell(0) == null || header.getCell(1) == null
					|| !"Name".equalsIgnoreCase(header.getCell(0).getStringCellValue().trim())
					|| !"Contact".equalsIgnoreCase(header.getCell(1).getStringCellValue().trim())) {

				return ResponseEntity.badRequest().body("❌ Invalid Excel Header (Expected: Name, Contact)");
			}

			DataFormatter formatter = new DataFormatter();
			for (int i = 1; i <= sheet.getLastRowNum(); i++) {

				Row row = sheet.getRow(i);
				if (row == null) {
					continue;
				}

				Cell nameCell = row.getCell(0);
				Cell contactCell = row.getCell(1);
				if ((nameCell == null || nameCell.toString().trim().isEmpty())
						&& (contactCell == null || contactCell.toString().trim().isEmpty())) {
					break;
				}
				totalRecords++;
				String name = formatter.formatCellValue(row.getCell(0)).trim();
				String contact = formatter.formatCellValue(row.getCell(1));
				contact = contact.replaceAll("[^0-9]", "").trim();
				// NAME VALIDATION
				if (!ExcelValidationUtil.isValidName(name)) {
					skippedRows.add("Row " + (i + 1) + ": Invalid name");
					continue;
				}

				// MOBILE VALIDATION
				if (!ExcelValidationUtil.isValidMobile(contact)) {
					skippedRows.add("Row " + (i + 1) + ": Invalid mobile number");
					continue;
				}

				// DUPLICATE INSIDE EXCEL
				if (!seenContacts.add(contact)) {
					excelDuplicates.add(contact);
					skippedRows.add("Row " + (i + 1) + ": Duplicate in Excel");
					continue;
				}

				// DUPLICATE IN DATABASE
				if (contactService.existsByContact(contact)) {
					skippedRows.add("Row " + (i + 1) + ": Already exists in DB");
					continue;
				}

				ContactNumber c = new ContactNumber();
				c.setName(name);
				c.setContact(contact);
				validContacts.add(c);
			}

			if (!validContacts.isEmpty()) {
				contactService.saveAllContact(validContacts);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.internalServerError().body("❌ Processing error");
		}

		// RESPONSE SUMMARY
		Map<String, Object> response = new LinkedHashMap<>();
		response.put("Total Records", totalRecords);
		response.put("Saved", validContacts.size());
		response.put("Skipped", skippedRows.size());
		response.put("Skipped Details", skippedRows);

		return ResponseEntity.ok(response);
	}

	@GetMapping("/download-template")
	public void downloadTemplate(HttpServletResponse response) throws IOException {

		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Contact Template");

		/* ================= HEADER STYLE (LOCKED) ================= */
		CellStyle headerStyle = workbook.createCellStyle();
		Font headerFont = workbook.createFont();
		headerFont.setBold(true);
		headerStyle.setFont(headerFont);
		headerStyle.setLocked(true);

		/* ================= EDITABLE CELL STYLE (UNLOCKED) ================= */
		CellStyle editableStyle = workbook.createCellStyle();
		editableStyle.setLocked(false);

		/* ================= HEADER ROW ================= */
		Row headerRow = sheet.createRow(0);

		Cell h1 = headerRow.createCell(0);
		h1.setCellValue("Name");
		h1.setCellStyle(headerStyle);

		Cell h2 = headerRow.createCell(1);
		h2.setCellValue("Contact");
		h2.setCellStyle(headerStyle);

		/* ================= SAMPLE ROW ================= */
		Row sampleRow = sheet.createRow(1);

		Cell c1 = sampleRow.createCell(0);
		c1.setCellValue("Enter Full Name");
		c1.setCellStyle(editableStyle);

		Cell c2 = sampleRow.createCell(1);
		c2.setCellValue("9876543210");
		c2.setCellStyle(editableStyle);

		/* ================= UNLOCK FUTURE ROWS ================= */
		for (int i = 1; i <= 1000; i++) {
			Row row = sheet.getRow(i);
			if (row == null)
				row = sheet.createRow(i);

			for (int j = 0; j < 2; j++) {
				Cell cell = row.getCell(j);
				if (cell == null)
					cell = row.createCell(j);
				cell.setCellStyle(editableStyle);
			}
		}

		/* ================= MOBILE NUMBER VALIDATION ================= */
		DataValidationHelper dvHelper = sheet.getDataValidationHelper();
		DataValidationConstraint dvConstraint = dvHelper
				.createTextLengthConstraint(DataValidationConstraint.OperatorType.EQUAL, "10", null);

		CellRangeAddressList addressList = new CellRangeAddressList(1, 1000, 1, 1);

		DataValidation validation = dvHelper.createValidation(dvConstraint, addressList);

		validation.setShowErrorBox(true);
		validation.createErrorBox("Invalid Mobile", "Contact number must be 10 digits");
		sheet.addValidationData(validation);

		/* ================= FINAL SHEET SETTINGS ================= */
		sheet.autoSizeColumn(0);
		sheet.autoSizeColumn(1);
		// sheet.setDisplayGridlines(false);

		// 🔐 Protect AFTER unlocking cells
		sheet.protectSheet("template-lock");

		/* ================= RESPONSE ================= */
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=contact_template.xlsx");

		workbook.write(response.getOutputStream());
		workbook.close();
	}

}
