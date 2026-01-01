package com.gram.panchayat.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.common.GramPanchayatConstant;
import com.gram.panchayat.dto.UserDto;
import com.gram.panchayat.model.User;
import com.gram.panchayat.services.UserService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

	private final UserService userService;

	public AdminController(UserService userService) {
		this.userService = userService;
	}

	@PostMapping("/addAdmin")
	public ApiResponse addAdmin(@RequestBody UserDto userDto, HttpSession session) {

		User loggedIn = (User) session.getAttribute("USER");

		userDto.setUserRole(GramPanchayatConstant.ADMIN);
		ApiResponse apiResponse = userService.registerAdminUser(userDto);
		return apiResponse;
	}
}
