package com.gram.panchayat.services;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.dto.ApplicationStatusUpdateRequestDto;
import com.gram.panchayat.dto.MarriageApplicationRequest;

public interface MarriageCertificateService {

	ApiResponse applyForMarriage(MarriageApplicationRequest req);

	ApiResponse updateMarriageCertificateApplicationStatus(ApplicationStatusUpdateRequestDto request);

}
