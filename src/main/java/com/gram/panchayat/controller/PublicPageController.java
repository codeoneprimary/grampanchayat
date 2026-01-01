package com.gram.panchayat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PublicPageController {

	@GetMapping("/")
	public String index() {
		return "home";
	}

	@GetMapping("/home")
	public String home() {
		return "home";
	}

	@GetMapping("/about")
	public String about() {
		return "about";
	}

	@GetMapping("/history")
	public String history() {
		return "history";
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
}
