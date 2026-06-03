package com.gram.panchayat.controller;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.model.Property;
import com.gram.panchayat.model.PropertyTax;
import com.gram.panchayat.services.PropertyService;
import com.gram.panchayat.services.PropertyTaxService;
import com.gram.panchayat.util.FinancialYearUtil;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PropertyTaxController {

	private final PropertyService propertyService;
	private final PropertyTaxService propertyTaxService;
	private final FinancialYearUtil financialYearUtil;

	public PropertyTaxController(PropertyService propertyService, PropertyTaxService propertyTaxService,
			FinancialYearUtil financialYearUtil) {
		this.propertyService = propertyService;
		this.propertyTaxService = propertyTaxService;
		this.financialYearUtil = financialYearUtil;
	}

	// 👉 taxHome List
	@GetMapping("/taxHome")
	public String list(@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "0") int page,
			Model model) {

		int size = 5;

		Pageable pageable = PageRequest.of(page, size);

		Page<Object[]> propertyPage = propertyService.getPropertyWithPending(keyword, pageable);

		model.addAttribute("properties", propertyPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", propertyPage.getTotalPages());
		model.addAttribute("keyword", keyword);
		model.addAttribute("financialYears", financialYearUtil.getFinancialLastYears(15));
		return "taxHome";
	}

	@GetMapping("/uploadPropertyTax")
	public String uploadPropertyTax(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "redirect:/login";
		}
		return "uploadPropertyTax";
	}

	@GetMapping("/downloadTaxTemplateForPropertyTax")
	public void downloadTaxTemplateForPropertyTax(HttpServletResponse response) throws IOException {

		// CSV content type
		response.setContentType("text/csv; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=property_tax_template.csv");

		PrintWriter writer = new PrintWriter(
				new OutputStreamWriter(response.getOutputStream(), StandardCharsets.UTF_8));

		// 🔥 Important for Excel Marathi support
		writer.write("\uFEFF");

		// Header (NO spaces after comma)
		writer.println("OWNER_NAME,MOBILE,PROPERTY_NO,PENDING_TAX,PENALTY,CURRENT_TAX");

		writer.println(safe("John Doe") + "," + safe("'9876543210") + "," + // ✅ correct
				safe("PROP001") + "," + "1200," + "50," + "2000");

		writer.flush();
		writer.close();
	}

	private String safe(String value) {
		if (value == null)
			return "";
		return "\"" + value.replace("\"", "\"\"") + "\"";
	}

	@PostMapping("/uploadPropertyTaxCsv")
	public String uploadTax(@RequestParam("file") MultipartFile file, RedirectAttributes ra) {

		try {
			Map<String, Object> result = propertyTaxService.uploadPropertyTaxCsv(file,
					financialYearUtil.getFinancialYear());

			ra.addFlashAttribute("totalCount", result.get("total"));
			ra.addFlashAttribute("successCount", result.get("success"));
			ra.addFlashAttribute("failCount", result.get("fail"));
			ra.addFlashAttribute("errors", result.get("errors"));
			ra.addFlashAttribute("successList", result.get("successList"));

		} catch (Exception e) {
			ra.addFlashAttribute("msg", "❌ Error: " + e.getMessage());
		}

		return "redirect:/uploadPropertyTax";
	}

	@GetMapping("/propertyTaxDetails/{id}")
	public String propertyDetails(@PathVariable Long id, Model model) {

		Property property = propertyService.getPropertyDetails(id);

		List<PropertyTax> taxes = propertyTaxService.getAllProprtyTaxByPropertyId(id);

		model.addAttribute("property", property);
		model.addAttribute("taxList", taxes);

		return "PropertyTaxDetails";
	}

	// 👉 Load Edit Page
	@GetMapping("/editPropertyTaxDetails/{id}")
	public String edit(@PathVariable long id, Model model, HttpSession session, RedirectAttributes ra) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "redirect:/login";
		}
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		PropertyTax propertyTax = propertyTaxService.getPropertyTaxDetailsById(id);

		boolean isTaxEdit = true;
		ra.addFlashAttribute("propertyTax", propertyTax);
		ra.addFlashAttribute("isTaxEdit", isTaxEdit);

		return "redirect:/propertyTaxDetails/" + propertyTax.getProperty().getId();
	}
	
	@PostMapping("/updatePropertyTaxAjax")
	@ResponseBody
	public ApiResponse updateAjax(@RequestBody PropertyTax tax) {

	    propertyTaxService.updatePropertyTax(tax);

	    return new ApiResponse(true, "Updated");
	}
	@GetMapping("/exportPropertyTax")
	public void exportPropertyTax(
	        @RequestParam(required = false) String year,
	        HttpServletResponse response) throws IOException {

	    response.setContentType("text/csv");
	    response.setHeader("Content-Disposition", "attachment; filename=property_tax.csv");

	    propertyTaxService.exportToCsv(response.getWriter(), year);
	}
}