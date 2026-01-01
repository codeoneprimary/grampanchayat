package com.gram.panchayat.util;

import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class SmsUtil {

	@Value("${sms.api.key}")
	private String smsApiKey;

	public String sendSms(String mobileNo, String message, String otp) {

		try {

			String url = "https://www.fast2sms.com/dev/bulkV2?" + "authorization=" + smsApiKey + "&route=v3"
					+ "&sender_id=TXTIND" + "&message=" + message + "&language=english" + "&numbers=" + mobileNo;

			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			conn.setRequestMethod("GET");
			conn.connect();

			int responseCode = conn.getResponseCode();
			return "SMS sent, status: " + responseCode;

		} catch (Exception e) {
			e.printStackTrace();
			return "Failed to send SMS";
		}
	}
}
