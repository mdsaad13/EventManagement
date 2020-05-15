package com.eventmanagement.modals;

public class Categories {
	private int ID;
	private String Name;

	public Categories() {
		ID = 0;
		Name = null;
	}

	public Categories(int iD, String name) {
		ID = iD;
		Name = name;
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

}
