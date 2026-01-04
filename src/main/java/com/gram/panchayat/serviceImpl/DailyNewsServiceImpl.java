package com.gram.panchayat.serviceImpl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.gram.panchayat.model.DailyNews;
import com.gram.panchayat.repository.DailyNewsRepository;
import com.gram.panchayat.services.DailyNewsService;

@Service
public class DailyNewsServiceImpl implements DailyNewsService {

	private final DailyNewsRepository dailyNewsRepository;

	public DailyNewsServiceImpl(DailyNewsRepository dailyNewsRepository) {
		this.dailyNewsRepository = dailyNewsRepository;
	}

	@Override
	public void saveDailyNews(DailyNews news) {
		dailyNewsRepository.save(news);

	}

	@Override
	public List<DailyNews> findDailyNews() {
		return dailyNewsRepository.findTodaysActiveNews(LocalDateTime.now());
	}

}
