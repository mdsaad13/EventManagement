package com.eventmanagement.modals;

public class Categories {
	private int ID;
	private String Name;

	/**
	 * Initializing with null values
	 */
	public Categories() {
		ID = 0;
		Name = null;
	}

	/**
	 * 
	 * @param ID
	 * @param Name
	 */
	public Categories(int iD, String name) {
		ID = iD;
		Name = name;
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
	 * @return Name
	 */
	public String getName() {
		return Name;
	}

	/**
	 * Set values
	 * 
	 * @param name
	 */
	public void setName(String name) {
		Name = name;
	}

}
