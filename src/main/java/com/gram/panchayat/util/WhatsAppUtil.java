package com.gram.panchayat.util;

import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class WhatsAppUtil {

	@Value("${whatsapp.api.url}")
	private String apiUrl;

	@Value("${whatsapp.token}")
	private String token;

	@Value("${whatsapp.phone.id}")
	private String phoneNumberId;

	public String sendMessage(String toMobileNO, String message) {

		try {
			URL url = new URL(apiUrl + "/" + phoneNumberId + "/messages");

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + token);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoOutput(true);

			String json = "{\n" + "  \"messaging_product\": \"whatsapp\",\n" + "  \"to\": \"" + toMobileNO + "\",\n"
					+ "  \"type\": \"text\",\n" + "  \"text\": {\"body\": \"" + message + "\"}\n" + "}";

			conn.getOutputStream().write(json.getBytes());

			return "Sent with response: " + conn.getResponseCode();

		} catch (Exception e) {
			e.printStackTrace();
			return "Failed";
		}
	}
}
