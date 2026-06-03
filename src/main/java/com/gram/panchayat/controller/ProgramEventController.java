package com.gram.panchayat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gram.panchayat.model.ProgramEvent;
import com.gram.panchayat.services.ProgramEventService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProgramEventController {

	private static final Logger logger = LoggerFactory.getLogger(ProgramEventController.class);
	private final ProgramEventService programEventService;

	public ProgramEventController(ProgramEventService programEventService) {
		this.programEventService = programEventService;
	}

	@PostMapping("/saveProgramEvent")
	public String saveProgramEvent(ProgramEvent programEvent, HttpSession session) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		programEvent.setStatus("APPROVED");
		programEvent.setCreatedBy((Long) session.getAttribute("regUserId"));
		programEventService.savesaveProgramEvent(programEvent);

		return "redirect:/addProgramEvent";
	}

	@GetMapping("/viewProgramEvent")
	public String viewProgramEvent(@RequestParam("id") long id, Model model, HttpSession session) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		// Fetch data from DB
		ProgramEvent programEvent = programEventService.getProgramEventsById(id);
		model.addAttribute("programEvent", programEvent);
		return "viewProgramEvent"; // JSP page name
	}

	@PostMapping("/sendProgramEventToUsers")
	@ResponseBody
	public String sendProgramEventToUsers(@RequestParam long programEventId) {

		logger.info("news sending to users id : " + programEventId);
		ProgramEvent programEvent = programEventService.getProgramEventsById(programEventId);

		programEventService.sendProgramEventToUsers(programEvent);

		return "success";
	}

	@PostMapping("/deleteProgramEvent")
	@ResponseBody
	public String deleteProgramEvent(@RequestParam long programEventId, HttpSession session) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		programEventService.deleteProgramEventById(programEventId);
		logger.info("news delete id : " + programEventId);
		return "success";
	}
}
