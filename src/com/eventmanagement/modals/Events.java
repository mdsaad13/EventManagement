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

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public int getCatID() {
		return CatID;
	}

	public void setCatID(int catID) {
		CatID = catID;
	}

	public String getDateTime() {
		return DateTime;
	}

	public void setCatName(String catName) {
		CatName = catName;
	}

	public String getCatName() {
		return CatName;
	}

	public void setDateTime(String dateTime) {
		DateTime = dateTime;
	}

	public int getVisibility() {
		return Visibility;
	}

	public void setVisibility(int visibility) {
		Visibility = visibility;
	}

	public String getImgUrl() {
		return ImgUrl;
	}

	public void setImgUrl(String imgUrl) {
		ImgUrl = imgUrl;
	}

	public String getVenueDate() {
		return VenueDate;
	}

	public void setVenueDate(String venueDate) {
		VenueDate = venueDate;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

}
