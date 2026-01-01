package com.gram.panchayat.serviceImpl;

import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

import com.gram.panchayat.model.OtpVerification;
import com.gram.panchayat.repository.OtpVerificationRepository;
import com.gram.panchayat.services.OtpService;
import com.gram.panchayat.util.OtpUtil;

@Service
public class OtpServiceImpl implements OtpService {

	private final OtpVerificationRepository otpVerificationRepository;

	public OtpServiceImpl(OtpVerificationRepository otpVerificationRepository) {
		this.otpVerificationRepository = otpVerificationRepository;
	}

	@Override
	public void saveOtp(String mobileNo, String otp) {
		OtpVerification otpObj = new OtpVerification();
		otpObj.setMobileNo(mobileNo);
		otpObj.setOtpHash(OtpUtil.hashOtp(otp));
		otpObj.setExpiryTime(LocalDateTime.now().plusMinutes(5));
		otpVerificationRepository.save(otpObj);

	}

	@Override
	public boolean verifyOtp(String mobileNo, String otp) {
		return otpVerificationRepository.findTopByMobileNoOrderByCreatedDateDesc(mobileNo).filter(o -> !o.isExpired())
				.filter(o -> o.getOtpHash().equals(OtpUtil.hashOtp(otp))).isPresent();
	}

}
