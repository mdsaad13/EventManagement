package com.eventmanagement.dbutil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.eventmanagement.config;

public class GeneralUtil extends config {
	public int CountTable(String TableName) throws SQLException {
		int count = 0;
		Connect();
		Statement stmt = conn.createStatement();
		ResultSet r = stmt.executeQuery("SELECT COUNT(*) AS rowcount FROM " + TableName);
		while (r.next()) {
			count = r.getInt(1);
		}
		r.close();
		DisConnect();
		return count;
	}

	public int CountByArgs(String TableName, String Args) throws SQLException {
		int count = 0;
		Connect();
		Statement s = conn.createStatement();
		ResultSet r = s.executeQuery("SELECT COUNT(*) AS rowcount FROM " + TableName + " WHERE " + Args);
		while (r.next())
			count = r.getInt(1);
		r.close();
		DisConnect();
		return count;
	}

}
