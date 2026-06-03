package com.gram.panchayat.util;

import org.springframework.web.multipart.MultipartFile;

public class ExcelValidationUtil {

	public static boolean isValidMobile(String mobile) {
		if (mobile == null)
			return false;
		mobile = mobile.replaceAll("[^0-9]", "");
		return mobile.matches("^[6-9]\\d{9}$");
	}

	public static boolean isValidName(String name) {
		return name != null && name.trim().length() >= 2;
	}

	public static boolean isExcelFile(MultipartFile file) {
		String type = file.getContentType();
		return type != null && (type.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
				|| type.equals("application/vnd.ms-excel"));
	}
}
