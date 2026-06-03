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
import com.gram.panchayat.dto.DeathCertificateApplicationRequestDto;
import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.model.DeathApplication;
import com.gram.panchayat.model.DeathCertificate;
import com.gram.panchayat.model.User;
import com.gram.panchayat.repository.DeathApplicationRepository;
import com.gram.panchayat.repository.DeathCertificateRepository;
import com.gram.panchayat.repository.UserRepository;
import com.gram.panchayat.services.DeathService;
import com.gram.panchayat.util.FileStorage;
import com.gram.panchayat.util.WhatsAppUtil;

@Service
public class DeathServiceImpl implements DeathService {
	private final UserRepository userRepository;
	private final DeathApplicationRepository deathApplicationRepository;
	private final DeathCertificateRepository deathCertificateRepository;
	private final FileStorage fileStorage;

	private final WhatsAppUtil whatsAppUtil;

	public DeathServiceImpl(UserRepository userRepository, DeathApplicationRepository deathApplicationRepository,
			DeathCertificateRepository deathCertificateRepository, FileStorage fileStorage, WhatsAppUtil whatsAppUtil) {
		this.userRepository = userRepository;
		this.deathApplicationRepository = deathApplicationRepository;
		this.deathCertificateRepository = deathCertificateRepository;
		this.fileStorage = fileStorage;
		this.whatsAppUtil = whatsAppUtil;
	}

	@Override
	public ApiResponse applyDeathCertificate(DeathCertificateApplicationRequestDto req) {
		User applicant = userRepository.findById(req.getUserId())
				.orElseThrow(() -> new RuntimeException("User not found"));

		DeathApplication app = new DeathApplication();
		app.setAppliedBy(applicant);
		app.setAadharCardNo(req.getAadharCardNo());
		app.setDeceasedName(req.getDeceasedName());
		app.setGender(req.getGender());
		app.setAge(req.getAge());
		app.setDateOfBirth(req.getDateOfBirth());
		app.setDateOfDeath(req.getDateOfDeath());
		app.setPlaceOfDeath(req.getPlaceOfDeath());
		app.setCauseOfDeath(req.getCauseOfDeath());
		app.setInformantName(req.getInformantName());
		app.setRelation(req.getRelation());
		app.setMobileNo(req.getMobileNo());
		app.setAddress(req.getAddress());
		app.setState(req.getAddress());
		app.setDistrict(req.getDistrict());
		app.setPincode(req.getPincode());

		if (req.getAadharCard() != null) {
			FileStorage.SavedFile aadharCardDoc = fileStorage.saveBase64("deathAadharCard",
					req.getAadharCard().getFileName(), req.getAadharCard().getBase64Data());

			app.setAadharCard(aadharCardDoc.filePath + "" + aadharCardDoc.fileName);
		}
		if (req.getDoctorCertificate() != null) {
			FileStorage.SavedFile doctorCertificateDoc = fileStorage.saveBase64("deathAadharCard",
					req.getDoctorCertificate().getFileName(), req.getDoctorCertificate().getBase64Data());

			app.setDoctorCertificate(doctorCertificateDoc.filePath + "/" + doctorCertificateDoc.fileName);
		}
		app.setStatus(GramPanchayatConstant.PENDING);
		app.setApplicationDate(LocalDateTime.now());
		deathApplicationRepository.save(app);
		try {
			ContactNumber contactNumber = new ContactNumber();
			contactNumber.setContact(applicant.getMobileNo());
			contactNumber.setName(applicant.getFullName());
			String text = " your Death Certificate application (ID: "
					+ app.getApplicationId()
					+ ") has been successfully submitted. We will inform you once it is processed.";
			whatsAppUtil.sendNewsToUser(contactNumber, text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ApiResponse(true, "Death application submitted", app.getApplicationId());
	}

	@Override
	public ApiResponse updateDeathApplicationStatus(ApplicationStatusUpdateRequestDto req) {
		User admin = userRepository.findById(req.getAdminUserId())
				.orElseThrow(() -> new RuntimeException("Admin user not found"));

		DeathApplication deathApplication = deathApplicationRepository.findById(req.getApplicationId())
				.orElseThrow(() -> new RuntimeException("Death application not found"));

		deathApplication.setStatus(req.getStatus());
		deathApplication.setStatusRemark(req.getRemark());
		deathApplication.setStatusUpdatedBy(admin);
		deathApplication.setStatusUpdatedDate(LocalDateTime.now());
		deathApplicationRepository.save(deathApplication);

		if (req.getStatus() == GramPanchayatConstant.APPROVED) {
			DeathCertificate deathCertificate = new DeathCertificate();
			deathCertificate.setDeathApplication(deathApplication);
			deathCertificate.setCertificateNumber("DEATH-" + UUID.randomUUID());
			deathCertificate.setIssuedBy(admin.getUsername());
			deathCertificateRepository.save(deathCertificate);
		}
		try {
			ContactNumber contactNumber = new ContactNumber();
			contactNumber.setContact(admin.getMobileNo());
			contactNumber.setName(admin.getFullName());
			String text =" the status of your Death Certificate application (ID: " + deathApplication.getApplicationId()
					+ ") has been updated to " + deathApplication.getStatus()
					+ ". Please check the system for details.";
			whatsAppUtil.sendNewsToUser(contactNumber, text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ApiResponse(true, "Death application status updated", deathApplication.getStatus());
	}

	@Override
	public DeathApplication findDeathCertificateApplicatioByApplicationId(Long applicationId) {
		DeathApplication deathApplication = deathApplicationRepository.findByApplicationId(applicationId);
		return deathApplication;
	}

	@Override
	public List<DeathApplication> findDeathApplicationByStatus(String appliationStatus) {
		return deathApplicationRepository.findByStatus(appliationStatus);
	}

	@Override
	public void updateDeathApplicationStatus(Long applicationId, String status, String adminComment) {
		DeathApplication deathApplication = deathApplicationRepository.findByApplicationId(applicationId);
		deathApplication.setStatus(status);
		deathApplication.setStatusRemark(adminComment);
		deathApplicationRepository.save(deathApplication);
		try {
			ContactNumber contactNumber = new ContactNumber();
			contactNumber.setContact(deathApplication.getAppliedBy().getMobileNo());
			contactNumber.setName(deathApplication.getAppliedBy().getFullName());
			String text = " the status of your Death Certificate application (ID: " + deathApplication.getApplicationId()
					+ ") has been updated to " + deathApplication.getStatus()
					+ ". Please check the system for details.";
			whatsAppUtil.sendNewsToUser(contactNumber, text);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<DeathApplication> findDeathApplicationUser(Long regUserId) {
		User applicant = userRepository.findById(regUserId).orElseThrow(() -> new RuntimeException("User not found"));
		return deathApplicationRepository.findByAppliedBy(applicant);
	}

	@Override
	public Page<DeathApplication> findDeathApplicationByStatus(String status, int page, int size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by("applicationId").descending());
		return deathApplicationRepository.findByStatus(status, pageable);
	}
}
