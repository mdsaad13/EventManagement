package com.eventmanagement.dbutil;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.eventmanagement.config;
import com.eventmanagement.modals.Bookings;

public class HomeUtil extends config {

	/**
	 * Add enquiry or add contact us
	 * 
	 * @param Name
	 * @param Email
	 * @param Sub
	 * @param Message
	 * @param DateTime
	 * @param Seen
	 * @return true/false
	 * @throws SQLException
	 */
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

	/**
	 * Book an event
	 * 
	 * @param Bookings_object
	 * @return true/false
	 * @throws SQLException
	 */
	public boolean BookEvent(Bookings bookings) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn
					.prepareStatement("INSERT INTO bookings (event_id, user_id, member, datetime) values (?, ?, ?, ?)");
			ps.setInt(1, bookings.getEventID());
			ps.setInt(2, bookings.getUserID());
			ps.setInt(3, bookings.getMembers());
			ps.setString(4, bookings.getDateOfBooking());

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
