package com.gram.panchayat.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gram.panchayat.common.GramPanchayatConstant;
import com.gram.panchayat.model.DeathApplication;
import com.gram.panchayat.model.DobApplication;
import com.gram.panchayat.services.DailyNewsService;
import com.gram.panchayat.services.DeathService;
import com.gram.panchayat.services.DobService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ApplicationController {

	private final DobService dobService;
	private final DeathService deathService;
	private final DailyNewsService dailyNewsService;

	public ApplicationController(DobService dobService, DeathService deathService, DailyNewsService dailyNewsService) {
		this.dobService = dobService;
		this.deathService = deathService;
		this.dailyNewsService = dailyNewsService;
	}

	@GetMapping("/login")
	public String userLogin() {
		return "login";
	}

	@GetMapping("/userRegistration")
	public String userRegistration() {
		return "userRegistration";
	}

	@GetMapping("/userOtp")
	public String userOtp() {
		return "userOtp";
	}

	@GetMapping("/birthCertificateApplication")
	public String birthCertificateApplication(HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "login";
		}
		return "birthCertificateApplication";
	}

	@GetMapping("/acknowledgmentBirthCertificateApplication")
	public String acknowledgmentBirthCertificateApplication(@RequestParam("applicationId") Long applicationId,
			Model model) {

		DobApplication dobApplication = dobService.findDobApplicationByApplicationId(applicationId);

		// Current date
		String applicationDate = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));

		model.addAttribute("dobApplication", dobApplication);
		model.addAttribute("applicationDate", applicationDate);
		model.addAttribute("status", "Submitted Successfully");

		return "acknowledgmentBirthCertificateApplication";
	}

	@GetMapping("/deathCertificateApplication")
	public String deathCertificateApplication(HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "login";
		}
		return "deathCertificateApplication";
	}

	@GetMapping("/acknowledgmentDeathCertificateApplication")
	public String acknowledgmentDeathCertificateApplication(@RequestParam("applicationId") Long applicationId,
			Model model) {

		DeathApplication deathApplication = deathService.findDeathCertificateApplicatioByApplicationId(applicationId);

		// Current date
		String applicationDate = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));

		model.addAttribute("deathApplication", deathApplication);
		model.addAttribute("applicationDate", applicationDate);
		model.addAttribute("status", "Submitted Successfully");

		return "acknowledgmentDeathCertificateApplication";
	}

	@GetMapping("/applicationList")
	public String applicationList(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "login";
		}
		model.addAttribute("deathApplicationList", deathService.findDeathApplicationByStatus("PENDING"));
		model.addAttribute("dobApplicationList", dobService.findDobApplicationByStatus("PENDING"));
		return "applicationList";
	}

	@GetMapping("/dobApplicationDetails")
	public String dobApplicationDetails(@RequestParam("applicationId") Long applicationId, Model model) {

		DobApplication application = dobService.findDobApplicationByApplicationId(applicationId);
		model.addAttribute("application", application);

		return "dobApplicationDetails";
	}

	@PostMapping("/updateDobApplicationStatus")
	public String updateDobApplicationStatus(@RequestParam Long applicationId, @RequestParam String status,
			@RequestParam(required = false) String adminComment) {

		dobService.updateDobApplicationStatus(applicationId, status, adminComment);

		return "redirect:/applicationList";
	}

	@GetMapping("/deathApplicationDetails")
	public String deathApplicationDetails(@RequestParam("applicationId") Long applicationId, Model model) {

		DeathApplication application = deathService.findDeathCertificateApplicatioByApplicationId(applicationId);
		model.addAttribute("application", application);

		return "deathApplicationDetails";
	}

	@PostMapping("/updateDeathApplicationStatus")
	public String updateDeathStatus(@RequestParam Long applicationId, @RequestParam String status,
			@RequestParam(required = false) String adminComment) {

		deathService.updateDeathApplicationStatus(applicationId, status, adminComment);

		return "redirect:/applicationList";
	}

	@GetMapping("/addsNews")
	public String addsNews(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("regUserId");
		String userRole = (String) session.getAttribute("userRole");
		if (userId == null || !userRole.equals(GramPanchayatConstant.ADMIN)) {
			return "login";
		}
		model.addAttribute("dailyNewsList", dailyNewsService.findDailyNews());
		return "addsNews";
	}

	@GetMapping("/adminRegistration")
	public String adminRegistration(HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		String userRole = (String) session.getAttribute("userRole");
		if (userId == null || !userRole.equals(GramPanchayatConstant.ADMIN)) {
			return "login";
		}
		return "adminRegistration";
	}

	@GetMapping("/userApplications")
	public String userApplications(HttpSession session, Model model) {
		Long regUserId = (Long) session.getAttribute("regUserId");
		if (regUserId == null) {
			return "login";
		}
		model.addAttribute("deathApplicationList", deathService.findDeathApplicationUser(regUserId));
		model.addAttribute("dobApplicationList", dobService.findDobApplicationByUser(regUserId));
		return "userApplications";
	}

}
