package com.gram.panchayat.serviceImpl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.common.GramPanchayatConstant;
import com.gram.panchayat.dto.ApplicationStatusUpdateRequestDto;
import com.gram.panchayat.dto.BirthCertificateApplicationRequestDto;
import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.model.DobApplication;
import com.gram.panchayat.model.DobCertificate;
import com.gram.panchayat.model.User;
import com.gram.panchayat.repository.DobApplicationRepository;
import com.gram.panchayat.repository.DobCertificateRepository;
import com.gram.panchayat.repository.UserRepository;
import com.gram.panchayat.services.DobService;
import com.gram.panchayat.util.FileStorage;
import com.gram.panchayat.util.WhatsAppUtil;

@Service
public class DobServiceImpl implements DobService {

	private final UserRepository userRepository;
	private final DobApplicationRepository dobApplicationRepository;
	private final DobCertificateRepository dobCertificateRepository;
	private final FileStorage fileStorage;

	private final WhatsAppUtil whatsAppUtil;

	public DobServiceImpl(UserRepository userRepository, DobApplicationRepository dobApplicationRepository,
			DobCertificateRepository dobCertificateRepository, FileStorage fileStorage, WhatsAppUtil whatsAppUtil) {
		this.userRepository = userRepository;
		this.dobApplicationRepository = dobApplicationRepository;
		this.dobCertificateRepository = dobCertificateRepository;
		this.fileStorage = fileStorage;
		this.whatsAppUtil = whatsAppUtil;
	}

	@Override
	public ApiResponse applyDOBApplication(BirthCertificateApplicationRequestDto req) {
		User applicant = userRepository.findById(req.getUserId())
				.orElseThrow(() -> new RuntimeException("User not found"));

		DobApplication dobApplication = new DobApplication();
		dobApplication.setAppliedBy(applicant);
		dobApplication.setChildName(req.getChildName());
		dobApplication.setDateOfBirth(req.getDateOfBirth());
		dobApplication.setPlaceOfBirth(req.getPlaceOfBirth());
		dobApplication.setHospitalName(req.getHospitalName());
		dobApplication.setFatherName(req.getFatherName());
		dobApplication.setMotherName(req.getMotherName());
		dobApplication.setGender(req.getGender());
		dobApplication.setMobileNo(req.getMobileNo());
		dobApplication.setAddress(req.getAddress());
		dobApplication.setState(req.getState());
		dobApplication.setDistrict(req.getDistrict());
		dobApplication.setPincode(req.getPincode());

		if (req.getDoctorCertificate() != null) {
			FileStorage.SavedFile saved = fileStorage.saveBase64("dob",
					req.getChildName() + "" + applicant.getRegUserId(), req.getDoctorCertificate().getBase64Data());

			dobApplication.setDoctorCertificate(saved.filePath + "" + saved.fileName);
		}
		dobApplication.setStatus(GramPanchayatConstant.PENDING);
		dobApplication.setApplicationDate(LocalDateTime.now());
		dobApplicationRepository.save(dobApplication);

		try {
			ContactNumber contactNumber = new ContactNumber();
			contactNumber.setContact(applicant.getMobileNo());
			contactNumber.setName(applicant.getFullName());
			String text = " your Birth Certificate (DOB) application (ID: "
					+ dobApplication.getApplicationId()
					+ ") has been successfully submitted. We will notify you once it is processed." + "";
			whatsAppUtil.sendNewsToUser(contactNumber, text);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ApiResponse(true, "DOB application submitted", dobApplication.getApplicationId());
	}

	@Override
	public ApiResponse updateDOBApplicationStatus(ApplicationStatusUpdateRequestDto req) {
		User admin = userRepository.findById(req.getAdminUserId())
				.orElseThrow(() -> new RuntimeException("Admin user not found"));

		DobApplication app = dobApplicationRepository.findById(req.getApplicationId())
				.orElseThrow(() -> new RuntimeException("DOB application not found"));

		app.setStatus(req.getStatus());
		app.setStatusRemark(req.getRemark());
		app.setStatusUpdatedBy(admin);
		app.setStatusUpdatedDate(LocalDateTime.now());
		dobApplicationRepository.save(app);

		if (req.getStatus() == GramPanchayatConstant.APPROVED) {
			DobCertificate cert = new DobCertificate();
			cert.setApplication(app);
			cert.setCertificateNumber("DOB-" + UUID.randomUUID());
			cert.setIssuedBy(admin.getUsername());
			dobCertificateRepository.save(cert);
		}

		try {
			ContactNumber contactNumber = new ContactNumber();
			contactNumber.setContact(admin.getMobileNo());
			contactNumber.setName(admin.getFullName());
			String text = " the status of your Birth Certificate (DOB) application (ID: " + req.getApplicationId()
					+ ") has been updated to " + req.getStatus() + ". Please check the system for details.";
			whatsAppUtil.sendNewsToUser(contactNumber, text);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ApiResponse(true, "DOB application status updated", app.getStatus());
	}

	@Override
	public DobApplication findDobApplicationByApplicationId(Long applicationId) {
		DobApplication dobApplication = dobApplicationRepository.findByApplicationId(applicationId);
		return dobApplication;
	}

	@Override
	public List<DobApplication> findDobApplicationByStatus(String appliucationStatus) {
		return dobApplicationRepository.findByStatus(appliucationStatus);
	}

	@Override
	public void updateDobApplicationStatus(Long applicationId, String status, String adminComment) {

		DobApplication dobApplication = dobApplicationRepository.findByApplicationId(applicationId);
		dobApplication.setStatus(status);
		dobApplication.setStatusRemark(adminComment);
		dobApplicationRepository.save(dobApplication);

		try {
			ContactNumber contactNumber = new ContactNumber();
			contactNumber.setContact(dobApplication.getAppliedBy().getMobileNo());
			contactNumber.setName(dobApplication.getAppliedBy().getFullName());
			String text = " the status of your Birth Certificate (DOB) application (ID: " + applicationId
					+ ") has been updated to " + status + ". Please check the system for details.";
			whatsAppUtil.sendNewsToUser(contactNumber, text);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<DobApplication> findDobApplicationByUser(Long regUserId) {
		User applicant = userRepository.findById(regUserId).orElseThrow(() -> new RuntimeException("User not found"));
		return dobApplicationRepository.findByAppliedBy(applicant);
	}

	@Override
	public Page<DobApplication> findDobApplicationByStatus(String status, int page, int size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by("applicationId").descending());
		return dobApplicationRepository.findByStatus(status, pageable);
	}
}
