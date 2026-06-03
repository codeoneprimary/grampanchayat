package com.gram.panchayat.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gram.panchayat.services.DailyNewsService;
import com.gram.panchayat.services.ProgramEventService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PublicPageController {

	@Value("${pdf.upload.path}")
	private String UPLOAD_DIR;
	private final DailyNewsService dailyNewsService;

	private final ProgramEventService programEventService;

	public PublicPageController(DailyNewsService dailyNewsService, ProgramEventService programEventService) {
		this.dailyNewsService = dailyNewsService;
		this.programEventService = programEventService;
	}

	@GetMapping("/")
	public String index(Model model) {

		File folder = new File(UPLOAD_DIR);
		String[] files = folder.list((dir, name) -> name.toLowerCase().endsWith(".pdf"));
		
		model.addAttribute("pdfList", files);
		model.addAttribute("dailyNewsList", dailyNewsService.findDailyNews());
		model.addAttribute("programEventList", programEventService.findActiveProgramEvent());
		return "home";
	}

	@GetMapping("/home")
	public String home(Model model) {
		File folder = new File(UPLOAD_DIR);
		String[] files = folder.list((dir, name) -> name.toLowerCase().endsWith(".pdf"));
		
		model.addAttribute("pdfList", files);
		model.addAttribute("dailyNewsList", dailyNewsService.findDailyNews());
		model.addAttribute("programEventList", programEventService.findActiveProgramEvent());
		return "home";
	}

	@GetMapping("/about")
	public String about() {
		return "about";
	}

	@GetMapping("/pilgrimageSite")
	public String pilgrimageSite() {
		return "pilgrimageSite";
	}

	@GetMapping("/sarpanchHistory")
	public String sarpanchHistory() {
		return "sarpanchHistory";
	}

	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}

	@GetMapping("/gallery")
	public String gallery() {
		return "gallery";
	}

	@GetMapping("/currentSchemes")
	public String currentSchemes() {
		return "currentSchemes";
	}

	@GetMapping("/currentSadasya")
	public String currentSadasya() {
		return "currentSadasya";
	}

	@GetMapping("/furtherSchemes")
	public String furtherSchemes() {
		return "furtherSchemes";
	}

	@GetMapping("/visionAndMission")
	public String visionAndMission() {
		return "visionAndMission";
	}

	@GetMapping("/objectivesAndFunctions")
	public String objectivesAndFunctions() {
		return "objectivesAndFunctions";
	}

	@GetMapping("/administrativeStructure")
	public String administrativeStructure() {
		return "administrativeStructure";
	}

	@GetMapping("/whoIsWho")
	public String whoIsWho() {
		return "whoIsWho";
	}

	@GetMapping("/healthDepartment")
	public String healthDepartment() {
		return "healthDepartment";
	}

	@GetMapping("/helpline")
	public String helpline() {
		return "helpline";
	}

	@GetMapping("/groupDevelopmentOfficer")
	public String groupDevelopmentOfficer() {
		return "groupDevelopmentOfficer";
	}

	@GetMapping("/administrativeDepartment")
	public String administrativeDepartment() {
		return "administrativeDepartment";
	}

	@GetMapping("/agricultureDepartment")
	public String agricultureDepartment() {
		return "agricultureDepartment";
	}

	@GetMapping("/animalHusbandryDepartment")
	public String animalHusbandryDepartment() {
		return "animalHusbandryDepartment";
	}

	@GetMapping("/educationDepartment")
	public String educationDepartment() {
		return "educationDepartment";
	}

	@GetMapping("/ruralWaterSupplyDepartment")
	public String ruralWaterSupplyDepartment() {
		return "ruralWaterSupplyDepartment";
	}

	@GetMapping("/swachhBharatMission")
	public String swachhBharatMission() {
		return "swachhBharatMission";
	}

	@GetMapping("/team")
	public String team() {
		return "team";
	}

	@GetMapping("/college")
	public String college() {
		return "college";
	}

	@GetMapping("/school")
	public String school() {
		return "school";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		return "redirect:/home";
	}

	@GetMapping("/complaintForm")
	public String complaintForm() {
		return "complaintForm";
	}

	@GetMapping("/houseRent")
	public String houseRent() {
		return "houseRent";
	}
}
