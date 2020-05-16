package com.eventmanagement.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eventmanagement.dbutil.AdminUtil;

/**
 * Servlet implementation class DeleteBooking
 */
@WebServlet("/DeleteBooking")
public class DeleteBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int BookingID = Integer.parseInt(request.getParameter("bookingid"));

		HttpSession session = request.getSession();
		int UserID = (int) session.getAttribute("UserID");

		String Message = "DeleteFailed";
		AdminUtil adminUtil = new AdminUtil();
		try {
			if (adminUtil.DeleteBooking(BookingID, UserID)) {
				Message = "DeleteSuccess";
			}
		} catch (SQLException e) {
			Message = "DeleteFailed" + e;
		}
		response.sendRedirect("mybookings.jsp?message=" + Message + "#maincontent");
	}

}
