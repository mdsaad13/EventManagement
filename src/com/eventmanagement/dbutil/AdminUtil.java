package com.eventmanagement.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.eventmanagement.config;
import com.eventmanagement.modals.Categories;
import com.eventmanagement.modals.Enquiries;
import com.eventmanagement.modals.Events;

public class AdminUtil extends config {

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

	public ArrayList<Events> AllEvents() throws SQLException {
		ArrayList<Events> list = new ArrayList<Events>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM events ORDER BY event_id DESC");
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

	public void DeleteEvent(int ID) throws SQLException {
		PreparedStatement pstmt = null;
		Connect();
		try {
			pstmt = conn.prepareStatement("DELECT FROM events WHERE event_id = ?");

			pstmt.setInt(1, ID);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DisConnect();
			pstmt.close();
		}
	}

}
