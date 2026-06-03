package com.gram.panchayat.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gram.panchayat.common.GramPanchayatConstant;
import com.gram.panchayat.model.Complaint;
import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.model.DeathApplication;
import com.gram.panchayat.model.DobApplication;
import com.gram.panchayat.services.ComplaintService;
import com.gram.panchayat.services.ContactNumberService;
import com.gram.panchayat.services.DailyNewsService;
import com.gram.panchayat.services.DeathService;
import com.gram.panchayat.services.DobService;
import com.gram.panchayat.services.ProgramEventService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ApplicationController {

	@Value("${complaint.image.upload.path}")
	private String UPLOAD_PATH;

	private final DobService dobService;
	private final DeathService deathService;
	private final DailyNewsService dailyNewsService;
	private final ContactNumberService contactService;
	private final ComplaintService complaintService;
	private final ProgramEventService programEventService;

	public ApplicationController(DobService dobService, DeathService deathService, DailyNewsService dailyNewsService,
			ContactNumberService contactService, ComplaintService complaintService,
			ProgramEventService programEventService) {
		this.dobService = dobService;
		this.deathService = deathService;
		this.dailyNewsService = dailyNewsService;
		this.contactService = contactService;
		this.complaintService = complaintService;
		this.programEventService = programEventService;
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
			return "redirect:/login";
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
			return "redirect:/login";
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
	public String applicationList(HttpSession session, @RequestParam(defaultValue = "PENDING") String status,
			@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size, Model model) {

		Long userId = (Long) session.getAttribute("regUserId");
		String userRole = (String) session.getAttribute("userRole");

		if (userId == null || !userRole.equals(GramPanchayatConstant.ADMIN)) {
			return "redirect:/login";
		}

		Page<DeathApplication> deathApplicationList = deathService.findDeathApplicationByStatus(status, page, size);
		Page<DobApplication> dobApplicationList = dobService.findDobApplicationByStatus(status, page, size);

		int deathTotalPages = deathApplicationList.getTotalPages();

		// 🔥 fix
		if (deathTotalPages == 0) {
			deathTotalPages = 1;
		}

		int dobTotalPages = dobApplicationList.getTotalPages();

		// 🔥 fix
		if (dobTotalPages == 0) {
			dobTotalPages = 1;
		}
		model.addAttribute("deathApplicationList", deathApplicationList.getContent());
		model.addAttribute("dobApplicationList", dobApplicationList.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("deathTotalPages", deathTotalPages);
		model.addAttribute("dobTotalPages", dobTotalPages);
		model.addAttribute("status", status);

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

	@GetMapping("/addProgramEvent")
	public String addProgramEvent(HttpSession session, Model model) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		model.addAttribute("programEventList", programEventService.findActiveProgramEvent());
		return "addProgramEvent";
	}

	@GetMapping("/addsNews")
	public String addsNews(HttpSession session, Model model) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		model.addAttribute("dailyNewsList", dailyNewsService.findDailyNews());
		return "addsNews";
	}

	@GetMapping("/adminRegistration")
	public String adminRegistration(HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		String userRole = (String) session.getAttribute("userRole");
		if (userId == null || !userRole.equals(GramPanchayatConstant.ADMIN)) {
			return "redirect:/login";
		}
		return "adminRegistration";
	}

	@GetMapping("/userApplications")
	public String userApplications(HttpSession session, Model model) {
		Long regUserId = (Long) session.getAttribute("regUserId");
		if (regUserId == null) {
			return "redirect:/login";
		}
		model.addAttribute("deathApplicationList", deathService.findDeathApplicationUser(regUserId));
		model.addAttribute("dobApplicationList", dobService.findDobApplicationByUser(regUserId));
		return "userApplications";
	}

	@GetMapping("/uploadContactNumber")
	public String uploadContactNumber(HttpSession session, @RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "5") int size, Model model) {
		Long regUserId = (Long) session.getAttribute("regUserId");
		if (regUserId == null) {
			return "redirect:/login";
		}

		Page<ContactNumber> contactPage = contactService.getPaginatedContacts(page, size);
		model.addAttribute("contactNumberList", contactPage.getContent());

		int dobTotalPages = contactPage.getTotalPages();

		// 🔥 fix
		if (dobTotalPages == 0) {
			dobTotalPages = 1;
		}
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", dobTotalPages);

		return "uploadContactNumber";
	}

	@GetMapping("/complaintFormList")
	public String complaintList(HttpSession session, @RequestParam(defaultValue = "PENDING") String status,
			@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size, Model model) {

		Long userId = (Long) session.getAttribute("regUserId");
		String userRole = (String) session.getAttribute("userRole");

		if (userId == null || !userRole.equals(GramPanchayatConstant.ADMIN)) {
			return "redirect:/login";
		}

		Page<Complaint> complaintPage = complaintService.getComplaintByStatus(status, page, size);

		int totalPages = complaintPage.getTotalPages();

		// 🔥 fix
		if (totalPages == 0) {
			totalPages = 1;
		}

		model.addAttribute("complaintFormList", complaintPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("status", status);

		return "complaintFormList";
	}

	@GetMapping("/complaintFormDetails")
	public String complaintFormDetails(@RequestParam("applicationId") Long applicationId, Model model) {

		Complaint complaintForm = complaintService.findcomplaintFormByApplicationId(applicationId).get();
		model.addAttribute("UPLOAD_PATH", UPLOAD_PATH);
		model.addAttribute("complaintForm", complaintForm);

		return "complaintFormDetails";
	}

	@PostMapping("/updateComplaintFormStatus")
	public String updateComplaintFormStatus(@RequestParam Long applicationId, @RequestParam String status) {

		complaintService.updateComplaintFormStatus(applicationId, status);

		return "redirect:/complaintFormList";
	}
}
