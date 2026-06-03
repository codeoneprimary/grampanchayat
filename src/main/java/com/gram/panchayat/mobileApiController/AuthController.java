package com.gram.panchayat.mobileApiController;

import java.time.LocalDateTime;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.RegisterRequestDto;
import com.gram.panchayat.model.User;
import com.gram.panchayat.repository.UserRepository;
import com.gram.panchayat.services.OtpService;
import com.gram.panchayat.services.UserService;
import com.gram.panchayat.util.JwtUtil;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	private final OtpService otpService;

	private final JwtUtil jwtUtil;

	private final UserService userService;

	private final UserRepository userRepository;

	public AuthController(UserService userService, OtpService otpService, UserRepository userRepository,
			JwtUtil jwtUtil) {
		this.jwtUtil = jwtUtil;
		this.userService = userService;
		this.otpService = otpService;
		this.userRepository = userRepository;
	}

	@PostMapping("/send-otp")
	public ResponseEntity<?> sendOtp(@RequestBody Map<String, String> req) {

		ApiResponse response = userService.findUserAndSendOtp(req.get("mobile"));

		if (!response.isSuccess()) {
			// 🔴 user not exist → go to registration
			return ResponseEntity
					.ok(Map.of("status", "REGISTER_REQUIRED", "message", "User not found. Please register."));
		}

		return ResponseEntity.ok(Map.of("status", "OTP_SENT", "message", "OTP sent successfully"));
	}

	@PostMapping("/verify-otp")
	public ResponseEntity<?> verifyOtp(@RequestBody Map<String, String> req) {

		String mobile = req.get("mobile");
		String otp = req.get("otp");

		boolean valid = otpService.verifyOtp(mobile, otp);

		if (!valid) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid OTP");
		}

		User user = userService.findByMobileNo(mobile).orElse(null);

		if (user == null) {
			return ResponseEntity.ok(Map.of("status", "REGISTER_REQUIRED", "mobile", mobile));
		}

		String token = jwtUtil.generateToken(user);

		return ResponseEntity.ok(Map.of("status", "LOGIN_SUCCESS", "token", token, "role", user.getUserRole(), "user", user));
	}

	@PostMapping("/register")
	public ResponseEntity<?> register(@RequestBody RegisterRequestDto req) {

		// check already exists
		if (userService.findByMobileNo(req.getMobile()).isPresent()) {
			return ResponseEntity.badRequest().body("User already exists");
		}

		User user = new User();
		user.setMobileNo(req.getMobile());
		user.setFullName(req.getFullName());
		user.setEmail(req.getEmail());
		user.setUserRole("CITIZEN");
		user.setCreatedDate(LocalDateTime.now());
		user.setActive(true);

		userRepository.save(user);
		logger.info("successfully user registared"+req.getMobile());
		return ResponseEntity.ok("Registration successful");
	}
}
