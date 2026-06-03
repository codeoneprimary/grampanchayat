package com.gram.panchayat.mobileApiController;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.gram.panchayat.services.DailyNewsService;
import com.gram.panchayat.services.ProgramEventService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/home")
public class MobileHomeController {

	@Value("${pdf.upload.path}")
	private String UPLOAD_DIR;
	private final DailyNewsService dailyNewsService;

	private final ProgramEventService programEventService;

	public MobileHomeController(DailyNewsService dailyNewsService, ProgramEventService programEventService) {
		this.dailyNewsService = dailyNewsService;
		this.programEventService = programEventService;
	}

	@GetMapping("/homePageDetails")
	public Map<String, Object> homeData(HttpServletRequest request) {

		String baseUrl = ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();

		File folder = new File(UPLOAD_DIR);
		String[] files = folder.list((dir, name) -> name.toLowerCase().endsWith(".pdf"));

		List<String> pdfList = new ArrayList<>();

		if (files != null) {
			for (String file : files) {
				pdfList.add(baseUrl + "/pdf/" + file); // ✅ correct mapping
			}
		}
		Map<String, Object> response = new HashMap<>();
		// Data
		response.put("pdfList", pdfList);
		response.put("dailyNewsList", dailyNewsService.findDailyNews());
		response.put("programEventList", programEventService.findActiveProgramEvent());

		return response;
	}
}
