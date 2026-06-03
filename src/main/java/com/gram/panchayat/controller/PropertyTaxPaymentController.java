package com.gram.panchayat.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gram.panchayat.dto.TaxSummaryDto;
import com.gram.panchayat.model.Property;
import com.gram.panchayat.model.PropertyTaxPayment;
import com.gram.panchayat.services.PropertyService;
import com.gram.panchayat.services.PropertyTaxService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PropertyTaxPaymentController {

	private final PropertyService propertyService;
	private final PropertyTaxService propertyTaxService;

	public PropertyTaxPaymentController(PropertyService propertyService, PropertyTaxService propertyTaxService) {
		this.propertyService = propertyService;
		this.propertyTaxService = propertyTaxService;
	}

	@GetMapping("/payPropertyTax/{id}")
	public String propertyDetails(@PathVariable Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "redirect:/login";
		}

		Property property = propertyService.getPropertyDetails(id);
		TaxSummaryDto taxSummaryDto = propertyTaxService.getTotalAndBalanceByPropertyId(id);

		model.addAttribute("taxSummaryDto", taxSummaryDto);

		model.addAttribute("property", property);
		return "payPropertyTax";
	}

	@PostMapping("/submitPropertyTaxPayment")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> submitPaymentAjax(@RequestParam Long propertyId,
			@RequestParam Double amount, @RequestParam String paymentMode) {

		Map<String, Object> response = new HashMap<>();

		try {
			double newBalance = propertyTaxService.submitPropertyTaxPayment(propertyId, amount, paymentMode);

			response.put("status", "success");
			response.put("message", "Payment successful!");
			response.put("newBalance", newBalance);

			return ResponseEntity.ok(response);

		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", e.getMessage());

			return ResponseEntity.badRequest().body(response);
		}
	}

	@GetMapping("/getPaymentHistory")
	public String getHistory(@RequestParam String propertyNo, @RequestParam(defaultValue = "0") int page, Model model) {

		Pageable pageable = PageRequest.of(page, 5);

		Page<PropertyTaxPayment> pageData = propertyTaxService
				.findByProperty_PropertyNoOrderByPaymentDateDesc(propertyNo, pageable);

		model.addAttribute("payments", pageData.getContent());
		model.addAttribute("page", pageData);
		model.addAttribute("propertyNo", propertyNo);

		return "paymentHistoryFragment";
	}
}
