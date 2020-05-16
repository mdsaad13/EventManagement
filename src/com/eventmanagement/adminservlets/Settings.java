package com.eventmanagement.adminservlets;

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
 * Servlet implementation class Settings
 */
@WebServlet("/admin/Settings")
public class Settings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int UserID = (int) session.getAttribute("AdminID");

		String Name = request.getParameter("name");
		String Email = request.getParameter("email");

		Users users = new Users(UserID, Name, Email, "", "", "");

		String Message = "UpdateFailed";

		AccountUtil accountUtil = new AccountUtil();
		try {
			if (accountUtil.UpdateAdmin(users)) {
				Message = "UpdateSuccess";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("settings.jsp?message=" + Message);
	}

}
