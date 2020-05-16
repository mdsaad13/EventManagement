package com.eventmanagement.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eventmanagement.Formatter;
import com.eventmanagement.dbutil.HomeUtil;
import com.eventmanagement.modals.Bookings;

/**
 * Servlet implementation class BookEvent
 */
@WebServlet("/BookEvent")
public class BookEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Message = "BookingFailed";

		HttpSession session = request.getSession();
		int UserID = (int) session.getAttribute("UserID");

		int eventID = Integer.parseInt(request.getParameter("eventID"));
		int members = Integer.parseInt(request.getParameter("members"));
		String dateOfBooking = Formatter.CurrentDateTime();

		Bookings bookings = new Bookings(eventID, UserID, members, dateOfBooking);
		HomeUtil homeUtil = new HomeUtil();
		try {
			if (homeUtil.BookEvent(bookings)) {
				Message = "BookingSuccess";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("mybookings.jsp?message=" + Message + "#maincontent");
	}

}
