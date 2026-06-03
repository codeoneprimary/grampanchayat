package com.gram.panchayat.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.ApplicationStatusUpdateRequestDto;
import com.gram.panchayat.dto.DeathCertificateApplicationRequestDto;
import com.gram.panchayat.model.User;
import com.gram.panchayat.services.DeathService;
import com.gram.panchayat.services.UserService;
import com.gram.panchayat.util.JwtUtil;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/death")
public class DeathController {

	private final DeathService deathService;

	private final JwtUtil jwtUtil;

	private final UserService userService;

	public DeathController(DeathService deathService, JwtUtil jwtUtil, UserService userService) {
		this.deathService = deathService;
		this.jwtUtil = jwtUtil;
		this.userService = userService;
	}

	@PostMapping("/apply")
	public ResponseEntity<ApiResponse> apply(@RequestBody DeathCertificateApplicationRequestDto request,
			HttpSession session, HttpServletRequest httpRequest) {

		Long userId = null;

		// ✅ 1. Try JWT (Mobile)
		String authHeader = httpRequest.getHeader("Authorization");

		if (authHeader != null && authHeader.startsWith("Bearer ")) {
			try {
				String token = authHeader.substring(7);

				// extract mobile from JWT
				String mobile = jwtUtil.extractClaims(token).getSubject();

				User user = userService.findByMobileNo(mobile).orElse(null);

				if (user != null) {
					userId = user.getRegUserId();
				}

			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
			}
		}

		// ✅ 2. Fallback to Session (Web)
		if (userId == null) {
			userId = (Long) session.getAttribute("regUserId");
		}

		// ❌ If still null → unauthorized
		if (userId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}

		request.setUserId(userId);

		return ResponseEntity.ok(deathService.applyDeathCertificate(request));
	}

	@PostMapping("/updateStatus")
	public ResponseEntity<ApiResponse> updateStatus(@RequestBody ApplicationStatusUpdateRequestDto request,
			HttpSession session) {

		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}
		request.setAdminUserId(userId);
		return ResponseEntity.ok(deathService.updateDeathApplicationStatus(request));
	}
}
