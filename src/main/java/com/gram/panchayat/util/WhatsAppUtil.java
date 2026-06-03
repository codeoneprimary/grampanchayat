package com.gram.panchayat.util;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.model.DailyNews;

@Service
public class WhatsAppUtil {
	private static final Logger logger = LoggerFactory.getLogger(WhatsAppUtil.class);

	@Value("${mobile.country.code}")
	private String countryCode;

	@Value("${otp.whatsapp.api.url}")
	private String otpApiUrl;

	@Value("${otp.whatsapp.api.apiKey}")
	private String otpApiKey;

	@Value("${otp.whatsapp.api.campaignName}")
	private String otpCampaignName;

	@Value("${news.whatsapp.api.url}")
	private String newsApiUrl;

	@Value("${news.whatsapp.api.apiKey}")
	private String newsApiKey;

	@Value("${news.whatsapp.api.campaignName}")
	private String newsCampaignName;

	public String sendMessage(String username, String toMobileNO, String otp) {

		try {

			URL url = new URL(otpApiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoOutput(true);

			String jsonInput = "{" + "\"apiKey\":\"" + otpApiKey.trim() + "\"," + "\"campaignName\":\""
					+ otpCampaignName.trim() + "\"," + "\"destination\":\"" + countryCode.trim() + toMobileNO + "\","
					+ "\"userName\":\"" + username + "\"," + "\"templateParams\":[\"" + otp + "\"],"
					+ "\"source\":\"new-landing-page form\"," + "\"media\":{}," + "\"buttons\":[{"
					+ "\"type\":\"button\"," + "\"sub_type\":\"url\"," + "\"index\":0," + "\"parameters\":[{"
					+ "\"type\":\"text\"," + "\"text\":\"" + otp + "\"" + "}]" + "}]," + "\"carouselCards\":[],"
					+ "\"location\":{}," + "\"attributes\":{}," + "\"paramsFallbackValue\":{\"FirstName\":\"user\"}"
					+ "}";

			// Send request
			OutputStream os = conn.getOutputStream();
			os.write(jsonInput.getBytes());
			os.flush();
			os.close();

			int responseCode = conn.getResponseCode();
			System.out.println("Response Code: " + responseCode);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public static void main(String arg[]) {
		WhatsAppUtil obj = new WhatsAppUtil();
		obj.sendMessage("bahirnath", "9822197411", "123456");
		ContactNumber contactNumber = new ContactNumber();
		contactNumber.setContact("9822197411");
		contactNumber.setName("bahirnath");
		DailyNews DailyNews = new DailyNews();
		DailyNews.setDescription("new news ");
		// obj.sendNewsToUser(contactNumber, DailyNews);
	}

	public void sendNewsToUser(ContactNumber contactNumber, String massage) {

		try {
			URL url = new URL(newsApiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoOutput(true);

			String param1 = contactNumber.getName(); // {{1}}
			String param2 = massage; // {{2}}

			String jsonInput = "{" + "\"apiKey\":\"" + newsApiKey.trim() + "\"," + "\"campaignName\":\""
					+ newsCampaignName.trim() + "\"," + "\"destination\":\"" + countryCode.trim()
					+ contactNumber.getContact() + "\"," + "\"userName\":\"" + contactNumber.getName() + "\","

					// ✅ TWO PARAMETERS
					+ "\"templateParams\":[\"" + param1 + "\",\"" + param2 + "\"],"

					+ "\"source\":\"new-landing-page form\"," + "\"media\":{},"

					// ❌ NO BUTTONS (your template doesn't have button)

					+ "\"carouselCards\":[]," + "\"location\":{}," + "\"attributes\":{},"
					+ "\"paramsFallbackValue\":{\"FirstName\":\"user\"}" + "}";

			// Send request
			OutputStream os = conn.getOutputStream();
			os.write(jsonInput.getBytes());
			os.flush();
			os.close();

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode =" + responseCode);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
