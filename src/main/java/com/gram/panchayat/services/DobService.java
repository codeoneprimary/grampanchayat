package com.gram.panchayat.services;

import java.util.List;

import org.springframework.data.domain.Page;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.ApplicationStatusUpdateRequestDto;
import com.gram.panchayat.dto.BirthCertificateApplicationRequestDto;
import com.gram.panchayat.model.DobApplication;

public interface DobService {

	ApiResponse applyDOBApplication(BirthCertificateApplicationRequestDto request);

	ApiResponse updateDOBApplicationStatus(ApplicationStatusUpdateRequestDto request);

	DobApplication findDobApplicationByApplicationId(Long applicationId);

	List<DobApplication> findDobApplicationByStatus(String applicationStatus);

	void updateDobApplicationStatus(Long applicationId, String status, String adminComment);

	List<DobApplication> findDobApplicationByUser(Long regUserId);

	Page<DobApplication> findDobApplicationByStatus(String status, int page, int size);

}
