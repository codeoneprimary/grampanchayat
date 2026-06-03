package com.gram.panchayat.services;

import java.util.List;

import org.springframework.data.domain.Page;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.ApplicationStatusUpdateRequestDto;
import com.gram.panchayat.dto.DeathCertificateApplicationRequestDto;
import com.gram.panchayat.model.DeathApplication;

public interface DeathService {

	ApiResponse applyDeathCertificate(DeathCertificateApplicationRequestDto request);

	ApiResponse updateDeathApplicationStatus(ApplicationStatusUpdateRequestDto request);

	DeathApplication findDeathCertificateApplicatioByApplicationId(Long applicationId);

	List<DeathApplication> findDeathApplicationByStatus(String applicationStatus);

	void updateDeathApplicationStatus(Long applicationId, String status, String adminComment);

	List<DeathApplication> findDeathApplicationUser(Long regUserId);

	Page<DeathApplication> findDeathApplicationByStatus(String status, int page, int size);
}
