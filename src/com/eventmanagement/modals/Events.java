package com.eventmanagement.modals;

public class Events {
	private int ID;
	private String Title;
	private String Description;
	private int CatID;
	private String CatName;
	private String DateTime;
	private int Visibility;
	private String ImgUrl;
	private String VenueDate;
	private String Address;

	/**
	 * Initializing with null values
	 */
	public Events() {
		ID = 0;
		Title = null;
		Description = null;
		CatID = 0;
		CatName = null;
		DateTime = null;
		Visibility = 0;
		ImgUrl = null;
		VenueDate = null;
		Address = null;
	}

	/**
	 * 
	 * @param iD
	 * @param title
	 * @param description
	 * @param catID
	 * @param catName
	 * @param dateTime
	 * @param visibility
	 * @param imgUrl
	 * @param venueDate
	 * @param address
	 */
	public Events(int iD, String title, String description, int catID, String catName, String dateTime, int visibility,
			String imgUrl, String venueDate, String address) {
		ID = iD;
		Title = title;
		Description = description;
		CatID = catID;
		CatName = catName;
		DateTime = dateTime;
		Visibility = visibility;
		ImgUrl = imgUrl;
		VenueDate = venueDate;
		Address = address;
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
	 * @return Title
	 */
	public String getTitle() {
		return Title;
	}

	/**
	 * Set values
	 * 
	 * @param title
	 */
	public void setTitle(String title) {
		Title = title;
	}

	/**
	 * 
	 * @return Description
	 */
	public String getDescription() {
		return Description;
	}

	/**
	 * Set values
	 * 
	 * @param description
	 */
	public void setDescription(String description) {
		Description = description;
	}

	/**
	 * 
	 * @return CatID
	 */
	public int getCatID() {
		return CatID;
	}

	/**
	 * Set values
	 * 
	 * @param catID
	 */
	public void setCatID(int catID) {
		CatID = catID;
	}

	/**
	 * 
	 * @return DateTime
	 */
	public String getDateTime() {
		return DateTime;
	}

	/**
	 * Set values
	 * 
	 * @param catName
	 */
	public void setCatName(String catName) {
		CatName = catName;
	}

	/**
	 * 
	 * @return CatName
	 */
	public String getCatName() {
		return CatName;
	}

	/**
	 * Set values
	 * 
	 * @param dateTime
	 */
	public void setDateTime(String dateTime) {
		DateTime = dateTime;
	}

	/**
	 * 
	 * @return Visibility
	 */
	public int getVisibility() {
		return Visibility;
	}

	/**
	 * Set values
	 * 
	 * @param visibility
	 */
	public void setVisibility(int visibility) {
		Visibility = visibility;
	}

	/**
	 * 
	 * @return ImgUrl
	 */
	public String getImgUrl() {
		return ImgUrl;
	}

	/**
	 * Set values
	 * 
	 * @param imgUrl
	 */
	public void setImgUrl(String imgUrl) {
		ImgUrl = imgUrl;
	}

	/**
	 * 
	 * @return VenueDate
	 */
	public String getVenueDate() {
		return VenueDate;
	}

	/**
	 * Set values
	 * 
	 * @param venueDate
	 */
	public void setVenueDate(String venueDate) {
		VenueDate = venueDate;
	}

	/**
	 * 
	 * @return Address
	 */
	public String getAddress() {
		return Address;
	}

	/**
	 * Set values
	 * 
	 * @param address
	 */
	public void setAddress(String address) {
		Address = address;
	}

}
