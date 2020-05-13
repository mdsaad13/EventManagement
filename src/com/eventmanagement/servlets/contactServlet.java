package com.eventmanagement.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventmanagement.Formatter;
import com.eventmanagement.dbutil.HomeUtil;

@WebServlet("/ContactUs")
public class contactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String result = "2";

		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		String Subject = request.getParameter("subject");
		String Message = request.getParameter("message");
		String DateTime = Formatter.CurrentDateTime();
		int Seen = 0;

		HomeUtil HomeUtil = new HomeUtil();

		try {
			if (HomeUtil.AddContactEnquiry(Name, Email, Subject, Message, DateTime, Seen)) {
				result = "1";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.setContentType("text/plain");
		response.getWriter().write(result);
	}

}
