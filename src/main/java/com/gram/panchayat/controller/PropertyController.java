package com.gram.panchayat.controller;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.model.Property;
import com.gram.panchayat.model.PropertyTax;
import com.gram.panchayat.model.TaxMaster;
import com.gram.panchayat.services.PropertyService;
import com.gram.panchayat.services.PropertyTaxService;
import com.gram.panchayat.util.WhatsAppUtil;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PropertyController {

	private final PropertyService propertyService;

	private final PropertyTaxService propertyTaxService;

	private final WhatsAppUtil whatsAppUtil;

	public PropertyController(PropertyService propertyService, PropertyTaxService propertyTaxService,
			WhatsAppUtil whatsAppUtil) {
		this.propertyService = propertyService;
		this.propertyTaxService = propertyTaxService;
		this.whatsAppUtil = whatsAppUtil;
	}

	@GetMapping("/addProperty")
	public String loadPage(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "redirect:/login";
		}
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		model.addAttribute("types", propertyService.getAllTaxMaster());

		return "addProperty";
	}

	@GetMapping("/uploadProperty")
	public String uploadProperty(@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "0") int page, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "redirect:/login";
		}
		int size = 5;

		Pageable pageable = PageRequest.of(page, size);

		Page<Object[]> propertyPage = propertyService.getPropertyWithPending(keyword, pageable);

		model.addAttribute("properties", propertyPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", propertyPage.getTotalPages());
		model.addAttribute("keyword", keyword);
		return "uploadProperty";
	}

	// 👉 Save Property

	@PostMapping("/saveProperty")
	@ResponseBody
	public Map<String, Object> savePropertyAjax(@ModelAttribute Property property) {

		Map<String, Object> response = new HashMap<>();

		try {

			if (property.getId() == null) {
				// Validate duplicate propertyNo
				if (property.getPropertyNo() != null && propertyService.existsByPropertyNo(property.getPropertyNo())) {

					response.put("status", "error");
					response.put("message", "Property number already exists");
					return response;
				}
			}
			// Save
			propertyService.savePropertyDetails(property);

			response.put("status", "success");
			response.put("message", "Property saved successfully");

		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", "Something went wrong");
		}

		return response;
	}

	@GetMapping("/checkPropertyNo")
	@ResponseBody
	public Map<String, Boolean> checkPropertyNo(@RequestParam String propertyNo) {
		boolean exists = propertyService.existsByPropertyNo(propertyNo);
		return Map.of("exists", exists);
	}

	// 👉 Property List
	@GetMapping("/propertyList")
	public String list(@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "0") int page,
			Model model, HttpSession session) {

		String role = (String) session.getAttribute("userRole");
		boolean isAdmin = "ADMIN".equals(role); // ✅ safe check

		// ❌ No search → don't load data
		if (!isAdmin && (keyword == null || keyword.trim().isEmpty())) {
			model.addAttribute("properties", null);
			model.addAttribute("currentPage", 0);
			model.addAttribute("totalPages", 0);
			model.addAttribute("keyword", keyword);
			model.addAttribute("isAdmin", isAdmin);
			return "propertyList";
		}

		int size = 10;

		Pageable pageable = PageRequest.of(page, size);
		Page<Object[]> propertyPage = propertyService.getPropertyWithPending(keyword, pageable);

		model.addAttribute("properties", propertyPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", propertyPage.getTotalPages());
		model.addAttribute("keyword", keyword);
		return "propertyList";
	}

	// 👉 Load Edit Page
	@GetMapping("/editProperty/{id}")
	public String edit(@PathVariable long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "redirect:/login";
		}
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		Property property = propertyService.getPropertyDetails(id);

		model.addAttribute("property", property);
		model.addAttribute("types", propertyService.getAllTaxMaster());

		return "editProperty";
	}

	// 👉 Update Property
	@PostMapping("/updateProperty")
	public String update(Property property) {

		propertyService.savePropertyDetails(property);

		return "redirect:/propertyList";
	}

	@GetMapping("/deleteProperty/{id}")
	public String deleteProperty(@PathVariable Long id, RedirectAttributes redirectAttributes, HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "redirect:/login";
		}
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		try {
			propertyService.deletePropertyById(id);
			redirectAttributes.addFlashAttribute("success", "Property deleted successfully!");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "Unable to delete property!");
		}

		return "redirect:/propertyList";
	}

	@GetMapping("/pendingReport")
	public String pendingReport(Model model) {

		List<Object[]> list = propertyService.getAllPendingSummary();

		model.addAttribute("pendingList", list);

		return "pendingReport";
	}

	@GetMapping("/propertyDetails/{id}")
	public String propertyDetails(@PathVariable Long id, Model model) {

		Property property = propertyService.getPropertyDetails(id);

		List<PropertyTax> taxes = propertyTaxService.getAllProprtyTaxByPropertyId(id);

		model.addAttribute("property", property);
		model.addAttribute("taxList", taxes);

		return "propertyDetails";
	}

	@GetMapping("/propertyType")
	public String showPage(Model model, HttpSession session) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		model.addAttribute("list", propertyService.getAllTaxMaster());
		return "propertyType";
	}

	@PostMapping("/savePropertyType")
	public String savePropertyType(@ModelAttribute TaxMaster propertyType, RedirectAttributes ra) {
		propertyService.savePropertyDetails(propertyType);

		if (propertyType.getId() == 0) {
			ra.addFlashAttribute("message", "✅ Saved successfully");
		} else {
			ra.addFlashAttribute("message", "✅ Updated successfully");
		}
		return "redirect:/propertyType";
	}

	@GetMapping("/editPropertyType")
	public String editPropertyType(@RequestParam int id, Model model, HttpSession session) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		model.addAttribute("propertyType", propertyService.getPropertTypeById(id));

		model.addAttribute("list", propertyService.getAllTaxMaster());
		return "propertyType";
	}

	// ✅ DELETE (AJAX)
	@PostMapping("/deletePropertyType")
	@ResponseBody
	public String deletePropertyType(@RequestParam int id, HttpSession session) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		try {
			propertyService.deletePropertyTypeById(id);
			return "success"; // used in JS

		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@PostMapping("/uploadPropertyCsv")
	public String uploadCsv(@RequestParam("file") MultipartFile file, RedirectAttributes ra) {

		try {
			Map<String, Object> result = propertyService.saveCsvDataWithUpsert(file);

			ra.addFlashAttribute("totalCount", result.get("totalCount"));
			ra.addFlashAttribute("successCount", result.get("successCount"));
			ra.addFlashAttribute("failCount", result.get("failCount"));
			ra.addFlashAttribute("errors", result.get("errors"));
			ra.addFlashAttribute("successList", result.get("successList"));

		} catch (Exception e) {
			ra.addFlashAttribute("msg", "❌ Error: " + e.getMessage());
		}

		return "redirect:/uploadProperty";
	}

	@GetMapping("/downloadPropertyTemplate")
	public void downloadTemplate(HttpServletResponse response) throws IOException {

		// CSV content type with UTF-8 (Marathi support)
		response.setContentType("text/csv; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=property_template.csv");

		PrintWriter writer = new PrintWriter(
				new OutputStreamWriter(response.getOutputStream(), StandardCharsets.UTF_8));

		// 🔥 Important for Excel Marathi support
		writer.write("\uFEFF");

		// Header Row (Marathi + English optional)
		writer.println("OWNER_NAME,MOBILE,PROPERTY_NO,AREA,PROPERTY_TYPE,WARD_NO,ADDRESS");
		// Sample Row
		writer.println(safe("John Doe") + "," + "=\"" + "9876543210" + "\"," + // 🔥 IMPORTANT
				safe("PROP001") + "," + "1200," + safe("Residential") + "," + "5," + safe("Main Road, Pune"));
		writer.flush();
		writer.close();
	}

	@GetMapping("/exportProperty")
	public void exportToCsv(HttpServletResponse response) throws IOException {

		// Content type & file name
		response.setContentType("text/csv; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=properties.csv");

		// Writer with UTF-8
		OutputStreamWriter osw = new OutputStreamWriter(response.getOutputStream(), StandardCharsets.UTF_8);
		PrintWriter writer = new PrintWriter(osw);

		// 🔥 IMPORTANT: Add BOM (fix Marathi in Excel)
		writer.write("\uFEFF");

		// Header

		writer.println("OWNER_NAME, MOBILE, PROPERTY_NO, AREA, PROPERTY_TYPE, WARD_NO, ADDRESS");

		// Data

		List<Property> list = propertyService.getAllPropertyList();
		for (Property p : list) {
			writer.println(safe(p.getOwnerName()) + "," + safe(p.getMobile()) + "," + safe(p.getPropertyNo()) + ","
					+ p.getArea() + "," + safe(p.getPropertyType()) + "," + p.getWardNo() + "," + safe(p.getAddress()));
		}

		writer.flush();
		writer.close();
	}

	// Helper to avoid null & comma issues
	private String safe(String value) {
		if (value == null)
			return "";
		return "\"" + value.replace("\"", "\"\"") + "\"";
	}

	@PostMapping("/sendMessageToPropertyOwner")
	@ResponseBody
	public String sendMessageToPropertyOwner(@RequestParam long id, @RequestParam double amount) {
		Property property = propertyService.getPropertyDetails(id);
		try {
			ContactNumber contactNumber = new ContactNumber();
			contactNumber.setContact(property.getMobile());
			contactNumber.setName(property.getOwnerName());
			String text = " your property tax of ₹" + amount
					+ " is pending for Property No. " + property.getPropertyNo()
					+ ". Please pay at the earliest to avoid penalty. If already paid, please ignore this message."
					+ "";
			whatsAppUtil.sendNewsToUser(contactNumber, text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
}