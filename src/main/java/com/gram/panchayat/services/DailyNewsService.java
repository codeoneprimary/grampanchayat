package com.gram.panchayat.services;

import java.util.List;

import com.gram.panchayat.model.DailyNews;

public interface DailyNewsService {

	void saveDailyNews(DailyNews news);

	List<DailyNews> findDailyNews();

}
