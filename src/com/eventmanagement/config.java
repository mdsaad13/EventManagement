package com.eventmanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class config {
	/**
	 * Connection string
	 */
	public Connection conn = null;

	private String Database = "eventmanagement";
	private String UserName = "root";
	private String Password = "";

	/**
	 * Establish connection to database
	 * 
	 * @throws SQLException
	 */
	public void Connect() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/" + Database, UserName, Password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Disconnect established connection from database
	 */
	public void DisConnect() {
		try {
			conn.close();
		} catch (Exception e) {
			/* ignored */ }
	}
}
