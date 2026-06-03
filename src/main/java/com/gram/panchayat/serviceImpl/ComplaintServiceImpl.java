package com.gram.panchayat.serviceImpl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gram.panchayat.common.ApiResponse;
import com.gram.panchayat.model.Complaint;
import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.repository.ComplaintRepository;
import com.gram.panchayat.services.ComplaintService;
import com.gram.panchayat.util.WhatsAppUtil;

@Service
public class ComplaintServiceImpl implements ComplaintService {

	@Value("${complaint.image.upload.path}")
	private String UPLOAD_PATH;
	private final WhatsAppUtil whatsAppUtil;
	private final ComplaintRepository complaintRepository;

	public ComplaintServiceImpl(ComplaintRepository complaintRepository, WhatsAppUtil whatsAppUtil) {
		this.complaintRepository = complaintRepository;
		this.whatsAppUtil = whatsAppUtil;
	}

	@Override
	public ApiResponse addComplaint(Complaint complaint, MultipartFile imageFile, MultipartFile videoFile) {
		if (imageFile != null && !imageFile.isEmpty()) {
			String imageName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
			try {
				imageFile.transferTo(new File(UPLOAD_PATH + imageName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			complaint.setImagePath(imageName);
		}
		if (videoFile != null && !videoFile.isEmpty()) {
			String videoName = System.currentTimeMillis() + "_" + videoFile.getOriginalFilename();
			try {
				videoFile.transferTo(new File(UPLOAD_PATH + videoName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			complaint.setVideoPath(videoName);
		}
		complaintRepository.save(complaint);
		try {
			ContactNumber contactNumber = new ContactNumber();
			contactNumber.setContact(complaint.getMobile());
			contactNumber.setName(complaint.getFullName());
			whatsAppUtil.sendNewsToUser(contactNumber, "your complaint "+complaint.getDetails()+" has submitted");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ApiResponse(true, "Complaint application submitted", null);
	}

	@Override
	public List<Complaint> findUsercomplaintByStatus(String status) {
		return complaintRepository.findByStatus(status);
	}

	@Override
	public Optional<Complaint> findcomplaintFormByApplicationId(Long applicationId) {
		// TODO Auto-generated method stub
		return complaintRepository.findById(applicationId);
	}

	@Override
	public void updateComplaintFormStatus(Long applicationId, String status) {
		Complaint complaint = complaintRepository.findById(applicationId).get();
		complaint.setStatus(status);
		complaintRepository.save(complaint);
		try {
			ContactNumber contactNumber = new ContactNumber();
			contactNumber.setContact(complaint.getMobile());
			contactNumber.setName(complaint.getFullName());
			whatsAppUtil.sendNewsToUser(contactNumber, "your complaint "+complaint.getDetails()+" has "+status);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Page<Complaint> getComplaintByStatus(String status, int page, int size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
		return complaintRepository.findByStatus(status, pageable);
	}

}
