package com.gram.panchayat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gram.panchayat.model.DailyNews;
import com.gram.panchayat.services.DailyNewsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DailyNewsController {

	private static final Logger logger = LoggerFactory.getLogger(DailyNewsController.class);
	private final DailyNewsService dailyNewsService;

	public DailyNewsController(DailyNewsService dailyNewsService) {
		this.dailyNewsService = dailyNewsService;
	}

	@PostMapping("/saveNews")
	public String saveNews(DailyNews news, HttpSession session) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		news.setStatus("APPROVED");
		news.setCreatedBy((Long) session.getAttribute("regUserId"));
		dailyNewsService.saveDailyNews(news);

		return "redirect:/addsNews";
	}

	@GetMapping("/viewNews")
	public String viewNews(@RequestParam("id") long id, Model model, HttpSession session) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		// Fetch data from DB
		DailyNews news = dailyNewsService.getDailyNewsById(id);
		model.addAttribute("news", news);
		return "viewNews"; // JSP page name
	}

	@PostMapping("/sendMessageToUsers")
	@ResponseBody
	public String sendMessageToUsers(@RequestParam long newsId) {

		logger.info("news sending to users id : " + newsId);
		DailyNews news = dailyNewsService.getDailyNewsById(newsId);

		dailyNewsService.sendMessageToUsers(news);

		return "success";
	}

	@PostMapping("/deleteNews")
	@ResponseBody
	public String deleteNews(@RequestParam long id, HttpSession session) {
		String role = (String) session.getAttribute("userRole");

		if (role == null || !role.equals("ADMIN")) {
			throw new RuntimeException("Unauthorized access ❌");
		}
		dailyNewsService.deleteById(id);
		logger.info("news delete id : " + id);
		return "success";
	}
}
