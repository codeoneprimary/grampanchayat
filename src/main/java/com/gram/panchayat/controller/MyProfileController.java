package com.gram.panchayat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gram.panchayat.model.User;
import com.gram.panchayat.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyProfileController {

	private final UserService userService;

	public MyProfileController(UserService userService) {
		this.userService = userService;

	}

	// 👉 Show Profile Page
	@GetMapping("/myProfile")
	public String showProfile(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return "redirect:/login";
		}
		User user = userService.findByUserId(userId);

		model.addAttribute("user", user);
		return "myProfile"; // profile.jsp
	}

}
