package com.eventmanagement.modals;

public class Enquiries {

	private int ID;
	private String Name;
	private String Email;
	private String Subject;
	private String Message;
	private String DateTime;
	private int Seen;

	public Enquiries() {
		ID = 0;
		Name = null;
		Email = null;
		Subject = null;
		Message = null;
		DateTime = null;
		Seen = 0;
	}

	public Enquiries(int iD, String name, String email, String subject, String message, String dateTime, int seen) {
		ID = iD;
		Name = name;
		Email = email;
		Subject = subject;
		Message = message;
		DateTime = dateTime;
		Seen = seen;
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

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	public String getMessage() {
		return Message;
	}

	public void setMessage(String message) {
		Message = message;
	}

	public String getDateTime() {
		return DateTime;
	}

	public void setDateTime(String dateTime) {
		DateTime = dateTime;
	}

	public int getSeen() {
		return Seen;
	}

	public void setSeen(int seen) {
		Seen = seen;
	}

}
