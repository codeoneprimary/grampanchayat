package com.gram.panchayat.controller;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Image;

import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPCell;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gram.panchayat.dto.PropertyTaxReportDto;
import com.gram.panchayat.services.PropertyTaxService;
import com.gram.panchayat.util.FinancialYearUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PropertyTaxReport {

	private final FinancialYearUtil financialYearUtil;

	private final PropertyTaxService propertyTaxService;

	public PropertyTaxReport(FinancialYearUtil financialYearUtil, PropertyTaxService propertyTaxService) {
		this.financialYearUtil = financialYearUtil;
		this.propertyTaxService = propertyTaxService;
	}

	@GetMapping("/propertyTaxReport")
	public String report(@RequestParam(required = false) String year, @RequestParam(required = false) String keyword,
			@RequestParam(required = false) String status, @RequestParam(defaultValue = "0") int page, Model model,
			HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "redirect:/login";
		}
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		if (year == null || year.isEmpty()) {
			year = financialYearUtil.getFinancialYear(); // e.g. "2025-2026"
		}
		Page<PropertyTaxReportDto> reportPage = propertyTaxService.getReport(year, keyword, status, page);

		model.addAttribute("reportPage", reportPage);
		model.addAttribute("year", year);
		model.addAttribute("keyword", keyword);
		model.addAttribute("status", status);

		model.addAttribute("financialYears", financialYearUtil.getFinancialLastYears(15));
		return "propertyTaxReport";
	}

	@GetMapping("/exportCsvPropertyTaxReport")
	public void exportCsv(String year, String keyword, String status, HttpServletResponse response) throws IOException {

		List<PropertyTaxReportDto> list = propertyTaxService.getReportListForDownload(year, keyword, status);

		if (list.isEmpty()) {
			response.getWriter().write("No record found");
			return;
		}

		response.setContentType("text/csv");
		response.setHeader("Content-Disposition", "attachment; filename=report.csv");

		PrintWriter w = response.getWriter();

		w.println("Year,Property,Owner,Mobile,Total,Paid,Balance,Status");

		for (var r : list) {
			w.println(r.getFinancialYear() + "," + safe(r.getPropertyNo()) + "," + safe(r.getOwnerName()) + "," + "'"
					+ safe(r.getMobile()) + "," +

					r.getTotalTax() + "," + r.getPaidAmount() + "," + r.getBalanceAmount() + "," + r.getStatus());
		}
	}

	private String safe(Object value) {

		if (value == null)
			return "";

		String str = value.toString();

		// Remove line breaks
		str = str.replace("\n", " ").replace("\r", " ");

		// Escape double quotes
		str = str.replace("\"", "\"\"");

		// Wrap in quotes if contains comma
		if (str.contains(",")) {
			str = "\"" + str + "\"";
		}

		return str;
	}

	@GetMapping("/exportPdfPropertyTaxReport")
	public void exportPdf(String year, String keyword, String status, HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		List<PropertyTaxReportDto> list = propertyTaxService.getReportListForDownload(year, keyword, status);

		if (list.isEmpty()) {
			response.getWriter().write("No record found");
			return;
		}

		response.reset();

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=property_tax_report.pdf");

		Document doc = new Document(PageSize.A4.rotate());
		PdfWriter.getInstance(doc, response.getOutputStream());

		doc.open();

		// 🔰 LOGO (optional)
		try {
			String path = request.getServletContext().getRealPath("/resources/img/titleIcon.jpg");

			Image logo = Image.getInstance(path);
			logo.scaleToFit(60, 60);
			logo.setAlignment(Image.ALIGN_LEFT);

			doc.add(logo);
		} catch (Exception e) {
		}

		// 🏛 HEADER
		Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16);
		Paragraph header = new Paragraph("Gram Panchayat - Property Tax Report", headerFont);
		header.setAlignment(Element.ALIGN_CENTER);
		doc.add(header);

		doc.add(new Paragraph(" "));

		// 📊 TABLE
		PdfPTable table = new PdfPTable(8);
		table.setWidthPercentage(100);
		table.setWidths(new float[] { 2, 2, 3, 3, 2, 2, 2, 2 });

		Font thFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10);

		// 🔹 HEADER ROW
		table.addCell(createHeader("Year", thFont));
		table.addCell(createHeader("Property No", thFont));
		table.addCell(createHeader("Owner Name", thFont));
		table.addCell(createHeader("Mobile", thFont));
		table.addCell(createHeader("Total Tax", thFont));
		table.addCell(createHeader("Paid", thFont));
		table.addCell(createHeader("Balance", thFont));
		table.addCell(createHeader("Status", thFont));

		Font tdFont = FontFactory.getFont(FontFactory.HELVETICA, 9);

		double totalTaxSum = 0;
		double paidSum = 0;
		double balanceSum = 0;

		// 🔹 DATA
		for (PropertyTaxReportDto r : list) {

			table.addCell(createCell(r.getFinancialYear(), tdFont));
			table.addCell(createCell(r.getPropertyNo(), tdFont));
			table.addCell(createCell(r.getOwnerName(), tdFont));
			table.addCell(createCell("'" + safe(r.getMobile()), tdFont));
			table.addCell(createCell("₹ " + r.getTotalTax(), tdFont));
			table.addCell(createCell("₹ " + r.getPaidAmount(), tdFont));
			table.addCell(createCell("₹ " + r.getBalanceAmount(), tdFont));

			PdfPCell statusCell = createCell(r.getStatus(), tdFont);

			if ("PAID".equalsIgnoreCase(r.getStatus())) {
				statusCell.setBackgroundColor(BaseColor.GREEN);
			} else if ("PENDING".equalsIgnoreCase(r.getStatus())) {
				statusCell.setBackgroundColor(BaseColor.RED);
			} else {
				statusCell.setBackgroundColor(BaseColor.YELLOW);
			}

			table.addCell(statusCell);

			totalTaxSum += r.getTotalTax();
			paidSum += r.getPaidAmount();
			balanceSum += r.getBalanceAmount();
		}

		// 🔥 TOTAL ROW
		Font totalFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 10);

		PdfPCell totalCell = new PdfPCell(new Phrase("TOTAL", totalFont));
		totalCell.setColspan(4);
		totalCell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(totalCell);

		table.addCell(new PdfPCell(new Phrase("₹ " + totalTaxSum, totalFont)));
		table.addCell(new PdfPCell(new Phrase("₹ " + paidSum, totalFont)));
		table.addCell(new PdfPCell(new Phrase("₹ " + balanceSum, totalFont)));
		table.addCell(new PdfPCell(new Phrase("-", totalFont)));

		doc.add(table);

		// 📅 FOOTER
		doc.add(new Paragraph(" "));
		doc.add(new Paragraph("Generated on: " + java.time.LocalDate.now()));

		doc.close();
	}

	private PdfPCell createHeader(String text, Font font) {
		PdfPCell cell = new PdfPCell(new Phrase(text, font));
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
		cell.setPadding(5);
		return cell;
	}

	private PdfPCell createCell(String text, Font font) {
		PdfPCell cell = new PdfPCell(new Phrase(text, font));
		cell.setPadding(4);
		return cell;
	}

}
