package com.gram.panchayat.services;

import java.util.List;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.ApplicationStatusUpdateRequestDto;
import com.gram.panchayat.dto.BirthCertificateApplicationRequestDto;
import com.gram.panchayat.model.DobApplication;

public interface DobService {

	ApiResponse applyDOBApplication(BirthCertificateApplicationRequestDto request);

	ApiResponse updateDOBApplicationStatus(ApplicationStatusUpdateRequestDto request);

	DobApplication getDobApplicationByApplicationId(Long applicationId);

	List<DobApplication> getDobApplicationByStatus(String appliucationStatus);

	void updateDobApplicationStatus(Long applicationId, String status, String adminComment);

}
