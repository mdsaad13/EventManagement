package com.eventmanagement.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.eventmanagement.config;
import com.eventmanagement.modals.Users;

public class AccountUtil extends config {

	/**
	 * Register user
	 * 
	 * @param users
	 * @return
	 * @throws SQLException
	 */
	public boolean InsertUser(Users users) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO users (name, email, password, mobile, datetime) values (?, ?, ?, ?, ?)");
			ps.setString(1, users.getName());
			ps.setString(2, users.getEmail());
			ps.setString(3, users.getPassword());
			ps.setString(4, users.getMobile());
			ps.setString(5, users.getDateTime());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

	/**
	 * Update user
	 * 
	 * @param users
	 * @return
	 * @throws SQLException
	 */
	public boolean UpdateUser(Users users) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn
					.prepareStatement("UPDATE users SET name = ?, email = ?, mobile = ? WHERE user_id = ?");
			ps.setString(1, users.getName());
			ps.setString(2, users.getEmail());
			ps.setString(3, users.getMobile());
			ps.setInt(4, users.getID());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

	/**
	 * Update user's password
	 * 
	 * @param Password
	 * @param ID
	 * @return
	 * @throws SQLException
	 */
	public boolean UpdatePassword(String Password, int ID) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE users SET password = ? WHERE user_id = ?");
			ps.setString(1, Password);
			ps.setInt(2, ID);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

	/**
	 * User Login
	 * 
	 * @param Email
	 * @param Password
	 * @return userid
	 * @throws SQLException
	 */
	public int UserLogin(String Email, String Password) throws SQLException {
		int ID = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
			pstmt.setString(1, Email);
			pstmt.setString(2, Password);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ID = rs.getInt("user_id");
			}

		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}

		return ID;
	}

	/**
	 * Fetch user details by id
	 * 
	 * @param ID
	 * @return Users object
	 * @throws SQLException
	 */
	public Users GetUserByID(int ID) throws SQLException {
		Users users = new Users();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM users WHERE user_id = ? ");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				users = new Users(rs.getInt("user_id"), rs.getString("name"), rs.getString("email"),
						rs.getString("password"), rs.getString("mobile"), rs.getString("datetime"));
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return users;
	}

	/**
	 * Fetch all users
	 * 
	 * @return ArrayList of Users objects
	 * @throws SQLException
	 */
	public ArrayList<Users> AllUsers() throws SQLException {
		ArrayList<Users> list = new ArrayList<Users>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM users");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Users users = new Users(rs.getInt("user_id"), rs.getString("name"), rs.getString("email"),
						rs.getString("password"), rs.getString("mobile"), rs.getString("datetime"));
				list.add(users);
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
	 * Admin login
	 * 
	 * @param Email
	 * @param Password
	 * @return AdminID
	 * @throws SQLException
	 */
	public int AdminLogin(String Email, String Password) throws SQLException {
		int ID = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM admin WHERE email = ? AND password = ?");
			pstmt.setString(1, Email);
			pstmt.setString(2, Password);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ID = rs.getInt("id");
			}

		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}

		return ID;
	}

	/**
	 * Fetch admin details by admin id
	 * 
	 * @param ID
	 * @return Users object
	 * @throws SQLException
	 */
	public Users GetAdminByID(int ID) throws SQLException {
		Users users = new Users();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM admin WHERE id = ? ");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				users = new Users(rs.getInt("id"), rs.getString("name"), rs.getString("email"),
						rs.getString("password"));
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return users;
	}

	/**
	 * Change admin password
	 * 
	 * @param Password
	 * @param ID
	 * @return true/false (query exected or not)
	 * @throws SQLException
	 */
	public boolean UpdateAdminPassword(String Password, int ID) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE admin SET password = ? WHERE id = ?");
			ps.setString(1, Password);
			ps.setInt(2, ID);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

	/**
	 * update admin details
	 * 
	 * @param users object (name, email, id)
	 * @return
	 * @throws SQLException
	 */
	public boolean UpdateAdmin(Users users) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE admin SET name = ?, email = ? WHERE id = ?");
			ps.setString(1, users.getName());
			ps.setString(2, users.getEmail());
			ps.setInt(3, users.getID());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		DisConnect();
		return result;
	}

}
