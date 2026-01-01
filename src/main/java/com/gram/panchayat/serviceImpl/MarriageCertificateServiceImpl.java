package com.gram.panchayat.serviceImpl;

import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.common.GramPanchayatConstant;
import com.gram.panchayat.dto.ApplicationStatusUpdateRequestDto;
import com.gram.panchayat.dto.MarriageApplicationRequest;
import com.gram.panchayat.model.MarriageApplication;
import com.gram.panchayat.model.MarriageCertificate;
import com.gram.panchayat.model.User;
import com.gram.panchayat.repository.MarriageApplicationRepository;
import com.gram.panchayat.repository.MarriageCertificateRepository;
import com.gram.panchayat.repository.UserRepository;
import com.gram.panchayat.services.MarriageCertificateService;
import com.gram.panchayat.util.FileStorage;

@Service
public class MarriageCertificateServiceImpl implements MarriageCertificateService {

	private final MarriageApplicationRepository marriageApplicationRepository;
	private final MarriageCertificateRepository marriageCertificateRepository;
	private final UserRepository userRepository;
	private final FileStorage fileStorage;

	public MarriageCertificateServiceImpl(MarriageApplicationRepository marriageApplicationRepository,
			MarriageCertificateRepository marriageCertificateRepository, UserRepository userRepository,
			FileStorage fileStorage) {
		this.marriageApplicationRepository = marriageApplicationRepository;
		this.marriageCertificateRepository = marriageCertificateRepository;
		this.userRepository = userRepository;
		this.fileStorage = fileStorage;
	}

	@Override
	public ApiResponse applyForMarriage(MarriageApplicationRequest req) {

		User user = userRepository.findById(req.getUserId()).orElseThrow(() -> new RuntimeException("User not found"));

		MarriageApplication app = new MarriageApplication();
		app.setAppliedBy(user);
		app.setBrideName(req.getBrideName());
		app.setGroomName(req.getGroomName());
		app.setBrideAadharCardNo(req.getBrideAadharCardNo());
		app.setGroomAadharCardNo(req.getGroomAadharCardNo());
		app.setMarriageDate(req.getMarriageDate());
		app.setPlaceOfMarriage(req.getPlaceOfMarriage());
		app.setWitnessOne(req.getWitnessOne());
		app.setWitnessTwo(req.getWitnessTwo());
		app.setAddress(req.getAddress());
		app.setBrideAadharCardDocument("BrideAadharCardDocument" + req.getBrideAadharCardNo());
		app.setGroomAadharCardDocument("GroomAadharCardDocument" + req.getGroomAadharCardNo());
		app.setStatus("PENDING");
		app.setCreatedDate(LocalDateTime.now());

		// Save file
		fileStorage.saveBase64("marriage", req.getBrideAadharCard().getBase64Data(),
				"BrideAadharCardDocument" + req.getBrideAadharCardNo());

		fileStorage.saveBase64("marriage", req.getBrideAadharCard().getBase64Data(),
				"GroomAadharCardDocument" + req.getBrideAadharCardNo());
		marriageApplicationRepository.save(app);

		return new ApiResponse(true, "marriage application submitted", app.getApplicationId());
	}

	@Override
	public ApiResponse updateMarriageCertificateApplicationStatus(ApplicationStatusUpdateRequestDto request) {
		User admin = userRepository.findById(request.getAdminUserId())
				.orElseThrow(() -> new RuntimeException("Admin user not found"));

		MarriageApplication marriageApplication = marriageApplicationRepository.findById(request.getApplicationId())
				.orElseThrow(() -> new RuntimeException("Marriage application not found"));

		marriageApplication.setStatus(request.getStatus());
		marriageApplication.setStatusRemark(request.getRemark());
		marriageApplication.setStatusUpdatedBy(admin);
		marriageApplication.setUpdatedDate(LocalDateTime.now());
		marriageApplicationRepository.save(marriageApplication);

		if (request.getStatus() == GramPanchayatConstant.APPROVED) {
			MarriageCertificate marriageCertificate = new MarriageCertificate();
			marriageCertificate.setMarriageApplication(marriageApplication);
			marriageCertificate.setCertificateNumber("DEATH-" + UUID.randomUUID());
			marriageCertificate.setIssuedBy(admin.getUsername());
			marriageCertificateRepository.save(marriageCertificate);
		}

		return new ApiResponse(true, "marriage application status updated", marriageApplication.getStatus());
	}

}
