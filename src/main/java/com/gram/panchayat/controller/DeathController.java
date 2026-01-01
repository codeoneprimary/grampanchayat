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
import com.gram.panchayat.services.DeathService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/death")
public class DeathController {

	private final DeathService deathService;

	public DeathController(DeathService deathService) {
		this.deathService = deathService;
	}

	@PostMapping("/apply")
	public ResponseEntity<ApiResponse> apply(@RequestBody DeathCertificateApplicationRequestDto request,
			HttpSession session) {

		Long userId = (Long) session.getAttribute("regUserId");
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
