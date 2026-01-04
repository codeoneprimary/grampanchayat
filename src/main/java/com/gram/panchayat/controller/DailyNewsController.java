package com.gram.panchayat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.gram.panchayat.model.DailyNews;
import com.gram.panchayat.services.DailyNewsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DailyNewsController {

	private final DailyNewsService dailyNewsService;

	public DailyNewsController(DailyNewsService dailyNewsService) {
		this.dailyNewsService = dailyNewsService;
	}

	@PostMapping("/saveNews")
	public String saveNews(DailyNews news, HttpSession session) {

		news.setStatus("APPROVED");
		news.setCreatedBy((Long) session.getAttribute("regUserId"));
		dailyNewsService.saveDailyNews(news);

		return "redirect:/addsNews";
	}

}
