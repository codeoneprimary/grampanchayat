package com.gram.panchayat.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.ApplicationStatusUpdateRequestDto;
import com.gram.panchayat.dto.BirthCertificateApplicationRequestDto;
import com.gram.panchayat.model.User;
import com.gram.panchayat.services.DobService;
import com.gram.panchayat.services.UserService;
import com.gram.panchayat.util.JwtUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/dob")
public class DobController {

	private final DobService dobService;

	private final JwtUtil jwtUtil;

	private final UserService userService;

	public DobController(DobService dobService, JwtUtil jwtUtil, UserService userService) {
		this.dobService = dobService;
		this.jwtUtil = jwtUtil;
		this.userService = userService;
	}

	@PostMapping("/apply")
	public ResponseEntity<ApiResponse> apply(@RequestBody BirthCertificateApplicationRequestDto request,
			HttpSession session, HttpServletRequest httpRequest) {

		Long userId = null;

		// ✅ 1. Try JWT (Mobile)
		String authHeader = httpRequest.getHeader("Authorization");

		if (authHeader != null && authHeader.startsWith("Bearer ")) {
			try {
				String token = authHeader.substring(7);

				String mobile = jwtUtil.extractClaims(token).getSubject();

				User user = userService.findByMobileNo(mobile).orElse(null);

				if (user != null) {
					userId = user.getRegUserId();
				}

			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
			}
		}

		// ✅ 2. Fallback to session (Web)
		if (userId == null) {
			userId = (Long) session.getAttribute("regUserId");
		}

		if (userId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}

		request.setUserId(userId);

		return ResponseEntity.ok(dobService.applyDOBApplication(request));
	}

	@PostMapping("/updateStatus")
	public ResponseEntity<ApiResponse> updateStatus(@RequestBody ApplicationStatusUpdateRequestDto request,
			HttpSession session) {

		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}
		request.setAdminUserId(userId);
		return ResponseEntity.ok(dobService.updateDOBApplicationStatus(request));
	}
}
