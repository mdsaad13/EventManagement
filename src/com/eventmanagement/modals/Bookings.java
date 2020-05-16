package com.eventmanagement.modals;

public class Bookings {
	private int ID;
	private int EventID;
	private int UserID;
	private int Members;
	private int Status;
	private String DateOfBooking;

	private String EventTitle;
	private String UserName;

	/**
	 * Initializing with null values
	 */
	public Bookings() {
		ID = 0;
		EventID = 0;
		UserID = 0;
		Members = 0;
		Status = 0;
		EventTitle = null;
		UserName = null;
		DateOfBooking = null;
	}

	/**
	 * For adding booking
	 * 
	 * @param iD
	 * @param eventID
	 * @param userID
	 * @param members
	 * @param status
	 * @param dateOfBooking
	 */
	public Bookings(int eventID, int userID, int members, String dateOfBooking) {
		EventID = eventID;
		UserID = userID;
		Members = members;
		DateOfBooking = dateOfBooking;
	}

	/**
	 * For displaying bookings
	 * 
	 * @param iD
	 * @param eventID
	 * @param userID
	 * @param members
	 * @param status
	 * @param dateOfBooking
	 * @param eventTitle
	 * @param userName
	 */
	public Bookings(int iD, int eventID, int userID, int members, int status, String dateOfBooking, String eventTitle,
			String userName) {
		ID = iD;
		EventID = eventID;
		UserID = userID;
		Members = members;
		Status = status;
		DateOfBooking = dateOfBooking;
		EventTitle = eventTitle;
		UserName = userName;
	}

	/**
	 * 
	 * @return ID
	 */
	public int getID() {
		return ID;
	}

	/**
	 * Set values
	 * 
	 * @param iD
	 */
	public void setID(int iD) {
		ID = iD;
	}

	/**
	 * 
	 * @return EventID
	 */
	public int getEventID() {
		return EventID;
	}

	/**
	 * Set values
	 * 
	 * @param eventID
	 */
	public void setEventID(int eventID) {
		EventID = eventID;
	}

	/**
	 * 
	 * @return UserID
	 */
	public int getUserID() {
		return UserID;
	}

	/**
	 * Set values
	 * 
	 * @param userID
	 */
	public void setUserID(int userID) {
		UserID = userID;
	}

	/**
	 * 
	 * @return Members
	 */
	public int getMembers() {
		return Members;
	}

	/**
	 * Set values
	 * 
	 * @param members
	 */
	public void setMembers(int members) {
		Members = members;
	}

	/**
	 * 
	 * @return Status
	 */
	public int getStatus() {
		return Status;
	}

	/**
	 * Set values
	 * 
	 * @param status
	 */
	public void setStatus(int status) {
		Status = status;
	}

	/**
	 * 
	 * @return EventTitle
	 */
	public String getEventTitle() {
		return EventTitle;
	}

	/**
	 * Set values
	 * 
	 * @param eventTitle
	 */
	public void setEventTitle(String eventTitle) {
		EventTitle = eventTitle;
	}

	/**
	 * 
	 * @return UserName
	 */
	public String getUserName() {
		return UserName;
	}

	/**
	 * Set values
	 * 
	 * @param userName
	 */
	public void setUserName(String userName) {
		UserName = userName;
	}

	/**
	 * 
	 * @return DateOfBooking
	 */
	public String getDateOfBooking() {
		return DateOfBooking;
	}

	/**
	 * Set values
	 * 
	 * @param dateOfBooking
	 */
	public void setDateOfBooking(String dateOfBooking) {
		DateOfBooking = dateOfBooking;
	}

}
