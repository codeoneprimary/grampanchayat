package com.gram.panchayat.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.model.Complaint;

public interface ComplaintService {

	List<Complaint> findUsercomplaintByStatus(String status);

	Optional<Complaint> findcomplaintFormByApplicationId(Long applicationId);

	void updateComplaintFormStatus(Long applicationId, String status);

	ApiResponse addComplaint(Complaint complaint, MultipartFile imageFile, MultipartFile videoFile);

	Page<Complaint> getComplaintByStatus(String status, int page, int size);

}
