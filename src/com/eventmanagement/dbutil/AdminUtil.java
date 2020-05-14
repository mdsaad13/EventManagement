package com.eventmanagement.dbutil;

import com.eventmanagement.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.eventmanagement.modals.*;

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

	public void UpdateEnquiriesToSeen() {
		try {
			Statement smt = conn.createStatement();
			String query = "UPDATE contact_us SET seen = 1";
			smt.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
