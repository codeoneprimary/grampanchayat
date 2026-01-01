package com.gram.panchayat.services;

public interface OtpService {

	void saveOtp(String mobileNo, String otp);

	boolean verifyOtp(String mobileNo, String otp);

}
