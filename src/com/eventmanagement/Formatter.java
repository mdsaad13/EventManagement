package com.eventmanagement;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Formatter {

	public static String CurrentDateTime() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}

	public static String FormatToDateTime(String Input) {

		SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY HH:mm:ss");

		Date date = null;

		try {
			date = (Date) format.parse(Input);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date.toString();
	}

	public static String FormatToDate(String Input) {

		SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");

		Date date = null;

		try {
			date = (Date) format.parse(Input);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date.toString();
	}
}
