package com.gram.panchayat.util;

import java.security.SecureRandom;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

@Service
public class OtpUtil {

	private static final SecureRandom secureRandom = new SecureRandom();
	private static final int OTP_LENGTH = 6;

	public static String generateOtp() {
		int number = secureRandom.nextInt(900000) + 100000; // 100000–999999
		return String.valueOf(number);
	}

	public static String hashOtp(String otp) {
		return DigestUtils.sha256Hex(otp);
	}
}
