package com.gram.panchayat.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.ApplicationStatusUpdateRequestDto;
import com.gram.panchayat.dto.MarriageApplicationRequest;
import com.gram.panchayat.services.MarriageCertificateService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/marriagecertificate")
public class MarriageCertificateController {

	private final MarriageCertificateService marriageCertificateService;

	public MarriageCertificateController(MarriageCertificateService marriageCertificateService) {
		this.marriageCertificateService = marriageCertificateService;
	}

	@PostMapping("/apply")
	public ResponseEntity<ApiResponse> applyForMarriage(@RequestBody MarriageApplicationRequest request,
			HttpSession session) {

		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}
		request.setUserId(userId);
		ApiResponse apiResponse = marriageCertificateService.applyForMarriage(request);
		return ResponseEntity.ok(apiResponse);
	}

	@PostMapping("/updateStatus")
	public ResponseEntity<ApiResponse> updateMarriageCertificateApplicationStatus(
			@RequestBody ApplicationStatusUpdateRequestDto request, HttpSession session) {
		Long userId = (Long) session.getAttribute("regUserId");
		if (userId == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
		}
		request.setAdminUserId(userId);
		return ResponseEntity.ok(marriageCertificateService.updateMarriageCertificateApplicationStatus(request));
	}
}
