package com.eventmanagement.dbutil;

import com.eventmanagement.*;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class HomeUtil extends config {
	public boolean AddContactEnquiry(String Name, String Email, String Sub, String Message, String DateTime, int Seen)
			throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO contact_us (name, email, subject, message, datetime, seen) values (?, ?, ?, ?, ?, ?)");
			ps.setString(1, Name);
			ps.setString(2, Email);
			ps.setString(3, Sub);
			ps.setString(4, Message);
			ps.setString(5, DateTime);
			ps.setInt(6, Seen);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}
}
