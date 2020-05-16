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
 * Servlet implementation class ChangePassword
 */
@WebServlet("/admin/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Password = request.getParameter("password");
		String NewPassword = request.getParameter("new_password");

		String Message = "PasswordChangeFailed";

		HttpSession session = request.getSession();
		int UserID = (int) session.getAttribute("AdminID");

		AccountUtil accountUtil = new AccountUtil();
		Users users = new Users();
		try {
			users = accountUtil.GetAdminByID(UserID);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (Password.equals(users.getPassword())) {
			try {
				if (accountUtil.UpdatePassword(NewPassword, UserID)) {
					Message = "PasswordChangeSuccess";
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			Message = "IncorrectPassword";
		}
		response.sendRedirect("settings.jsp?message=" + Message);
	}

}
