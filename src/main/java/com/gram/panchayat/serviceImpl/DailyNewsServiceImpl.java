package com.gram.panchayat.serviceImpl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.gram.panchayat.model.ContactNumber;
import com.gram.panchayat.model.DailyNews;
import com.gram.panchayat.repository.DailyNewsRepository;
import com.gram.panchayat.services.ContactNumberService;
import com.gram.panchayat.services.DailyNewsService;
import com.gram.panchayat.util.WhatsAppUtil;

@Service
public class DailyNewsServiceImpl implements DailyNewsService {

	private final DailyNewsRepository dailyNewsRepository;

	private final ContactNumberService contactService;
	private final WhatsAppUtil whatsAppUtil;

	public DailyNewsServiceImpl(DailyNewsRepository dailyNewsRepository, ContactNumberService contactService,
			WhatsAppUtil whatsAppUtil) {
		this.dailyNewsRepository = dailyNewsRepository;
		this.contactService = contactService;
		this.whatsAppUtil = whatsAppUtil;
	}

	@Override
	public void saveDailyNews(DailyNews news) {
		dailyNewsRepository.save(news);

	}

	@Override
	public List<DailyNews> findDailyNews() {
		return dailyNewsRepository.findTodaysActiveNews(LocalDate.now());
	}

	@Override
	public DailyNews getDailyNewsById(long id) {
		// TODO Auto-generated method stub
		return dailyNewsRepository.getById(id);
	}

	@Override
	public void deleteById(long id) {
		DailyNews dailyNews = dailyNewsRepository.getById(id);
		dailyNews.setStatus("DELETE");
		dailyNewsRepository.save(dailyNews);
	}

	@Override
	public void sendMessageToUsers(DailyNews news) {
		List<ContactNumber> list = contactService.findAllContactNumber();

		for (ContactNumber contactNumber : list) {
			try {
				whatsAppUtil.sendNewsToUser(contactNumber, news.getDescription());
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}

}
