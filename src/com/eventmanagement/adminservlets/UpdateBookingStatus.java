package com.eventmanagement.adminservlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventmanagement.dbutil.AdminUtil;

/**
 * Servlet implementation class UpdateBookingStatus
 */
@WebServlet("/admin/UpdateBookingStatus")
public class UpdateBookingStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int BookingID = Integer.parseInt(request.getParameter("bookingid"));
		String RetUrl = request.getParameter("returnurl");

		String Message = "BookingUpdateFailed";
		AdminUtil adminUtil = new AdminUtil();
		try {
			if (adminUtil.UpdateBookingStatus(BookingID, 1)) {
				Message = "BookingUpdateSuccess";
			}
		} catch (SQLException e) {
			Message = "BookingUpdateFailed";
		}
		response.sendRedirect(RetUrl + "&message=" + Message);
	}

}
