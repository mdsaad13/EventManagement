package com.eventmanagement.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.eventmanagement.config;
import com.eventmanagement.modals.Bookings;
import com.eventmanagement.modals.Categories;
import com.eventmanagement.modals.Enquiries;
import com.eventmanagement.modals.Events;

public class AdminUtil extends config {

	/**
	 * Fetch all enquiries
	 * 
	 * @return ArrayList of Enquiries object
	 * @throws SQLException
	 */
	public ArrayList<Enquiries> AllEnquiries() throws SQLException {
		ArrayList<Enquiries> list = new ArrayList<Enquiries>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM contact_us ORDER BY id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Enquiries enquiries = new Enquiries(rs.getInt("id"), rs.getString("name"), rs.getString("email"),
						rs.getString("subject"), rs.getString("message"), rs.getString("datetime"), rs.getInt("seen"));

				list.add(enquiries);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	/**
	 * Update enquiry status to seen
	 * 
	 * @throws SQLException
	 */
	public void UpdateEnquiriesToSeen() throws SQLException {
		Connect();
		try {
			Statement smt = conn.createStatement();
			String query = "UPDATE contact_us SET seen = 1";
			smt.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		DisConnect();
	}

	/**
	 * Fetch all enquiries
	 * 
	 * @return ArrayList of Categories object
	 * @throws SQLException
	 */
	public ArrayList<Categories> AllCategories() throws SQLException {
		ArrayList<Categories> list = new ArrayList<Categories>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM categories ORDER BY cat_id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Categories categories = new Categories(rs.getInt("cat_id"), rs.getString("name"));

				list.add(categories);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	/**
	 * Fetch category by id
	 * 
	 * @param Category_ID
	 * @return Categories object
	 * @throws SQLException
	 */
	public Categories GetCatByID(int ID) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Categories categories = new Categories();

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM categories WHERE cat_id = ?");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				categories = new Categories(rs.getInt("cat_id"), rs.getString("name"));
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return categories;
	}

	/**
	 * insert category
	 * 
	 * @param Categories_object
	 * @return true/false
	 * @throws SQLException
	 */
	public boolean AddCategory(Categories categories) throws SQLException {
		boolean result = false;
		PreparedStatement pstmt = null;
		Connect();
		try {
			pstmt = conn.prepareStatement("INSERT INTO categories (name) values (?)");
			pstmt.setString(1, categories.getName());

			int rows = pstmt.executeUpdate();

			if (rows > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisConnect();
			pstmt.close();
		}
		return result;
	}

	/**
	 * Edit category details
	 * 
	 * @param Categories_object
	 * @return true/false
	 * @throws SQLException
	 */
	public boolean EditCategory(Categories categories) throws SQLException {
		boolean result = false;
		PreparedStatement pstmt = null;
		Connect();
		try {
			pstmt = conn.prepareStatement("UPDATE categories SET name = ? WHERE cat_id = ?");
			pstmt.setString(1, categories.getName());
			pstmt.setInt(2, categories.getID());

			int rows = pstmt.executeUpdate();

			if (rows > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisConnect();
			pstmt.close();
		}
		return result;
	}

	/**
	 * Fetch all events
	 * 
	 * @return ArrayList of Events object
	 * @throws SQLException
	 */
	public ArrayList<Events> AllEvents() throws SQLException {
		ArrayList<Events> list = new ArrayList<Events>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM events WHERE isdeleted = 0 ORDER BY event_id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int CatID = rs.getInt("cat_id");
				String CatName = GetCatByID(CatID).getName();
				Events events = new Events(rs.getInt("event_id"), rs.getString("title"), rs.getString("description"),
						CatID, CatName, rs.getString("datetime"), rs.getInt("visibility"), rs.getString("img_url"),
						rs.getString("venue_date"), rs.getString("address"));

				list.add(events);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	/**
	 * Fetch only events set for home/index page
	 * 
	 * @return ArrayList of Enquiries object
	 * @throws SQLException
	 */
	public ArrayList<Events> OnlyHomeEvents() throws SQLException {
		ArrayList<Events> list = new ArrayList<Events>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement(
					"SELECT * FROM events WHERE visibility = 1 AND isdeleted = 0 ORDER BY event_id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int CatID = rs.getInt("cat_id");
				String CatName = GetCatByID(CatID).getName();
				Events events = new Events(rs.getInt("event_id"), rs.getString("title"), rs.getString("description"),
						CatID, CatName, rs.getString("datetime"), rs.getInt("visibility"), rs.getString("img_url"),
						rs.getString("venue_date"), rs.getString("address"));

				list.add(events);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	/**
	 * Fetch event details by perticular id
	 * 
	 * @param ID
	 * @return Events object
	 * @throws SQLException
	 */
	public Events GetEventByID(int ID) throws SQLException {
		Events events = new Events();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM events WHERE event_id = ?");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int CatID = rs.getInt("cat_id");
				String CatName = GetCatByID(CatID).getName();
				events = new Events(rs.getInt("event_id"), rs.getString("title"), rs.getString("description"), CatID,
						CatName, rs.getString("datetime"), rs.getInt("visibility"), rs.getString("img_url"),
						rs.getString("venue_date"), rs.getString("address"));
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return events;
	}

	/**
	 * 
	 * @param Events_object
	 * @return
	 * @throws SQLException
	 */
	public boolean AddEvent(Events obj) throws SQLException {
		boolean result = false;
		PreparedStatement pstmt = null;
		Connect();
		try {
			pstmt = conn.prepareStatement(
					"INSERT INTO events (title, description, cat_id, datetime, visibility, img_url, venue_date, address) values (?, ?, ?, ?, ?, ?, ?, ?)");

			pstmt.setString(1, obj.getTitle());
			pstmt.setString(2, obj.getDescription());
			pstmt.setInt(3, obj.getCatID());
			pstmt.setString(4, obj.getDateTime());
			pstmt.setInt(5, obj.getVisibility());
			pstmt.setString(6, obj.getImgUrl());
			pstmt.setString(7, obj.getVenueDate());
			pstmt.setString(8, obj.getAddress());

			int rows = pstmt.executeUpdate();

			if (rows > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisConnect();
			pstmt.close();
		}
		return result;
	}

	/**
	 * 
	 * @param Events_obj
	 * @return true/false
	 * @throws SQLException
	 */
	public boolean EditEvent(Events obj) throws SQLException {
		boolean result = false;
		PreparedStatement pstmt = null;
		Connect();
		try {
			pstmt = conn.prepareStatement(
					"UPDATE events SET title = ?, description = ?, cat_id = ?, visibility = ?, img_url = ?, venue_date = ?, address = ? WHERE event_id = ?");

			pstmt.setString(1, obj.getTitle());
			pstmt.setString(2, obj.getDescription());
			pstmt.setInt(3, obj.getCatID());
			pstmt.setInt(4, obj.getVisibility());
			pstmt.setString(5, obj.getImgUrl());
			pstmt.setString(6, obj.getVenueDate());
			pstmt.setString(7, obj.getAddress());

			pstmt.setInt(8, obj.getID());

			int rows = pstmt.executeUpdate();

			if (rows > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisConnect();
			pstmt.close();
		}
		return result;
	}

	/**
	 * Updated isdeleted flag to 1 Does not actually delete because of primary key
	 * relation
	 * 
	 * @param Event_ID
	 * @throws SQLException
	 */
	public void DeleteEvent(int ID) throws SQLException {
		PreparedStatement pstmt = null;
		Connect();
		try {
			pstmt = conn.prepareStatement("UPDATE events SET isdeleted = 1 WHERE event_id = ?");

			pstmt.setInt(1, ID);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisConnect();
			pstmt.close();
		}
	}

	/**
	 * 
	 * @return ArrayList of Bookings object
	 * @throws SQLException
	 */
	public ArrayList<Bookings> AllBookings() throws SQLException {
		ArrayList<Bookings> list = new ArrayList<Bookings>();
		AccountUtil accountUtil = new AccountUtil();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM bookings ORDER BY booking_id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String EventTitle = GetEventByID(rs.getInt("event_id")).getTitle();
				String UserName = accountUtil.GetUserByID(rs.getInt("user_id")).getName();
				Bookings bookings = new Bookings(rs.getInt("booking_id"), rs.getInt("event_id"), rs.getInt("user_id"),
						rs.getInt("member"), rs.getInt("status"), rs.getString("datetime"), EventTitle, UserName);

				list.add(bookings);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	/**
	 * Fetch only perticular users booking details
	 * 
	 * @param User_ID
	 * @return ArrayList of Bookings object
	 * @throws SQLException
	 */
	public ArrayList<Bookings> UsersBookings(int ID) throws SQLException {
		ArrayList<Bookings> list = new ArrayList<Bookings>();
		AccountUtil accountUtil = new AccountUtil();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM bookings WHERE user_id = ? ORDER BY booking_id DESC");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String EventTitle = GetEventByID(rs.getInt("event_id")).getTitle();
				String UserName = accountUtil.GetUserByID(rs.getInt("user_id")).getName();
				Bookings bookings = new Bookings(rs.getInt("booking_id"), rs.getInt("event_id"), rs.getInt("user_id"),
						rs.getInt("member"), rs.getInt("status"), rs.getString("datetime"), EventTitle, UserName);

				list.add(bookings);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	/**
	 * Get all booking by event
	 * 
	 * @param Event_ID
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<Bookings> EventBookings(int ID) throws SQLException {
		ArrayList<Bookings> list = new ArrayList<Bookings>();
		AccountUtil accountUtil = new AccountUtil();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM bookings WHERE event_id = ? ORDER BY booking_id DESC");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String EventTitle = GetEventByID(rs.getInt("event_id")).getTitle();
				String UserName = accountUtil.GetUserByID(rs.getInt("user_id")).getName();
				Bookings bookings = new Bookings(rs.getInt("booking_id"), rs.getInt("event_id"), rs.getInt("user_id"),
						rs.getInt("member"), rs.getInt("status"), rs.getString("datetime"), EventTitle, UserName);

				list.add(bookings);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	/**
	 * 
	 * @param Booking_ID
	 * @return Bookings object
	 * @throws SQLException
	 */
	public Bookings GetBookingByID(int ID) throws SQLException {

		AccountUtil accountUtil = new AccountUtil();
		Bookings bookings = new Bookings();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM bookings WHERE booking_id = ?");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String EventTitle = GetEventByID(rs.getInt("event_id")).getTitle();
				String UserName = accountUtil.GetUserByID(rs.getInt("user_id")).getName();
				bookings = new Bookings(rs.getInt("booking_id"), rs.getInt("event_id"), rs.getInt("user_id"),
						rs.getInt("member"), rs.getInt("status"), rs.getString("datetime"), EventTitle, UserName);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return bookings;
	}

	/**
	 * Update seen flag of bookings table
	 * 
	 * @throws SQLException
	 */
	public void UpdateBookingToSeen() throws SQLException {
		Connect();
		try {
			Statement smt = conn.createStatement();
			String query = "UPDATE bookings SET seen = 1";
			smt.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		DisConnect();
	}

	/**
	 * Update status of booking - Accept Booking
	 * 
	 * @param Booking_ID
	 * @param Status
	 * @return
	 * @throws SQLException
	 */
	public boolean UpdateBookingStatus(int ID, int Status) throws SQLException {
		boolean result = false;
		PreparedStatement pstmt = null;
		Connect();
		try {
			pstmt = conn.prepareStatement("UPDATE bookings SET status = ? WHERE booking_id = ?");

			pstmt.setInt(1, Status);
			pstmt.setInt(2, ID);

			int rows = pstmt.executeUpdate();

			if (rows > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisConnect();
			pstmt.close();
		}
		return result;
	}

	/**
	 * Delete booking - only used for users
	 * 
	 * @param Booking_ID
	 * @param UserID
	 * @return
	 * @throws SQLException
	 */
	public boolean DeleteBooking(int ID, int UserID) throws SQLException {
		boolean result = false;
		PreparedStatement pstmt = null;
		Connect();
		try {
			pstmt = conn.prepareStatement("DELETE FROM bookings WHERE booking_id = ? AND user_id = ? ");

			pstmt.setInt(1, ID);
			pstmt.setInt(2, UserID);

			int rows = pstmt.executeUpdate();

			if (rows > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisConnect();
			pstmt.close();
		}
		return result;
	}

}
