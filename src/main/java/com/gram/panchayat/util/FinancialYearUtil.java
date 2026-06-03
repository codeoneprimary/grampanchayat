package com.gram.panchayat.util;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class FinancialYearUtil {

	public String getFinancialYear() {

		LocalDate today = LocalDate.now();

		int year = today.getYear();
		int month = today.getMonthValue();

		if (month >= 4) {
			// April to December
			return year + "-" + (year + 1);
		} else {
			// Jan to March
			return (year - 1) + "-" + year;
		}
	}

	public List<String> getFinancialLastYears(int pastYears) {

		List<String> years = new ArrayList<>();

		LocalDate today = LocalDate.now();
		int year = today.getYear();
		int month = today.getMonthValue();

		int startYear = (month >= 4) ? year : year - 1;

		for (int i = 0; i < pastYears; i++) {
			int y1 = startYear - i;
			int y2 = y1 + 1;

			years.add(y1 + "-" + y2);
		}

		return years;
	}
}