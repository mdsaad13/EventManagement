package com.eventmanagement.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eventmanagement.dbutil.AccountUtil;
import com.eventmanagement.modals.Users;

/**
 * Servlet implementation class SettingsServlet
 */
@WebServlet("/SettingsServlet")
public class SettingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int UserID = (int) session.getAttribute("UserID");

		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		String Mobile = request.getParameter("mobile");

		Users users = new Users(UserID, Name, Email, "", Mobile, "");

		String Message = "UpdateFailed";

		AccountUtil accountUtil = new AccountUtil();
		try {
			if (accountUtil.UpdateUser(users)) {
				Message = "UpdateSuccess";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("settings.jsp?message=" + Message);
	}

}
