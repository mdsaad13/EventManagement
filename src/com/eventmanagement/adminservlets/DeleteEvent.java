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
 * Servlet implementation class DeleteEvent
 */
@WebServlet("/admin/DeleteEvent")
public class DeleteEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int ID = Integer.parseInt(request.getParameter("eventid"));

		String Message = "DeleteFailed";
		AdminUtil adminUtil = new AdminUtil();
		try {
			adminUtil.DeleteEvent(ID);
			Message = "DeleteSuccess";

		} catch (SQLException e) {
			Message = "DeleteFailed&e=" + e;
		}
		response.sendRedirect("events.jsp?message=" + Message);
	}

}
