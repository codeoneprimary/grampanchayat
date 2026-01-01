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
import com.gram.panchayat.services.DobService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/dob")
public class DobController {

	private final DobService dobService;

	public DobController(DobService dobService) {
		this.dobService = dobService;
	}

	@PostMapping("/apply")
	public ResponseEntity<ApiResponse> apply(@RequestBody BirthCertificateApplicationRequestDto request,
			HttpSession session) {

		Long userId = (Long) session.getAttribute("regUserId");
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
