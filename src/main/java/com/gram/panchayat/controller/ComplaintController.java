package com.gram.panchayat.controller;

import java.util.Base64;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.ComplaintRequestDto;
import com.gram.panchayat.model.Complaint;
import com.gram.panchayat.services.ComplaintService;
import com.gram.panchayat.util.Base64MultipartFile;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/complaint")
public class ComplaintController {

	private static final Logger logger = LoggerFactory.getLogger(ComplaintController.class);
	private final ComplaintService complaintService;

	public ComplaintController(ComplaintService complaintService) {
		this.complaintService = complaintService;
	}

	@PostMapping(value = "/add", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<ApiResponse> add(@RequestParam("fullName") String fullName,
			@RequestParam("mobile") String mobile, @RequestParam(value = "email", required = false) String email,
			@RequestParam("complaintType") String complaintType, @RequestParam("details") String details,
			@RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
			@RequestParam(value = "videoFile", required = false) MultipartFile videoFile, HttpSession session)
			throws Exception {
		Complaint complaint = new Complaint();
		complaint.setFullName(fullName);
		complaint.setMobile(mobile);
		complaint.setEmail(email);
		complaint.setComplaintType(complaintType);
		complaint.setDetails(details);
		logger.info("complaint added by " + mobile);
		return ResponseEntity.ok(complaintService.addComplaint(complaint, imageFile, videoFile));
	}

	@PostMapping("/add-mobile")
	public ResponseEntity<ApiResponse> addMobile(@RequestBody ComplaintRequestDto request) {

		Complaint complaint = new Complaint();
		complaint.setFullName(request.getFullName());
		complaint.setMobile(request.getMobile());
		complaint.setEmail(request.getEmail());
		complaint.setComplaintType(request.getComplaintType());
		complaint.setDetails(request.getDetails());

		// ✅ Decode Image
		MultipartFile imageFile = null;
		if (request.getImageBase64Data() != null && !request.getImageBase64Data().isEmpty()) {
			byte[] imageBytes = Base64.getDecoder().decode(request.getImageBase64Data());
			imageFile = new Base64MultipartFile(imageBytes, request.getImageFileName(), request.getImageFileType());
		}

		// ✅ Decode Video
		MultipartFile videoFile = null;
		if (request.getVideoBase64Data() != null && !request.getVideoBase64Data().isEmpty()) {
			byte[] videoBytes = Base64.getDecoder().decode(request.getVideoBase64Data());
			videoFile = new Base64MultipartFile(videoBytes, request.getVideoFileName(), request.getVideoFileType());
		}

		return ResponseEntity.ok(complaintService.addComplaint(complaint, imageFile, videoFile));
	}
}
