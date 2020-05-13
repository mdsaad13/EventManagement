package com.eventmanagement.modals;

public class Users {
	private int ID;
	private String Name;
	private String Email;
	private String Password;
	private String Mobile;
	private String DateTime;

	/**
	 * Empty initialize
	 */
	public Users() {
		ID = 0;
		Name = null;
		Email = null;
		Password = null;
		Mobile = null;
		DateTime = null;
	}

	/**
	 * Initializing with all fields
	 * 
	 * @param iD
	 * @param name
	 * @param email
	 * @param password
	 * @param mobile
	 * @param dateTime
	 */
	public Users(int iD, String name, String email, String password, String mobile, String dateTime) {
		ID = iD;
		Name = name;
		Email = email;
		Password = password;
		Mobile = mobile;
		DateTime = dateTime;
	}

	/**
	 * Reusing the same for Admin details
	 * 
	 * @param iD
	 * @param name
	 * @param email
	 * @param password
	 */
	public Users(int iD, String name, String email, String password) {
		ID = iD;
		Name = name;
		Email = email;
		Password = password;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getMobile() {
		return Mobile;
	}

	public void setMobile(String mobile) {
		Mobile = mobile;
	}

	public String getDateTime() {
		return DateTime;
	}

	public void setDateTime(String dateTime) {
		DateTime = dateTime;
	}

}