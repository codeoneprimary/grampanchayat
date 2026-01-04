package com.gram.panchayat.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.common.GramPanchayatConstant;
import com.gram.panchayat.dto.UserDto;
import com.gram.panchayat.services.OtpService;
import com.gram.panchayat.services.UserService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/citizenuser")
public class CitizenAuthController {

	private final UserService userService;
	private final OtpService otpService;

	public CitizenAuthController(UserService userService, OtpService otpService) {
		this.userService = userService;
		this.otpService = otpService;
	}

	@PostMapping("/sendOtp")
	public ApiResponse sendOtp(@RequestParam String mobileNo) {
		ApiResponse apiResponse = userService.findUserAndSendOtp(mobileNo);
		return apiResponse;
	}

	@PostMapping("/register")
	public ResponseEntity<ApiResponse> createUser(@RequestBody UserDto userDto) {
		userDto.setUserRole(GramPanchayatConstant.CITIZEN);
		ApiResponse apiResponse = userService.registerUser(userDto);
		return ResponseEntity.ok(apiResponse);
	}

	@PostMapping("/sendRegisterOtp")
	public ApiResponse sendRegisterOtp(@RequestParam String mobileNo, HttpSession session) {
		ApiResponse apiResponse = userService.sendUserOtp(mobileNo);
		return apiResponse;

	}

	@PostMapping("/verifyOtp")
	public ApiResponse verifyOtp(@RequestParam String mobileNo, @RequestParam String otp, @RequestParam String captcha,
			HttpSession session) {

		String sessionCaptcha = (String) session.getAttribute("CAPTCHA");
		if (!captcha.equals(sessionCaptcha)) {
			return new ApiResponse(false, "Invalid Captcha");
		}
		if (!otpService.verifyOtp(mobileNo, otp)) {
			return new ApiResponse(false, "Invalid OTP");
		}

		return userService.findByMobileNo(mobileNo).map(user -> {
			session.setAttribute("user", user);
			session.setAttribute("regUserId", user.getRegUserId());
			session.setAttribute("username", user.getUsername());
			session.setAttribute("userRole", user.getUserRole());
			return new ApiResponse(true, "LOGIN");
		}).orElseGet(() -> {
			session.setAttribute("TEMP_MOBILE", mobileNo);
			return new ApiResponse(true, "REGISTER");
		});
	}

}
